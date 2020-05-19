Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E5A1D8CB2
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgESA5u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgESA5u (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:50 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31079C05BD0A
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:50 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e10so10222082edq.0
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oIuZ1mZuSbaARFWKgFIy6HiDUVCOeosRlutqdcOm5ug=;
        b=h+xsl+2jBwkqtHHYruIHQqkdZbbLsaex5BkNc7PBPmzqoLYIpEjKar7dAoxC/k/i8s
         mChMnTWuf9answ2JlOm49+W/ng4tCT2KIdF0ys6hUsbHR8QFjr8EdC0ebkgQBW7adoYA
         65QRzDSVHZ/jUnXOi8KW66tclKHjGArO+9Lszjzex3iwu1k1gkpEiJqyF3cqI+QsCQvu
         mxRw22uK6CIFBKk/J61rWVOVmU5PeYi/75WrKpSxjcUQ/K86pR9z9soN7cFcc6AOnqd9
         AaKVDRz7ONh4N1DYWmSHo3BmPj3qVazuYH9W9zIKY0EysjaP0ojtKjRZn8Z40iTLCCGQ
         jQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oIuZ1mZuSbaARFWKgFIy6HiDUVCOeosRlutqdcOm5ug=;
        b=Ryf/R/J9JO+jA21hRecwshCHSTvnvxXtBVXYlSe5/u80VujkUYuzbXUNnGr2WXhTJb
         w0XDOwUqHKulKAjnbuIdWjHCiUGIZw5gwa1wDCv/a7/+ginNhfIgCnP1mHjZ3AePH4NX
         CIH1ukAq4n7XeRyTFw6wD/X//Ktk0YE/s9uhv6vOlL+nUZzjsZ6ITMl6PJF3DjjqtXs8
         kLUUw8LDcfJISsDMSYnpsu/hYK8m7KatkT6Wc73/qMSKl3Qv4HkWog9ifG3Pldq+zGx/
         GtLXtR0LImLmiYPkgvA2PBSyWgbu3M9oEQWW/rfv3N1u5z3Uxi/vej/1SUwp6haKeGfg
         sXgg==
X-Gm-Message-State: AOAM531Ps8WPiPKzof8gWTH5aHtH8XbQpbbgJINBmgE5jmZs8Cse6mKo
        dYNsRas/NOKgB88EJFC7C0irTabB
X-Google-Smtp-Source: ABdhPJweRQiH3K/cP+AUAx7Rd6ABHTMkssxgHw3SuWtpo4bPCz3PBdPjtCzztJJwSK9AlxUtBSOzBA==
X-Received: by 2002:a50:f40e:: with SMTP id r14mr15177561edm.241.1589849868763;
        Mon, 18 May 2020 17:57:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:48 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 16/28] scope: __label__ is special
Date:   Tue, 19 May 2020 02:57:16 +0200
Message-Id: <20200519005728.84594-17-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Labels declared wth __label__ are special because they must follow
the block scope normally used for variables instad of using the
scope used for labels.

So, use bind_symbol_scoped() instead of first using bind_symbol()
and then changing the namespace.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/parse.c b/parse.c
index e23c5b64e8be..29e3f939166d 100644
--- a/parse.c
+++ b/parse.c
@@ -2569,8 +2569,7 @@ static struct token *label_statement(struct token *token)
 	while (token_type(token) == TOKEN_IDENT) {
 		struct symbol *sym = alloc_symbol(token->pos, SYM_LABEL);
 		/* it's block-scope, but we want label namespace */
-		bind_symbol(sym, token->ident, NS_SYMBOL);
-		sym->namespace = NS_LABEL;
+		bind_symbol_with_scope(sym, token->ident, NS_LABEL, block_scope);
 		fn_local_symbol(sym);
 		token = token->next;
 		if (!match_op(token, ','))
-- 
2.26.2

