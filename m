Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0DA1D6E0D
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgEQXb3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgEQXb2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:31:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9747AC061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:28 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id v12so9663884wrp.12
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oRkJwe6tOqHdoMy8vmhCHXbtPBTHvnopU01FHtB7Dvs=;
        b=c1XTNsDiNmBc4vpd+f0Y7qGLN6QkCuRjo0uT8e+r67Wc9H2xstGgAVQrsUoAJpgIrw
         hEkP97XbSD+KY1S72/HfyrJ3ejTXOktLI4snX0K9W2jyepFIId1eda3On5dIn3JDq83o
         hbBY+ffiCFfMGN2bLXObFz14osKlEEJMU2uHvgmqTq9o+O31Qj2Cuh1CZc0+wppG2mnR
         Z5nC5G5H4rPV94aeuRC3RvMRLbFw3Sze41K1BDkBt3XUurI2E9c87w/FlEq0XqIm+MdP
         WN/gObMkLLH5Esb4ZIpgblWuYA0gbZEiq39tDTjrE2cdtTlCC+lbZrhW8nkaF3NN/gGD
         m5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oRkJwe6tOqHdoMy8vmhCHXbtPBTHvnopU01FHtB7Dvs=;
        b=tzl8l9azkmd8UPN06o0DectfAt2cX7g/y6fJlh9lnd3ES4Q9Cem5gd3q8WqneMEfmi
         NBhYC8S8QR4l+6l5DTkGgqhjEvBS54oDppxhDZMFLIAHk1NUuu7yQ1nxHQAJefybqO4M
         1hkNdWfBOwtab/SsHNkk+pBLqAXRNKVmIRCH1CmvMZJfbB0fx0k0errRXVW4FjVXzavR
         qSMa6Z27+FXzLK0dem996zfvgw0JMhIBE0ZgOS254Vuw5o7F+mJAVFyn7kVRQ2lP/MjS
         Oo5yaVsc/QoMM2EWEvI/jjbANCGRioCUrm7u9q0CpLAkbmZ4bN44Xc8T2wom2cA7fBEX
         OBAw==
X-Gm-Message-State: AOAM532QC3VlbTMXCqrSHL64MnB3IjJDZjldsM1UOb3g8rW5Y7RYOW7P
        ZxvrqWDDh3GV3B0fOjz05tjAfvT3
X-Google-Smtp-Source: ABdhPJzWTTJoapXUsEKrI5jE9BSzQyQubNWQZqsFxWMxZhHJk47YAoRA528klszxyvVZa62J1MDCrA==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr15705746wrj.192.1589758287017;
        Sun, 17 May 2020 16:31:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id 89sm14665016wrj.37.2020.05.17.16.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:31:26 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/6] attribute: sort the table of modifier names
Date:   Mon, 18 May 2020 01:31:17 +0200
Message-Id: <20200517233122.1872-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
References: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It easier to search an item if sorted and this avoid needless
conflict when new items are always added at the end of the table.

