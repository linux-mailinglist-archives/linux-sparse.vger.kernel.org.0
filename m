Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 360C8ED3DE
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 17:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfKCQ2q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 11:28:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55397 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbfKCQ2p (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 11:28:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id m17so4873054wmi.5
        for <linux-sparse@vger.kernel.org>; Sun, 03 Nov 2019 08:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EDX18BQ3B0CJX0jk+DtU+5U6A1qUYvcc4e97fUfeQsk=;
        b=DI1BZJl1iP1wP2Ufc90NX+IfjUukDipoIPT5KwcEdiWZHnVJO1QSo8uPqSkhuFUVwx
         NZg5cSOfZHmpGvNJpwbc0CZXvqvsiyikgkuNqFYsjZDwrthz0CfW8OoEwTwgmxKI4gdT
         gybOYHDNXw6Ip4i1amDXuRxkEeZDEjEqYutCFTDZWCHF6PaPtRIRjXykbWgQL+BFvqe3
         TRHE3o4IyQBpnhDmqbp6g4QXb5ZWKraYzMUAVpl9ApbhnDeigOAilkXDzE19gfnEpug7
         pPVz4a5wPGCFCGBpzqzMmS1V54nLmX1PYoyMXh1LSvfhh5FROOhxomzl8/tclBFcpuG1
         Qriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EDX18BQ3B0CJX0jk+DtU+5U6A1qUYvcc4e97fUfeQsk=;
        b=bLLBUsn2Ij/tmq6ZL2SlKud4gvGRWM/gjQ7mirk8NXzsSTbOlW4THCadXXPUP1yceH
         Oe/SFYo+ILTRH2Jnw6iVyITF86Yr9V7qD51rAuZPcPlP/ZIjee2D29cBkNiS3gwiBQTz
         YhWMxWpZ365bkQqqQ2lZW3BcV0ohnIYuWNGBVX8SW2f2VV3uaExU0DzLlp+9rOvFq001
         3k3tREs21u7Wr8QsqrVLIbteiVTk5X3J6u45BnoBHt7bOI+OsXEPiaUIZ06mexn38q5T
         cED53znOVeQI9rOPGbZ8Mmm4d0fkfkWurwnjlYykOBEjg7TpyS6dswVDWyChu5qdUxFW
         77lQ==
X-Gm-Message-State: APjAAAUH6oRcylJeCDDLrbVu4I2DfFCnKWKmESrlFlXEeRMMn3o7w/xu
        Yjws+F0kn+ZpIEO43uc+pRUXzDXQ
X-Google-Smtp-Source: APXvYqzpO+3R7Ufslsbl9MI056h0aZKMlXLCRmiEutcCKiMAAMi6u6UuceneL09jOwIEjQVLqg8Myw==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr6688279wmi.78.1572798522703;
        Sun, 03 Nov 2019 08:28:42 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:d83d:1405:3788:2299])
        by smtp.gmail.com with ESMTPSA id o189sm20902060wmo.23.2019.11.03.08.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 08:28:42 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/4] remove unused SYM_TYPEDEF
Date:   Sun,  3 Nov 2019 17:26:34 +0100
Message-Id: <20191103162635.66442-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
References: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

SYM_TYPEDEF is not used anymore since the SYM -> MOD conversion.

So, remove it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 ast-inspect.c | 1 -
 show-parse.c  | 1 -
 symbol.c      | 1 -
 symbol.h      | 1 -
 4 files changed, 4 deletions(-)

diff --git a/ast-inspect.c b/ast-inspect.c
index d1b4f9ace..b510cd9b1 100644
--- a/ast-inspect.c
+++ b/ast-inspect.c
@@ -109,7 +109,6 @@ static const char *symbol_type_name(enum type type)
 		[SYM_STRUCT] = "SYM_STRUCT",
 		[SYM_UNION] = "SYM_UNION",
 		[SYM_ENUM] = "SYM_ENUM",
-		[SYM_TYPEDEF] = "SYM_TYPEDEF",
 		[SYM_TYPEOF] = "SYM_TYPEOF",
 		[SYM_BITFIELD] = "SYM_BITFIELD",
 		[SYM_LABEL] = "SYM_LABEL",
diff --git a/show-parse.c b/show-parse.c
index 232460743..7b65ba679 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -58,7 +58,6 @@ static void do_debug_symbol(struct symbol *sym, int indent)
 		[SYM_STRUCT] = "strt",
 		[SYM_UNION] = "unin",
 		[SYM_ENUM] = "enum",
-		[SYM_TYPEDEF] = "tdef",
 		[SYM_TYPEOF] = "tpof",
 		[SYM_BITFIELD] = "bitf",
 		[SYM_LABEL] = "labl",
diff --git a/symbol.c b/symbol.c
index 30f5d27df..a410af43a 100644
--- a/symbol.c
+++ b/symbol.c
@@ -533,7 +533,6 @@ const char* get_type_name(enum type type)
 	[SYM_STRUCT] = "struct",
 	[SYM_UNION] = "union",
 	[SYM_ENUM] = "enum",
-	[SYM_TYPEDEF] = "typedef",
 	[SYM_TYPEOF] = "typeof",
 	[SYM_BITFIELD] = "bitfield",
 	[SYM_LABEL] = "label",
diff --git a/symbol.h b/symbol.h
index 6ad026d3b..ee7088718 100644
--- a/symbol.h
+++ b/symbol.h
@@ -64,7 +64,6 @@ enum type {
 	SYM_STRUCT,
 	SYM_UNION,
 	SYM_ENUM,
-	SYM_TYPEDEF,
 	SYM_TYPEOF,
 	SYM_BITFIELD,
 	SYM_LABEL,
-- 
2.23.0

