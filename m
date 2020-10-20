Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6622A29445C
	for <lists+linux-sparse@lfdr.de>; Tue, 20 Oct 2020 23:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438679AbgJTVKo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 20 Oct 2020 17:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438669AbgJTVKn (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 20 Oct 2020 17:10:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B17C0613D3
        for <linux-sparse@vger.kernel.org>; Tue, 20 Oct 2020 14:10:43 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id qp15so4867119ejb.3
        for <linux-sparse@vger.kernel.org>; Tue, 20 Oct 2020 14:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CoY/T3csZYJSTKEDx5YSw0U/P3BhQL13s5zAuN4J7WM=;
        b=gJSroswlDQqbOU8TPMvV0ju8haPb4PuQt3LuQmAjAVC5FZc+vgzqS858HC6IT6k4b0
         TT+k9GEObRxAiXwY15aoWDcvTgeGZuQrlkzHFHtuDj5xfyTRXlivKBI2Ljk8ydRrC4x1
         v65AEtsT+hAyOaKmIQu0PJyJMJdR/UzQ+97ZUsx6EkEr3XxHzaH7z0R92esyJOQGNCnx
         5FC4SGpsuC2uRiLob1eIdddbrD7gUYt1zSZr6Y+b7YgcSDi1ON2a95/YLrhhCbc4ewhe
         hUZoGZp+CL5hOu28rPvKgEA0LICHKMkBVjMsvEDvIAi8yuaePeLcXa9Crzwq2G8Iflk4
         Cz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CoY/T3csZYJSTKEDx5YSw0U/P3BhQL13s5zAuN4J7WM=;
        b=a5tuDeO7Ji6iy/4ed9o4ucqal7M/oQRf+qkXQinuFUYsELt9WaJ0DTP5j+e6UK9oA9
         Hg8Nhn8kWc0QZJP8Qo/1jjr0KowNoNG3uMInPjBGA8mg+iqpfs0LhA3VwD9L4fUMTvRQ
         a1np9MrwQ0FyT8qo763puCK79sb44PHHPwgzidE3w1MBwLEHnaRydqtHcBLFf90DbuLA
         +84ZQC59Z94Cb3fP0fvheoHqpyZHIYW0r8+Orxh0Ouj8GY74eThdIdLZBjGUFJTrkjov
         ruExoyWtDZ8Fi7QFPSAAJzsuLBkPVOPfVR03/STXs1op2Vc74sMMVIUMu/LU73BFAKvP
         6cxg==
X-Gm-Message-State: AOAM533kPXEqfEWYjGPNbaHYku6bHdrVdCyhU14QfS1zHPkvd/0H5nFv
        YCq/skbWi2h1XIzydkX7G7CrfDdZd4E=
X-Google-Smtp-Source: ABdhPJyFX8Nsykgn5hLLHjegnB4IPONkYTQc2HA+zCg/pConF3qtGTUC43qdD/BLKx4Ggu/MzMXhqw==
X-Received: by 2002:a17:906:a0cb:: with SMTP id bh11mr116112ejb.314.1603228241885;
        Tue, 20 Oct 2020 14:10:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:85fe:66cb:a92b:c664])
        by smtp.gmail.com with ESMTPSA id d12sm4012848ejt.105.2020.10.20.14.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 14:10:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 20/22] sub: simplify x - (y + x) --> -y
Date:   Tue, 20 Oct 2020 23:10:19 +0200
Message-Id: <20201020211021.82394-21-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020211021.82394-1-luc.vanoostenryck@gmail.com>
References: <20201020211021.82394-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 simplify.c                                | 2 ++
 validation/optim/simplify-same-subr-add.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/simplify.c b/simplify.c
index 48bf48d29f9a..68ee6ed015c1 100644
--- a/simplify.c
+++ b/simplify.c
@@ -1399,6 +1399,8 @@ static int simplify_sub(struct instruction *insn)
 	case OP_ADD:
 		if (src1 == def->src1)		// x - (x + z) --> -z
 			return replace_with_unop(insn, OP_NEG, def->src2);
+		if (src1 == def->src2)		// x - (y + x) --> -y
+			return replace_with_unop(insn, OP_NEG, def->src1);
 		break;
 	case OP_NEG:				// (x - -y) --> (x + y)
 		insn->opcode = OP_ADD;
diff --git a/validation/optim/simplify-same-subr-add.c b/validation/optim/simplify-same-subr-add.c
index bafd2643bfd0..950c55f67c24 100644
--- a/validation/optim/simplify-same-subr-add.c
+++ b/validation/optim/simplify-same-subr-add.c
@@ -3,7 +3,6 @@ int subr_add(int x, int y) { return x - (y + x); }
 /*
  * check-name: simplify-same-subr-add
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: neg\\..* %arg2
-- 
2.28.0

