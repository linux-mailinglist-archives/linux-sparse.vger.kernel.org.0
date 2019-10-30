Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C34E98C1
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbfJ3JDu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43997 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfJ3JDu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id n1so1329534wra.10
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cfd0MKA/Z3VdDnpq3cZbaXMVKLfEfd8yncwXTXklIr4=;
        b=JBs1YRmltpWduNv+bI0HVBZFkQOJ01mEj6WjtOT1kL7oOduY6AQJC/LsDDL3BDtWbZ
         4khJg3vGWINq19lTdGqF9DhJRc/gHoUCFKoK/Ao7nsf37JJSr/eS9+1UVH+BR66SOOuR
         Vn3ZLqiRs86AfERKEi1wDhrGO2q9pIsTObM4WNdirnFxX7tqCZke+2QX51Zy4bufRxSE
         k5a5+CR2ox/6cRHoYDioczjhmcGVfqtXg0LoNlIEXP7mEvBqPcpoBMaaZ257C2FkZ/gl
         x7c35gCGm+yPLlLFBBrnAqGICutiRYnHxFBa8nIYnKYw6OdExaoZsDBDEorn3MggP06I
         mc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cfd0MKA/Z3VdDnpq3cZbaXMVKLfEfd8yncwXTXklIr4=;
        b=P30vVJ7i74/9RQx8cFPoFuzG/QsqAZFOZ+dlC6K+ZhcUmafdJTbo86Z/nTLaR35vzD
         jji/Py7jttJ76TAzfzYuWZDH0C3yZrlNutN3JC56c4eqftL/Lx0RmtQDvRq5YGH6GDuG
         NtJjCVcRWN9+71htTMOpSu2pcLxQsWguAKE75FY7NpnAcR5QO71XWzxc+2TM9p3CWIBC
         dWw8b1qjWePsmu7RRC7+PJRymAQ3X9llGwbjMXEwzQscE4tuMBXeq116/UggLFolcbmW
         2YMAivx4NNSyn4D1ln+stvWs6850jB6f4/OXWVRLGGnaPUEAmHItZzGxpwyvuevjfjPy
         HYUA==
X-Gm-Message-State: APjAAAX/6MPZ3qISMVq2WyEFLpwgFxNwDXsfFN9ucLmgKIbUIGHn+kD+
        pn9tssTOd2Wa8/FcpotUotIyLY64
X-Google-Smtp-Source: APXvYqyVhbY0Bp6gUuskfpavHE0jskgU/Dinj7fNn6fj/aRlhZhhvlqA6intuecs/ac7SZHP6xJH3Q==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr22622570wrm.218.1572426228107;
        Wed, 30 Oct 2019 02:03:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:47 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 3/6] change the arch when changing -m32/64
Date:   Wed, 30 Oct 2019 10:03:26 +0100
Message-Id: <20191030090333.3412-7-luc.vanoostenryck@gmail.com>
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

