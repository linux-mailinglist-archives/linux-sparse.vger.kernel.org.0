Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B8E1D8CB0
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgESA5u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgESA5u (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:50 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40099C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:49 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id se13so10370906ejb.9
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wzX4UZbP1YWCaVt8qjKhs+nP0AiMSGLA5+HaAPI4lks=;
        b=JGvQ3zCBDfZspBVT8SgHD2XRGGQuDOyltB40qp43h1f1W/6tnb4tnyC1L8aaSMc+8w
         2muALB5w/DGNRgvhMmjzIT8m/MTdp7O0V5MT+83YQLcpx46eLRxdaXH+0qUxlU3UN1Bq
         gygPbWNlhTRxf7IV/s7F+FgOL3jBlM7dtnvsVhLsYl/hlaaH1QKZEIZVVgdtaYGBt63c
         oJVBJJ0mQrqH8mIDR4Feqx2tBuMWJisCY3/U5SlvRZDDv8vswcLTCOGE2DVerkKwnHFB
         dovz/ftN4fRtlQW/Y2NeaVBGHWJ5QoFdwS+hDJC1uKkBj3Iu5DhxuP3J9dRhY5Cq+zY7
         7ijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzX4UZbP1YWCaVt8qjKhs+nP0AiMSGLA5+HaAPI4lks=;
        b=KZcpJ+tLHHqNDtOM+eogeZzLZvKY6yaUm7Tgxu5ZfyTEE8wNKsEUkT15TDVVNMLbaQ
         GSFgiOn7pdJ3YtKJwUWij8+OiokNdGeIeJ3qoMuc9okcruoU/YZr34TGv6pDMrF1hJ72
         fQebiYwrCXaa9p+9aaGn2caFzEkKIRRonK3rIlaUTRjcClHa8gUwdKkmtvHT2qTNZmJ4
         gJeFcmVnxJr5bCadWB1iTC1PqkuAAhosoFQAwudobhGkk/kqzOsM7JLlie/ThSJCSVFg
         Yq92za6/ekieN6PCYrhz9wNGPcxpZdGfAEfIt6GWLIyoyT/vSZCwr6jJRe51HZlXZlSm
         O9Vw==
X-Gm-Message-State: AOAM533jfC8MC2hGMyV5SyiTsAY1aA1kDXKO9dwWP1KsblXDykdU1gBU
        cRUylyuRXPpYeSxAoIGDTGqvvV/A
X-Google-Smtp-Source: ABdhPJzz7bHuSbYfuqTtdmq4xe1/7sO26PHD+6OZFTb8CoaBHLwrBETxVUVtgyddEe+uznTPMe3eag==
X-Received: by 2002:a17:906:2e4a:: with SMTP id r10mr16759067eji.116.1589849867776;
        Mon, 18 May 2020 17:57:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:47 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 15/28] scope: __func__ is special
Date:   Tue, 19 May 2020 02:57:15 +0200
Message-Id: <20200519005728.84594-16-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

__func__ needs to be in the namepsace for symbols: NS_SYMBOL
but doesn't follow the usual scope rules of them: it always
needs to be declared in the function scope.

So, use bind_symbol_scoped() instead of first using bind_symbol()
and then changing the namespace.
Also change the comment to better express that it's the scope
that is the unusual thing.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/expression.c b/expression.c
index 78e577cf10a1..ffb3c2dce4d5 100644
--- a/expression.c
+++ b/expression.c
@@ -122,9 +122,8 @@ static struct symbol *handle_func(struct token *token)
 	decl->ctype.modifiers = MOD_STATIC;
 	decl->endpos = token->pos;
 
-	/* function-scope, but in NS_SYMBOL */
-	bind_symbol(decl, ident, NS_LABEL);
-	decl->namespace = NS_SYMBOL;
+	/* NS_SYMBOL but in function-scope */
+	bind_symbol_with_scope(decl, ident, NS_SYMBOL, function_scope);
 
 	len = current_fn->ident->len;
 	string = __alloc_string(len + 1);
-- 
2.26.2

