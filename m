Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCDA1DFF43
	for <lists+linux-sparse@lfdr.de>; Sun, 24 May 2020 16:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgEXOBH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 24 May 2020 10:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgEXOBG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 24 May 2020 10:01:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD5CC061A0E
        for <linux-sparse@vger.kernel.org>; Sun, 24 May 2020 07:01:05 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id yc10so17958563ejb.12
        for <linux-sparse@vger.kernel.org>; Sun, 24 May 2020 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INJ3DH1XxetEDhVrgnFB0tbnE3WWFeaiND5dPTrbJA8=;
        b=K6jhoyIDznBxFmDyvTqQD8zULpeGrKJQhpvQP6dRxn/IF+tjFYpOvLqQgL16aYMTR+
         oHf1/oolIG6e3wBtmv0VV33RJJkJkQvAtrA+ALqIkNs5ZU7uIZEbUMZJLKTcnMqov2we
         K9jt/aEOyA+ueH3ZqXiCd7z0tvsqHLbwp7vmbnVimpVFarsutTywzmPArC/bsGDkK8fO
         K1AgrF9h8HrE8cnX4akZYYcJH0poVNbBOY3r8D3YBB2Z43WBxGbuE8h9ehL4h67j54la
         TkiTmBAGPvGqJHzF/c+7ItHPVEyrAWeAhSPWVf/cRJYA2gy4SUq+/mqkyjS4w9KJhmnl
         eTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INJ3DH1XxetEDhVrgnFB0tbnE3WWFeaiND5dPTrbJA8=;
        b=J8wCD49gndc51w+OpyOfYLKSb65gHBIIhxhZj2T34fv3ic9EuouKiS5a3vixKw+xOb
         dcOjhKWvArVqMJ019kgSBOvH0+XLPUEFo5w1mEN9kmjAeNBRdhtER9rsDwLrcGgL19Ss
         lZ9pND6nlZw0mscAH00VqsMP0BG22fbPzxaB0T4UdItt2cj5tUr7a0/RP6CmL7KaKw6G
         uR5tPRmLkdD/c/6d98Q8Em3sDbdF1wgjo9HmfrNAItBbqlp+jNeB4jQ0khEm0+44+o3p
         RCZQORi46Ma/pdf0PS2lGb8UveZXi6w2VE35onAU7tB1uj2KpuqaJoGYiuj+5FDoAYRl
         REWg==
X-Gm-Message-State: AOAM5329m4F0gBycclu9e695fumXzhIutOXXGNnksWLGTBSJt0k8eV1w
        hZ1YZ+iBDJRvkU0e93ur/rxIZyKS
X-Google-Smtp-Source: ABdhPJyL5XA/m2dp04lVKZSh+3U0KWmtCZ2s3UyLW0hibhOsyd3ogHkv9L9DzVFssaLf3UsPgQl56Q==
X-Received: by 2002:a17:906:3e56:: with SMTP id t22mr15723887eji.277.1590328864129;
        Sun, 24 May 2020 07:01:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:ed3c:ef0e:6f3d:f78f])
        by smtp.gmail.com with ESMTPSA id g20sm13484530ejx.85.2020.05.24.07.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 07:01:03 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] add an option to suppress warning no 'newline at EOF'
Date:   Sun, 24 May 2020 16:00:57 +0200
Message-Id: <20200524140057.5927-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some platforms have some of their systems header files which
are missing the ending newline. Sparse will then warn about
the missng newline, again and again, and more important warnings
can easily be lost in the noise.

So, add an option flag '-W[no-]newline-eof' to conditionalize
this warning.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c      | 2 ++
 lib.h      | 1 +
 sparse.1   | 7 +++++++
 tokenize.c | 2 +-
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index 9ee8d3cf6b21..7aca9cd0ac40 100644
--- a/lib.c
+++ b/lib.c
@@ -272,6 +272,7 @@ int Wenum_mismatch = 1;
 int Wexternal_function_has_definition = 1;
 int Wsparse_error = 0;
 int Wmemcpy_max_count = 1;
+int Wnewline_eof = 1;
 int Wnon_pointer_null = 1;
 int Wold_initializer = 1;
 int Wold_style_definition = 1;
@@ -761,6 +762,7 @@ static const struct flag warnings[] = {
 	{ "int-to-pointer-cast", &Wint_to_pointer_cast },
 	{ "memcpy-max-count", &Wmemcpy_max_count },
 	{ "non-pointer-null", &Wnon_pointer_null },
+	{ "newline-eof", &Wnewline_eof },
 	{ "old-initializer", &Wold_initializer },
 	{ "old-style-definition", &Wold_style_definition },
 	{ "one-bit-signed-bitfield", &Wone_bit_signed_bitfield },
diff --git a/lib.h b/lib.h
index 5e6db111170a..e767840c1038 100644
--- a/lib.h
+++ b/lib.h
@@ -161,6 +161,7 @@ extern int Wimplicit_int;
 extern int Winit_cstring;
 extern int Wint_to_pointer_cast;
 extern int Wmemcpy_max_count;
+extern int Wnewline_eof;
 extern int Wnon_pointer_null;
 extern int Wold_initializer;
 extern int Wold_style_definition;
diff --git a/sparse.1 b/sparse.1
index 50e928392573..63b408e3aa5a 100644
--- a/sparse.1
+++ b/sparse.1
@@ -280,6 +280,13 @@ The limit can be changed with \fB\-fmemcpy\-max\-count=COUNT\fR,
 the default being \fB100000\fR.
 .
 .TP
+.B \-Wnewline\-eof
+Warn if the input file doesn't end with a newline.
+
+Sparse issues these warnings by default.  To turn them off, use
+\fB\-Wno\-newline\-eof\fR.
+.
+.TP
 .B \-Wnon\-pointer\-null
 Warn about the use of 0 as a NULL pointer.
 
diff --git a/tokenize.c b/tokenize.c
index d8bbef498a46..d3371e1e7cb1 100644
--- a/tokenize.c
+++ b/tokenize.c
@@ -411,7 +411,7 @@ got_eof:
 		c = '\\';
 		goto out;
 	}
-	if (stream->pos)
+	if (stream->pos & Wnewline_eof)
 		warning(stream_pos(stream), "no newline at end of file");
 	else if (spliced)
 		warning(stream_pos(stream), "backslash-newline at end of file");
-- 
2.26.2

