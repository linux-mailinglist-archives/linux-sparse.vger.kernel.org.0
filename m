Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3DA1D8CAF
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgESA5r (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgESA5q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:46 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D46C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:46 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so2399215ejd.0
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IQT82X9PRucFb49eAkG88b6rnRLPWhnKOkI9EuyB26w=;
        b=AHo5WuUnIQ6DYto7AZuEI/1/nKZbNuEyO8nr7dNC4+F4Ooutbs7NkhLTBll4zq5LlV
         aeC1T6F36YfBSy8j2dF0Pk9dEXcjm//55alhmSKjCVddB2+UqheidbcxqsOuvaJzsBxH
         lepGQ+zk8Z8sn24rkDbSA154bb+h+Myr8Eled6+lW2QjkfiHQ7gJ2OTAXri2Ic8tXm7U
         WvNx2MoqbmDnrbcDYWL5UuTjXbB9JGFQXNJcgNfEdu9MeC8bbzcDhToJGJr4/F188P24
         Ae2Htv5ESau+VsSNMlQLDaOcJu8bo1S4oSZPsEHBU+bzaKXCpexZVfTStBjl2/fnbvS2
         Zehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IQT82X9PRucFb49eAkG88b6rnRLPWhnKOkI9EuyB26w=;
        b=H2zap599wdk9hie+TJaXxiqVx07Dv69xekIAMRry3oG2xt0b4Lbdfww6+DdSCXbthr
         reATa5ZxNnuEeYpnI+l0XYGICSZt/kyNyrQEq+iFs8r2sbb75FJZMaTwmpw699Jmvb7w
         MMsrwWH8vYOjZ71i7i7U2do2P/TKtawcHNmMot9+cl0WpYz9hg811l+Y/Im06hpL+f+D
         GEU72RUOgb40rTZTDQRHgrfGF/OcLjVe3hNpmuYF8VygwxW19ZAvpWWiSCPvKwDFzCRH
         XOklbaDt3KdcqNqsyTd496e2+LepPBNpdYOUoQLiJwtLWtzMNPnRzVZZSrYVo5YRxang
         a3Kw==
X-Gm-Message-State: AOAM531+iBeU/+MUWQ8j9PYCohAB33wWM220pbUsBZCn8IUWA9MFs86X
        gXEKKojUuBVQuW5W2N6HvZaZ+Z5F
X-Google-Smtp-Source: ABdhPJyUXs0JAHAA/jvoo4DR4uA4UZv5F6+Jamn/5C/7ph2hjspjbj59hWa+AB+v7kxxk8tXgS+YGQ==
X-Received: by 2002:a17:907:39b:: with SMTP id ss27mr14578139ejb.209.1589849865064;
        Mon, 18 May 2020 17:57:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:44 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 12/28] scope: no memset() needed after __alloc_scope()
Date:   Tue, 19 May 2020 02:57:12 +0200
Message-Id: <20200519005728.84594-13-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When starting some scopes, the newly allocated struct is
memset'ed with zero but this is unneeded since the allocator
always returns zeroed memory.

Remove the unneeded call to memset().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scope.c b/scope.c
index 420c0f5a3f51..0e4fb3b42150 100644
--- a/scope.c
+++ b/scope.c
@@ -68,7 +68,6 @@ void rebind_scope(struct symbol *sym, struct scope *new)
 static void start_scope(struct scope **s)
 {
 	struct scope *scope = __alloc_scope(0);
-	memset(scope, 0, sizeof(*scope));
 	scope->next = *s;
 	*s = scope;
 }
@@ -77,7 +76,6 @@ void start_file_scope(void)
 {
 	struct scope *scope = __alloc_scope(0);
 
-	memset(scope, 0, sizeof(*scope));
 	scope->next = &builtin_scope;
 	file_scope = scope;
 
-- 
2.26.2

