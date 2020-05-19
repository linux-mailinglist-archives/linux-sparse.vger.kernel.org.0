Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC14C1D8CBA
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgESA57 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA57 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:59 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5DDC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:58 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h21so10388229ejq.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eeqfJ5yxiYGkbphtu4RCEegQyllTOOh7iRENcZmcFSg=;
        b=tk4Ej/x7fyDCscDwTK0d6BQhSdtwgrGL5bgKBXSFBkBTBDwryeXKxuPjVqGA/RIDqb
         PGMlyRq6QNMk4SwwSfHXsRf64Yupuve6hp4eim77SPUg9s+WDjAdVM1HFTKonOmPz/Gu
         iIPDoiJC1vMvYc5AO2jDndHy2egeGRodlvYvq78+kV8fxjFgCKSjQ3wJqtmVgd2XVQnR
         v3783URkheQ5qt4A4SoPsl/5g2HE1vZrNa8uTEmnmkWjcoge7FgBrYSsasnP3p/3W2Bj
         ecz9EvL6nm9J33bnlq/ydQxaoK4M8led/Jprd46q5yEcB8VrCIh4fbNHfV5PfP7qoJCc
         Un5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eeqfJ5yxiYGkbphtu4RCEegQyllTOOh7iRENcZmcFSg=;
        b=fIRTj/sXf9P//lZNnpMkZi9ooXz8e+ZySU6zfF/Gs87eB9h5MspoQVct/Q8fBn7ANv
         Axc9KmtyhVBMS7eu0KEK+B+mvRCxnsY0T5JT3+mYOFp0+v4c11Bhbppcj6U5o2QRI2TJ
         SHnBzHubgUUPz9tzAyzpN+YCd146QQ8end8EqZ+JjzsAZZ7GOGEkyh4cRCmtG94Bujcz
         Hu4XmkrBxVZv5sVC1xMtfIKsXomi/6P3Zd2Z4OOmJ3VJaD0KfEhXMVUOB5PmocmdjmJF
         SiP5ml+qeadn4mqsVxMrJ1lmc+uC6uAdmJ7xHNBUaYru+4UeXFwdO8TVhLTQm81k1+54
         v1lA==
X-Gm-Message-State: AOAM531I+y9QIdRQEOO9IvSdECtjNio8R+uAw4aRSJzP+zn0NDLNYXqA
        u9cNguWOBOy5VZ8IKYDb4AqQgOp9
X-Google-Smtp-Source: ABdhPJyj3wN3SVEdgNZba21ByAEHtlGue8/dgKcZbWkYa1Z6aBhbDYRTgCXSoLSKcnO2dr2adU2D/w==
X-Received: by 2002:a17:906:95cb:: with SMTP id n11mr16598642ejy.182.1589849877236;
        Mon, 18 May 2020 17:57:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:56 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 25/28] bad-goto: check declaration of label expressions
Date:   Tue, 19 May 2020 02:57:25 +0200
Message-Id: <20200519005728.84594-26-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Issue an error when taking the address of an undeclared label
and mark the mark the function as improper for linearization
since the resulting IR would be invalid.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                            | 1 +
 validation/label-scope-cgoto.c        | 1 -
 validation/linear/label-scope-cgoto.c | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index b272e3f642b2..63d75d9031d1 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3344,6 +3344,7 @@ struct symbol *evaluate_expression(struct expression *expr)
 
 	case EXPR_LABEL:
 		expr->ctype = &ptr_ctype;
+		check_label_declaration(expr->pos, expr->label_symbol);
 		return &ptr_ctype;
 
 	case EXPR_TYPE:
diff --git a/validation/label-scope-cgoto.c b/validation/label-scope-cgoto.c
index c5d278d3d654..1edb9948d8cf 100644
--- a/validation/label-scope-cgoto.c
+++ b/validation/label-scope-cgoto.c
@@ -65,7 +65,6 @@ l:		 1;
 /*
  * check-name: label-scope-cgoto
  * check-command: sparse -Wno-decl $file
- * check-known-to-fail
  *
  * check-error-start
 label-scope-cgoto.c:12:19: error: label 'l' used outside statement expression
diff --git a/validation/linear/label-scope-cgoto.c b/validation/linear/label-scope-cgoto.c
index 592f1ce4f664..0eba05aea3c7 100644
--- a/validation/linear/label-scope-cgoto.c
+++ b/validation/linear/label-scope-cgoto.c
@@ -3,7 +3,6 @@
 /*
  * check-name: linear/label-scope-cgoto
  * check-command: test-linearize -Wno-decl -I. $file
- * check-known-to-fail
  *
  * check-error-ignore
  * check-output-ignore
-- 
2.26.2

