Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966088E9DC
	for <lists+linux-sparse@lfdr.de>; Thu, 15 Aug 2019 13:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbfHOLMj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 15 Aug 2019 07:12:39 -0400
Received: from movementarian.org ([178.79.150.28]:51746 "EHLO
        movementarian.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfHOLMj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 15 Aug 2019 07:12:39 -0400
Received: from movement by movementarian.org with local (Exim 4.92)
        (envelope-from <movement@movementarian.org>)
        id 1hyDgL-0005Fb-Ox; Thu, 15 Aug 2019 12:12:37 +0100
Date:   Thu, 15 Aug 2019 12:12:37 +0100
From:   John Levon <levon@movementarian.org>
To:     smatch@vger.kernel.org, linux-sparse@vger.kernel.org
Cc:     yuri.pankov@nexenta.com
Subject: Re: noreturn attribute doesn't work in smatch
Message-ID: <20190815111237.GA20100@movementarian.org>
References: <20190815005328.GA8004@movementarian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815005328.GA8004@movementarian.org>
X-Url:  http://www.movementarian.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


I took another pass, and this works for me:

diff --git a/parse.c b/parse.c
index ca4726b8..44c59707 100644
--- a/parse.c
+++ b/parse.c
@@ -2859,6 +2859,7 @@ struct token *external_declaration(struct token
*token, struct symbol_list **lis
        /* Parse declaration-specifiers, if any */
        token = declaration_specifiers(token, &ctx);
        mod = storage_modifiers(&ctx);
+       mod |= ctx.ctype.modifiers & MOD_NORETURN;
        decl = alloc_symbol(token->pos, SYM_NODE);
        /* Just a type declaration? */
        if (match_op(token, ';')) {

(I suppose a proper fix would collate all function-level attributes
but...)


However, it seems like smatch is still not quite passing its knowledge
along: if I have:

extern void die() __attribute((__noreturn__));

void mydie()
{
	die();
}

then the die() call is nullified, but smatch doesn't realise that means
all paths of mydie() are __noreturn__ too.

regards
john
