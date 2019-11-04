Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240D9EED3D
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 23:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388481AbfKDWEs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 17:04:48 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36865 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388678AbfKDWEp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 17:04:45 -0500
Received: by mail-wm1-f68.google.com with SMTP id q130so17743642wme.2
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fu1HeYYi6cu3FWgJguieb80XpcIdbBw2qoRR1ggWB2g=;
        b=BkVoNSjGoeTX65J6cF1vXRlCOvnMMwIQNw8y5Lx7xKbDz0xmAGwwmzXVJPl/K63O8J
         ZnGRRjv9l1a17DXQRcpCVJLvgOs5bXAHfCAjR3A2gLHf2wTFyE0A1gI4duDXdmmrFPTe
         HNb9pzdO/SQniOnnQFOWVlaMIVr3qnNpeNp1J5hG95xWpO+95xeL2Go23kXj9fDRT6NP
         uTX1HEq4xvoLRPmyln00sJi0NgHk9NiL1UyfCiw64xP8lqWpI61gzV196+ZxImU9H+sY
         xitLRuNxpN6vlkWgQlrG3mVflcSLwPgqF+sO8jCQeQs347CebCZnf5aU1HET4yKFX33K
         pEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fu1HeYYi6cu3FWgJguieb80XpcIdbBw2qoRR1ggWB2g=;
        b=VcNLCH38gsd5091Z7h5IPe1XhZGNm2PwEwsxRbzmTgqZEloDhHkKNmbNNCzCbLu3dJ
         /Fav/LtzhDKWi4o3TL1BW886irmgK3CrxAa6OG5+TNWrOKXKxUxbUGawo2GTubibjPAK
         1hIxKXYZNvpdB6qcVzzUuOTzlVXcmdFT74Ghy3sNsBwpuyDXhSW96N++HsrBos6b4miv
         Jt69CYKMFJfOMGyMciCC1wtYlA1oPdjOZIb38oVWP203d9/ZqEjHf+Owbj1eNaveipY5
         mqMc+y211lGxaLy8AvrJ8PTcOqrOw/WPm3ibR37Ty4J1lzGmOICYnGuAvN2U475neuxn
         RuHA==
X-Gm-Message-State: APjAAAX8XgqeQUtXBoeHXuMkWWuC0KLVEQeNZnnwccLkZHy8qOxSCBYz
        UmIFXlHCVnpi5Nc4OIKl8tsvQcU3
X-Google-Smtp-Source: APXvYqyhfWJRo/RGGZfAXjn58bXb8YdMC5TlXUllz7wo0tiJu0wA7i3viXVzH471MFHpzMcE0461Pg==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr1047716wmk.144.1572905082680;
        Mon, 04 Nov 2019 14:04:42 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id m3sm13955280wrw.20.2019.11.04.14.04.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 14:04:42 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:04:41 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104220440.vsqnrxnogvy3tazw@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104214643.d6ta3xok4jypkrjo@ltop.local>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Nov 04, 2019 at 10:46:44PM +0100, Luc Van Oostenryck wrote:
> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
> > I've put the latest code up at:
> > 
> >  https://github.com/bjdooks-ct/sparse bjdooks/printf20
> > 
> > I think it has all the issues dealt with.
> > 
> > I can't currently post or do a final test as away from work laptop.
> 
> Thank you.
> 
> I've a few more remarks about formatting or naming and
> also some simplifications I would like you make.

This one is a bit more complex.
IIRC, you introduced get_printf_fmt() and called before the
evaluation of the arguments because this evaluation inhibited
the check that the format was indeed a string literal.

In fact it doesn't. This function is thus not needed and
everything can be done in the same function.

Uou'll need a few more changes at the beginning of
evaluate_format_printf() so that the warning is again
issued for non-literal string format.

From bc1c1dd9851188f2de25cdbd2ca4904f6009a0c3 Mon Sep 17 00:00:00 2001
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date: Mon, 4 Nov 2019 18:04:38 +0100
Subject: [PATCH 4/7] get rid of get_printf_fmt()

---
 evaluate.c | 51 +++++++++++++++------------------------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index c415773f4..76b37e045 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2706,44 +2706,33 @@ static int parse_format_printf(const char **fmtstring,
 	return 1;
 }
 
-static const char *get_printf_fmt(struct symbol *fn, struct expression_list *head)
-{
-	struct expression *expr;
-
-	expr = get_nth_expression(head, fn->ctype.format.index-1);
-	if (!expr)
-		return NULL;
-	if (!evaluate_expression(expr))
-		return NULL;
-	if (expr->type == EXPR_PREOP && expr->op == '*')
-		expr = expr->unop;
-	if (expr->type == EXPR_SYMBOL) {
-		struct symbol *sym = expr->symbol;
-		if (sym && sym->initializer)
-			expr = sym->initializer;
-	}
-	if (expr->type == EXPR_STRING)
-		return expr->string->data;
-
-	return NULL;
-}
-
 /*
  * attempt to run through a printf format string and work out the types
  * it specifies. The format is parsed from the __attribute__(format())
  * in the parser code which stores the positions of the message and arg
  * start in the ctype.
  */
-static void evaluate_format_printf(const char *fmt_string, struct symbol *fn,
-				   struct expression_list *head)
+static void evaluate_format_printf(struct symbol *fn, struct expression_list *head)
 {
 	struct format_state state = { };
 	struct expression *expr;
+	struct expression *init;
+	const char *fmt_string;
+
+	if (!fn->ctype.format.index)
+		return;
 
 	expr = get_nth_expression(head, fn->ctype.format.index-1);
 	if (!expr)
 		return;
 
+	if (expr->type != EXPR_SYMBOL || expr->symbol->ident)
+		return;			// not a literal
+	init = expr->symbol->initializer;
+	if (!init || init->type != EXPR_STRING)
+		return;			// not a string
+	fmt_string = init->string->data;
+
 	state.expr = expr;
 	state.first = fn->ctype.format.first;
 	state.arg_index = fn->ctype.format.first;
@@ -2775,19 +2764,9 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 {
 	struct expression *expr;
 	struct symbol_list *argument_types = fn->arguments;
-	const char *fmt_string = NULL;
 	struct symbol *argtype;
 	int i = 1;
 
-	/*
-	 * Do the va-arg format parsing here. This is done as the argument
-	 * info may get lost or changed later on in the evaluation loop by
-	 * calls to degenerate()
-	 */
-
-	if (Wformat && fn->ctype.format.index)
-		fmt_string = get_printf_fmt(fn, head);
-
 	PREPARE_PTR_LIST(argument_types, argtype);
 	FOR_EACH_PTR (head, expr) {
 		struct expression **p = THIS_ADDRESS(expr);
@@ -2825,8 +2804,8 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 	} END_FOR_EACH_PTR(expr);
 	FINISH_PTR_LIST(argtype);
 
-	if (Wformat && fn->ctype.format.index)
-		evaluate_format_printf(fmt_string, fn, head);
+	if (Wformat)
+		evaluate_format_printf(fn, head);
 
 	return 1;
 }
-- 
2.23.0

