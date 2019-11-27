Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7EC10A894
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfK0CG6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:58 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34090 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfK0CG6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:58 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so24802843wrr.1
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NROjPbDxBs3qLfbqtTvoYGEq6pYj2DNAakNALdruTKo=;
        b=f+h+tojVuuLeYQjLmRfh8z2mX0b27EQbWvniwAIT3MA7VmQk6NdHLcGpZttj4BiRe9
         k92Jitg8NXGC1SRhoFjfw1IC1IAaSZNenEwiJuADSkJ5dcmsC+WewYcKdmJiSt+VnUTT
         JhceMZgmntI8/Vp8uINAvXN8L8AAXVGTttRa4GyBgSKVSsd2uJjQsP4Pxga6Lzo/1nHA
         aA/taHMB1Z9qI/ZLcDTHcoYnRQoB/W2BDJ6r8oJFIv/GnAHHcEsBks7sVRhAjywg93nM
         EcmbgBfyS98VNC1IiXgJuvUWZXPVq71zecdB7gI3mkXQ3PwAjYGQzmjotWGMBylL9vCg
         1IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NROjPbDxBs3qLfbqtTvoYGEq6pYj2DNAakNALdruTKo=;
        b=bhiLfr/yG58vVGv9z5bg6pjR9UdWsbelqqKolmpaHVrbBwz6oMrRA4BKLcFUG3A+xB
         ypPPiNqcTgLs4o/PZx77F+gZlVmBQcZFQldyXtOzro8CXgB4LcwwU0SgC3wZvwPH4SPJ
         fLQucdb8ZiVOuHXQfMzvQVfz0mFeoHFvB5s3RZ2Y5lMr62qz4Ge1yj9pscDBNh2SfLwz
         /F9fNEYU51rqiU6zquKJsPZkUF8w7iZWXTOma9swkHnNFcQGmOcnVM0SdFZkobElvdWO
         3LyGnFMMEuJvHTz4OkuAO4nDl7oQVfQHP8Z2ExKbmm3VWaGATgviV+ku2Bhou7AT+j1W
         NonQ==
X-Gm-Message-State: APjAAAVBfJoIP09pyBUNoFNdDZUfvikSzog1OBweQ3bQDOw76/KTOlX/
        WtIunUcblIFSzOeLe93su0ySDDXY
X-Google-Smtp-Source: APXvYqxiEesk3bYsW9u4nVUi9tl6EUU0k+OlGYxva2vyMd5FSpWy5v+G2U6AYQm5/osxfaGkkkgvng==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr23488245wrq.43.1574820415803;
        Tue, 26 Nov 2019 18:06:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:55 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 07/12] arch: (almost) all platforms simply use int for int32
Date:   Wed, 27 Nov 2019 03:06:38 +0100
Message-Id: <20191127020643.68629-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The known execptions are:
* ARM with the bare-metal eabi
* MIPS64 with the n32 ABI

But these two are not really supported yet.
So, for now, int32 & uint32 can siply be set to int & uint.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target.c b/target.c
index 146c4125d..d03b179be 100644
--- a/target.c
+++ b/target.c
@@ -104,19 +104,6 @@ void init_target(void)
 		break;
 	}
 
-	switch (arch_mach) {
-	case MACH_M68K:
-	case MACH_SPARC32:
-	case MACH_PPC32:
-	case MACH_MIPS32:
-	case MACH_RISCV32:
-		int32_ctype = &long_ctype;
-		uint32_ctype = &ulong_ctype;
-		break;
-	default:
-		break;
-	}
-
 	switch (arch_mach) {
 	case MACH_ARM:
 	case MACH_MIPS32:
-- 
2.24.0

