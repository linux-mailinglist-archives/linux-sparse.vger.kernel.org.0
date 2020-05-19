Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCB91D8CB9
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbgESA56 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA56 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:58 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE20C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:57 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id se13so10371086ejb.9
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FAjbUbPyF5Ab28nrTKYR8Q4YJddMJltRl8FoziRI+U=;
        b=cz+Ln23EEk0FvFrq0G7pYHiClR+qxwOYUTEzuWBIWPyyvDLfk0LmPWEPQy767sHJvF
         +5cq1aJG1ED5lAbZ1/QOhwo4UV012fTo8Bsaw3ubP+H2Nn16djf48VTYaMVZAedTA45N
         u7sV4enYnhC3q+nhAJU9Vc2iSAHJTVCnf2xm6K/4vd3ELlNRGgL+8fYFE4mhlvBe/Kyd
         Z79oP5xVRfiUK+LaLk1NnJfDHBWowNkI066VBCEMcg03ywPEg2+cCCuBaOMgyvWZww8u
         ruxRbX44ebl17N/DEqKaZuuKVypz6+fZgd45HD5QftcuLGBxWZKxwhVRJan5pFMBoig3
         08tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FAjbUbPyF5Ab28nrTKYR8Q4YJddMJltRl8FoziRI+U=;
        b=NxdKs6zMDE97Gh0ZLXjqCjuBiLoOpi0t7ifakBq9I05q3Z/tIjMjG4EqQH7gasuAwF
         eKvPVf1Yy+nD1TyebkDKAAHSo5Y/5u+lQFqLjNJt7FRtYMY6IrTvsCLqztwHfGNeM6NB
         PqCxy0VktR0UpRc2DkKhnPa4vNmppqHy4NkisujbfmMql0cstIMbDusDVGjBZDi33m3c
         wO9NUgR0yj5ol2HJu06rSuYWnxBTX3u3377MsYbv9xxnDwRndTxuzjVbs+Vzag5S0BXL
         NkT6N7jwIFfV9vZ9kJTG0BG97yXrvX/YuwT1pcjqi4zZezQRjwZ1/ezoxw4bJP0akf5I
         LPmg==
X-Gm-Message-State: AOAM530ekqTYN3EaIY87aeZ8FNyRqMUwyGq/OwhBOjDZWLdNfHPq81B4
        bX1Pwbsc/4xnXXzeefBRzi9rIUji
X-Google-Smtp-Source: ABdhPJz462onvSl6xygYD2C7SzelLJUIzPoYZQ7LHVtbFhpzN3G68T746tynQgLF2cVd9bpy37Hy7Q==
X-Received: by 2002:a17:906:b08c:: with SMTP id x12mr15582668ejy.154.1589849876285;
        Mon, 18 May 2020 17:57:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:55 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 24/28] bad-goto: extract check_label_declaration()
Date:   Tue, 19 May 2020 02:57:24 +0200
Message-Id: <20200519005728.84594-25-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Extract this helper from evaluate_goto_statement().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 21d5d761627f..b272e3f642b2 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3257,6 +3257,21 @@ static struct symbol *evaluate_offsetof(struct expression *expr)
 	return size_t_ctype;
 }
 
+static void check_label_declaration(struct position pos, struct symbol *label)
+{
+	switch (label->namespace) {
+	case NS_LABEL:
+		if (label->stmt)
+			break;
+		sparse_error(pos, "label '%s' was not declared", show_ident(label->ident));
+		/* fallthrough */
+	case NS_NONE:
+		current_fn->bogus_linear = 1;
+	default:
+		break;
+	}
+}
+
 struct symbol *evaluate_expression(struct expression *expr)
 {
 	if (!expr)
@@ -3748,12 +3763,7 @@ static void evaluate_goto_statement(struct statement *stmt)
 		return;
 	}
 
-	if (label->namespace == NS_LABEL && !label->stmt) {
-		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
-		current_fn->bogus_linear = 1;
-	}
-	if (label->namespace == NS_NONE)
-		current_fn->bogus_linear = 1;
+	check_label_declaration(stmt->pos, label);
 }
 
 struct symbol *evaluate_statement(struct statement *stmt)
-- 
2.26.2

