Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D532B545B
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Nov 2020 23:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730113AbgKPW3f (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Nov 2020 17:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgKPW3f (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Nov 2020 17:29:35 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD03C0613CF
        for <linux-sparse@vger.kernel.org>; Mon, 16 Nov 2020 14:29:35 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id me8so26668637ejb.10
        for <linux-sparse@vger.kernel.org>; Mon, 16 Nov 2020 14:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gFeoJ7Co8u7OfVlouvwI7kH2iObKo4KckGQrmSm11ck=;
        b=s15OPqAV4CofZPAIok3Lt8FsSGQ1IhP2uwbpaZMwo9xv4lXNC9GeIOhu5LpYaLs2YU
         sMRPWRguC/EOApr67dzgqwlERM94Hg8yokKsESnY+HAfu+jug0U/H1aikXAqr53hkFXn
         hMSv+LhWLIVrNjNbH+8XAjzVJ71SgkpAh4THS5xwZMndnCtMjN7B4D7wDN5IMSMuwcWl
         SI2odcD/yzaTAeXQLarAGNks5Rk0OoMGKmQzR3MtJVKyiLlxziMbtXiQqyHChxcV71Tc
         R55cTNwPkJJwXF7KRa7whLbNFHRgvrtebTG2bZystKGOUFySfamS/2CiME8hfTSkn5HD
         ajHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gFeoJ7Co8u7OfVlouvwI7kH2iObKo4KckGQrmSm11ck=;
        b=fA1OEG1ad8YpM+70r+xBCOx9jQH2FUsq1aR66RSFnQqJHZZUGPP/u+VBV8CZqMLdcd
         5SXvKC2GgOFhQY7JFSPcL8dbG4EFPUbzfwyXFpyoYgnxAmGyV0WdIUAndjiUX3nU8eoW
         pf+9Tu+YPVvVs5AwaH0t6qSUr0XBD/6JndlScLA1DfUou/bA5/NNidFogDn7azSMCnDq
         0H0UFAg7AwueoNc+V2J/R9IfKHpnUsTJJYdRe+YwgCAjydgkTCAiR00aDAlpqXL/9tlP
         T47sIrZhacjOaG4ZXCdqfpAkIdLxod67M8lYbVP+nwQVd3ReXofNHSGuIvvLACkTPneq
         8hOQ==
X-Gm-Message-State: AOAM530bKpmBHklDmGw0f7Q2O/pTufDOdZtGl7+AxIxy2hhh6v1V88Y1
        QRTNNX4fIdy7NXdjKqaP6vIm+wUWZZg=
X-Google-Smtp-Source: ABdhPJzSP1vRiQVUcCzA8NJavtpDPHV4XvtA3PywN7q+xpvzVai+YnmNMFqDZb2DKdgNyx1yRz2gYg==
X-Received: by 2002:a17:906:5a97:: with SMTP id l23mr16129762ejq.232.1605565773611;
        Mon, 16 Nov 2020 14:29:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:a141:d91b:1f47:d972])
        by smtp.gmail.com with ESMTPSA id bn25sm10805446ejb.76.2020.11.16.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 14:29:33 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/8] testcase: avoid UNDEF
Date:   Mon, 16 Nov 2020 23:29:20 +0100
Message-Id: <20201116222927.51939-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116222927.51939-1-luc.vanoostenryck@gmail.com>
References: <20201116222927.51939-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Reduced testcases (with creduce, of course) often needlessly have
undefined variables. Since these are untouched by the simplification
code and should not be present in source code, they should be avoided
in optimization testcases.

So, defines 'x' to some value other than 0.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/optim/cse-size.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/validation/optim/cse-size.c b/validation/optim/cse-size.c
index 5b31420c84ad..e1a5d492a666 100644
--- a/validation/optim/cse-size.c
+++ b/validation/optim/cse-size.c
@@ -1,7 +1,7 @@
 static void foo(void)
 {
 	unsigned short p = 0;
-	int x;
+	int x = 1;
 
 	for (;;)
 		if (p)
@@ -13,5 +13,6 @@ static void foo(void)
  * check-command: test-linearize -Wno-decl $file
  *
  * check-output-ignore
- * check-output-pattern(2): phi\\.
+ * check-output-pattern(0,1): phi\\.
+ * check-output-excludes: cbr
  */
-- 
2.29.2

