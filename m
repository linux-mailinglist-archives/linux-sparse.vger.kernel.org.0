Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F37129730F
	for <lists+linux-sparse@lfdr.de>; Fri, 23 Oct 2020 18:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464763AbgJWQBA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 23 Oct 2020 12:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374472AbgJWQBA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 23 Oct 2020 12:01:00 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27912C0613CE
        for <linux-sparse@vger.kernel.org>; Fri, 23 Oct 2020 09:01:00 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id 33so2008125edq.13
        for <linux-sparse@vger.kernel.org>; Fri, 23 Oct 2020 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hY1hTAszrWzleO2lnbHdyipwEPJooZr0jefkzYJ+vi4=;
        b=Mb6mgGtKXLyZVnaO8E5dl1AjGG+6sBBQO/XX4bmlGvtLQS83k1sQCO3tIZQtgQDIdG
         JE+RYqUR66fVCJj8nkIS6FgC8e2DaeFTUxTxq4+06D4ofo4mB5SlbKdw594sLxfvqwbh
         jVp3+8fNmuRdlaA77hpGIys46zkKff69DSpGulG7fPC19fdIQGotqAuQMbnMutwX/luR
         zboW/DQ0N6dIf9ID4YKs0up3XiOBMswyCjl3HfzmUv3/O84YCj5JgBUCoVIGo3G/72Nk
         /1241SzbLx6iPLNxL1Oi0N5wKy8OoE0Un6h8QoK1Zd+m8ucf9/4AW2bItv+ExcyeSxwK
         rjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hY1hTAszrWzleO2lnbHdyipwEPJooZr0jefkzYJ+vi4=;
        b=L3pLEwphbawaTnaEEtTNweQuq3FXB8Bbcg7LML+kHpSCfXEj0/apgXmMpNVQhXq8iY
         h/uueOg7SE7ws9DBWFSHSBjHethhTPtOtJpwOOu82JB2X0H3rbAQEYHp7B7dqvjIhGfv
         CPQYgxgSo1mjwIAungShK7udqqucDcpWy1qrQqsbbbZ/MWXf/SIqm1LB5k5GFx4niatO
         PZIm63TRv2QZkVxaokER8+JrFGl3dR/QLsaTqqCkA/1PcN0S06091SxK4oFkBWv+O/F8
         EJTuBwnXpY7G7np53ekDRi7cw3uuCDBzrBP7qaeOauafH9B+372+51UtH/B0sPnLMTy1
         buvw==
X-Gm-Message-State: AOAM532WmSJCrJWAe1b4fYv4GujxgtNMA9pqWPiaxcD622/3dCszHZBk
        kC1x6abmcnzu2V3e/BPIK6FDrGEutvw=
X-Google-Smtp-Source: ABdhPJysra8lAx0KOzv4yXfqltRjab5WNg+S+HBwkfhpCpBT9sntdJZkk6BaiAv1mFYrFO2MUEcxdA==
X-Received: by 2002:aa7:c2d9:: with SMTP id m25mr2923405edp.226.1603468858468;
        Fri, 23 Oct 2020 09:00:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:c9b0:42da:8135:1fa1])
        by smtp.gmail.com with ESMTPSA id d24sm977573edq.34.2020.10.23.09.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:00:58 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] cleanup linearize_cond_branch()
Date:   Fri, 23 Oct 2020 18:00:55 +0200
Message-Id: <20201023160055.57533-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

No functional changes here, just some more consistency:
* systematically use break instead of 'return VOID'
* remove some superfluous curlies
* remove some unneeded blank lines

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/linearize.c b/linearize.c
index 1081bda86425..978d1e415fe1 100644
--- a/linearize.c
+++ b/linearize.c
@@ -1795,37 +1795,30 @@ static pseudo_t linearize_cond_branch(struct entrypoint *ep, struct expression *
 	case EXPR_STRING:
 	case EXPR_VALUE:
 		add_goto(ep, expr->value ? bb_true : bb_false);
-		return VOID;
-
+		break;
 	case EXPR_FVALUE:
 		add_goto(ep, expr->fvalue ? bb_true : bb_false);
-		return VOID;
-		
+		break;
 	case EXPR_LOGICAL:
 		linearize_logical_branch(ep, expr, bb_true, bb_false);
-		return VOID;
-
+		break;
 	case EXPR_COMPARE:
 		cond = linearize_compare(ep, expr);
 		add_branch(ep, cond, bb_true, bb_false);
 		break;
-		
 	case EXPR_PREOP:
 		if (expr->op == '!')
 			return linearize_cond_branch(ep, expr->unop, bb_false, bb_true);
 		/* fall through */
-	default: {
+	default:
 		cond = linearize_expression_to_bool(ep, expr);
 		add_branch(ep, cond, bb_true, bb_false);
-
-		return VOID;
-	}
+		break;
 	}
 	return VOID;
 }
 
 
-	
 static pseudo_t linearize_logical_branch(struct entrypoint *ep, struct expression *expr, struct basic_block *bb_true, struct basic_block *bb_false)
 {
 	struct basic_block *next = alloc_basic_block(ep, expr->pos);
-- 
2.28.0

