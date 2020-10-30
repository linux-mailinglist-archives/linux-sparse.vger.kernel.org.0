Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE4D2A09FC
	for <lists+linux-sparse@lfdr.de>; Fri, 30 Oct 2020 16:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgJ3Pgh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 30 Oct 2020 11:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgJ3Pgg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 30 Oct 2020 11:36:36 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7D9C0613CF
        for <linux-sparse@vger.kernel.org>; Fri, 30 Oct 2020 08:36:36 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l24so7088273edj.8
        for <linux-sparse@vger.kernel.org>; Fri, 30 Oct 2020 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=flq0FL17W7Wf+yZ7NwNJAiPPmidb5wholchPp0CIJk4=;
        b=Y57bc1IKEWX+yabM/p52CcnrI/irb+wYuwEZn8w2Qhj5oV5cX3G7bMjxLgtKeDlEeV
         9h9CaDS3D0UzMykqvX29089wL+UIQe0VAnPqeoDrPjLO22vJZQbaWorPa9Onc9151HbI
         h2D10pUIXksC74ngrofXsA2FZALy9gpsMHw4Bue4sM7jbQmySdBfDeKpjaBxO6CPwqY9
         003pUdLIILYYTJVSX9xsA0ZE91T74NHTGvMD3QWoxalWW7fyc04k/AVbob9E3sUlt7QM
         4Xz3F3uElu9A9loYxewolnEEpaRs3D0XgXtGmX2eN22cQ4H714JxvN1Qzc8rZxCcOP8l
         r8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=flq0FL17W7Wf+yZ7NwNJAiPPmidb5wholchPp0CIJk4=;
        b=CzUHZELq9Wg4i/fJiVTbQbUPlxs4T2Dp0bv2pr3QxJclxSdzfGGT5Mz3CLWDQGju6l
         0g2Nr0YocimtUTx7UbtIIjrtNlhFw8CKDMk3iiM0S1IA5Pd0H6zRkEOb7Q4GDk9FobLQ
         Dul/DRRiWe6VCPKL9VAaR1CEsixi3VAOhvYjrE6cAl8hCN327MVj7Tul2DJhyNkTDGnx
         zkL+WimMTFBNwQDuAGimkdaXrMGKbEfYD5p5qF3+ZC9tnLfF24e3W8ac3OzRLnCRloE0
         S0ej0XMu/IRbiVFBUJDwHU0zeGaeaRdCp/gE7wv5YM5HJwfG68LejgZMydvlNRIgCpB+
         APJg==
X-Gm-Message-State: AOAM530UsRqTVnuS6sJiw38sKtgFTOozu0NLfPHhzakfCM06yG92+049
        ZUfYLLdsSHEXjigV8FpxuhNdzXEJp/M=
X-Google-Smtp-Source: ABdhPJw4QwGa2ELzyj8T2bTnj1g6zd3f396o2k1u5HBd19Il5w3Kn0d8RdARid+JhMZ3VnaKG8F1hw==
X-Received: by 2002:aa7:dc52:: with SMTP id g18mr3043132edu.369.1604072194776;
        Fri, 30 Oct 2020 08:36:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:29f3:92a7:2520:4dda])
        by smtp.gmail.com with ESMTPSA id 6sm3093686ejv.49.2020.10.30.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:36:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] fix init_linearized_builtins()
Date:   Fri, 30 Oct 2020 16:36:29 +0100
Message-Id: <20201030153629.18989-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hmmm ... the wrong pointer was updated. Fix this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linearize.c b/linearize.c
index 1081bda86425..85d370de5728 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2631,6 +2631,6 @@ void init_linearized_builtins(int stream)
 		if (!sym->op)
 			sym->op = &ptr->op;
 		sym->op->type |= KW_BUILTIN;
-		ptr->op.linearize = ptr->linearize;
+		sym->op->linearize = ptr->linearize;
 	}
 }
-- 
2.29.1

