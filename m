Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17420E98C2
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfJ3JDv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41978 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfJ3JDv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id p4so1338143wrm.8
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cfd0MKA/Z3VdDnpq3cZbaXMVKLfEfd8yncwXTXklIr4=;
        b=vdtIcQO0ldvrOGtS4MsloXyxrZvbrgl1k7Ux/7KqgvYfSfFCZoyPrwHE9qdU17Czyu
         Xok1+T6d+ElbtkGBn1nP9infSthdqP2nc5isMP3mgy/qPtw6hWz2w4EWFaSDHazsXiqU
         Xr5geSUrglYETg+9DerPoxDxwPeg+9kfGmK7CetF/27DbzfzmFzRbfaN5bDwkG7j48HT
         GMkgCPvebKi1SohZ9Cfg9sZKzjVa/FXIhEEgiF2YXuek+fsoSVA4P3c4JuIDVcAjmPfT
         y8UySLt4aWH+lDaecldWDuvhPAKI8A+umzkak0XAd5RSWT+IHxYYO7VIghEb0mCYgDEn
         X7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cfd0MKA/Z3VdDnpq3cZbaXMVKLfEfd8yncwXTXklIr4=;
        b=d5A1HHw7F9GDWmxGddeGHj+bbzD0iXNr2Djw6039zr+HKo3i78dLO4NJXDsLokxpD/
         mN9xLkE2YNvjvgpq51VdYXM3VmzzQUFwVFpNl+lrBtEbi0Q9deJ1xohdGZoJp4fY2s66
         aF0D6sJCMlLYowGjChEtpurtQ5d/OOBNDD9mUQFoVTrirlo8bwCcKJJQZ9/vt8s+KHYA
         2mHx2zzDvYC0RCsUS16ncfvhCz7cnUNqZcBDG5VLQSWqpHmRp+fCqXTxEQtjNnTqQFlI
         WY4SIWTwZ99raHT+FJeP1Z1JyDRJDr1VNOlDk3H04SQ/tAgSBFXuTr9VCfOYvU7eSiKa
         m5sg==
X-Gm-Message-State: APjAAAWFDO71l18r9WxxmBsdgG/Sz6+0yZfqIr60IKKi6/2v31VvYilm
        YdrFGD3wb7THHndLQDVqepK8AknX
X-Google-Smtp-Source: APXvYqyJNNeOOl4noabKCGd8oAbGV7cp76qe1/06+TFK4c812lNZpbjttd5Yy2uR/m9+CHm0YjI80A==
X-Received: by 2002:adf:ec90:: with SMTP id z16mr22565388wrn.110.1572426229005;
        Wed, 30 Oct 2019 02:03:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:48 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/7] arch: change the arch when changing -m32/64
Date:   Wed, 30 Oct 2019 10:03:27 +0100
Message-Id: <20191030090333.3412-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

If the flag -m32 or -m64 is given in argument, we must insure
that the corresponding architecture is changed as well.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target.c b/target.c
index 7829e8f9a..90097818f 100644
--- a/target.c
+++ b/target.c
@@ -57,6 +57,27 @@ int enum_alignment = 4;
 
 void init_target(void)
 {
+	switch (arch_mach) {
+	case MACH_I386:
+	case MACH_MIPS32:
+	case MACH_PPC32:
+	case MACH_RISCV32:
+	case MACH_SPARC32:
+	case MACH_S390:
+		if (arch_m64 == ARCH_LP64)
+			arch_mach++;
+		break;
+	case MACH_X86_64:
+	case MACH_MIPS64:
+	case MACH_PPC64:
+	case MACH_RISCV64:
+	case MACH_SPARC64:
+	case MACH_S390X:
+		if (arch_m64 == ARCH_LP32)
+			arch_mach--;
+		break;
+	}
+
 	switch (arch_mach) {
 	case MACH_X86_64:
 		if (arch_m64 == ARCH_LP64)
-- 
2.23.0

