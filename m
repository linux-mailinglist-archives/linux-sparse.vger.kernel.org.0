Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8D89F5F65
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfKINfb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:35:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42506 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfKINfa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:35:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so9954035wrf.9
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MfK9WQaA7IG8G/JNCwb0n5JbK8wsaZeit7girDX2c/s=;
        b=SQAbhzwljokwq6iKmL7DEpjJVBoG9/11Y+UGICajziFA7E+ZjSLUFNk+qnSvZZtL0+
         2NpxwAZAOgTVwNxs29jH612qP2FAMDzyE0UIdEutCvSX+HOUS+F5Zdr6DmrdJPHYamac
         gJzmP8RAgH7ZxNchBgYijkPnBG2l+nbuPgL35YE9hk7wivSJAxxmRXaWHAn3OOTl1iZ/
         qBdcuqaWanh0v6kq6yusasPKo/2ZEj746xL7k4gDbF565S58Md63GuEaIW5AcNGjXAbd
         JDyOyP17hh4MoYuLLy3/qhO8XAYJg5B46ZoQ6evp9Ob1BtXA0rqZUdteGakKUzrQ5hlZ
         vjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MfK9WQaA7IG8G/JNCwb0n5JbK8wsaZeit7girDX2c/s=;
        b=ddCEeomCX8YQQghihF9Jqdhu7oRouLNhn2JpNvSUZZ9SoQO4VmWQ1sVPplJ2LUYTI6
         CwyC9BMzCiVUJEtyg8nG90B/QSABjilZm86cGO55HCVvlnSD36Gl+uALaXsSr3l+Ykny
         5BeUn1QAwz8oAuDodOHYiG1r0TJqVIBTmGsjEAndURxHXG4D4BqfcgS+VlEGdGoKEQRh
         fZyqLFeUu+EOicmGYd0EOrglXZRL4AKTvsEvheR4OQUNnCccDG8EX0s+Gw2zzAKrhuGc
         bHNMmXnJQgJiOYShV1UPJlyBgCGl9vaeAnu9eNPmRVSBu+zPDWMvL9oJu6+9FehayzEM
         7zIg==
X-Gm-Message-State: APjAAAWJYmREkvy9OdvXoGER5n36W37m8k1R7aYPiXPfT4RqTVYxyber
        DwoQ+aqCk/zgsxW1/IfsvgfgcKpO
X-Google-Smtp-Source: APXvYqz/4A8WweHHcJNciQqcfcVbISbuYNa7LZpzB36ZKW8u0R1+svz6P4/ORtd96r3oL48bBJYR3w==
X-Received: by 2002:a5d:414a:: with SMTP id c10mr14048956wrq.100.1573306527276;
        Sat, 09 Nov 2019 05:35:27 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id j66sm8124422wma.19.2019.11.09.05.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:35:26 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/4] typeof: examine it at show-time
Date:   Sat,  9 Nov 2019 14:35:19 +0100
Message-Id: <20191109133519.63010-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Unless an explicit call to examine_pointer_target() or
get_base_type() is made, the base type of pointers are
*not* examined via the usual recursive examine_symbol_type().
That means that it is possible to call show_typename()
on a non-fully examined type which is wrong (for example,
because SYM_TYPEOFs may not be converted).

So, call examine_pointer_target() on pointers when trying
to display them.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 show-parse.c              | 1 +
 validation/eval/typeof0.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/show-parse.c b/show-parse.c
index 371041675..80125e741 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -337,6 +337,7 @@ deeper:
 		mod = sym->ctype.modifiers;
 		as = sym->ctype.as;
 		was_ptr = 1;
+		examine_pointer_target(sym);
 		break;
 
 	case SYM_FN:
diff --git a/validation/eval/typeof0.c b/validation/eval/typeof0.c
index abef63865..12b086608 100644
--- a/validation/eval/typeof0.c
+++ b/validation/eval/typeof0.c
@@ -4,7 +4,6 @@ static typeof(i) *ptr;
 /*
  * check-name: eval-typeof0
  * check-command: test-show-type $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: unknown type
-- 
2.24.0

