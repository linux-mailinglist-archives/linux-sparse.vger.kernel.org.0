Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1AD10A896
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfK0CHA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:07:00 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45720 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfK0CHA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:07:00 -0500
Received: by mail-wr1-f67.google.com with SMTP id z10so24704154wrs.12
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aHh6Ft9v6BE2j7+GtvCtwAC4ocwk3GJa90kZ3tgHNfI=;
        b=JZO75P3j0YnHGbKKOzdYhIKGoD/HfJHxow5ONe28jOJoMEVu37TH9YlonOjmus0l3X
         J5T+uF1u3gBtYIpZFPpVNC7dHhW7ouRYOVxecLDBj1L24LrO+2QF6xrM1dEa4ONYhowf
         OBeVPNExMQSKEZE+8U6+DKtFeRbNCYhAqLyq0taO7OeacgkEYlzpTvkWtsAK1IZEQCAK
         lpoIC/ikiBOY9DAj97SeFUAm6OY81nVEzRFVqxccHJlSbW4w6F46XDHAV9f8WjpFz8Xk
         FVHH+FN8LoEKy5Bvc/23foAkz+V8kvoUfDdCmJhOP7q+zqLCD8QaG6TiaaqVmsSoaOOO
         DfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aHh6Ft9v6BE2j7+GtvCtwAC4ocwk3GJa90kZ3tgHNfI=;
        b=UQAPEieDIrHFW+5JTx3kfxPNCT1WofT81sJ834eOEgBYIPo684aVCO7DOtv6uJSiS1
         NjsMrhSG5HZ3+K3FvGWG0Mo4YsN1ZI4nXUUr376lJb8/o0bikcmxiX4Z146cUcLor0t0
         coFinkYPGSUC9rgNrTj6ZHUc53UiFRLalOr4PKXW0XDYZIK2VLYPaPdMXz1WdFLieA3i
         d/VUClGFm0bvmHu2DlWrr2LsDqzJkf6EOPikcz2FyOVEhs7UqWn3cgoVAz3wM561uNes
         m9bWPd+Dycf8BoMlJkTCY4zNhJ6xSok7xGI/nVRRtbvN16pAYkjjEuNtyctit+tP7gwH
         twhQ==
X-Gm-Message-State: APjAAAXzS1//PLpVlmoO2hcYxckrUlm/5YXZn1unShE/4f9jxaBQNnre
        4sq8WV+E06ckXiA9pJum/n16ea2Z
X-Google-Smtp-Source: APXvYqwAIH4pthqSbtuwE95x7gi6Apb97JhM/Dgs86iqr7hAwhq4cKXIHsSLX53BXLXoC0aKseq2jw==
X-Received: by 2002:a05:6000:149:: with SMTP id r9mr387832wrx.147.1574820418008;
        Tue, 26 Nov 2019 18:06:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:57 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 09/12] arch: use a variable for the OS
Date:   Wed, 27 Nov 2019 03:06:40 +0100
Message-Id: <20191127020643.68629-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

There are a few OS-specific settings and handling them
with #ifdef is 1) ugly, 2) can only work with when specifically
built for this OS (either a native or cross-build).

So, use a variable to hold the OS and initialize it to the one
used to compile sparse. This avoid the ugly #ifdef and allow
simpler transition if if the future sparse would take the OS
in parameter (maybe as triple).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c     |  1 +
 lib.h     |  1 +
 machine.h | 26 ++++++++++++++++++++++++++
 target.c  | 24 +++++++++++++-----------
 4 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/lib.c b/lib.c
index 602960a08..8bfe4e1c9 100644
--- a/lib.c
+++ b/lib.c
@@ -329,6 +329,7 @@ static int arch_msize_long = 0;
 int arch_m64 = ARCH_M64_DEFAULT;
 int arch_big_endian = ARCH_BIG_ENDIAN;
 int arch_mach = MACH_NATIVE;
+int arch_os = OS_NATIVE;
 int arch_cmodel = CMODEL_UNKNOWN;
 
 
diff --git a/lib.h b/lib.h
index 00c608125..24febfbfa 100644
--- a/lib.h
+++ b/lib.h
@@ -207,6 +207,7 @@ extern int funsigned_char;
 extern int arch_m64;
 extern int arch_big_endian;
 extern int arch_mach;
+extern int arch_os;
 
 enum {
 	CMODEL_UNKNOWN,
diff --git a/machine.h b/machine.h
index 22b05d91a..e98a64462 100644
--- a/machine.h
+++ b/machine.h
@@ -70,4 +70,30 @@ enum machine {
 #define MACH_NATIVE	MACH_UNKNOWN
 #endif
 
+
+enum {
+	OS_CYGWIN,
+	OS_DARWIN,
+	OS_FREEBSD,
+	OS_LINUX,
+	OS_NETBSD,
+	OS_OPENBSD,
+	OS_SUNOS,
+	OS_UNKNOWN,
+};
+
+#if defined(__linux__) || defined(__linux)
+#define OS_NATIVE	OS_LINUX
+#elif defined(__FreeBSD__)
+#define OS_NATIVE	OS_FREEBSD
+#elif defined(__APPLE__)
+#define OS_NATIVE	OS_DARWIN
+#elif defined(__CYGWIN__)
+#define OS_NATIVE	OS_CYGWIN
+#elif defined(__sun__) && defined(__sun)
+#define OS_NATIVE	OS_SUNOS
+#else
+#define OS_NATIVE	OS_UNKNOWN
+#endif
+
 #endif
diff --git a/target.c b/target.c
index d03b179be..c89bb07d2 100644
--- a/target.c
+++ b/target.c
@@ -83,13 +83,19 @@ void init_target(void)
 		wchar_ctype = &long_ctype;
 		/* fall through */
 	case MACH_X86_64:
-#if defined(__APPLE__)
-		int64_ctype = &llong_ctype;
-		uint64_ctype = &ullong_ctype;
-#endif
-#if defined(__FreeBSD__) || defined(__APPLE__)
-		wint_ctype = &int_ctype;
-#endif
+		switch (arch_os) {
+		case OS_CYGWIN:
+			wchar_ctype = &ushort_ctype;
+			break;
+		case OS_DARWIN:
+			int64_ctype = &llong_ctype;
+			uint64_ctype = &ullong_ctype;
+			wint_ctype = &int_ctype;
+			break;
+		case OS_FREEBSD:
+			wint_ctype = &int_ctype;
+			break;
+		}
 		break;
 	case MACH_M68K:
 	case MACH_SPARC32:
@@ -178,8 +184,4 @@ void init_target(void)
 		pointer_alignment = 8;
 		break;
 	}
-
-#if defined(__CYGWIN__)
-	wchar_ctype = &ushort_ctype;
-#endif
 }
-- 
2.24.0

