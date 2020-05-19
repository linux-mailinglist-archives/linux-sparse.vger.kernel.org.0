Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D4C1D8CB1
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgESA5w (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgESA5w (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:52 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C1BC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:52 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l5so3701797edn.7
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y/cIaK7Vxq1c2uitCRtQUTKA9NOQApxj9UJRSau3CrE=;
        b=Xxx8uWHDT6DxgGqLsddwrWfM1WC/5S2nEbGeAvExq91PY/HcoBQpv7VhXBMxQmp9Bf
         dpgDjJpA6tsjhvPV/EKUTrCnRy75fQiTHeiScbqQamwMNWtoCzzL/dFIOagvDaeLoRtM
         xN32CU1acV2Mz3cHAONQcAVzkbGTxUs/GOdaEptD1fInZ2uGs6zYNkgjuyoUVgZq6zr9
         GNWpIm7dcPEMiuVMpU9mmmakhWSAXiGlLwPoDwRLQOxI9X6Skz7oh1OBFwUhbe6CuNos
         xunRz2ZVmJckJpg23bH3xZskS9LCfCQ8r8ZmRCiUBkjgISKfeGwTSr3yXwI9Yho/Gin1
         clqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y/cIaK7Vxq1c2uitCRtQUTKA9NOQApxj9UJRSau3CrE=;
        b=J3Sq+SEdtx1BfNiUsdmAKPSelTILnVGPo87u7nDoxa/LSas/aRoHGR37pcRjUP1jEI
         SEeYqlVqq6F16p3gReX8F1QRSdaz9Cj97zgI4hftCS8H/3GOLgJaJyoT6E3T2zTd2Y+l
         +V/qVlotxFo+CUp56w1hKl+HLugUKVUggBE8d8F95AJK2GJ4ekUvBZCWWXgz4/mSrEbX
         tpIPxOszFduwKBeaPvaUQ8fC8gSO+8+S9LL4CpK61aZsa60RGhYHcQtZjAk1xm697OfO
         4jstfBWqBU4/oiAtmak5EXgKYcHTOJChnuGeJ0IFxLcH1j43Fb+YvHANKg1oK2orgceJ
         ZwIw==
X-Gm-Message-State: AOAM533Qkeg7EWv9ZT3lEGcqxAQwhXKVrtNtPqae/Tp5/OadansgD0L3
        vuxzIgw4wkGy8fjbG14Jhl07D67m
X-Google-Smtp-Source: ABdhPJxDCozUPgr5pwRj4RjxkeXIh6RlOsn936GPTtVGQhbkM767340y08O5ihX08BcWJHGWJgbvtA==
X-Received: by 2002:a05:6402:1c1e:: with SMTP id ck30mr15486995edb.154.1589849870801;
        Mon, 18 May 2020 17:57:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 18/28] scope: make function_scope invalid outside functions
Date:   Tue, 19 May 2020 02:57:18 +0200
Message-Id: <20200519005728.84594-19-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The scopes are mainly used for symbols corresponding to variables
and functions with this hiearchy:
* builtin
* global
* function
* block

But the function_scope is only used for labels and __func__ and
is meaningless outside a function.

So, mainly in preparation for some incoming changes, let
function_scope's parent be NULL instead of the builtin scope.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scope.c b/scope.c
index cc54f1e1760b..83cc34c44bf5 100644
--- a/scope.c
+++ b/scope.c
@@ -36,7 +36,7 @@
 static struct scope builtin_scope = { .next = &builtin_scope };
 
 struct scope	*block_scope = &builtin_scope,		// regular automatic variables etc
-		*function_scope = &builtin_scope,	// labels, arguments etc
+		*function_scope = NULL,			// __fun__, labels
 		*file_scope = &builtin_scope,		// static
 		*global_scope = &builtin_scope;		// externally visible
 
@@ -80,7 +80,6 @@ void start_file_scope(void)
 	file_scope = scope;
 
 	/* top-level stuff defaults to file scope, "extern" etc will choose global scope */
-	function_scope = scope;
 	block_scope = scope;
 }
 
@@ -138,6 +137,7 @@ void end_function_scope(void)
 {
 	end_scope(&block_scope);
 	end_scope(&function_scope);
+	function_scope = NULL;
 }
 
 int is_outer_scope(struct scope *scope)
-- 
2.26.2

