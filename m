Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D82A21463A
	for <lists+linux-sparse@lfdr.de>; Sat,  4 Jul 2020 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgGDN54 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 09:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgGDN5z (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 09:57:55 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E749C061794
        for <linux-sparse@vger.kernel.org>; Sat,  4 Jul 2020 06:57:55 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id dm19so24073258edb.13
        for <linux-sparse@vger.kernel.org>; Sat, 04 Jul 2020 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aDf21opjaB64NtBqL5FyDGgbhaj69BfusJf0QVbF/Is=;
        b=eRxmIkVE9cZfaEBvIO7ks4GRguXkT50qeH0WOOjzupPcs0OJzVmagAnm1HyYNvpKCV
         /fdmHSDDrHf+AmRyPb6+MROOVudSNc+YD5eOXX44PVfwefofDYe+f6IcgOhNZeSEG7Ln
         K5zN1EJ7MRZfdyjVaQk1tYuYonf0GPoUjHxBklPLMBhY24TiYSn14+iCq2vO9oZenMZI
         9GiMHuMqHCD7BfWiVnVuzmdiVPyZ921Z+dqFirMIa/AvUg7w/yPSnVWnsocwyKYaACGk
         kah/O4LgDE4dP5uP+/y8R2rVAx70yl8zRYBdEFkkyOkhiaQikWpD4/8t1JOxPoW3sTBa
         7Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDf21opjaB64NtBqL5FyDGgbhaj69BfusJf0QVbF/Is=;
        b=XSdrTkHC9nTJRpb/3DmlEXBuvlh+1SxMo0iTGrhFr+/OM5nlSw60f4POqk4z/Pe68P
         Zgdg+T6ns/2LpDmHxqWlQWJPEqpc1hlsS0e6IXwS8wt7XJ4f7qsIzqoAm2Ositchc57S
         d8O3KFLVjdHoVUGtZ1vLLGZ8aqqHhet6JCZ8Voy2aSCzo94e69dJ/Bv0dkzFu9RO42/W
         Sb3pitfG07bMu/ZoVIKF2BwaAO6P6kGZEUvPt4prl09if3sVQtwwknc2o1O37oxYRizb
         8nfHHMKuJnIR4KdDNOI3Lm6NcwGFKieZOJFk+jn3B2bflWn2A6FoBz9TEVa2+Cxvxxct
         e3Eg==
X-Gm-Message-State: AOAM533vKsd2vCk4UaH/pD9aonvF1XLTO1hkUObX78ocA6N4zZtlZVGT
        As2z0YMxRg16eypqUhTSRStQd8Hw
X-Google-Smtp-Source: ABdhPJz7ZWCyg/QGFwokK+K+WWzh9FS25LC6ylH32WZ3qGS2YGkW0/6wKQRFBoEwT30iuB0d8glPlA==
X-Received: by 2002:a50:c219:: with SMTP id n25mr46555942edf.306.1593871074101;
        Sat, 04 Jul 2020 06:57:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:41c2:9e8d:5955:8578])
        by smtp.gmail.com with ESMTPSA id w18sm16348297edv.11.2020.07.04.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 06:57:53 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/3] add memory asm constraint for S390
Date:   Sat,  4 Jul 2020 15:57:47 +0200
Message-Id: <20200704135747.87752-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
References: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The 'Q', 'R', 'S' & 'T'' asm constraint are used for for memory
operands on S390 but only 'Q' belong to the 'common constraints'.

Fix this by handling the 3 others with an arch-specific method.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target-s390.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target-s390.c b/target-s390.c
index 8fe7d93677b2..9dbc810e507c 100644
--- a/target-s390.c
+++ b/target-s390.c
@@ -1,6 +1,7 @@
 #include "symbol.h"
 #include "target.h"
 #include "machine.h"
+#include "expression.h"
 
 
 static void predefine_s390(const struct target *self)
@@ -8,6 +9,16 @@ static void predefine_s390(const struct target *self)
 	predefine("__s390__", 1, "1");
 }
 
+static const char *asm_constraint_s390(struct asm_operand *op, int c, const char *str)
+{
+	switch (c) {
+	case 'R': case 'S': case 'T':
+		op->is_memory = true;
+		break;
+	}
+	return str;
+}
+
 const struct target target_s390 = {
 	.mach = MACH_S390,
 	.bitness = ARCH_LP32,
@@ -21,6 +32,7 @@ const struct target target_s390 = {
 	.target_64bit = &target_s390x,
 
 	.predefine = predefine_s390,
+	.asm_constraint = asm_constraint_s390,
 };
 
 
@@ -45,4 +57,5 @@ const struct target target_s390x = {
 	.target_32bit = &target_s390,
 
 	.predefine = predefine_s390x,
+	.asm_constraint = asm_constraint_s390,
 };
-- 
2.27.0

