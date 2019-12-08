Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 715BC11641A
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 00:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfLHXWF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 8 Dec 2019 18:22:05 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44120 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbfLHXWF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 8 Dec 2019 18:22:05 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so13983224wrm.11
        for <linux-sparse@vger.kernel.org>; Sun, 08 Dec 2019 15:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YGoMo1WR3At7id6bm5FBcST8iUVJ+y/p0F6sbUJibl4=;
        b=QlVjwLOMMpZYuPZ2RaRIEtomkj5AZF3+6iko4xdQ6WwD1ZTxby3vyt7OzISrtDW4at
         ayFJEn4GlCF7yK8pV8DomO79yHY0zjjO5efknK9Loz7ZKFFFVstpVAm69QUxqg5XTfEu
         o+ApGgR1QltqmPd34Fg2/VB6LyB0l+fdtuXWfO1bXCXHqB8N8pMb7ZdBNn4qvE1jRuu1
         29FMvldmAWh76PjLnEKC9j2CYo8xssCK3EEIN0li9dX/4c0a1bFfXhhphUCATsmZjpNq
         rlCas1ZWZyos1gB9hobaKGNK9EidmgWyM5Z4tTjGizSbYA/1vth+1yzaxHiBSZABdPqn
         6nCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGoMo1WR3At7id6bm5FBcST8iUVJ+y/p0F6sbUJibl4=;
        b=AvvFizQ9h5F2cQamib6NyZqUsqcKCz4WK1oYGcTrJ4X5mU4PVFjVt+CJ3lae2R1pr9
         287jhBltCD+XbHjBDF7h/F8KhzKgZKhK7P6+dMAKlO4cbKCLOf7Wl5Ch2IEJ3VrorhrW
         F+c+fox+XyyxZzZK5ziKkBQ4wHehfGpjAMPhNGrzV7g4brn8JRN4koM/kPqxL8+TvWAE
         Ti/YXmW0J3GIgaiLLnpq5EXJm+w5NYhOHyB6HVcZ2APIUQFqhLjwkvvyy/n5nIZce34h
         lbW+7TC8DEFZVVROGD4GTri+mMENUhObTqLICOi9NW0DBAgvlqnykOTHGYX9UKSD4SDH
         PomA==
X-Gm-Message-State: APjAAAUD12NcjpBuKs02dFxDWN4WI0I5oefpbYTZzBEOnlWDuvAxishN
        vgc1SyzwPCRZLIFBVhdbT45STY3S
X-Google-Smtp-Source: APXvYqxuBWIVikjONnS3hYzZtT2rLFepjqFxzsuTyNF2okIROQbLI4LLqOPHrvZaEedqG7nXHFeZqA==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr26704852wrv.18.1575847322819;
        Sun, 08 Dec 2019 15:22:02 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40d5:8a00:61ab:d604:b478:87a3])
        by smtp.gmail.com with ESMTPSA id w17sm25377996wrt.89.2019.12.08.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 15:22:02 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] bitfield: oversized bitfields are errors
Date:   Mon,  9 Dec 2019 00:19:19 +0100
Message-Id: <20191208231921.49964-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Till now, a bitfield with a width bigger than its base type
only caused a warning but this should be considered as an error
since it's generally impossible to emit correct IR code for it.

Fix this by issuing an error instead and marking the width
as invalid.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c                    | 6 ++++--
 validation/bitfield-sizes.c | 1 -
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/symbol.c b/symbol.c
index 6c1fb2a5195f..40e50874c27f 100644
--- a/symbol.c
+++ b/symbol.c
@@ -258,8 +258,10 @@ static struct symbol *examine_bitfield_type(struct symbol *sym)
 
 	if (!base_type)
 		return sym;
-	if (sym->bit_size > base_type->bit_size)
-		warning(sym->pos, "impossible field-width, %d, for this type",  sym->bit_size);
+	if (sym->bit_size > base_type->bit_size) {
+		sparse_error(sym->pos, "impossible field-width, %d, for this type",  sym->bit_size);
+		sym->bit_size = -1;
+	}
 
 	alignment = base_type->ctype.alignment;
 	if (!sym->ctype.alignment)
diff --git a/validation/bitfield-sizes.c b/validation/bitfield-sizes.c
index e30a3e4c649c..c43bb0a4aeb2 100644
--- a/validation/bitfield-sizes.c
+++ b/validation/bitfield-sizes.c
@@ -19,7 +19,6 @@ static struct b b;
 /*
  * check-name: bitfield-sizes
  * check-command: sparse -m64 $file
- * check-known-to-fail
  *
  * check-error-start
 bitfield-sizes.c:12:18: error: invalid bitfield width, -1.
-- 
2.24.0

