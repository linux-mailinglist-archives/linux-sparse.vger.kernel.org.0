Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0901FFCE9
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 22:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgFRUti (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 16:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgFRUth (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 16:49:37 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FEFC0613EE
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w16so7866568ejj.5
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oJHgcZ/6vod5zjTvZzIkQ0ATymwfF8pLieoB5Vp7Cyg=;
        b=YOpunzhC/jamK9ThoUpS9vkxG762heCNEUwocoe+fpDFz5MeV+q41pYjApYN31Dz53
         W6Y6dPtagi+QG9vBQv3opUF1MkL5Umz6jds0XfGrWG1pCRn7ke/mARPaDU9XJ6aVS5+3
         d9IWuyheBkCE4SqGaFhOEb2pZHI1hhhrBIREgBPv6ZpHtvPjJM58EpJ2SjMlErbpxvRU
         5Vd4TA7hq0lpG4hLorJtDprbd+EvvaU1vg/sAZrnZAhDw0H3OoOzDuFriLo5suq+30X1
         PnhakKD31gFbKSu8hMuOLy1pSUb486ImQhQT2dw5+0GPYiwPAscIaTZG57Zh4rzxlGvO
         GUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJHgcZ/6vod5zjTvZzIkQ0ATymwfF8pLieoB5Vp7Cyg=;
        b=BH4jsVZC1FctjVtde/8F+lCWB2iSxmlt869aN36vbRt4M4Fl4HD2L4DXktPvu2Qtni
         BteAy6XbaOYbQvCzFDi4Ww4S112jhOQCLx6mGY43lkJKL53lyxILo6CmNAy1NEFaBLHf
         z1YywYEBXaBGpTVGbt57x41VP7G/CNtWE1qBUejM95eVa4tiEYwMicazf+mPhaJ/VYEy
         dDrlyu1fAoIJkvFI/4CcWAh14ZdWkoM08va/oXbmHQW1LWY7XvYkhQggIx1FzrCkO9XF
         LNSMBhLWutHujwKDwr9CNKpiszBESPFjLjWidae9yk7MbetBsQMTF22kdv1rfhk5zf8P
         PAOQ==
X-Gm-Message-State: AOAM531Bg4/9/26U/PxZp0yd8wylhaAi2nUPWwSOZGSeDk9kGQexvDem
        Ns7ZitUC2DWgGZ5DD9XFPCRG4cdm
X-Google-Smtp-Source: ABdhPJwOkJOTUi1vtcfT9RrusSUbHzMTDWhIvG8J2OM4gJvf40NZH2j0tlbeNVjKY4KXp0yAkFK/sQ==
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr239911ejb.549.1592513375442;
        Thu, 18 Jun 2020 13:49:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id s15sm2913160edw.54.2020.06.18.13.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 13:49:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/5] pre-process: rename 'expander' into 'expand_simple'
Date:   Thu, 18 Jun 2020 22:47:13 +0200
Message-Id: <20200618204716.3896-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
References: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse support the expansion of one-symbol-builtin macros like
__FILE__ or the pre-processor operator 'defined'. It also supports the
expansion of builtin macros with arguments, like __has_attribute()
but only inside a pre-processor conditional expression.

In preparation of adding the general expansion of these macros,
rename the method 'expander' into 'expand_simple'.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 pre-process.c | 8 ++++----
 symbol.h      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/pre-process.c b/pre-process.c
index e6becf233eba..059a7c1d9b7b 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -229,8 +229,8 @@ static int expand_one_symbol(struct token **list)
 	sym = lookup_macro(token->ident);
 	if (!sym)
 		return 1;
-	if (sym->expander) {
-		sym->expander(token);
+	if (sym->expand_simple) {
+		sym->expand_simple(token);
 		return 1;
 	} else {
 		int rc;
@@ -2040,7 +2040,7 @@ static void init_preprocessor(void)
 	};
 	static struct {
 		const char *name;
-		void (*expander)(struct token *);
+		void (*expand_simple)(struct token *);
 	} dynamic[] = {
 		{ "__LINE__",		expand_line },
 		{ "__FILE__",		expand_file },
@@ -2066,7 +2066,7 @@ static void init_preprocessor(void)
 	for (i = 0; i < ARRAY_SIZE(dynamic); i++) {
 		struct symbol *sym;
 		sym = create_symbol(stream, dynamic[i].name, SYM_NODE, NS_MACRO);
-		sym->expander = dynamic[i].expander;
+		sym->expand_simple = dynamic[i].expand_simple;
 	}
 
 	counter_macro = 0;
diff --git a/symbol.h b/symbol.h
index a16a27c24afe..6b483101548a 100644
--- a/symbol.h
+++ b/symbol.h
@@ -160,7 +160,7 @@ struct symbol {
 			struct token *expansion;
 			struct token *arglist;
 			struct scope *used_in;
-			void (*expander)(struct token *);
+			void (*expand_simple)(struct token *);
 		};
 		struct /* NS_PREPROCESSOR */ {
 			int (*handler)(struct stream *, struct token **, struct token *);
-- 
2.27.0

