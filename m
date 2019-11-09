Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E93F5F57
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKINLA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:11:00 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37277 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfKINLA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:11:00 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so638545wmj.2
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ASxKEl9paAUrJBE01yJ19fGSz1e2lB/2kqusmkWi9Ws=;
        b=k2CCEOmMDZ94Su7bvew58VtfiNNiIeWtrWnr6QsK3vXRhjyzk/ygnZGhhWXxf3p3lp
         oDIB7Osp12J+GkstGF6kMt2FO6zchtYyWszUTraV+kMVKv8AlgRpxXNx6un4rIw7RMpo
         cJVUJw8VbiqyYL4959MAKrw4Rr9sr3agvVWPROQp9e5GlSxvlynshxh0gfscYv8tHfBj
         Hti2BycvH2PYyfgw7zObqWvr4rGjl3WG97FHfiVkWEkPmphKr2H9el5cTAWElOYzTM1F
         eR9fPPmHdWgfQccYPXtYKh32X14y8+M9zqs6S928O/5WDpb0koDBElV4l3l0PwjJybAt
         i7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ASxKEl9paAUrJBE01yJ19fGSz1e2lB/2kqusmkWi9Ws=;
        b=Mi8hkLi8Z48DBbEc9XEby0ymfHuls5EyGwth5AZSfkmE6VEFLum9K+fBJSVtJfm2Fy
         uD29Sh9aRSfpJOqMDHW2Cw+U8NvrjggLZ+UsmeS9pjbvyqEMkA/yHLGSj8LLhRy0WWmg
         m7o1mUHvTcobwqluKUZ3VNTZ9DeBaI21xOS2JWT5+7OpNoekuH3Mnhmm4leSfd0uC11Z
         CTVW8cA4OSNZZsK8jnfIqulZ49ewvz/JWaoj2Cm9fjDlL79U9l65Dd6kyWnnkTJnjWDS
         C7DWcaqMohBzwt4I1IuCKu3vxL2MCCl6Kf3XdxxHhvauWoLMrBnH4Uh7vR13R+QwxRpq
         Y6mg==
X-Gm-Message-State: APjAAAWvJ8Wg8uljNBs0xU0udfYi73O7DcTLnCsy5eQf9yUTEpQVNOpx
        4xw3cE440O0xtoZNmKKobLDC7XDP
X-Google-Smtp-Source: APXvYqw1EXhH9zrSyS3bRjIPn1SA6H+YigKyMoteXS4vIkIaOVkhMZAE2rkPemLmLl2sbMEWcLPbQQ==
X-Received: by 2002:a1c:39c2:: with SMTP id g185mr12283587wma.88.1573305057990;
        Sat, 09 Nov 2019 05:10:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id 65sm16200067wrs.9.2019.11.09.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:10:57 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/2] cgcc: let sparse define _BIG_ENDIAN
Date:   Sat,  9 Nov 2019 14:08:49 +0100
Message-Id: <20191109130849.62559-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191109130849.62559-1-luc.vanoostenryck@gmail.com>
References: <20191109130849.62559-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In addition of __BIG_ENDIAN__, gcc defines _BIG_ENDIAN on
powerpc (32 & 64-bit). cgcc does that too but this may also
beeneeded when using sparse itself.

So, move this define the the sparse code.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc  | 3 +--
 lib.c | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/cgcc b/cgcc
index c97085e74..93bdc644c 100755
--- a/cgcc
+++ b/cgcc
@@ -276,8 +276,7 @@ sub add_specs {
 	return (' --arch=x86_64' .
 		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc') {
-	return (' -D_BIG_ENDIAN' .
-		' --arch=ppc' .
+	return (' --arch=ppc' .
 		&float_types (1, 1, 21, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc64') {
 	return (
diff --git a/lib.c b/lib.c
index fbf14282b..fd45da5d1 100644
--- a/lib.c
+++ b/lib.c
@@ -1514,6 +1514,8 @@ static void predefined_macros(void)
 		predefine("__powerpc", 1, "1");
 		predefine("__ppc__", 1, "1");
 		predefine("__PPC__", 1, "1");
+		if (arch_big_endian)
+			predefine("_BIG_DEBIAN", 1, "1");
 		break;
 	case MACH_RISCV64:
 	case MACH_RISCV32:
-- 
2.24.0

