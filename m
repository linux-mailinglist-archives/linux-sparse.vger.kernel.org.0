Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC3D1FFCEC
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 22:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgFRUtm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 16:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgFRUtm (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 16:49:42 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC1BC06174E
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:40 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c35so5925768edf.5
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1I6dYUEzCahHAmSdRkocLPdGc9+GB8kNvsnb8hoMhZc=;
        b=bCgzml17ZPOfvC58Kljd8prcWurVYH3P6Y9I0SSYwPBf9SALogrtJ6k9qLR4Q3mFPR
         SMUP4pPwnIpnWiIuaruEpFSwwHsbSV7sQgKUC2ZuInQy8tiLfjFwNG23RzBrNvsNuDJJ
         hXm0jA/4/H78h33A64ml/1RUKqYrHeo9aB+sc0C+RAjf87Qh1VgXE9Zergfd265YNb7w
         sxYvrGXlkx2Vje7EA4NwmdMnAmOi39wA0q93L+sg0djgu8GPnftjPOqPaEiYlu0QtFvp
         8T66XAdTvtOrnWwHDX7LpOyidwTI+7Cwa22Z2p1fz47c68ilZsnFZ/ep5HKX5S4EqJEu
         RoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1I6dYUEzCahHAmSdRkocLPdGc9+GB8kNvsnb8hoMhZc=;
        b=e0GBXcoXeXZHBpNH1MlZwUfDRBfx02DZ9QUNiJLrvAbBiYiR8P/yW/dtVPPppWjlu+
         t8XtATNCX4f6irFWy4YQ+GnEsBzQwV7lFuPkEWK2+lnMV00bgQHHhfyJ7k+T0DFhimhP
         d6lnICgDfL0cE2SIn0bMxgBkuMabfId3qn1kUq7gWlWLx1LowQFb5sQhniLHjNvuyMdW
         /JqGVDkEvG+GIRyFsEBOfXBJYUbE/F6HqgEPyISsDOpnncr8uHumUjaRaoW2qphatYl2
         5qIRszvGYCJqY4Jyu9MYgyKrzTHtbtbv/Wr0l73TQWtx7YZp7YtjSMuWH7Y7LdmNlsQW
         yV2A==
X-Gm-Message-State: AOAM532Ep2vyQ6JW3I6lyltl05e6hhLt1F2+gHlgYi5sui3WfMzNdlPj
        LgKH3ivYFAVaIDZlE0mDPqwBk/jT
X-Google-Smtp-Source: ABdhPJzRTAJT6iWCmArh9xveksz6QXGFkZynikU4ACQtZVT35rRAL4hpn9xRWqrPXIBLIc2ZiZVNow==
X-Received: by 2002:a05:6402:3106:: with SMTP id dc6mr41480edb.375.1592513378914;
        Thu, 18 Jun 2020 13:49:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id s15sm2913160edw.54.2020.06.18.13.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 13:49:38 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/5] pre-process: make __has_{attribute,builtin}() true builtin macros
Date:   Thu, 18 Jun 2020 22:47:16 +0200
Message-Id: <20200618204716.3896-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
References: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The macros __has_atribute() & __has_builtin() are only expanded
in the context of a preprocessor conditional but they should
be expanded like usual user defined macros.

Fix this by using the new infrastructure for builtin macros.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 ident-list.h  |  2 --
 lib.c         |  2 --
 pre-process.c | 84 ++++++++++++++++++++-------------------------------
 3 files changed, 32 insertions(+), 56 deletions(-)

diff --git a/ident-list.h b/ident-list.h
index a3a282587c67..8049b6940745 100644
--- a/ident-list.h
+++ b/ident-list.h
@@ -59,8 +59,6 @@ IDENT_RESERVED(__label__);
  * sparse. */
 IDENT(defined);
 IDENT(once);
-IDENT(__has_attribute);
-IDENT(__has_builtin);
 IDENT(c_alignas);
 IDENT(c_alignof);
 IDENT(c_generic_selections);
diff --git a/lib.c b/lib.c
index 8f071bfe96ef..7ba758bc537f 100644
--- a/lib.c
+++ b/lib.c
@@ -1452,8 +1452,6 @@ static void create_builtin_stream(void)
 	add_pre_buffer("#add_system \"%s/include\"\n", gcc_base_dir);
 	add_pre_buffer("#add_system \"%s/include-fixed\"\n", gcc_base_dir);
 
