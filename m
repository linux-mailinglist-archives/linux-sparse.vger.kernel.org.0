Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8944029445A
	for <lists+linux-sparse@lfdr.de>; Tue, 20 Oct 2020 23:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438677AbgJTVKl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 20 Oct 2020 17:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438669AbgJTVKl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 20 Oct 2020 17:10:41 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE4CC0613CE
        for <linux-sparse@vger.kernel.org>; Tue, 20 Oct 2020 14:10:40 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t20so159488edr.11
        for <linux-sparse@vger.kernel.org>; Tue, 20 Oct 2020 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zcmIyfSPT3DB9IRLt1Q7PWIxtIk0W3pNJ/px2/pPzCQ=;
        b=Pvv8/AMqc6JqP9EApFKTTRPUUix3FKyGTDA3+hbKk/usP4mXP3aHnCVBsSc+301hiI
         iePhhtitX8m/vKRL1aLakwCMqq2KEth9vAm6TNtZn0rwTF5MhldwZodrJJfgNrhvG9su
         qzYhIkUkiy8gFeS4uio08i9IpSYcALEkullSs1FSCbHQMN1K7dIWH5I+mNHRttFwCCdk
         0s5SIJ0d2yaOjd9+y8n6PJ8QQXUKJwGeLj/vpMUGAT7ie0ogFxZUJPMQDmmEuWPgE12f
         OU7bli8LPWKe26F/drcHgEvMZVZ+HGaGB+lInVynenSlFYPHQKYDjyQStP8eVGrT1l6i
         ScuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zcmIyfSPT3DB9IRLt1Q7PWIxtIk0W3pNJ/px2/pPzCQ=;
        b=QcZ34fRRVvB6N5TKSNCgdcmG6aqOWpaZDQRwjbjsmigyy20+7BdtLdz/7t84A5cgo4
         AIEyMSFUr8iyK7zifSCalxXiPckCPdPwB14Bx4pd0q57RDdh4Lr5KrTrWNTnoCBPIUAl
         pExvrkMgLll6+BT3yFnncSgEgQ8q9J8xEu7BjZ80qgtzDGsQepTpQ7xlDA/pnItf/hTQ
         ax5yDPiGZpxVPwzf8/u811R60L1w52D1LSxeBCNGw/zNEsNMRLQzS/+Q8qviO8widOK+
         ZbEd565STEin/qXIML6WHSbR2PJhMmHQ4DRrY1tACK83bcHQ0B/KOdVgJ0M1M/ouUga4
         41LQ==
X-Gm-Message-State: AOAM532DV8LOz6mmtuX+qT44KVNp9sep7hPHgg+UbcmpgSeBc+oyqnqr
        Gs0EhTHTL0qg27Du0Q2zzWT6CDFC0kg=
X-Google-Smtp-Source: ABdhPJz134w3NXMtjqFPMP4LRMPg3rK4S5W17iS6NXGVz46uPMhSWwmcJg2bkJ/HK4XpSRhr1Rlzig==
X-Received: by 2002:a50:fd83:: with SMTP id o3mr4918066edt.17.1603228239171;
        Tue, 20 Oct 2020 14:10:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:85fe:66cb:a92b:c664])
        by smtp.gmail.com with ESMTPSA id d12sm4012848ejt.105.2020.10.20.14.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 14:10:38 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 17/22] sub: simplify (x + y) - x --> y
Date:   Tue, 20 Oct 2020 23:10:16 +0200
Message-Id: <20201020211021.82394-18-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020211021.82394-1-luc.vanoostenryck@gmail.com>
References: <20201020211021.82394-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 simplify.c                                | 8 ++++++++
 validation/optim/simplify-same-add-subl.c | 1 -
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/simplify.c b/simplify.c
index 187d4fc0c9ab..cb401d8fac9f 100644
--- a/simplify.c
+++ b/simplify.c
@@ -1382,9 +1382,17 @@ static int simplify_add(struct instruction *insn)
 
 static int simplify_sub(struct instruction *insn)
 {
+	pseudo_t src1 = insn->src1;
 	pseudo_t src2 = insn->src2;
 	struct instruction *def;
 
+	switch (DEF_OPCODE(def, src1)) {
+	case OP_ADD:
+		if (def->src1 == src2)		// (x + y) - x --> y
+			return replace_with_pseudo(insn, def->src2);
+		break;
+	}
+
 	switch (DEF_OPCODE(def, src2)) {
 	case OP_NEG:				// (x - -y) --> (x + y)
 		insn->opcode = OP_ADD;
diff --git a/validation/optim/simplify-same-add-subl.c b/validation/optim/simplify-same-add-subl.c
index 1f17ef0b968e..394e7dc5a404 100644
--- a/validation/optim/simplify-same-add-subl.c
+++ b/validation/optim/simplify-same-add-subl.c
@@ -3,7 +3,6 @@ int add_subl(int x, int y) { return (x + y) - x; }
 /*
  * check-name: simplify-same-add-subl
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-start
 add_subl:
-- 
2.28.0

