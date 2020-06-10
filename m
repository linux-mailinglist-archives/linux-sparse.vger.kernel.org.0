Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FEC1F5D27
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbgFJU1p (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728675AbgFJU1p (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:45 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD2EC03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:44 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o15so4037859ejm.12
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aYBGZWua1F5iQuSBJGWjVUrw+r6uHuupKvRnQCAPLPg=;
        b=ro+zwyJy32lRgYlIm1lhaigIXeKnFAbF3e1OkLUdXMlR91rsPHZmrSGYXPcwW8QASd
         wtvCZAS4/nOrJfEixI52Re8YiB2Gund5iN+JrTWS49e5I56MExpvKP5s240R+ureF+C6
         LljIodPvxvsc7FP17RTGyEGdl/TyD369hj5zefgVtWPrFukiNyxnBVWw7SiPbfEy8ll8
         8B50hGanbV2Cbe9+7rnAt5rMCtJ2tw9HyQhhNtrDRbHkd6At3Sg5QEZDxjv0d2xI7Zih
         4pEZztKD98qvnUR7xtnwYCk2nBWOl68VsU7Z6vrnVSZUXpla/H62jyM85Tkv9hy0pKBK
         dtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aYBGZWua1F5iQuSBJGWjVUrw+r6uHuupKvRnQCAPLPg=;
        b=XNfVAowaaywpklag27jHbesl/kH8hKIT8EjM1xxu4n6FaefpbOKDOHQoSMIBuuqRth
         2yxrExUyYs6hiqnZiSEZXKFVBQu2G8m9XI6XuL5GW5sWpsRREAYc1/dvbpCydlm0XDdx
         94exXPVHFuqReSOiE44OIXe+HrC52Yj4YacNRM9nQMmCUWFkgn/uaBcPO1GwBFAxcw0E
         5zvv2W8a1J8N1Ph4AWZtNVbiyekGGxaOg52hxNNoyYRV8D8OoL6My6uqJ9l+CCNX+XmJ
         C9n/5JFmHSbgPfDCBD0+MioZNrrGuhZlGnGpj2SEDF8W9c7z2G/G9tqRsXk4BS/Jcx0Z
         2oww==
X-Gm-Message-State: AOAM532j5haBDKjiuwED6KQ2l2Af3JtETBT0l+lJDKNp78BkCP1P17d/
        XfYf0wWCB8Q6WgwrlNCk7Zu6XeEe
X-Google-Smtp-Source: ABdhPJzU7DNocNiv3xp6yg09ajint14dPaw0G/oT5V2uUpcqr8VzhFcFj1WMk/qjoFxaO1K9t0ZMmg==
X-Received: by 2002:a17:906:7848:: with SMTP id p8mr5401997ejm.244.1591820863343;
        Wed, 10 Jun 2020 13:27:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:42 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/7] builtin: can be initialized later
Date:   Wed, 10 Jun 2020 22:27:29 +0200
Message-Id: <20200610202735.84968-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The itialization of the buitins can be done later,
after that the types have been initialized.

So move the call to init_builtins() to just before declare_builtins().
This will allow some other small improvements.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c    | 1 +
 symbol.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index 8f071bfe96ef..aa1c1d656b9d 100644
--- a/lib.c
+++ b/lib.c
@@ -1595,6 +1595,7 @@ struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list
 
 		predefined_macros();
 		create_builtin_stream();
+		init_builtins(0);
 		declare_builtins();
 
 		list = sparse_initial();
diff --git a/symbol.c b/symbol.c
index 7044ab3f78ce..6ee521ba48d8 100644
--- a/symbol.c
+++ b/symbol.c
@@ -783,7 +783,6 @@ void init_symbols(void)
 #include "ident-list.h"
 
 	init_parser(stream);
-	init_builtins(stream);
 }
 
 // For fix-sized types
-- 
2.27.0

