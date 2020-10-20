Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE2329445F
	for <lists+linux-sparse@lfdr.de>; Tue, 20 Oct 2020 23:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438682AbgJTVKp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 20 Oct 2020 17:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438680AbgJTVKp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 20 Oct 2020 17:10:45 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85E9C0613CE
        for <linux-sparse@vger.kernel.org>; Tue, 20 Oct 2020 14:10:44 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id t25so4822090ejd.13
        for <linux-sparse@vger.kernel.org>; Tue, 20 Oct 2020 14:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acKBIWcSTlmgsn/k2kkJrbhc96RJoNBv/HxBlb6i9tk=;
        b=GF63IuJCVwntSI3pYYl2QwEWP190iFuzpy/cVLHK7412eNFerdAL4m5fOIZQt5hlsN
         jPzD35cAfLvNuKZXkTJDgzGOTMpvLfZNBttrNOOowsHljMDjzCnyDVESzr1Ud3VEvpbW
         gmSOf6q5BZSpKOqhH6jCYYUDyYcA9nkhj2zk6jNFFyoVLzKkNIQMh7rnMin2DhLJc4qY
         P0EYDLAu67kjdCvz3NZnkE7S83j/Hv1XLE7dkFplWFFr2Q2Z+75hfcoaZyHc2Pcig9NB
         QM7aztstuOWu7LudOgv/unlvJ3yconBYY/f3GjEoDmXXXs8fv8zNcIJc6qyK41vRYinO
         hwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acKBIWcSTlmgsn/k2kkJrbhc96RJoNBv/HxBlb6i9tk=;
        b=Y5EbKTKi1aVLFKrSKdMW3jo4WJrEE5Akm1ldNbDAu9Ul2Z3xHDOdG8SmA41y6SgriY
         GMyNulWDHducxY5sK9UMBgDjVwZ5wFueiszRfi5I6aUrSAp+ifzFCpdzEHnabCbWI1uV
         lRtmoVqrX+gvh9igJqbs8A5UcQPBYMmPyuw8QyKBs2YZdfW+dqpEmzsiRRKYTGolwHJI
         8TORoQJ8pIIUFIpu1zhE4KeRZPVZFazJYks+SVqIFXOFxkXsGUBH30u4E/5gZMVQeBwO
         2slvBTnRNGKYhLtTeByoxx03KsAjMpVXda4o5iqLXphxpfIdgY4RvD8VwROtxxHn11Ra
         2svw==
X-Gm-Message-State: AOAM5334qgG894LyB/f2anLg5RaXyFgxAXuW9k0jOs+QdWK4kOVWux62
        xWdjTLqlYZmxK7HHrTJqFR2YwsQBLfM=
X-Google-Smtp-Source: ABdhPJw3KfCj3d7Qzc75mwT0QEzCZntQ1q6HSYiU5HUn5hRS96TiIwPdW4J0dHOCPt2ZCVwtUK+Gdg==
X-Received: by 2002:a17:907:42fd:: with SMTP id oa21mr77097ejb.247.1603228243408;
        Tue, 20 Oct 2020 14:10:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:85fe:66cb:a92b:c664])
        by smtp.gmail.com with ESMTPSA id d12sm4012848ejt.105.2020.10.20.14.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 14:10:42 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 22/22] sub: simplify x + (y - x) --> y
Date:   Tue, 20 Oct 2020 23:10:21 +0200
Message-Id: <20201020211021.82394-23-luc.vanoostenryck@gmail.com>
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
 simplify.c                                | 4 ++++
 validation/optim/simplify-same-addl-sub.c | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/simplify.c b/simplify.c
index 65fca35099a6..6caf6cbcf918 100644
--- a/simplify.c
+++ b/simplify.c
@@ -1380,6 +1380,10 @@ static int simplify_add(struct instruction *insn)
 	case OP_NEG:				// (x + -y) --> (x - y)
 		insn->opcode = OP_SUB;
 		return replace_pseudo(insn, &insn->src2, def->src);
+	case OP_SUB:
+		if (src1 == def->src2)		// x + (y - x) --> y
+			return replace_with_pseudo(insn, def->src1);
+		break;
 	}
 
 	return 0;
diff --git a/validation/optim/simplify-same-addl-sub.c b/validation/optim/simplify-same-addl-sub.c
index 51d2b07966f4..9cca1d12ff92 100644
--- a/validation/optim/simplify-same-addl-sub.c
+++ b/validation/optim/simplify-same-addl-sub.c
@@ -3,7 +3,6 @@ int foo(int x, int y) { return x + (y - x); }
 /*
  * check-name: simplify-same-addl-sub
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: ret\\..*%arg2
-- 
2.28.0

