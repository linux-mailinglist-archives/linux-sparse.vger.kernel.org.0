Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E625D11641C
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 00:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfLHXWH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 8 Dec 2019 18:22:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36192 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbfLHXWH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 8 Dec 2019 18:22:07 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so14033055wru.3
        for <linux-sparse@vger.kernel.org>; Sun, 08 Dec 2019 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vHBh6NoQeAxvT/5OI4Pnj2E1vQF1VjLi3k2s23TMyNY=;
        b=Oc23JFxVNfSDuyaQ09j5iZx1cfjl+E8LSoBPaRl4e9JEtXwIkKTwZLcld3OsYV+1qM
         po5sa8D014RcFImYcTwYXBFwysCeF17p3S8V3YKFZI2wOYIwrI/gUjcewki+hXmFBQT4
         3WrXhvj9pV13CABqtnx/Af3Vf0JLHcTQagAid9cPy+66f4k5fA7nYGKkkFoqhJVExie8
         A92+qsy+FNTBCnm58p8TK81Zs8Sx9W/f9NkVOZy16I+SaNYed+zE4Gn7IZA/8MiAciFs
         I2mRH2lGdbZoh0MbANHhsoRC1t8aBAJvrBv1Sa8ZXRdPxyzv006kBOa1WQB1/ZKkA5YG
         RZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHBh6NoQeAxvT/5OI4Pnj2E1vQF1VjLi3k2s23TMyNY=;
        b=l4YoOGpFBkQEdceZE0iOJJwcRRApmFH63uT7GjW7jdCHvoi5lwUkU+p4zZ4u4xhPtk
         EL+cK7XNcqLvqRkYXqgURVJa30O0XJQ9Sj+3bTv674oJ/ICkOLkmbqXo/2GeynUMj6ID
         dMU5C3qlZzsOxf0jqaE11D/AZ+BAh0LNyHjIMjY1uk0BQRpsb7oPWFBohWP6CpG+nOh5
         b9HY4c7mgVqV88jiCcaOt82i2z1rAZUO6SHVeXVEOAlij8hrkWgiftzWUktqobN3oJDs
         ybi8o6y0IzBz5GRWtramY/lZAZ+1SvyrupfnfkQecTx0kwMt7vbX6Qz6boJvKzJAkC5z
         Dmfg==
X-Gm-Message-State: APjAAAV+up5TI0lVum53RRmx4eOmdDfp2CjTB/sIzKjbHPUPif03muhP
        cM/4MhattavpTDdivqjZ7RKo/cIG
X-Google-Smtp-Source: APXvYqxBGMFqnnNa5glLqh61QZuP98JwwvCDEsRwHQ+XUbiEMCDO1eMqRfsrF5/AyGu70EOBX9Jugg==
X-Received: by 2002:adf:8541:: with SMTP id 59mr21094778wrh.307.1575847324754;
        Sun, 08 Dec 2019 15:22:04 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40d5:8a00:61ab:d604:b478:87a3])
        by smtp.gmail.com with ESMTPSA id w17sm25377996wrt.89.2019.12.08.15.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 15:22:04 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/5] bitfield: display the bitfield name in error messages
Date:   Mon,  9 Dec 2019 00:19:21 +0100
Message-Id: <20191208231921.49964-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Diagnostics related to a bitfield and issued after parsing
didn't display the bitfield name because it was not available.

Now that that the name is available, use it in error messages
since it helps to find the origin of the problem.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                     |  9 +++------
 symbol.c                    |  3 ++-
 validation/bitfield-sizes.c | 10 +++++-----
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/parse.c b/parse.c
index efd8c5de1b6d..fb05253b6a4b 100644
--- a/parse.c
+++ b/parse.c
@@ -1946,12 +1946,9 @@ static struct token *handle_bitfield(struct token *token, struct decl_state *ctx
 	width = const_expression_value(expr);
 	bitfield->bit_size = width;
 
-	if (width < 0 || width > INT_MAX) {
-		sparse_error(token->pos, "invalid bitfield width, %lld.", width);
-		width = -1;
-	} else if (*ctx->ident && width == 0) {
-		sparse_error(token->pos, "invalid named zero-width bitfield `%s'",
-		     show_ident(*ctx->ident));
+	if (width < 0 || width > INT_MAX || (*ctx->ident && width == 0)) {
+		sparse_error(token->pos, "bitfield '%s' has invalid width (%lld)",
+			show_ident(*ctx->ident), width);
 		width = -1;
 	} else if (*ctx->ident) {
 		struct symbol *base_type = bitfield->ctype.base_type;
diff --git a/symbol.c b/symbol.c
index 40e50874c27f..3655cbb78913 100644
--- a/symbol.c
+++ b/symbol.c
@@ -259,7 +259,8 @@ static struct symbol *examine_bitfield_type(struct symbol *sym)
 	if (!base_type)
 		return sym;
 	if (sym->bit_size > base_type->bit_size) {
-		sparse_error(sym->pos, "impossible field-width, %d, for this type",  sym->bit_size);
+		sparse_error(sym->pos, "bitfield '%s' is wider (%d) than its type (%s)",
+			show_ident(sym->ident), sym->bit_size, show_typename(base_type));
 		sym->bit_size = -1;
 	}
 
diff --git a/validation/bitfield-sizes.c b/validation/bitfield-sizes.c
index c43bb0a4aeb2..9f76d07418a5 100644
--- a/validation/bitfield-sizes.c
+++ b/validation/bitfield-sizes.c
@@ -21,10 +21,10 @@ static struct b b;
  * check-command: sparse -m64 $file
  *
  * check-error-start
-bitfield-sizes.c:12:18: error: invalid bitfield width, -1.
-bitfield-sizes.c:13:26: error: invalid bitfield width, 2147483648.
-bitfield-sizes.c:15:17: error: invalid named zero-width bitfield `a0'
-bitfield-sizes.c:6:15: error: impossible field-width, 33, for this type
-bitfield-sizes.c:7:15: error: impossible field-width, 65, for this type
+bitfield-sizes.c:12:18: error: bitfield 'm1' has invalid width (-1)
+bitfield-sizes.c:13:26: error: bitfield 'x1' has invalid width (2147483648)
+bitfield-sizes.c:15:17: error: bitfield 'a0' has invalid width (0)
+bitfield-sizes.c:6:15: error: bitfield 'x' is wider (33) than its type (int)
+bitfield-sizes.c:7:15: error: bitfield 'y' is wider (65) than its type (long)
  * check-error-end
  */
-- 
2.24.0

