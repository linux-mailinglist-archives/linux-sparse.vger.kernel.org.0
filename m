Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C3055B217
	for <lists+linux-sparse@lfdr.de>; Sun, 26 Jun 2022 15:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbiFZNIH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 26 Jun 2022 09:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234535AbiFZNID (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 26 Jun 2022 09:08:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C5125F9
        for <linux-sparse@vger.kernel.org>; Sun, 26 Jun 2022 06:08:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B39B86121E
        for <linux-sparse@vger.kernel.org>; Sun, 26 Jun 2022 13:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D0C341CB;
        Sun, 26 Jun 2022 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656248880;
        bh=UrAkhnFDuSOEuz40PQq0cDjbsCnjbB5GJR+N7s1FoBY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BmGRE7g5vgCMrZB8EGhCK3jehwLKW6uMoaDFx8c2Y11+F3HhmueJVNMNoROnSShFq
         u1TsE4WJTLJgIBYCx+6ddSqhy6dh+Q50DB7L9zYscH1ooUH63ugbmES1GgGqo+N4HE
         lFKj5VrjQmwG/Wd1T7omhyMAv7eBNub8miYnd0FX3iSAY+B4sTEKkoSPsOk4/Eto5Z
         LvqOXaPdMi7HJaAV3jEBV7xkv0i99N/qPbrExjkdnN30oyEoonHt/0ALVcM8wAdXBm
         2zaP5lTB/sFLfuoOyDhm5fk1xwmOw2lhaohgrIxAxXIbOujoWubOGHQOWtcvXFjRp1
         V2eX01frZ8X/w==
From:   Luc Van Oostenryck <lucvoo@kernel.org>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/6] inline: allocate statement after guards
Date:   Sun, 26 Jun 2022 15:07:47 +0200
Message-Id: <20220626130748.74163-6-lucvoo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626130748.74163-1-lucvoo@kernel.org>
References: <20220626130748.74163-1-lucvoo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

In inline_function(), the statement that will correspond to the
inlined code is allocated in the function declaration but then
it's checked if the function can be allocated or not.

This is not much memory and the checks should succeed most of the time
but it's clearer if the statement is allocated after the checks.

So, move the allocation after the checks.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 inline.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/inline.c b/inline.c
index a6f9252ab0ff..68f235c21945 100644
--- a/inline.c
+++ b/inline.c
@@ -516,7 +516,7 @@ int inline_function(struct expression *expr, struct symbol *sym)
 {
 	struct symbol_list * fn_symbol_list;
 	struct symbol *fn = sym->ctype.base_type;
-	struct statement *stmt = alloc_statement(expr->pos, STMT_COMPOUND);
+	struct statement *stmt;
 	struct symbol_list *arg_decl;
 	struct symbol *name;
 	struct expression *arg;
@@ -528,6 +528,7 @@ int inline_function(struct expression *expr, struct symbol *sym)
 	if (fn->expanding)
 		return 0;
 
+	stmt = alloc_statement(expr->pos, STMT_COMPOUND);
 	expr->type = EXPR_STATEMENT;
 	expr->statement = stmt;
 	expr->ctype = fn->ctype.base_type;
-- 
2.36.1

