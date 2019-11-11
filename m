Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75F6F7556
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfKKNr7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:47:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35877 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKNr7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id c22so13296657wmd.1
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CdpRZpXwwwpv+t6qLwk4W4YLQ/jTu158pXgTDvvwZT4=;
        b=KeR0KzbzvOZmqAYpMc3+k3kzqzypLMGfISBXy4er5SXu7i2mAoaseL4EFiPQOIScsv
         kn0w+T7Kf4lcerGmGAJf1IkE8pV0RZs1VqtfZ/UvcI0CZWjtHmBcxtIWsvliPWabWZjn
         2k38C24soMvOjWqnrraB4/1JEtFPS6p5PScmYB9Z1jgk1n0GXmHb8cCCuRf5EZtYyA1J
         XpBHc8MDiZn4vSXWcacWeT7x+nE8cSxkiP9FKaUBaq4FmHl6Ffdct5acKqLQTLX41Tku
         5ZNuugqOTyDgjMq/vTCf3+AiQ7rEizZq0jeS4nz0ofTmqzJ6Q8MtFzpUS4i84USiOaGQ
         JIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CdpRZpXwwwpv+t6qLwk4W4YLQ/jTu158pXgTDvvwZT4=;
        b=lQ7XWTwZZ7+1fUQR+yt1V2ZujiFkdS5K3HHFQcPOzY6+MzlYT5nmnOZBPBu7BOxYuj
         zHhxRNP3NhvNFXhj9u78Hcr1YFYzNAeEJRQ/F/yBWTydnOSirMeMECJbg20HOW+9EErM
         lI4zU4HMki4cImiE1jRn2bRbqEYtkPsF0Qfk6JGm/w9Ff8yMZyQQ9/jj69ZlF1YEaNam
         SCCkdCRZCXxmaJuBpmjbHg22cpXzkddJOXC5J7FiZSAqMvEycJUVOB3W3BOJbNs1XFbH
         kAFiBog21MuQ/wOBz8vtZeSnFGm7iRubfuvJXfZ63oGMac5MPoczeX7owDuxdb/kxBZx
         x0og==
X-Gm-Message-State: APjAAAXjr861L5chCQZd4OSaKQJm69zlgfIjrpD0+5yY7n386F7SWlIP
        z/A+o9DDZ2oeKhbv9MuBulqohY+p
X-Google-Smtp-Source: APXvYqxHwXp1g/dJS06F2sSq3RuiwKjxsuufTHtL74E3pP7vbq6hT3/lO5UpbaekdZiXKPzkq+/d+w==
X-Received: by 2002:a1c:998f:: with SMTP id b137mr21476111wme.104.1573480076913;
        Mon, 11 Nov 2019 05:47:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:56 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 6/9] spec: KW_LONG is not needed
Date:   Mon, 11 Nov 2019 14:47:44 +0100
Message-Id: <20191111134747.79516-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

To determine the rank of shorts & floats, the keyword type
KW_LONG is used but there is no need for a specific keyword
since testing for 'Set_Long' has the same effect.

So, remove this keyword and test for 'Set_Long' instead
as this somehow clarify the processing of specifiers.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 4 ++--
 symbol.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/parse.c b/parse.c
index 3526bf37e..0ace13514 100644
--- a/parse.c
+++ b/parse.c
@@ -294,7 +294,7 @@ static struct symbol_op unsigned_op = {
 };
 
 static struct symbol_op long_op = {
-	.type = KW_SPECIFIER | KW_LONG,
+	.type = KW_SPECIFIER,
 	.test = Set_S|Set_Char|Set_Float|Set_Short|Set_Vlong,
 	.set = Set_Long,
 };
@@ -1630,7 +1630,7 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 				size = -2;
 			} else if (s->op->set & Set_Int128) {
 				size = 3;
-			} else if (s->op->type & KW_LONG && size++) {
+			} else if (s->op->set & Set_Long && size++) {
 				if (class == CReal) {
 					specifier_conflict(token->pos,
 							   Set_Vlong,
diff --git a/symbol.h b/symbol.h
index 5b25c040c..188291cd7 100644
--- a/symbol.h
+++ b/symbol.h
@@ -82,7 +82,7 @@ enum keyword {
 	KW_ASM		= 1 << 5,
 	KW_MODE		= 1 << 6,
      // KW UNUSED	= 1 << 7,
-	KW_LONG		= 1 << 8,
+     // KW UNUSED	= 1 << 8,
 	KW_EXACT	= 1 << 9,
 };
 
-- 
2.24.0

