Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D327ED3DD
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 17:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbfKCQ2o (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 11:28:44 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51405 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfKCQ2o (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 11:28:44 -0500
Received: by mail-wm1-f68.google.com with SMTP id q70so14143987wme.1
        for <linux-sparse@vger.kernel.org>; Sun, 03 Nov 2019 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I7AV2xIJutGZwhW0jKBO3yXeQjukB+pKGlRdyKRLHro=;
        b=ZoZwW/d/uRBKCdUdqQ22gbVhJrXHQAlFfETorIGYse4DJ/DdEQ+GpqrPzp6scEB7hx
         h9gemgR+FjTaEquc6BcD85otVEemDJjv7pg1AldySbc3gQUymSAmq/xHkzO5cfUj8m9o
         +GeraOSJ1quf4kx/vvZnrakIpkQLqyHCyKaWdHf6RWZHfNwQ4uRzUprraOtSbNTGxXA9
         vHYc7ENaFYeca3YostmWWFkswjHbMoCKZcKpjtkZKbYTlu6s1xjmOdKaTQHu+a0W9Xh5
         oXdrRiJCDcrPGmBBfQQQ2TxBccF6rkbycj5kA6V59dXrDxhQbn6QfmdNo62K6FiAtYN8
         0vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7AV2xIJutGZwhW0jKBO3yXeQjukB+pKGlRdyKRLHro=;
        b=sIhL5fePrpYdcwPynJBvs/Dv/xHB2LGb0RcfGMNJPtykU3DF6yQhvtdvVAQzm7UHd2
         dGhKBlOHK3pQIWdWhNzRcQmIKx2Sr6W3wGC5wUF86jZ3NFTF6sLfxctQA1OpwLniI5wb
         45vBVXu8nKd22TKgFweoxOXJkZFeK2rpR7Ewjpekt5PuvkJ/om11mJfHHxbzDoyc4b2y
         TaCYEz7jwq+5znGpA6VNFHDLwsMh0PziKH5e+FSURN+MpygHSB7qonj6OVGM3CrwvX0c
         164fcCjHQqP4x2VnTKrlQHRGs+V12btNqmWolH1Xu1e1WLQR6dG50Sl+gwA+3LnIhfVN
         wVkA==
X-Gm-Message-State: APjAAAXZq5hxdAsP1ZT82/LlLjpbUyJsHJ6hTBrWnLzrTLkmj0trNzvc
        XUg1GcLmEtJhTOeviUlh7ZgqsvdY
X-Google-Smtp-Source: APXvYqxOwxwqgLySMCafkaqR3Y2fDeC2lRItLUAUSJ7sRE74ExBhUjKI3ktgKeqZzKcTJ7mf61ZqQg==
X-Received: by 2002:a1c:9a88:: with SMTP id c130mr20083943wme.164.1572798521773;
        Sun, 03 Nov 2019 08:28:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:d83d:1405:3788:2299])
        by smtp.gmail.com with ESMTPSA id o189sm20902060wmo.23.2019.11.03.08.28.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 08:28:41 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/4] remove unused SYM_MEMBER
Date:   Sun,  3 Nov 2019 17:26:33 +0100
Message-Id: <20191103162635.66442-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
References: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

SYM_MEMBER has never been set.

Remove since it's unused.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 ast-inspect.c | 1 -
 show-parse.c  | 1 -
 symbol.c      | 1 -
 symbol.h      | 1 -
 4 files changed, 4 deletions(-)

diff --git a/ast-inspect.c b/ast-inspect.c
index 24d4a4a65..d1b4f9ace 100644
--- a/ast-inspect.c
+++ b/ast-inspect.c
@@ -111,7 +111,6 @@ static const char *symbol_type_name(enum type type)
 		[SYM_ENUM] = "SYM_ENUM",
 		[SYM_TYPEDEF] = "SYM_TYPEDEF",
 		[SYM_TYPEOF] = "SYM_TYPEOF",
-		[SYM_MEMBER] = "SYM_MEMBER",
 		[SYM_BITFIELD] = "SYM_BITFIELD",
 		[SYM_LABEL] = "SYM_LABEL",
 		[SYM_RESTRICT] = "SYM_RESTRICT",
diff --git a/show-parse.c b/show-parse.c
index 371041675..232460743 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -60,7 +60,6 @@ static void do_debug_symbol(struct symbol *sym, int indent)
 		[SYM_ENUM] = "enum",
 		[SYM_TYPEDEF] = "tdef",
 		[SYM_TYPEOF] = "tpof",
-		[SYM_MEMBER] = "memb",
 		[SYM_BITFIELD] = "bitf",
 		[SYM_LABEL] = "labl",
 		[SYM_RESTRICT] = "rstr",
diff --git a/symbol.c b/symbol.c
index 72ea2e4e7..30f5d27df 100644
--- a/symbol.c
+++ b/symbol.c
@@ -535,7 +535,6 @@ const char* get_type_name(enum type type)
 	[SYM_ENUM] = "enum",
 	[SYM_TYPEDEF] = "typedef",
 	[SYM_TYPEOF] = "typeof",
-	[SYM_MEMBER] = "member",
 	[SYM_BITFIELD] = "bitfield",
 	[SYM_LABEL] = "label",
 	[SYM_RESTRICT] = "restrict",
diff --git a/symbol.h b/symbol.h
index a27392fa4..6ad026d3b 100644
--- a/symbol.h
+++ b/symbol.h
@@ -66,7 +66,6 @@ enum type {
 	SYM_ENUM,
 	SYM_TYPEDEF,
 	SYM_TYPEOF,
-	SYM_MEMBER,
 	SYM_BITFIELD,
 	SYM_LABEL,
 	SYM_RESTRICT,
-- 
2.23.0

