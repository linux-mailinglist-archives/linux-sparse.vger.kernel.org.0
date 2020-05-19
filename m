Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D294B1D8CAB
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgESA5p (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgESA5p (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:45 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22A3C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:44 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id h16so10185557eds.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CLWuXaGrqfHhgUglQXimeFAcyQZWIw/YiITBIyA5lX0=;
        b=SMi2CJRNDNGFoLSKR2dCuxMsMrO3wtEob2RwQtxFEagh6Rn7sfyVs7GTrUfQXvrfI4
         Gn2cVCgKVizGY86uYSZ5C0XzK78hMbY8KgVSCgoC8PFDaGjLJOxLfvnEfO+fF5L5MBN8
         5RooOwQvMfqyskgO5L/0WY9Yyr0YyJcut7fo82hf6dZU+jCxbioxRWijUVXRxi7ID6q8
         c6lWZJ1L+XT9hKyFd1kmrF4tBL0aaAq5WfWsK1k7C4YgeMpuiziqiQmDzaSrPeptFdkY
         Jrqv1C5AxLXoydlz5wtW3xjba255hFojfJmDf9s2ACQYAs/2lFI/2h0jP/Yq+5ys7kvT
         zW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CLWuXaGrqfHhgUglQXimeFAcyQZWIw/YiITBIyA5lX0=;
        b=bKQ8nYsYWZYqlbdBC1u/9Sexiqm3p3EYvH/fZGYymoW4JeD3hjTpLqiEmohBYgVFDU
         Nc0QkkUTFcfclgkydW4hDfT6T/0vVRAAEtkzyjoINTL7dl/hfLosxpRDAXs3/Lpl0z6J
         XklZ3SkqQTrhrnDLWkPiC4riM1upGRRxjCA4xqRs22upRFKATmbYky0da5/D74D4qYog
         5OCfKaXJ3x4fYkx+8JsNoo+GbUIl/F3ibO8FICDc7Z04G8jMFM8mreLv/mh6fxIqeUTW
         c4Hpu2QkKfRoP/0jQaTLZBfK9F4obb/gzrgC59vW+52zR7mBMUN5wjzm4OugjnKX/0G2
         xDUg==
X-Gm-Message-State: AOAM530AfXeniQdV0RbSlPT9hA8AZbagHax7+vD0XaYxi1QfGA5ngbJy
        4ZDbwOdZTdWyigD7VNBknZsy8sM6
X-Google-Smtp-Source: ABdhPJy37IUcwI42ilhj0n87vxbCt/2k05fh4KAzcYsv+ljzc/AWewjksPh/EeaTSt7COfgtf/zkoA==
X-Received: by 2002:aa7:d718:: with SMTP id t24mr15580633edq.20.1589849863210;
        Mon, 18 May 2020 17:57:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:42 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 10/28] bad-goto: do not linearize function with undeclared labels
Date:   Tue, 19 May 2020 02:57:10 +0200
Message-Id: <20200519005728.84594-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's not possible to produce a valid & correct IR if
the function contains a goto to an undeclared label.

So, try to catch these situations and mark the function
as such, the linearization will then simply ignore it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/evaluate.c b/evaluate.c
index d4b462274add..c757fc82b204 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3750,6 +3750,7 @@ static void evaluate_goto_statement(struct statement *stmt)
 
 	if (label->namespace == NS_LABEL && !label->stmt) {
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
+		current_fn->bogus_linear = 1;
 	}
 }
 
-- 
2.26.2

