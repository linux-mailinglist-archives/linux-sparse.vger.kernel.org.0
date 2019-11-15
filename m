Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A61FD243
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbfKOBOF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33553 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKOBOE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:04 -0500
Received: by mail-wr1-f68.google.com with SMTP id w9so9154792wrr.0
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qI5NPQjggpjqH6pEyh1Af2hX2N+sfC4lbzjMsTezSow=;
        b=EF+fe3EVTAWQMxcP95EZxwq7IjrjKUxsM7qG+AmfN61TG7lXgkG37SeSPICF2ooi/F
         Lq4fTYGd106IJQ2FCTMbKDlH9TSFEY2NY1W2Dzc4c2mKs+yigDLqq0YqR05EfV77hadB
         P5G6QY0TtwaPfWsMXqANWQVsQh5DHvzuXQjtcpkWw6QlK+Fa8xe1Z0U4LyPpLcHsCMpZ
         RusW+srGnvOmBd7nYlf7OnEoQm5OtfGQQ5jlZL0NyvOJ1l7qlAfOzNn2VpGwFyHm4BKx
         /cge9NrY6xw66WRRbmzIN0Hu/RGRH1W2JAaaUuONWaROGYRtQQMz1hC+qz5LdFXS+tG2
         A94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qI5NPQjggpjqH6pEyh1Af2hX2N+sfC4lbzjMsTezSow=;
        b=kdetro4bwD3JzRAganhdl3jSU0YrXJb7xBzjPVThTu33KuPnkmakjicc+ahvi2o0tA
         BJiFSNqkqv0XCFdlCe+FLJjrBxJa8icbsHeH14IWHjnmZLa//vVchcSaThFw6oM0hd9n
         SsmlT9RThsnY+RaUabBKLo90rt0ei3QVY1tHiPP+qe30P48K+145OD6oKGC9NwgVIJj3
         sBAkkiHXH0LePQ+ScqZxo5XI1fiWBPQ9CpWBl4Um+RhBdxVhXTseXkctgas7eQpie0sE
         udIzEAfFNgcJ2jYLoHe281uXd6MN/fFnaeQUfSy3EmK2AeLEYQ32OnFxnhI3hJXDQSAw
         W7VA==
X-Gm-Message-State: APjAAAVr0Tye/AXQ4aqU9OPwYG3KXfP/C5D12DA+/OaNh9Lb6iQ8cyTT
        Y3wZ3ytdNmuiVSadiXYVLXPs5PXd
X-Google-Smtp-Source: APXvYqzwV7bw1MNmSbj9bCKU1/wzfDdCO8wfsb0j1B53WPTP9ZnvzmbZAnUsbkC3zqshZOlVYz/dyg==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr12011424wrr.88.1573780442583;
        Thu, 14 Nov 2019 17:14:02 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:02 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/8] arch: keep BSD & Darwin specifics with i386/x86-64 specifics
Date:   Fri, 15 Nov 2019 02:13:50 +0100
Message-Id: <20191115011355.53495-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
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

