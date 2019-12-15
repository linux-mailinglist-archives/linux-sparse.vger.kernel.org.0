Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB44611F753
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 12:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfLOLGc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 06:06:32 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54586 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfLOLGc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 06:06:32 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so3516577wmj.4
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 03:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cqruCV/G5asdj7snUjcde3JHJ0rfPbeVRemzLyzm3t8=;
        b=dTlBWyGtLC1vMhhbISS7bE2QnCCzdDPb64G3tLbQBQ6eXCRqFge3ztoW/3F/y/Lagv
         QXCM4iEVLjZ8A5DrstHI+KnQDsa+kJhXyXisXa48piVa7Ez3gzc98ogrLn1AnuzudsYI
         DY9UeD4IRi28WCcYI6kKnQO99NYLOZuI0li8b4VOwr0Tfq06s5hu01P2xaHcmipA8nlt
         5unw1hM2q3kpL7jwvYedLRoB13kmft3UhZIXhmerEm9pFZ6Xli9eGhl2Fi4xkG5oLuat
         B7Ud27boHHT1dcYjZXz1z0f86LLyKXO4T9NFFdZ1ZoNXCxynjQ5uLSNZe1xmFL90iJVV
         zh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cqruCV/G5asdj7snUjcde3JHJ0rfPbeVRemzLyzm3t8=;
        b=UfKrOum+37exI+TumLtf2Jm8NA3yWJafOfR3Zs8zwbubluuotXEGzDH9j5d+K6on/s
         NnXEozZaJp7RZwQtU3gVBJMDMFhfj3uGcbEFrt+9k2wxMZugGaAggPqkYS7uozC+9K22
         veVHSlGRNZdMhcAnxm4HAypc97GF34iobP8jsXbHJAzI+AvA1pK2TeTgr69jaEqW/+4Q
         z9GR1lLW3ntXkQLQ44HriKt9j10YfAdHFFD0V/dq/jVQzzp15Xn8E7isfhzo/96OCg3i
         DPv5jlnmZFS7QaqYax9XlRPHu4uaBnyb/TJRfV0W9Dka2gZZr01MUZwp1NL3Pfb9lLcN
         pNdQ==
X-Gm-Message-State: APjAAAWpvozqYgsWD91XDq+WSWY5Ok2px/+wVO3+LPa8SQVuVnBB9/Oe
        Sg9cz2jwH9eGZZW1P/K19B6xZbrr
X-Google-Smtp-Source: APXvYqyXhmIXX86m4NjCLxZxzQwH9F6JmgtGdHaeA2oh7WIIYpAgeUNtJp0sGu0nD120gP+kEHc9qA==
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr3392077wmj.88.1576407990131;
        Sun, 15 Dec 2019 03:06:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:180:4f0:43c8:9084])
        by smtp.gmail.com with ESMTPSA id r5sm16760690wrt.43.2019.12.15.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 03:06:29 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/4] mark strings as examined & evaluated
Date:   Sun, 15 Dec 2019 12:04:22 +0100
Message-Id: <20191215110425.76533-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

evaluate_string() leaves the strings it creates as unexamined
& unevaluated. More exactly, they are examined and evaluated
(they have correct size & type) but not marked as such.

This doesn't seem to really matter but shows up when auditing
if classify_type() is always used on examined symbols.

So, mark the strings as examined and evaluated since their
size & type are known.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/evaluate.c b/evaluate.c
index 34578be8a3bd..539ef8038587 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -110,6 +110,8 @@ static struct symbol *evaluate_string(struct expression *expr)
 	sym->ctype.modifiers = MOD_STATIC;
 	sym->ctype.base_type = array;
 	sym->initializer = initstr;
+	sym->examined = 1;
+	sym->evaluated = 1;
 
 	initstr->ctype = sym;
 	initstr->string = expr->string;
@@ -119,6 +121,8 @@ static struct symbol *evaluate_string(struct expression *expr)
 	array->ctype.alignment = 1;
 	array->ctype.modifiers = MOD_STATIC;
 	array->ctype.base_type = &char_ctype;
+	array->examined = 1;
+	array->evaluated = 1;
 	
 	addr->symbol = sym;
 	addr->ctype = &lazy_ptr_ctype;
-- 
2.24.0

