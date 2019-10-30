Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF49EE98BF
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfJ3JDs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33710 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfJ3JDs (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:48 -0400
Received: by mail-wr1-f67.google.com with SMTP id s1so1377235wro.0
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wKW8iZ30J+9D0MFnnWRot60IdudahSYdVNTFwS5waTk=;
        b=Sy3fGy8jNlGOoYFUo/eBqIuTUq8waUKbEkGF3qJBAgW1nZBzZnSNWbBtvwIx6CTnpu
         zPCllXsadPN1/xB5CL53q0HUSmUg5T7UTQ6hDZg8y9zEeFLV7kVdTRgMTRCkOcZ/HGJC
         qq4u/sEx/hFqG668qPHWBgzgAxxnuQPouVMC/4yqV+s9zpvyIABJ6Ykda+M8VhwE3/71
         ORkVf1OyN4wEiHBXf8j6sZv4AP/gviGLY3z5RZ3vwKSFt5aPcot73ngkM3rj+OGKlgU0
         6Ry7nniMbXDIj/M8zputrvlYXFvJgJbGaB1s1MAYwShEVaNkhQCwrgJ7jUS95TZAIJUA
         dxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKW8iZ30J+9D0MFnnWRot60IdudahSYdVNTFwS5waTk=;
        b=Bl6a2aEB7CedImN7Fo+txH0b4tLGyMAow1IXR+QZM7odp89P4ikoJBiq+DTSldyGG/
         mACHk30FUHBvjC7/ORDmeMUpf02Cy52A6wS9jIFtdDENuhhcQRO3i0mORYSEIoKR/rQ5
         7cOuW/bNZnWgvKmBjpoEVjPHCrzV7cARWyPQVGV2fslUrLcG7HZaRrabhB58ZGyNc56r
         W7ShiLTLLOrwIgzhvnX6dJW/tsNjCbVZEMGnn7ifOyfBpywcVt3aUamBckZeQUxNPu7Y
         77oIzPvwqBfKcUYl17BdNsnxDt4SsHH9WhDUzlRJ4tcZdCTzsFV6vBiqA8KyUixZqyxR
         9DQQ==
X-Gm-Message-State: APjAAAU0vgkPdNsog2V4SJqVJbOEbJvExmcxttMhFqJVP+FtGwR0I44j
        FpRnravOOWWb9hJOWWJPbNKK8KjB
X-Google-Smtp-Source: APXvYqxli17OmOnrtGQP72MiLH3rYtXSik6RdA6TQM5f4jxbHur6pu4GjzmA3sKH6+bLycU+SUfmPA==
X-Received: by 2002:adf:e849:: with SMTP id d9mr22974874wrn.145.1572426226201;
        Wed, 30 Oct 2019 02:03:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:45 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/7] arch: reorder MACH_XXX defines
Date:   Wed, 30 Oct 2019 10:03:24 +0100
Message-Id: <20191030090333.3412-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some architectures have a 32- and a 64-bit variant which can
be exchanged via the -m32/-m64 flags.

Make clear the correspondance between these variant when
defining the MACH_XXX.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 machine.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/machine.h b/machine.h
index b46383ac1..f7567efed 100644
--- a/machine.h
+++ b/machine.h
@@ -25,18 +25,12 @@ enum {
 
 
 enum machine {
-	MACH_ARM,
-	MACH_ARM64,
-	MACH_I386,
-	MACH_X86_64,
-	MACH_MIPS32,
-	MACH_MIPS64,
-	MACH_PPC32,
-	MACH_PPC64,
-	MACH_RISCV32,
-	MACH_RISCV64,
-	MACH_SPARC32,
-	MACH_SPARC64,
+	MACH_ARM,	MACH_ARM64,
+	MACH_I386,	MACH_X86_64,
+	MACH_MIPS32,	MACH_MIPS64,
+	MACH_PPC32,	MACH_PPC64,
+	MACH_RISCV32,	MACH_RISCV64,
+	MACH_SPARC32,	MACH_SPARC64,
 	MACH_M68K,
 	MACH_S390X,
 	MACH_UNKNOWN
-- 
2.23.0

