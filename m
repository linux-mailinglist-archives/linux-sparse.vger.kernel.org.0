Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69831FFCEA
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 22:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgFRUtk (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 16:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgFRUti (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 16:49:38 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9DBC06174E
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:38 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so7827440ejm.12
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mT489bCQBQG6RV/gV4wFL+B7Jnjg2vXG/18r21Ye15A=;
        b=p41ttb1lVgHtZ/u7ouvCLLCU9cc86wUO7ZM3bnr8C+Cws6LazLhrSVACKCNIW+kHcD
         z8Lpcfwn7Xlsan8qzupWxsCW3/Yio120nL2oxVTErWcvTkCQOYn/0VErYU6Z0PYX/C4y
         LUl8afZGplo+KO8/57aQg5AvmWt08n50q44/UWHlO22MUcapvVGYZfp7mFaULRLN9HyL
         stTSwaNcXYmEhONIxfqYdeXLFGQnm+siSCpYHy04dLELF7pmUdxlxas0XBdJMfCyWxgv
         d7vriQAJ0k3/aYQ8zZeI8ojT6+TthvRh38d7MScrQEGqY3nJdNrnkp/Lgd4tbTg6yeIO
         rMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mT489bCQBQG6RV/gV4wFL+B7Jnjg2vXG/18r21Ye15A=;
        b=LGlyh6d4OJppoffcShQX146zOPSE3zHwUeIIDmOMIfBXFzWsMvLTfgimYY0etBy50E
         byvBIVDQkklZgvM/R86OJhnWS7FvzFZft4cSnERZYvxOQ1SBU0HEyvP+S9osj+XK8Eqs
         vUCAW2ca89DCFjUswM7WS8o6bwKVZeZ93DmB1xBvvTZ6zIYaQk3bE8f1xHGJAvYDD3/V
         oftQFMtqQi278zcVvMmfqzZdNbQobew05uRbiDjAsxgK1Vo1r8JZf8d7afACxa+pMpR1
         j+nBtNtm7nPrsn7klES/+q0GRA7ZL92UF3OivT66+EL9mjK3axVIwq9Kr2JfdBlMxgyH
         aFLg==
X-Gm-Message-State: AOAM532OO2FleNI2lki04TUnMRmT/hutqGTC9z1bCYRmdwfsadvC+jOK
        ERg+xrBGeLVeo4UEz51kT9X7Hr2S
X-Google-Smtp-Source: ABdhPJzlvgLKw0Qh8Kg1BYVgiUnaJr/6pogtJ43O9Mk5uI1L/D+GPfnzAkQqKdPEErTy5HUhU2ledw==
X-Received: by 2002:a17:906:f8c2:: with SMTP id lh2mr538842ejb.112.1592513376497;
        Thu, 18 Jun 2020 13:49:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id s15sm2913160edw.54.2020.06.18.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 13:49:36 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] pre-process: add support for builtin macros
Date:   Thu, 18 Jun 2020 22:47:14 +0200
Message-Id: <20200618204716.3896-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
References: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse support the expansion of one-symbol-builtin macros like __FILE__.
It also support builtin macros with an argument, like 'defined()'
or '__has_attribute()'.

However, these last one are only expanded inside a pre-processor
conditional expression. This is correct for 'defined()' but macros
like '__has_attribute()' should be expanded in all contexts,
like user defined macros.

So, add support for the general expansion of such macros.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 pre-process.c | 34 ++++++++++++++++++++++++++++++++++
 symbol.h      |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/pre-process.c b/pre-process.c
index 059a7c1d9b7b..d2e13400711e 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -777,6 +777,9 @@ static int expand(struct token **list, struct symbol *sym)
 		expand_arguments(nargs, args);
 	}
 
+	if (sym->expand)
+		return sym->expand(token, args) ? 0 : 1;
+
 	expanding->tainted = 1;
 
 	last = token->next;
@@ -2000,6 +2003,34 @@ static int handle_nondirective(struct stream *stream, struct token **line, struc
 	return 1;
 }
 
+static void create_arglist(struct symbol *sym, int count)
+{
+	struct token *token;
+	struct token **next;
+
+	if (!count)
+		return;
+
+	token = __alloc_token(0);
+	token_type(token) = TOKEN_ARG_COUNT;
+	token->count.normal = count;
+	sym->arglist = token;
+	next = &token->next;
+
+	while (count--) {
+		struct token *id, *uses;
+		id = __alloc_token(0);
+		token_type(id) = TOKEN_IDENT;
+		uses = __alloc_token(0);
+		token_type(uses) = TOKEN_ARG_COUNT;
+		uses->count.normal = 1;
+
+		*next = id;
+		id->next = uses;
+		next = &uses->next;
+	}
+	*next = &eof_token_entry;
+}
 
 static void init_preprocessor(void)
 {
@@ -2041,6 +2072,7 @@ static void init_preprocessor(void)
 	static struct {
 		const char *name;
 		void (*expand_simple)(struct token *);
+		bool (*expand)(struct token *, struct arg *args);
 	} dynamic[] = {
 		{ "__LINE__",		expand_line },
 		{ "__FILE__",		expand_file },
@@ -2067,6 +2099,8 @@ static void init_preprocessor(void)
 		struct symbol *sym;
 		sym = create_symbol(stream, dynamic[i].name, SYM_NODE, NS_MACRO);
 		sym->expand_simple = dynamic[i].expand_simple;
+		if ((sym->expand = dynamic[i].expand) != NULL)
+			create_arglist(sym, 1);
 	}
 
 	counter_macro = 0;
diff --git a/symbol.h b/symbol.h
index 6b483101548a..e256322e83a2 100644
--- a/symbol.h
+++ b/symbol.h
@@ -114,6 +114,7 @@ struct decl_state {
 
 struct pseudo;
 struct entrypoint;
+struct arg;
 
 struct symbol_op {
 	enum keyword type;
@@ -161,6 +162,7 @@ struct symbol {
 			struct token *arglist;
 			struct scope *used_in;
 			void (*expand_simple)(struct token *);
+			bool (*expand)(struct token *, struct arg *args);
 		};
 		struct /* NS_PREPROCESSOR */ {
 			int (*handler)(struct stream *, struct token **, struct token *);
-- 
2.27.0

