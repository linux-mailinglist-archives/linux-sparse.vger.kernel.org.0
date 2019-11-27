Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEAB10A890
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK0CGz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:55 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51863 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfK0CGy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:54 -0500
Received: by mail-wm1-f67.google.com with SMTP id g206so5354998wme.1
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qI5NPQjggpjqH6pEyh1Af2hX2N+sfC4lbzjMsTezSow=;
        b=e64OfBgHf6K0qoDoNYDHX8pZzrSxIYFwvgYy/5vU9T99nDn5ckNT80xZG1mR4FGRT3
         pXd5uUKgWvSO8UsawklXK4+Bej2fO5Mk3JKzpqQ6/eloRegJtAQz9cHDMkoB4D137ug3
         Z9109btcfG9lxJITJZ3N3fN3F6YLli7fYbcOy4uPxMQxsBhwcfP14X8eh+pzYsbk/Ari
         r3BndBOeAohqV6SKAR7I/Cr2tsMhsa/FzSuP4cv5orLVU2HulexGjsQ2f5f54dSZh18s
         7PkJugZ0Ymnsm4sQBf+XzYiWp1gskrfC9w+id4HLQg5jRdbd1wc1F68kMRSDpQPSE7cP
         xNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qI5NPQjggpjqH6pEyh1Af2hX2N+sfC4lbzjMsTezSow=;
        b=ASi0bWra8uzbtQVbzCBrA/T/yui6zoGxc/hus7c2Nbg2KzVVjrTz9m+GRP7puXi9By
         cv6N+BtDUXe3EpKkR1L11ZMlWnjM1DFnjSsF6vSnRBiadKcuWzDVHDDaBWCk4BV9Isde
         ViK4NY+UGDN0TWb3POIhHcuWJYVOfPuDpzOHMQF1DPCvjX/yg0WqiyuBnYMOgGCqyYRT
         86PlCzS7hHQ0CAulJXzncjGpYyYJeFBKPa06W0p81cAn1L8I2F4tP9lPUYydK2KwTTcp
         y/1XtwsY9Ud4t7XSgb97kIslpHJ8VHsum7s4KJ3WHcwrXU3N4Hr16yiZ24sm7jjk9x6n
         Gnzw==
X-Gm-Message-State: APjAAAVrIp6M6nyqc7QAeXHc781tReB2RqjPmxkZpqf2Lqjj//HEkLMl
        1+KYMotWfRIaJd/PCc5yWvepVkJk
X-Google-Smtp-Source: APXvYqzECjwxiS0B+mGjR/sAVvpwMvigo87ZAUYb60vvEU9/USiS2CsVPUXsd7lgjlQbsStg2MIzoQ==
X-Received: by 2002:a05:600c:a:: with SMTP id g10mr1754225wmc.69.1574820412404;
        Tue, 26 Nov 2019 18:06:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:51 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 03/12] arch: keep BSD & Darwin specifics with i386/x86-64 specifics
Date:   Wed, 27 Nov 2019 03:06:34 +0100
Message-Id: <20191127020643.68629-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Without more testing, the specific types for wint_t & int64_t
on FreeBSD & Darwin are only valid for i386/x86-64.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target.c b/target.c
index acafbd929..647817a22 100644
--- a/target.c
+++ b/target.c
@@ -83,6 +83,13 @@ void init_target(void)
 		wchar_ctype = &long_ctype;
 		/* fall through */
 	case MACH_X86_64:
+#if defined(__APPLE__)
+		int64_ctype = &llong_ctype;
+		uint64_ctype = &ullong_ctype;
+#endif
+#if defined(__FreeBSD__) || defined(__APPLE__)
+		wint_ctype = &int_ctype;
+#endif
 		break;
 	case MACH_M68K:
 	case MACH_SPARC32:
@@ -193,11 +200,4 @@ void init_target(void)
 #if defined(__CYGWIN__)
 	wchar_ctype = &ushort_ctype;
 #endif
-#if defined(__FreeBSD__) || defined(__APPLE__)
-	wint_ctype = &int_ctype;
-#endif
-#if defined(__APPLE__)
-	int64_ctype = &llong_ctype;
-	uint64_ctype = &ullong_ctype;
-#endif
 }
-- 
2.24.0

