Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A417655C437
	for <lists+linux-sparse@lfdr.de>; Tue, 28 Jun 2022 14:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237751AbiF0TF7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 27 Jun 2022 15:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbiF0TFx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 27 Jun 2022 15:05:53 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF44225D1
        for <linux-sparse@vger.kernel.org>; Mon, 27 Jun 2022 12:05:51 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id mf9so21236929ejb.0
        for <linux-sparse@vger.kernel.org>; Mon, 27 Jun 2022 12:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JdyJgs7OQYfPWhdxx4pQzYYW/R/ijOX67FT24uUrsOg=;
        b=pdk0CbI9qZ6t/B/W6bLxWYF+VjKHURUtGnUqgUXpXfWYcJAcEGosri5fO7otyeBmNK
         LjeHVjwZRZ/syZeXL9clX8hgjPqVU1R8L3mRwfX2jf0thrMz+NSVB87blJggXpR8iPTr
         NFuEAvAS2dynSTYM9ZsP6flKGGGGmmIaeKD1bXDvnmIfYaVNa/4ISZI5C2PDmmFqvMuw
         vFiCKgpaekNYzO6gNOJuon7k4cdoQzdvwtxO2c/q7jx41UBxm5Deq1QLm4pwlpMLK9D6
         379/xQNM9gRJFv79cPf3b2r4FKyZ3zlqLMhEATdy4wGmLlfRfX2/tpv4AMl9p4S5dDih
         mGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JdyJgs7OQYfPWhdxx4pQzYYW/R/ijOX67FT24uUrsOg=;
        b=R75KpfugplVv5djTg9uF58uLC/WpEwCzTud+F0wTqgz1r80H1Eqj2qyj3aomW2RdlV
         iXVAvOMfabpqum/70FUj8nf/Ooo6n1CYDAmKEZIjnrDmb17PUjAd7bNl++GwDMp8tAJJ
         8CBI990f2Rqyu2lDRoCF6OvxwVQTVSHYmBy2M0nGvEjO/iowhPjdx36jKJ57hrl+sGn0
         M9m9DkHamG7c77NWip3Ixj0HOMmy8g2ux3N3Sm5/Wokjv4Vl50ZHzAThIP/+71gvQqRt
         6IzQLrKL6O02yHAvXOw5zAT0BjOAtZ7Mrbw5wt+heRBBY2iXLkXU9kdsodV84efvioOh
         c3wg==
X-Gm-Message-State: AJIora+VUebOJa1ZDrMHb/pReMgKT6jE3AdzM4bl6/e23GgwMKFTiDmk
        XSk3jHlo8+ufd2tozPKkbOp1eRV68FY=
X-Google-Smtp-Source: AGRyM1u2nvcOU+q4OCROx1PPzWiUZ3Q+PvD6fNn9r5+2u5bbJYR/zqgYjW6F3cKwsHSxyWbcD57sZw==
X-Received: by 2002:a17:906:b1c1:b0:726:b009:4b63 with SMTP id bv1-20020a170906b1c100b00726b0094b63mr4622191ejb.24.1656356750405;
        Mon, 27 Jun 2022 12:05:50 -0700 (PDT)
Received: from localhost.localdomain (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
        by smtp.gmail.com with ESMTPSA id p24-20020a170906615800b00709343c0017sm5456776ejl.98.2022.06.27.12.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:05:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] bitwise: allow compares for bitwise types
Date:   Mon, 27 Jun 2022 21:05:38 +0200
Message-Id: <20220627190540.13358-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627190540.13358-1-luc.vanoostenryck@gmail.com>
References: <CAHk-=wj8gM8q04v2jS5JGjEdoE2d+B4_nm74xrFjZ77f9YRsbA@mail.gmail.com>
 <20220627190540.13358-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, bitwise types are restricted to bitwise operations
(&, |, ^ and ~) as well as equality comparisons.

This patch makes the others comparisons valid for bitwise types
too.

Warning: This change make sense in the context of [1] but
         doesn't make sense for the 'main' bitwise types:
         __be32 and friends.
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                       | 4 ++++
 validation/bitwise-cmp.c         | 1 -
 validation/linear/bitwise-cmps.c | 1 -
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index bcbcdf1ef0cc..bb8c0caa905a 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -435,6 +435,10 @@ static int restricted_binop(int op, struct symbol *type)
 		case '^':
 		case '?':
 			return 2;	/* keep fouled */
+		case '<':
+		case '>':
+		case SPECIAL_LTE:
+		case SPECIAL_GTE:
 		case SPECIAL_EQUAL:
 		case SPECIAL_NOTEQUAL:
 			return 3;	/* warn if fouled */
diff --git a/validation/bitwise-cmp.c b/validation/bitwise-cmp.c
index ca12b5e51e8e..8c3e6894072d 100644
--- a/validation/bitwise-cmp.c
+++ b/validation/bitwise-cmp.c
@@ -28,5 +28,4 @@ static int gtx(b32 x, b32 y)  { return (x >  y); }
 
 /*
  * check-name: bitwise-cmp
- * check-known-to-fail
  */
diff --git a/validation/linear/bitwise-cmps.c b/validation/linear/bitwise-cmps.c
index 6122944a42c6..f83ab7fe47db 100644
--- a/validation/linear/bitwise-cmps.c
+++ b/validation/linear/bitwise-cmps.c
@@ -8,7 +8,6 @@ static int gtu(bs32 x, bs32 y)  { return (x >  y); }
 /*
  * check-name: bitwise-cmps
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: setb\\.
-- 
2.36.1

