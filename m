Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 281E7FD268
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfKOBZX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:25:23 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44258 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfKOBZX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:25:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id f2so9134421wrs.11
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qim0d+bSWfF9SSPhts6IrHKcLBzeCKICpnCJAdfDg5w=;
        b=WuOgrayqljorip1O6RWYVwtQ1sYVCET11wFa6S98CF3y1izuL5OVNlkeCTHC24WnFa
         dokAYInXfUjQbK8Dcccpk058BsULL1HwYVGnrrLXI0adjciuL5XOSDgAroDMpKiSMk+4
         suqNcRypf06mlXQbDJ4VzCLw/MH05kIQgwMKXLhr39SUtPm3222hqFffoAIAOztprq8d
         2g7b92TYWqj4eQatOy32p/5t/ub2MhbriuE6btSXpFFONJaSW2TSmGEOoEiJdFbvtH7s
         SxbpeR8+UigAoSj4cx0vcwjLd9mvliTM06C6YRzs9rfmGrn93DinDGdGRm0KuOjXYmD/
         +otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qim0d+bSWfF9SSPhts6IrHKcLBzeCKICpnCJAdfDg5w=;
        b=AQPwl1SnhRVkiMOuT7TgPzPTldHO79OWE3p6+YSvSBXYZS142kIpOYq8dXK2a8sO55
         MUYVT3YGpbEybmYPC1OtLFLJ+QAfFrx+3MDl1Y8XeELUJXojGaq0cTL+htlTNcRC5YWV
         OBxJeVLF0nSvC3sHKTPl0jyQ46mau7FNRD0ibfR80G93XOSl84b/1ohTJdPj62DcrRcQ
         RhK2dcUrN/Qbfma+EXZ5bTk97mrZ3TpRUucnqmET0DFNXiwpqIAXxhxpJtGm1hh6aJDp
         L6MSu0TA1kqGfXVH6VnNHXLx7uXzB90m/CFsy5maOwzlFpJgWQU3LoPtlteBNoXHBu7e
         /wJQ==
X-Gm-Message-State: APjAAAVM4U1d6f5P0G7op87SYm1GvVPnbeqOGze3ocPyu9Bm10SGove5
        jx9Ao5DRqe+3DxpXDIQr7o5HZaCp
X-Google-Smtp-Source: APXvYqw+GSsLIX3Zgq9KMLht+8nw196/zeDvLggK4qv2guqK9J5zMVw06CfsmNOkozhX0vagVAzFMg==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr1864306wrq.40.1573781120909;
        Thu, 14 Nov 2019 17:25:20 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id j22sm10736216wrd.41.2019.11.14.17.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:25:20 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] arch: teach sparse about -fshort-wchar
Date:   Fri, 15 Nov 2019 02:25:14 +0100
Message-Id: <20191115012515.53725-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
References: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is useful in cgcc for supporting Cygwin which doesn't
use a 32-bit type for wchar_t.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c                         | 2 ++
 lib.h                         | 1 +
 target.c                      | 2 ++
 validation/arch/short-wchar.c | 6 ++++++
 4 files changed, 11 insertions(+)
 create mode 100644 validation/arch/short-wchar.c

diff --git a/lib.c b/lib.c
index 350d881a9..47dd7029d 100644
--- a/lib.c
+++ b/lib.c
@@ -313,6 +313,7 @@ unsigned long long fmemcpy_max_count = 100000;
 unsigned long fpasses = ~0UL;
 int fpic = 0;
 int fpie = 0;
+int fshort_wchar = 0;
 int funsigned_char = -1;
 
 int preprocess_only;
@@ -995,6 +996,7 @@ static struct flag fflags[] = {
 	{ "pie",		&fpie,	handle_switch_setval, 1 },
 	{ "PIE",		&fpie,	handle_switch_setval, 2 },
 	{ "signed-char",	&funsigned_char, NULL,	OPT_INVERSE },
+	{ "short-wchar",	&fshort_wchar },
 	{ "unsigned-char",	&funsigned_char, NULL, },
 	{ },
 };
diff --git a/lib.h b/lib.h
index 00c608125..3d596a529 100644
--- a/lib.h
+++ b/lib.h
@@ -202,6 +202,7 @@ extern unsigned long long fmemcpy_max_count;
 extern unsigned long fpasses;
 extern int fpic;
 extern int fpie;
+extern int fshort_wchar;
 extern int funsigned_char;
 
 extern int arch_m64;
diff --git a/target.c b/target.c
index 9ce21272d..7aaad1c40 100644
--- a/target.c
+++ b/target.c
@@ -106,6 +106,8 @@ void init_target(void)
 	default:
 		break;
 	}
+	if (fshort_wchar)
+		wchar_ctype = &ushort_ctype;
 
 	switch (arch_mach) {
 	case MACH_MIPS64:
diff --git a/validation/arch/short-wchar.c b/validation/arch/short-wchar.c
new file mode 100644
index 000000000..de05313c6
--- /dev/null
+++ b/validation/arch/short-wchar.c
@@ -0,0 +1,6 @@
+_Static_assert([__WCHAR_TYPE__] == [unsigned short], "short wchar");
+
+/*
+ * check-name: short-wchar
+ * check-command: sparse -fshort-wchar $file
+ */
-- 
2.24.0

