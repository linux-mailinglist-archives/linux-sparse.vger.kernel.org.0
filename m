Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6141FF445
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 16:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbgFROKO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 10:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730622AbgFROJ6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 10:09:58 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8810C0613ED
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 07:09:55 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id mb16so6585521ejb.4
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ABRwHxAcLNkboBfvPFRpCG8LZWv4rqcq7jzrC46klk4=;
        b=g3JtQlvgSkV14a/CimWm7cxtFch8wfA2Qp4PfJ4JyDqfNhm1bvo/CCpz+BR0CHYWXw
         fuqjqq7bxThnh1OBzCbOz/xD1KmvYiGv+OcIesDnPuZH3LNp0fJz5rB7i4Nc/4ZQakCk
         uj7bdAXWFhD1O686aGPd4qRu1b3LKYdH0T8pzNoDCcdnCEy1SM4mTKMfa1RzOJSLDBp1
         W00+ypdwHrpsMhb4r181Y9a/QA4QIXEaAsGKXMSMMnxxlUOCmT+6wtI04wLAa8oHbWBJ
         nQGQdyxpIEL4eZxxby2WHZzXdfO0UCe1y4Aj/3ZV4FJveElE1+s9gvZU/J38h5mkmjXr
         VZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ABRwHxAcLNkboBfvPFRpCG8LZWv4rqcq7jzrC46klk4=;
        b=G+SM9pV2rLXzwYl3z2n76zAaTlsANKuTuk4zgp+CygXmC3OFjP5l6sEStgVfXj2ztU
         dY0zIiBFY89WevkveC97EXgKCvcMGvFA8YEwY3O+ydoe6pdv1/HQ/RmJsml+MxHoAlyo
         Eo4DUJU26U0r5WXESnGeNQUFL7mVaXwgtvhR3xGrgtct7O8KiRxr7FJNpVr609XYCD2x
         Uo8KV/NXuXbUrZ27T4m3cuj0sgTWvUe37Hirtf0mN0Ilmps113HrIe3oKM102S9xwX2q
         Y7O2CJHhKHE+li8DRz7V6N3OfkCAUUS3Y33/q68xhFruka+dFMq8bLF3UaPEID41h2QO
         sf/g==
X-Gm-Message-State: AOAM533DcF/f32pFTjKWVWRXlGIxKVn2f67Zm2H5jIWGaIo7243vUQeM
        D6EF/4hwa3gnNdhuDYEWT4ZHG1QEzlTkSg==
X-Google-Smtp-Source: ABdhPJydBTuwQ8sGgV/irzCMRBqhXv2WIEsut//r8nLdZrCwA7TjCxMIQgSxtOkN4ChjCRkWfmipAw==
X-Received: by 2002:a17:906:2dc7:: with SMTP id h7mr4277293eji.15.1592489394509;
        Thu, 18 Jun 2020 07:09:54 -0700 (PDT)
Received: from garrit-VirtualBox.fritz.box ([94.31.102.44])
        by smtp.gmail.com with ESMTPSA id f17sm2201643edj.32.2020.06.18.07.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 07:09:53 -0700 (PDT)
From:   garritfra <garritfranke@gmail.com>
To:     luc.vanoostenryck@gmail.com, linux-sparse@vger.kernel.org
Cc:     garritfra <garritfranke@gmail.com>
Subject: [PATCH] ir-validate: remove orphan comments
Date:   Thu, 18 Jun 2020 16:09:14 +0200
Message-Id: <20200618140913.25321-1-garritfranke@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Please let me know if these comments have a right to be there, but I
think they are orphans and can be removed.

Signed-off-by: Garrit Franke <garritfranke@gmail.com>
---
 optimize.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/optimize.c b/optimize.c
index e8cb7fc3..31d94e61 100644
--- a/optimize.c
+++ b/optimize.c
@@ -75,7 +75,6 @@ repeat:
 	 */
 	do {
 		simplify_memops(ep);
-		//ir_validate(ep);
 		do {
 			repeat_phase = 0;
 			clean_up_insns(ep);
@@ -86,15 +85,11 @@ repeat:
 
 			if (repeat_phase & REPEAT_SYMBOL_CLEANUP)
 				simplify_memops(ep);
-			//ir_validate(ep);
 		} while (repeat_phase);
 		pack_basic_blocks(ep);
-		//ir_validate(ep);
 		if (repeat_phase & REPEAT_CFG_CLEANUP)
 			kill_unreachable_bbs(ep);
-		//ir_validate(ep);
 	} while (repeat_phase);
-	//ir_validate(ep);
 
 	vrfy_flow(ep);
 
@@ -111,13 +106,11 @@ repeat:
 	 * again
 	 */
 	if (simplify_flow(ep)) {
-		//ir_validate(ep);
 		clear_liveness(ep);
 		if (repeat_phase & REPEAT_CFG_CLEANUP)
 			kill_unreachable_bbs(ep);
 		goto repeat;
 	}
-	//ir_validate(ep);
 
 	/* Finally, add deathnotes to pseudos now that we have them */
 	if (dbg_dead)
-- 
2.25.1

