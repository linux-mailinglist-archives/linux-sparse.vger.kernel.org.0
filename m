Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229B71D6E12
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgEQXbd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgEQXbd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:31:33 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05776C061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:33 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l18so9717600wrn.6
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KW3idWHxzzPts5nCP7FVzXZT8eojlyMaVRiDT4RJX28=;
        b=YZaCqgGZdngyCFC+Q6Am07fZBGY7y9Sa7f9Z3fGV2AMywyek+t+3WPmfS6+anHd+L3
         31LZwj+2W64HjWaAQoFHmzgp1YCn0clmRdWvuBUkJ5WZ13FKYipICJPOZkKJpPrd1ql5
         WCv8Yxgg0hqvix2B1owJjMgzLd8ckrBjTOmNIITNUrFgHcYyGFXCtszmp2elUFXBc34d
         HEHe0fw5Qu6Zknok0xqPVwSUBkrsTU3m78H7FTWO3Mss98DHahbbEk48f2UIi7sLAC1M
         VZc7NTPZ1rCtttR/U4zMc6k5zGNPSWyXPeDfTps73hQwlm7r7vyhnlWs/CFGMUjSsxRz
         Zqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KW3idWHxzzPts5nCP7FVzXZT8eojlyMaVRiDT4RJX28=;
        b=eOhx5P5DFiEtetI0VQ6pE5ABhJCYsp6XIGRuDc1wF6D7xivKyFwLewiayejl8H/8tz
         iqUz35sKryyTz7r17ztLsaW1L6P211ay+dl8PxaHeiaDn6Ki1p1mbpcuuBjaJmtJmtuj
         aN8vZnMfbDtMuIsJ7mwYqodgYAPmb/QjKx79lQcDKaPtlUmPwwMP6fKMi/+noskZ5G85
         5V5qOol4GPFEQBtCdgqB7fJP+tuLDepnalCDxQWDM4ufcwTZhgj9+OzYw+CpIbJfymXn
         mzGotJLNMW8/cLKPA6/PAf1bjA7jCa85l/8aN/Nqyt0DHdkqeaXKAqWwHGHTXJZwpEOB
         cFsg==
X-Gm-Message-State: AOAM531xG7v8BnYHECvftG/G6M0rH8WIPBYqXOMaR5Af1ZehYUb93hkD
        DWuJPPOsD+yTcfQGsGIJ4HUowTeC
X-Google-Smtp-Source: ABdhPJxD58VnbCrcpw1z/FGlwBux8DUIyi0AyhHGvQDUAQQQxWLHmOXLoXMSBWdbI0BuOTmkxZHkEg==
X-Received: by 2002:a5d:6541:: with SMTP id z1mr16543262wrv.264.1589758291542;
        Sun, 17 May 2020 16:31:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id 89sm14665016wrj.37.2020.05.17.16.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:31:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 6/6] attribute: teach sparse about attribute((gnu_inline))
Date:   Mon, 18 May 2020 01:31:22 +0200
Message-Id: <20200517233122.1872-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
References: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

But for the moment do nothing special with it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c      | 2 ++
 show-parse.c | 1 +
 symbol.h     | 8 ++++----
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/parse.c b/parse.c
index 96e6fda59663..9e7b74f98638 100644
--- a/parse.c
+++ b/parse.c
@@ -590,6 +590,8 @@ static struct init_keyword {
 	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
 	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
 	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
+	{"gnu_inline",	NS_KEYWORD,	MOD_GNU_INLINE,	.op = &attr_fun_op },
+	{"__gnu_inline__",NS_KEYWORD,	MOD_GNU_INLINE,	.op = &attr_fun_op },
 	{"externally_visible",	NS_KEYWORD,	.op = &ext_visible_op },
 	{"__externally_visible__",	NS_KEYWORD,	.op = &ext_visible_op },
 
diff --git a/show-parse.c b/show-parse.c
index f4c7de30da2c..eb71b6504be4 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -131,6 +131,7 @@ const char *modifier_string(unsigned long mod)
 		{MOD_ATOMIC,		"[atomic]"},
 		{MOD_BITWISE,		"[bitwise]"},
 		{MOD_EXPLICITLY_SIGNED,	"[explicitly-signed]"},
+		{MOD_GNU_INLINE,	"[gnu_inline]"},
 		{MOD_NOCAST,		"[nocast]"},
 		{MOD_NODEREF,		"[noderef]"},
 		{MOD_NORETURN,		"[noreturn]"},
diff --git a/symbol.h b/symbol.h
index 4bce78d55e54..7241f13df4e4 100644
--- a/symbol.h
+++ b/symbol.h
@@ -229,7 +229,7 @@ struct symbol {
 #define MOD_UNSIGNED		0x00004000
 #define MOD_EXPLICITLY_SIGNED	0x00008000
 
-     // MOD UNUSED		0x00010000
+#define MOD_GNU_INLINE		0x00010000
 #define MOD_USERTYPE		0x00020000
      // MOD UNUSED		0x00040000
      // MOD UNUSED		0x00080000
@@ -252,7 +252,7 @@ struct symbol {
 #define MOD_ESIGNED	(MOD_SIGNED | MOD_EXPLICITLY_SIGNED)
 #define MOD_SIGNEDNESS	(MOD_SIGNED | MOD_UNSIGNED | MOD_EXPLICITLY_SIGNED)
 #define MOD_SPECIFIER	MOD_SIGNEDNESS
-#define MOD_IGNORE	(MOD_STORAGE | MOD_ACCESS | MOD_USERTYPE | MOD_EXPLICITLY_SIGNED | MOD_EXT_VISIBLE | MOD_UNUSED)
+#define MOD_IGNORE	(MOD_STORAGE | MOD_ACCESS | MOD_USERTYPE | MOD_EXPLICITLY_SIGNED | MOD_EXT_VISIBLE | MOD_UNUSED | MOD_GNU_INLINE)
 #define MOD_QUALIFIER	(MOD_CONST | MOD_VOLATILE | MOD_RESTRICT)
 #define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_ATOMIC | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)
 /* modifiers preserved by typeof() operator */
@@ -262,9 +262,9 @@ struct symbol {
 /* like cvr-qualifiers but 'reversed' (OK: source <= target) */
 #define MOD_REV_QUAL	(MOD_PURE|MOD_NORETURN)
 /* do not warn when these are duplicated */
-#define MOD_DUP_OK	(MOD_UNUSED)
+#define MOD_DUP_OK	(MOD_UNUSED|MOD_GNU_INLINE)
 /* must be part of the declared symbol, not its type */
-#define MOD_DECLARE	(MOD_STORAGE|MOD_UNUSED|MOD_PURE|MOD_NORETURN|MOD_EXT_VISIBLE)
+#define MOD_DECLARE	(MOD_STORAGE|MOD_GNU_INLINE|MOD_UNUSED|MOD_PURE|MOD_NORETURN|MOD_EXT_VISIBLE)
 
 
 
-- 
2.26.2

