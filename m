Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F220F11641B
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 00:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfLHXWF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 8 Dec 2019 18:22:05 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33202 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfLHXWF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 8 Dec 2019 18:22:05 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so14032616wrq.0
        for <linux-sparse@vger.kernel.org>; Sun, 08 Dec 2019 15:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3B9ffHwR7ahsaNBTuYzJ2lEizjxgiw9qLV8FEE+AtsE=;
        b=NdNF6SwTDYHl78ChXPUZOWa8HrBHVM6hiroo7nttX+Nm8irqLsL3yVIA3TKtfEb1eA
         J7npyRgrXCzRzDvWuxKPfhIqI1o3GM00lHYvNyvtZhLsUKKnMpooQHyKSu2NZrtboozw
         mI7Og+zIU6QMHhsfpER9y774gj22doEcDHuCuAHrpmQK1T7WzUpJa7a5t6DfnolCc3ll
         6iTGj0p145mXhm9o9UXs9DVnE2D9q10rCImeYwI93jtUs78TUfGp3uyHOmkguVjAcaz0
         XWW5itSd9Gb6WnF7yHArCohDPI/FKuhz9uSraveuB9nwbRMBY6t+BQUs7wCG2sfyGcYb
         3zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3B9ffHwR7ahsaNBTuYzJ2lEizjxgiw9qLV8FEE+AtsE=;
        b=gXEKs+Ni7wGw+QYcOlqDl+jhngFnNuLwrl4xn1YrQFqaLglZ5v1kfs12h8aIl8wbsc
         sdxa4TyHB2Qdr/6+V+AAR02b9FZwcVykAKqXBwm7h8HUGnQKXgDNnJLmvpNj41MCY7Wo
         JU7jhvq6mTEggU+xpiFZwdCeEVlBqVlH5awFytmKLl5U52CgXsjPzEyYFaJoKfoD6wbB
         KyugwRnRLvw0VpHtPluIDwoQWFt6GAMSx6WPwKkeIiPzlsbhMyUuILbWPjm/Obsm4h/i
         4RfqdQnlwSrpSFuxAgJKrjqqnb0wei+xgsXNQxYa+T5nehwslx52bWLW0ZXarJPm/A85
         cl1w==
X-Gm-Message-State: APjAAAXvWQ9Te1iVsTTIJQjLQ4ommlebUBuqfu8J0mjgaYeSnr6rPw6C
        Qp89BMsiPfmtVytSPz+qduVseNmw
X-Google-Smtp-Source: APXvYqxi4PtmDY6/355hPFAx5tK5erB+OFb7fdoD9RixQljut+M4EEtr+zim55HkAKBq8trvlO6pvA==
X-Received: by 2002:adf:db84:: with SMTP id u4mr25867974wri.317.1575847323869;
        Sun, 08 Dec 2019 15:22:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40d5:8a00:61ab:d604:b478:87a3])
        by smtp.gmail.com with ESMTPSA id w17sm25377996wrt.89.2019.12.08.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 15:22:03 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/5] bitfield: keep the bitfield ident
Date:   Mon,  9 Dec 2019 00:19:20 +0100
Message-Id: <20191208231921.49964-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

While issuing a diagnostic related to a bitfield, it's useful
to display the bitfield's name. Unfortunately, this name is not
stored in the symbol and thus is only available during parsing.

Fix this by adding the ident to the symbol initialization.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/parse.c b/parse.c
index 6db3cba738bc..efd8c5de1b6d 100644
--- a/parse.c
+++ b/parse.c
@@ -1972,6 +1972,7 @@ static struct token *handle_bitfield(struct token *token, struct decl_state *ctx
 	}
 	bitfield->bit_size = width;
 	bitfield->endpos = token->pos;
+	bitfield->ident = *ctx->ident;
 	return token;
 }
 
-- 
2.24.0