So, sort the table but keep the storage modifers first so
that show_typename() & friends still display types as usual.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 show-parse.c                 | 26 +++++++++++++-------------
 validation/cond_expr2.c      |  2 +-
 validation/function-redecl.c |  6 +++---
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/show-parse.c b/show-parse.c
index 8a145b887914..0c4b9ec27645 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -119,28 +119,28 @@ const char *modifier_string(unsigned long mod)
 
 	static struct mod_name mod_names[] = {
 		{MOD_AUTO,		"auto"},
+		{MOD_EXTERN,		"extern"},
 		{MOD_REGISTER,		"register"},
 		{MOD_STATIC,		"static"},
-		{MOD_EXTERN,		"extern"},
+		{MOD_INLINE,		"inline"},
 		{MOD_CONST,		"const"},
-		{MOD_VOLATILE,		"volatile"},
 		{MOD_RESTRICT,		"restrict"},
-		{MOD_ATOMIC,		"[atomic]"},
-		{MOD_SIGNED,		"[signed]"},
-		{MOD_UNSIGNED,		"[unsigned]"},
-		{MOD_TLS,		"[tls]"},
-		{MOD_INLINE,		"inline"},
+		{MOD_VOLATILE,		"volatile"},
 		{MOD_ADDRESSABLE,	"[addressable]"},
+		{MOD_ASSIGNED,		"[assigned]"},
+		{MOD_ATOMIC,		"[atomic]"},
+		{MOD_BITWISE,		"[bitwise]"},
+		{MOD_EXPLICITLY_SIGNED,	"[explicitly-signed]"},
 		{MOD_NOCAST,		"[nocast]"},
 		{MOD_NODEREF,		"[noderef]"},
-		{MOD_TOPLEVEL,		"[toplevel]"},
-		{MOD_ASSIGNED,		"[assigned]"},
-		{MOD_SAFE,		"[safe]"},
-		{MOD_USERTYPE,		"[usertype]"},
 		{MOD_NORETURN,		"[noreturn]"},
-		{MOD_EXPLICITLY_SIGNED,	"[explicitly-signed]"},
-		{MOD_BITWISE,		"[bitwise]"},
 		{MOD_PURE,		"[pure]"},
+		{MOD_SAFE,		"[safe]"},
+		{MOD_SIGNED,		"[signed]"},
+		{MOD_TLS,		"[tls]"},
+		{MOD_TOPLEVEL,		"[toplevel]"},
+		{MOD_UNSIGNED,		"[unsigned]"},
+		{MOD_USERTYPE,		"[usertype]"},
 	};
 
 	for (i = 0; i < ARRAY_SIZE(mod_names); i++) {
diff --git a/validation/cond_expr2.c b/validation/cond_expr2.c
index 5e974cfaffb3..a5d965764a6f 100644
--- a/validation/cond_expr2.c
+++ b/validation/cond_expr2.c
@@ -16,7 +16,7 @@ cond_expr2.c:6:11: warning: incorrect type in assignment (different modifiers)
 cond_expr2.c:6:11:    expected void volatile *extern [addressable] [toplevel] q
 cond_expr2.c:6:11:    got void const volatile *
 cond_expr2.c:8:11: warning: incorrect type in assignment (different modifiers)
-cond_expr2.c:8:11:    expected int volatile *extern [addressable] [toplevel] [assigned] r
+cond_expr2.c:8:11:    expected int volatile *extern [addressable] [assigned] [toplevel] r
 cond_expr2.c:8:11:    got int const volatile *
  * check-error-end
  */
diff --git a/validation/function-redecl.c b/validation/function-redecl.c
index 0315135932ab..d0d844a5422a 100644
--- a/validation/function-redecl.c
+++ b/validation/function-redecl.c
@@ -51,11 +51,11 @@ void arg_vararg(int a, ...) { }			/* check-should-fail */
 function-redecl.c:5:6: error: symbol 'ret_type' redeclared with different type (different base types):
 function-redecl.c:5:6:    void extern [addressable] [toplevel] ret_type( ... )
 function-redecl.c:4:5: note: previously declared as:
-function-redecl.c:4:5:    int extern [signed] [addressable] [toplevel] ret_type( ... )
+function-redecl.c:4:5:    int extern [addressable] [signed] [toplevel] ret_type( ... )
 function-redecl.c:9:11: error: symbol 'ret_const' redeclared with different type (different modifiers):
-function-redecl.c:9:11:    int extern const [signed] [addressable] [toplevel] ret_const( ... )
+function-redecl.c:9:11:    int extern const [addressable] [signed] [toplevel] ret_const( ... )
 function-redecl.c:8:5: note: previously declared as:
-function-redecl.c:8:5:    int extern [signed] [addressable] [toplevel] ret_const( ... )
+function-redecl.c:8:5:    int extern [addressable] [signed] [toplevel] ret_const( ... )
 function-redecl.c:13:13: error: symbol 'ret_as' redeclared with different type (different address spaces):
 function-redecl.c:13:13:    void <asn:1> *extern [addressable] [toplevel] ret_as( ... )
 function-redecl.c:12:6: note: previously declared as:
-- 
2.26.2

