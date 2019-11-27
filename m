Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB8910A895
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfK0CG7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34093 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfK0CG7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id t2so24802864wrr.1
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0vitU0+oYwg7IlELLCqnY2I6rtW7GbwNNJAgyqCT5o=;
        b=N6LwwB8HlcjCPzFIln5EVbKjjyoRiVfhOLaKroSW5BpZLzGxd/IEv9j/hZRwHKMNzF
         5F4cQ7PBlxqkJUU244zlmrIwucyYOjDSwRZOKu3MC8NOo6tcf1FszXeNaAQfnZqMjb2H
         nazSxtV0zY02dWCncEp8hc3frs9v4zHnjBwzD8Q3Z7AMe/Cn/BQ+79BGPryTjAciETgP
         3ceUyHG9LGGvERfZ8ouL/HdS2lmCxjMTt92q9Q/NIwtCyAjxVBNUUO01cB+jB53Eg96m
         sgMV9O93BFKZubUB/Ib6gc8N1/KIjZoYPkBZNFU0DAq8qsT4cehc05Xt7YxvfhVmPz+7
         aKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0vitU0+oYwg7IlELLCqnY2I6rtW7GbwNNJAgyqCT5o=;
        b=qGvmKr2mAXy0tfptAMcyQr+ZvEAwojrbu0ZY1PTXWEtZRPDLB7DBPQZgYzMPl9BKI0
         E0+1tJ4chTZhWHENOi93TbXS3QfQIQonZkaTD62Y0HLa4gpEL86A5o9fhO8nFEVq658V
         Myu+073xr2uT8T4M2Fy4T2gmilRtEr4wAuJmUCc8dHkC2jqFo3RTcVdcUoszGSiTDThQ
         Q5TZbuOZ0lOyI4lPMYi8Xn+5dL/mfofhybc2uRDOcgnzDJXDdAHVYUdXzPphut6sIlmG
         igkdfVP3EnkkQsiPqkYppUHJc/enEyXSBbUwS33lya2vkuWMCwLpy+V7NRx9AXufxYIO
         VVzQ==
X-Gm-Message-State: APjAAAUWJQjYuFtvQybrot1OXO2VexYCoRaXsEZc+jV/BizS0lNx5oNR
        w2wHi3NX6L7FbmWKO4iD+JXRK9Kc
X-Google-Smtp-Source: APXvYqzd6JNqtBqt1tU2ec8FDJdXf2769FnPGnyTrX7SYEAZOcwHpXzpHiCQ+zsTQdqcM5kdXJf1DQ==
X-Received: by 2002:adf:979a:: with SMTP id s26mr40689297wrb.92.1574820416929;
        Tue, 26 Nov 2019 18:06:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:56 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 08/12] arch: add predefines for INT128 only on supported archs
Date:   Wed, 27 Nov 2019 03:06:39 +0100
Message-Id: <20191127020643.68629-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The predefines for INT128 were added unconditionally for
all archs but only the 64-bit ones support them.

Fix this by issuing the the predefines only on 64-bit archs.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c                            | 13 +++++++++++--
 validation/preprocessor/predef.c |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib.c b/lib.c
index f9e7caf4a..602960a08 100644
--- a/lib.c
+++ b/lib.c
@@ -1433,8 +1433,6 @@ static void predefined_macros(void)
 	predefined_ctype("INT64",      int64_ctype, PTYPE_MAX|PTYPE_TYPE);
 	predefined_ctype("UINT64",    uint64_ctype, PTYPE_MAX|PTYPE_TYPE);
 
-	predefined_sizeof("INT128", "", 128);
-
 	predefined_ctype("INTMAX",    intmax_ctype, PTYPE_MAX|PTYPE_TYPE|PTYPE_WIDTH);
 	predefined_ctype("UINTMAX",  uintmax_ctype, PTYPE_MAX|PTYPE_TYPE);
 	predefined_ctype("INTPTR",   ssize_t_ctype, PTYPE_MAX|PTYPE_TYPE|PTYPE_WIDTH);
@@ -1447,6 +1445,17 @@ static void predefined_macros(void)
 	predefined_sizeof("DOUBLE", "", bits_in_double);
 	predefined_sizeof("LONG_DOUBLE", "", bits_in_longdouble);
 
+	switch (arch_mach) {
+	case MACH_ARM64:
+	case MACH_MIPS64:
+	case MACH_PPC64:
+	case MACH_RISCV64:
+	case MACH_S390X:
+	case MACH_SPARC64:
+	case MACH_X86_64:
+		predefined_sizeof("INT128", "", 128);
+	}
+
 	predefine("__ORDER_LITTLE_ENDIAN__", 1, "1234");
 	predefine("__ORDER_BIG_ENDIAN__", 1, "4321");
 	predefine("__ORDER_PDP_ENDIAN__", 1, "3412");
diff --git a/validation/preprocessor/predef.c b/validation/preprocessor/predef.c
index 5678acedf..90f9fb9c8 100644
--- a/validation/preprocessor/predef.c
+++ b/validation/preprocessor/predef.c
@@ -37,7 +37,9 @@ int test(void)
 	TEST_SIZEOF(INT, int);
 	TEST_SIZEOF(LONG, long);
 	TEST_SIZEOF(LONG_LONG, long long);
+#ifdef __SIZEOF_INT128__
 	TEST_SIZEOF(INT128, __int128);
+#endif
 	TEST_SIZEOF(PTRDIFF_T, __PTRDIFF_TYPE__);
 	TEST_SIZEOF(SIZE_T, __SIZE_TYPE__);
 	TEST_SIZEOF(POINTER, void*);
-- 
2.24.0

