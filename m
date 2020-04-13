Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3271A69A2
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731401AbgDMQQ3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731405AbgDMQQ1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC909C0A3BE2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:25 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id p10so10708992wrt.6
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Unz8ufFdGs6t5nW4yGl4qg0hYPZpZ3Kl8/wmJIVaygs=;
        b=H5Qz3DYrcK1nE2XcU97OAqgHJLTLyttr+PFW9c7JTgRak55aqr7IrTz2Bqp0ur2KKT
         jrlzev3djQJkWdZGcZhyxIoFUFtP/XHps/+WuLgIR4IHVZDQiWDsoZyBMJNV3in/suF7
         KgC/37ruypzSwji2gyzDe/zWP3mnpDXpj70VpYzJsrScaGehRBIemFFNustKz5PMLL1f
         h+IZDa3vgEB7AEzCgEMucDXUt5CaW6n31hwnW9pCZOok7mmFDFLNTVLnMh45hFnm/7XN
         BZfTUQrqn+LyAO2bjb6TwUs/4Nm5A52G5J7jG7iows9Tf10RphFATRkoa7s029ggO8+d
         N96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Unz8ufFdGs6t5nW4yGl4qg0hYPZpZ3Kl8/wmJIVaygs=;
        b=asLq7lAmm/iyO3W4CcZiMj9rEH18X+nOUIEFuHMtcY5VGolCZz5bM1R8Qrv2hD+mVK
         hquB1bV+O/VY6DvZf69brYTREW+ivNLjbLNO2JbPr5ETjpygLOl3ymOEthd/mPsZM6fT
         1bK9N+4WF/XPHQJkXdVAlRhLvswAUb77kTDTA6Czc5pBkxRY6RnSM2CJFXJOWadc6qxN
         jrFNF3L5MrsVGI5nFvAFXiFz+AhcQAa50V9ZeetscVEeFhn/LSmLIMt7sNq4lPRS+mfM
         RAdic/e/jrLzk5uRZ2WMQjUXFCYhSiarq2VV6g6i6nAI8ZRvVbdYUVySy/7oFYaDzGIq
         CrLg==
X-Gm-Message-State: AGi0PuagdmKNodD6HiwHsH7ot5LmZgiudGaOCbd24jykkybuRLYRTIXD
        bQ1pizoV+YoGT673pILIMttzIn7u
X-Google-Smtp-Source: APiQypK6TurEqqy6Ks7vtfB7GqXJ1sPu9Pvo8S/hQT25eRSjfQrRcDuIQSTEqh4QF8+vSo4/JPqDrg==
X-Received: by 2002:a5d:500a:: with SMTP id e10mr19590218wrt.341.1586794584386;
        Mon, 13 Apr 2020 09:16:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:23 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 14/17] scope: add is_in_scope()
Date:   Mon, 13 Apr 2020 18:16:02 +0200
Message-Id: <20200413161605.95900-15-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add an helper to check if a scope is included into
another one.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c | 9 +++++++++
 scope.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/scope.c b/scope.c
index 24c8a7a484f7..b5c9e454b55d 100644
--- a/scope.c
+++ b/scope.c
@@ -163,3 +163,12 @@ int is_outer_scope(struct scope *scope)
 	return 1;
 }
 
+int is_in_scope(struct scope *outer, struct scope *inner)
+{
+	while (inner != outer) {
+		if (inner == &builtin_scope)
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
2.26.0

