Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19B355ACDD
	for <lists+linux-sparse@lfdr.de>; Sun, 26 Jun 2022 00:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbiFYWPF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 25 Jun 2022 18:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiFYWPF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 25 Jun 2022 18:15:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646CE12761
        for <linux-sparse@vger.kernel.org>; Sat, 25 Jun 2022 15:15:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BCC72B80B9C
        for <linux-sparse@vger.kernel.org>; Sat, 25 Jun 2022 22:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D916AC3411C;
        Sat, 25 Jun 2022 22:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656195301;
        bh=yeDhCbSxiGLOeXX0OLCoCTE7Ea0IIa8gZX5xZuW3FmY=;
        h=From:To:Cc:Subject:Date:From;
        b=j43sDg4hOK7uon7XwpcM9Dr8YMGCs+4l+QSSMIg0APOXV5tWXjm+9GuV7WRNlUFkP
         kcvc/q2L1k9aiyoxqF4jMN6jrYP3CWQzG9upd1dUEj4eRmVW/6IDIFP17wOQifnOUh
         CHeIGUpMqe0D6CYkvtSq9q1GwofpLsgC6H8tRePSDrm7LPW3NABImNY7vMyFlvK2uW
         FHhDewDCMHv8nYL5usy8qcWWVi8+xH6STkgTmxWJHpAGZmjh3jkwPIrZYniOaEIMu2
         kdckrU+yMr1Yy/qSYeBrEvNoGhJxybq/O0CA4P7JtUcbpyVN9i2J05Nrf5ECoT7Up4
         iLLmVb8BAaDGw==
From:   Luc Van Oostenryck <lucvoo@kernel.org>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] inline: avoid node of node on variadics
Date:   Sun, 26 Jun 2022 00:14:54 +0200
Message-Id: <20220625221454.63271-1-lucvoo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

When inlining a variadic function (unsupported in general by
sparse but OK when the arguments are unused and occurs as such
in the kernel), the extra arguments are added in the declaration
list as SYM_NODE.

But the base type of these nodes are the effective arguments and
are, as such, already SYM_NODEs. So, nodes of nodes are created
and Sparse doesn't support those (these nodes must be merged).

Fix this, by simply copying the effective argument, like done
for the non-variadic ones.

Note: Sparse doesn't really support inlining of variadic functions
      but is fine when the arguments are not used (and such cases
      occur in the kernel).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 inline.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/inline.c b/inline.c
index 0097e4bf620a..4ee44eedec7a 100644
--- a/inline.c
+++ b/inline.c
@@ -542,11 +542,12 @@ int inline_function(struct expression *expr, struct symbol *sym)
 	FOR_EACH_PTR(arg_list, arg) {
 		struct symbol *a = alloc_symbol(arg->pos, SYM_NODE);
 
-		a->ctype.base_type = arg->ctype;
 		if (name) {
 			*a = *name;
 			set_replace(name, a);
 			add_symbol(&fn_symbol_list, a);
+		} else {
+			*a = *arg->ctype;
 		}
 		a->initializer = arg;
 		add_symbol(&arg_decl, a);
-- 
2.36.1

