Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D241D8CB8
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgESA55 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA55 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:57 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20BEC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:56 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a2so744302ejb.10
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O/cJzEosGukhaSFLtRl9pQNQrfywQiG79gDXUepBsHA=;
        b=SznEFAMypI92Vj3k4ndfWMa8tOGJSXOHhFmIa+ApDRo9NQnwloMbWnXtxdkbNEKXBk
         ezZV8LmaHE/sE90WaOjAMmdXqvtn6NlUtWb6BI1iGQ/HenKwlXQueZOsFh2UtOmrwOIz
         mL3duJ8A4/vhicJxGJPo+/x4K7Tg1kSlZ11zxkhCB5+vFEuTMBmtlhHbc9fRxLqgE5F6
         fBdrr8SRx8MzWuLl103Eo0SnJAoHS74B7zJHTnmDuD3Gf74sR12/xZO0sCiznXSBHoQ/
         GLQM4dt1l4VoEmKed75JKx4RdDTNy6XO3U0jqCwPgK4X3kYoV3Hi4YhmneSzz8fhfPQF
         pKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O/cJzEosGukhaSFLtRl9pQNQrfywQiG79gDXUepBsHA=;
        b=lwrDiwvrwVon3n2R6LhY21M5qepNR4Zb+LgRZv0YU8CCaw+XReQ9gH4lVY/28sAQLs
         MycJtd+86N121qAwW94ZMUJpbWzUG2MENCXhg83XVMYRdXONxshYa303gkheE7JmWa6J
         ZcH3YNW0ikIw1N4T2pfxHIaW8Sxr+6zxdkacu5ddGWZVVNh1NLbXvnhedrUQUBkw8jkg
         DUbUIjPVUVC45muZI6uJa7+hRlnuHA9FQYnWVlwCoLiSYWCcUxJXccNNOnwpwUgU016t
         is4CUUJNlgQAvdtdEDPh+/it6cG55sM42ANCjjpHWMCRJInyiXuvw2Qj/9/ngwk2BHyP
         EuTQ==
X-Gm-Message-State: AOAM531y7cyp7NBqBBYl2Vo2+wLT/QSu5knT/1siSr+wBmR+fqN9+9gt
        HMSJ0i8PdJnXbbDniCNLwcOi4iZt
X-Google-Smtp-Source: ABdhPJy2zNaLZuW3qvSf04OXVpd+Zr4A1GiiqG/SmAV5nb/qXj26MdrcL38kI6MwjINdDaqwrFsAEA==
X-Received: by 2002:a17:906:49c7:: with SMTP id w7mr16136370ejv.216.1589849875285;
        Mon, 18 May 2020 17:57:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:54 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 23/28] bad-goto: label expression inside a statement expression is UB
Date:   Tue, 19 May 2020 02:57:23 +0200
Message-Id: <20200519005728.84594-24-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

More exactly, what is undefined is to jump inside the statement
expression with a computed goto.

Of course, once the address of such a label is taken, it's generaly
impossible to track if it will be used or not to jump inside the
statement expression.

So, for now, handle taking the address of such a label from outside
the statement expression, exactly as if a computed goto is effectively
done from there and so issue an error message and also mark the function
as useless for linearization.

Note: this is only partially correct since:
      1) the address could be taken from outside the statement
         and never used for a computed goto.
      2) the address could be taken from outside the statement
         but the corresponding computed goto only done from
         inside, which is perfectly fine.
      3) the address could be taken from inside but a computed
         goto done from outside.

Note: the real problem, like for the regular goto, is that the
      statement expression can be eliminated before linearization,
      the correspondng gotos corresponding then to branches to
      unexistent BBs.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/expression.c b/expression.c
index f8a8f03e7402..bbbc24e6b561 100644
--- a/expression.c
+++ b/expression.c
@@ -691,6 +691,7 @@ static struct token *unary_expression(struct token *token, struct expression **t
 				sym->ctype.modifiers |= MOD_ADDRESSABLE;
 				add_symbol(&function_computed_target_list, sym);
 			}
+			check_label_usage(sym, token->pos);
 			label->flags = CEF_ADDR;
 			label->label_symbol = sym;
 			*tree = label;
-- 
2.26.2

