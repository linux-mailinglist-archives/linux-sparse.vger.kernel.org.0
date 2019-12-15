Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B600311F755
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 12:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfLOLGe (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 06:06:34 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39682 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfLOLGe (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 06:06:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id b72so1457053wme.4
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fal4b/Cty1m/2qylGZASR8UP6fUeskmiHIE63Fubb5g=;
        b=LCfQTSVLtmhf5gY0auqYCKC6K8sBr5sxAZaPFx+restHuqA9DMvPTw+1pT91RiGKOy
         5W7EPykWMRsPiyO8r16za1TE9qseUZaqjZlCDat5thmqJzkfXZUC1Eqi1N0PqjojY5QQ
         jQ51B3oxqRh63f9G5jHV/YK2qWlnypv+PZpEOOdiutH1WHaW1SFtso6JA57i0J8eDVBl
         LihXJ8Gj9sTdfnB7oQ6fw1P/Uvc2m2PRYTbgal1Mq9qKQgFPcP1t/H05fsMEwAEoFZ7H
         jAPvAFMj+4vot2xRYhCJy/VaLe+FlrqVpdW5V45Kip4XF/ym1YPSWZAScfG5GRP4CpwM
         DKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fal4b/Cty1m/2qylGZASR8UP6fUeskmiHIE63Fubb5g=;
        b=KquoUpEciVNPvQJsG42IApMO3H8hFnO/ZGzdIqcRLA0Rq8+DpkSzDFJrhbKOJcaF9M
         DW1qVGlYHva4aHiHHdBMmxnt49y0NBmTW+bS36HhUwpsg2+MbVGTwuSU1mV6MLXE4KUc
         4FuSlHH6w4q+tYCsEtGNNwCf29FCgS8iARmTL2e1sE0NQIk0iUTo/yIJZCsVn1bOmluy
         X1QKZ7dfAAhBwGYiGhZ6ScY1m7VZJ2WZkDRWKxtkjA6ikkuC2kecWvpqJeOcyW9Aa26G
         78ZZ2qyLLVACZd7w9k8Q5Fmbom8Cy+TaswyAEyo2ey1DtH2Ok4PA0JmLmSJkgyEiLHvD
         TFzA==
X-Gm-Message-State: APjAAAWO/++Ufy+D6T8AaQC6nmcGEtw+67ENLN0Ev9apNifs2H+ZmqpQ
        +OojRhZQsgaCcjmqzjWDBePxqzNI
X-Google-Smtp-Source: APXvYqxMhgkd3svyNs1DMYX9ukIhpWs83xJcVXQ/w6l31KI+pCbnXIJnRkLqXkeEAF5Ee8LCAJpYbw==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr23488319wmj.168.1576407991724;
        Sun, 15 Dec 2019 03:06:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:180:4f0:43c8:9084])
        by smtp.gmail.com with ESMTPSA id r5sm16760690wrt.43.2019.12.15.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 03:06:31 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/4] typeof: extract examine_typeof() from examine_symbol_type()
Date:   Sun, 15 Dec 2019 12:04:24 +0100
Message-Id: <20191215110425.76533-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

No functional changes here, just moving the code for the
conversion of SYM_TYPEOFs in its own function, in preparation
for some further changes.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/symbol.c b/symbol.c
index 3655cbb78913..46fe740b4cc1 100644
--- a/symbol.c
+++ b/symbol.c
@@ -453,6 +453,25 @@ static struct symbol *examine_pointer_type(struct symbol *sym)
 	return sym;
 }
 
+static struct symbol *examine_typeof(struct symbol *sym)
+{
+	struct symbol *base = evaluate_expression(sym->initializer);
+	unsigned long mod = 0;
+
+	if (!base)
+		base = &bad_ctype;
+	if (is_bitfield_type(base))
+		warning(base->pos, "typeof applied to bitfield type");
+	if (base->type == SYM_NODE) {
+		mod |= base->ctype.modifiers & MOD_TYPEOF;
+		base = base->ctype.base_type;
+	}
+	sym->type = SYM_NODE;
+	sym->ctype.modifiers = mod;
+	sym->ctype.base_type = base;
+	return examine_node_type(sym);
+}
+
 /*
  * Fill in type size and alignment information for
  * regular SYM_TYPE things.
@@ -486,26 +505,8 @@ struct symbol *examine_symbol_type(struct symbol * sym)
 	case SYM_BASETYPE:
 		/* Size and alignment had better already be set up */
 		return sym;
-	case SYM_TYPEOF: {
-		struct symbol *base = evaluate_expression(sym->initializer);
-		if (base) {
-			unsigned long mod = 0;
-
-			if (is_bitfield_type(base))
-				warning(base->pos, "typeof applied to bitfield type");
-			if (base->type == SYM_NODE) {
-				mod |= base->ctype.modifiers & MOD_TYPEOF;
-				base = base->ctype.base_type;
-			}
-			sym->type = SYM_NODE;
-			sym->ctype.modifiers = mod;
-			sym->ctype.base_type = base;
-			return examine_node_type(sym);
-		}
-		sym->type = SYM_NODE;
-		sym->ctype.base_type = &bad_ctype;
-		return sym;
-	}
+	case SYM_TYPEOF:
+		return examine_typeof(sym);
 	case SYM_PREPROCESSOR:
 		sparse_error(sym->pos, "ctype on preprocessor command? (%s)", show_ident(sym->ident));
 		return NULL;
-- 
2.24.0

