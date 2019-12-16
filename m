Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 141D1121E6E
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfLPWiM (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:12 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40880 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbfLPWiL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:11 -0500
Received: by mail-wr1-f66.google.com with SMTP id c14so9212829wrn.7
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffoAOxhvO9fz0FGv6gAzsXl9VjEAP0GpWdtfRsejzQU=;
        b=I1cq8Rhb1SQqrqSHBcLjBHCT9srI+GqfKJrPugOspTRypOhbrTvm7UK6zODa0vuvvn
         MCvHRsitCdwUovTLyQwRoirybrqO+nCrI8JXKfE/pFgWi0jTTMi6a0TY/9EVOxWuDLDn
         sFmaW1Q6yWfgMG2ZCSEqxTj9k4t52tmByAPs9HqLTJoyz8/VIVzqd5FvR0rIb5BuCebp
         tQWCcZTJ+1heOHFLGu3I2sRc8LbfbYrOF7idsJ0iXw3lunSe+Ho+kW6dVggyuiSb12K2
         /9WNZ2Yqd7v04W0rxgKmsP3wqPY/cPKZAJHM0wlncxR43RPuesP60RHipbZbJvTbXUNV
         QQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffoAOxhvO9fz0FGv6gAzsXl9VjEAP0GpWdtfRsejzQU=;
        b=J6mQeaz6PswPj32Hqj77AiWhGs7WaPopEQEMqjhU+wSBJvaTWQcCshczB4qJjLWb4i
         sA2vKmgNFl8UbcqnmMYf9mdEJs9FKhcbhd07gxyeX2KSQIBW5ImbKQx0iorwVUjtQSAQ
         C0ue9fIRYISJjCPDJej4TTBS6TxiET6WALldg9rU0Due0ShdOB+q8p6cf68Cy0d+cnVA
         Fs3mCX1RwVKZ4Grqqxk9PIDpCMymPA/bX9YDjzXKNb6XMfqnTrauk1qA7y1qwWqTUmbu
         Du+nXQ+OOxvn+gqcTgMkuGDid75D/7wEMXCtfL26D3oa0caXtZbOl/NqlPvLSpK3N7XC
         pyog==
X-Gm-Message-State: APjAAAXgCXXlN9hyX/8xq18nCpF6tLObgrYZHK/K3XjtYooecEzZTC7g
        vB6/eejHy6JPvJ2Ls15bOCOBFKv5
X-Google-Smtp-Source: APXvYqwxUAmRw5YXWsgke1FlXamgQClUO5Ti/uxC1L1xlSFCy1roUDbnkjJYMizL3m4D4zn80QM7Qw==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr35198574wrr.266.1576535889606;
        Mon, 16 Dec 2019 14:38:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:09 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 10/10] arch: arch_mach is not needed anymore
Date:   Mon, 16 Dec 2019 23:37:56 +0100
Message-Id: <20191216223756.2428-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

arch_target now points to a structure holding all the
arch-specificities. So, arch_mach is not needed anymore.

Remove arch_mach.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c    | 1 -
 lib.h    | 1 -
 target.c | 2 --
 3 files changed, 4 deletions(-)

diff --git a/lib.c b/lib.c
index 842423c63d25..40e192a7e7cf 100644
--- a/lib.c
+++ b/lib.c
@@ -324,7 +324,6 @@ int arch_msize_long = 0;
 int arch_m64 = ARCH_M64_DEFAULT;
 int arch_big_endian = ARCH_BIG_ENDIAN;
 int arch_fp_abi = FP_ABI_NATIVE;
-int arch_mach = MACH_NATIVE;
 int arch_os = OS_NATIVE;
 int arch_cmodel = CMODEL_UNKNOWN;
 
diff --git a/lib.h b/lib.h
index 290cbc576abe..236235259ab9 100644
--- a/lib.h
+++ b/lib.h
@@ -209,7 +209,6 @@ extern int arch_msize_long;
 extern int arch_m64;
 extern int arch_big_endian;
 extern int arch_fp_abi;
-extern int arch_mach;
 extern int arch_os;
 
 enum {
diff --git a/target.c b/target.c
index 1c7a40836175..abfa975672b1 100644
--- a/target.c
+++ b/target.c
@@ -134,7 +134,6 @@ void target_config(enum machine mach)
 	const struct target *target = targets[mach];
 
 	arch_target = target;
-	arch_mach = target->mach;
 	arch_m64 = target->bitness;
 	arch_big_endian = target->big_endian;
 
@@ -179,7 +178,6 @@ void target_init(void)
 		break;
 	}
 	arch_target = target;
-	arch_mach = target->mach;
 
 	if (fpie > fpic)
 		fpic = fpie;
-- 
2.24.0

