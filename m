Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33CD1D8CB5
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgESA5y (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA5y (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:54 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03541C05BD09
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:54 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e10so10222193edq.0
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ukWJ3mSiNtP+FDO0LwIY+RlV4l6415qA4HyAb/b0v5Q=;
        b=bHDna9Y4pJ3Xz6UivWlPietvW318aohzEHVru4PJhAGgwxdHWfqByXIGvnJrk3eTaq
         uJGRo05vWPiUr04FxzjZuoqXSp4hHIa/WfTm+z4TFfjULoDcwiiFfBt9qkIpAmmzW6iV
         wBzX5IKy9h39AJ/Nur5Oqdt2E6sjP5dNy8ASUx6rEe/HSSZCRAdPcQ09UCBcmA4EdFzY
         eDJwRLEMivqtyAwu5X7QSlVv2g6xQ/kj5peP6QBtBuyT6lAEBBH0Wst9nWmFTwI/b05n
         H9bfBT3AS1zjytoszcgVK+OqFGVuw1Xb2YvLg2+Wb8TpezF4EM7GqCpEPwOJbyF45jJh
         o+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukWJ3mSiNtP+FDO0LwIY+RlV4l6415qA4HyAb/b0v5Q=;
        b=X4XMCiJQXidaGae3cuhfp8OJgkjX6mgJM6xirAVY5zGKehL5r8MT92/9VwjOiOtaBW
         EFweBC0Z8Mq9tqTPEtZCzz/mOuj+WO+PEfM8ggbSbnKXIR5bAo0B+/euxxZt4Tv1FjTE
         GA5kWmFWctL52ZveXrKscQFPddbwH/sa8C0afECQA9zTy/5Zg/d/yull8BPiOcldECMH
         a5/zTMt5+aR6A1cmiCCrDNyy4mBOFQncIjyKgiLBshBEKej4tl1/0F8DDdQgwUN7IdwQ
         Umu7Qd2zb+KggSAJT41lDaAiWxSMcdh2ou0etIOkj2Ae7Fmvk8JJ4m8hWfqNHmBindz7
         b4tw==
X-Gm-Message-State: AOAM532jRxnn+yQw7Hx4U0Sab+sytFuFVqnGOhOq/IZdvgVXuzNSON6y
        evD5ToBa2+6+TOBuI+SOqiAWG9Qy
X-Google-Smtp-Source: ABdhPJwTBBcoMYJGgNhXUSU9A+oT6sEaSeWJDhpy85Q55qCK12UoVP7ZKZVCVGjSvva4V6mQS5QOdw==
X-Received: by 2002:aa7:d1ce:: with SMTP id g14mr4609245edp.146.1589849872562;
        Mon, 18 May 2020 17:57:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:52 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 20/28] scope: add is_in_scope()
Date:   Tue, 19 May 2020 02:57:20 +0200
Message-Id: <20200519005728.84594-21-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add an helper to check if a scope is included into another one.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c | 9 +++++++++
 scope.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/scope.c b/scope.c
index 2e3a1c37ec15..017c0dcd8600 100644
--- a/scope.c
+++ b/scope.c
@@ -162,3 +162,12 @@ int is_outer_scope(struct scope *scope)
 	return 1;
 }
 
+int is_in_scope(struct scope *outer, struct scope *inner)
+{
+	while (inner != outer) {
+		if (!inner)
+			return 0;
+		inner = inner->next;
+	}
+	return 1;
+}
diff --git a/scope.h b/scope.h
index ddcb90bd146b..36a56d6adf1d 100644
--- a/scope.h
+++ b/scope.h
@@ -62,4 +62,6 @@ extern void bind_scope(struct symbol *, struct scope *);
 extern void rebind_scope(struct symbol *, struct scope *);
 
 extern int is_outer_scope(struct scope *);
+extern int is_in_scope(struct scope *outer, struct scope *inner);
+
 #endif
-- 
2.26.2