-	add_pre_buffer("#define __has_builtin(x) 0\n");
-	add_pre_buffer("#define __has_attribute(x) 0\n");
 	add_pre_buffer("#define __builtin_stdarg_start(a,b) ((a) = (__builtin_va_list)(&(b)))\n");
 	add_pre_buffer("#define __builtin_va_start(a,b) ((a) = (__builtin_va_list)(&(b)))\n");
 	add_pre_buffer("#define __builtin_ms_va_start(a,b) ((a) = (__builtin_ms_va_list)(&(b)))\n");
diff --git a/pre-process.c b/pre-process.c
index 7a39b1715f31..38167802f465 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -160,18 +160,6 @@ static void replace_with_defined(struct token *token)
 	replace_with_bool(token, token_defined(token));
 }
 
-static void replace_with_has_builtin(struct token *token)
-{
-	struct symbol *sym = lookup_symbol(token->ident, NS_SYMBOL);
-	replace_with_bool(token, sym && sym->builtin);
-}
-
-static void replace_with_has_attribute(struct token *token)
-{
-	struct symbol *sym = lookup_symbol(token->ident, NS_KEYWORD);
-	replace_with_bool(token, sym && sym->op && sym->op->attribute);
-}
-
 static void expand_line(struct token *token)
 {
 	replace_with_integer(token, token->pos.line);
@@ -1609,14 +1597,6 @@ static int expression_value(struct token **where)
 				state = 1;
 				beginning = list;
 				break;
-			} else if (p->ident == &__has_builtin_ident) {
-				state = 4;
-				beginning = list;
-				break;
-			} else if (p->ident == &__has_attribute_ident) {
-				state = 6;
-				beginning = list;
-				break;
 			}
 			if (!expand_one_symbol(list))
 				continue;
@@ -1647,38 +1627,6 @@ static int expression_value(struct token **where)
 				sparse_error(p->pos, "missing ')' after \"defined\"");
 			*list = p->next;
 			continue;
-
-		// __has_builtin(x) or __has_attribute(x)
-		case 4: case 6:
-			if (match_op(p, '(')) {
-				state++;
-			} else {
-				sparse_error(p->pos, "missing '(' after \"__has_%s\"",
-					state == 4 ? "builtin" : "attribute");
-				state = 0;
-			}
-			*beginning = p;
-			break;
-		case 5: case 7:
-			if (token_type(p) != TOKEN_IDENT) {
-				sparse_error(p->pos, "identifier expected");
-				state = 0;
-				break;
-			}
-			if (!match_op(p->next, ')'))
-				sparse_error(p->pos, "missing ')' after \"__has_%s\"",
-					state == 5 ? "builtin" : "attribute");
-			if (state == 5)
-				replace_with_has_builtin(p);
-			else
-				replace_with_has_attribute(p);
-			state = 8;
-			*beginning = p;
-			break;
-		case 8:
-			state = 0;
-			*list = p->next;
-			continue;
 		}
 		list = &p->next;
 	}
@@ -2003,6 +1951,36 @@ static int handle_nondirective(struct stream *stream, struct token **line, struc
 	return 1;
 }
 
+static bool expand_has_attribute(struct token *token, struct arg *args)
+{
+	struct token *arg = args[0].expanded;
+	struct symbol *sym;
+
+	if (token_type(arg) != TOKEN_IDENT) {
+		sparse_error(arg->pos, "identifier expected");
+		return false;
+	}
+
+	sym = lookup_symbol(arg->ident, NS_KEYWORD);
+	replace_with_bool(token, sym && sym->op && sym->op->attribute);
+	return true;
+}
+
+static bool expand_has_builtin(struct token *token, struct arg *args)
+{
+	struct token *arg = args[0].expanded;
+	struct symbol *sym;
+
+	if (token_type(arg) != TOKEN_IDENT) {
+		sparse_error(arg->pos, "identifier expected");
+		return false;
+	}
+
+	sym = lookup_symbol(arg->ident, NS_SYMBOL);
+	replace_with_bool(token, sym && sym->builtin);
+	return true;
+}
+
 static bool expand_has_extension(struct token *token, struct arg *args)
 {
 	struct token *arg = args[0].expanded;
@@ -2133,6 +2111,8 @@ static void init_preprocessor(void)
 		{ "__TIME__",		expand_time },
 		{ "__COUNTER__",	expand_counter },
 		{ "__INCLUDE_LEVEL__",	expand_include_level },
+		{ "__has_attribute",	NULL, expand_has_attribute },
+		{ "__has_builtin",	NULL, expand_has_builtin },
 		{ "__has_extension",	NULL, expand_has_extension },
 		{ "__has_feature",	NULL, expand_has_feature },
 	};
-- 
2.27.0

