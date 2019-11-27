Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9AEA10A88F
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK0CGy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:54 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40247 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfK0CGy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:54 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so175649wrn.7
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/n/ZTGiSL9N9IC4C9QtqL2Ayd2vcAT6LxmnHYfV00M=;
        b=tbfIfJvikoBtrTFL1zE0wVsFSdGFpYIDh6QOVAw3MTQfL6V5ltBYvNOh8lsXNZJQYU
         uvT4TkwMo6IQYVZ0Sngg3bNwWqUdo9Xibu3rGrN8e97OVw76vvtuVUjsadS86lkaUeTF
         hZjw14RrbnByG63EdRSXJoo4BKrazD+9eS7fFBJ799fWJmZI8fMca3l+pvwzbwdTnE3C
         X4yFOk3kDTr1W+EAl9pkCy3uZZWF7oKO2i2O7RZvPtpQuu8J1JrKz4r1db8Oo3I4uozl
         bUaThm1OedJRWv5+CdIb3lQrWwLXy/WjMyA8xwhPe9STdNs6FPC5YasWeMEJi6mUMd0t
         RHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/n/ZTGiSL9N9IC4C9QtqL2Ayd2vcAT6LxmnHYfV00M=;
        b=jJESyFCz1cZsMc4qdKPaV+m6rHZGBp9K3p89rNe0xfGmPr1rzpe0cjDYD2uzg/rflg
         YFndR9DsDED2mLvGgJamOGJ5P5DBOqAVfuJmzOwHMAU16Ut6BUdllZo6oM/Vsv9IGevL
         /B8UAkxklz8xt/cAg1T/ZTnlyxPtX6VZao9/56UgsEET8FxdJ/wF0bOl1JQYtBDNn2W+
         bYzoIG+GqNIAS+FqtDaJ9VVELEpZ/z/+AFHpx1Mr4mlFfDQBXNDmmiapwAC/9R+GHwDM
         8wLxl/afhhFFqxUE4anm+W+j8sK1HZUBa7kLWAFX39OY++kOuOmhUVOZ+c9OPFEhjzvV
         bOlw==
X-Gm-Message-State: APjAAAUHvls5Wf18KW2jitrabrS3eTZi5Vz/i5LT1fvIMEMmglSOC/Rs
        RiURPKvYxqz0WCpLNZsze5ROM8rs
X-Google-Smtp-Source: APXvYqwAGenHfMzr4V/POXYGhQVBbkFzr36eyeiH/XoRvc36Y91KvLw0Q1BxPhCbL6J8eEr9Rgimfg==
X-Received: by 2002:adf:fe0c:: with SMTP id n12mr39039289wrr.174.1574820411493;
        Tue, 26 Nov 2019 18:06:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:50 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 02/12] arch: simplify i386/x86-64 specifics
Date:   Wed, 27 Nov 2019 03:06:33 +0100
Message-Id: <20191127020643.68629-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The current test for setting wchar on i386 uses a
conditional break and a fallthrough on the x86-64 case.

This is not needed and can be simplified by reversing the
order of the i386 & x86-64 cases.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target.c b/target.c
index 497ecdc5e..acafbd929 100644
--- a/target.c
+++ b/target.c
@@ -79,11 +79,11 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
-	case MACH_X86_64:
-		if (arch_m64 == ARCH_LP64)
-			break;
-		/* fall through */
 	case MACH_I386:
+		wchar_ctype = &long_ctype;
+		/* fall through */
+	case MACH_X86_64:
+		break;
 	case MACH_M68K:
 	case MACH_SPARC32:
 	case MACH_PPC32:
-- 
2.24.0

