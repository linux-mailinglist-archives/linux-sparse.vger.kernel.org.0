Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9DBDE98C7
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfJ3JDy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54801 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJ3JDy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id g7so1201901wmk.4
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aE6UOBNzrm/LmMQzEKnT/8N/NSIBmyzPS5+DjDWt0P0=;
        b=J7Eri0HmCqducwIWiGpVPn3qMtUIVA+80RAAyKivcAEl3fmhaGtNtc/6vvWVb6xuuw
         Ai8zt3D4P2FVBimAiKmr5lxWskd/jQm3fGP/LUl4NXmqJ4rb6ukVMzScfAP4807HpEoR
         FDy9qXnohQ+zK+KU3nIFV7xygRuVNltSt2DMVA/M9PHuFSTSKFZBDhlPds6Fpit7b6pI
         xLBsyYrsvUR9O/AeGP1IA8Hyn+9pZBjoeHjQxBrsQpI18g3UjRKWyZppnm9UZC/snFUp
         U680x/jSqdCHzOdhDnGSz1q3zNuqInt375T8t7Q5fnrz7uZ1E9tJhzICtXYnNf6kmyS0
         kf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aE6UOBNzrm/LmMQzEKnT/8N/NSIBmyzPS5+DjDWt0P0=;
        b=MdpHSIpPqo4pzKBb6CNv5oaYXKiC/bG41L5G0kqSImH70RYHx9NIVSW7Al91tBMmRI
         qqQdunmU1bcLUkkO2OqbRnwLUiNbGts5nbMz2WOizd4KsJLDNokOb3sYmZBrUTBRr3r6
         SHF+0k+c2gf2/j/r5LMt4WbiWDAfisdhcSFulxaCk0fvhBK4Z1pHjkzx+16vozRDd/PW
         S4pFRGAm47dj0WZRsFd2khqTD59/8wizXvH6D3JTEIHwm2IssFNCD5H88WLtCcJWMSMh
         VZjrGvBmZaqN/93qfDHmcKcHRfc1aU4iKKEpM/4NMgNE5H1rP5XbLfi4aU6M4nER+I7k
         +ZuA==
X-Gm-Message-State: APjAAAUgQ43NcZdBfRfCwpSEwD0jx23ty6pnPQjJFzridFw6V0dIuvXb
        LpqeqPIiTjJUDfBNpqvve2AfE3jW
X-Google-Smtp-Source: APXvYqw41QYVGNXMYMTM2BR4GYR2aAa/JF2wPbEuh1yBT1oVDEIZJ0mPF6t0ujXvyfqNlRvuE2GLfw==
X-Received: by 2002:a1c:750e:: with SMTP id o14mr2443272wmc.35.1572426231703;
        Wed, 30 Oct 2019 02:03:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 5/6] cgcc: specify the arch via --arch
Date:   Wed, 30 Oct 2019 10:03:30 +0100
Message-Id: <20191030090333.3412-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that it's possible to specify the architecture via
the --arch=ARCH option, let cgcc make use of it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/cgcc b/cgcc
index 122f6e276..0ac9a55cd 100755
--- a/cgcc
+++ b/cgcc
@@ -294,29 +294,35 @@ sub add_specs {
 	    " -D'__declspec(x)=__attribute__((x))'";
     } elsif ($spec eq 'i386') {
 	return (
+		' --arch=i386' .
 		&float_types (1, 1, 21, [24,8], [53,11], [64,15]));
     } elsif ($spec eq 'sparc') {
 	return (
+		' --arch=sparc' .
 		&integer_types (8, 16, 32, $m64 ? 64 : 32, 64) .
 		&float_types (1, 1, 33, [24,8], [53,11], [113,15]) .
 		&define_size_t ($m64 ? "long unsigned int" : "unsigned int") .
 		' -D__SIZEOF_POINTER__=' . ($m64 ? '8' : '4'));
     } elsif ($spec eq 'sparc64') {
 	return (
+		' --arch=sparc64' .
 		&integer_types (8, 16, 32, 64, 64, 128) .
 		&float_types (1, 1, 33, [24,8], [53,11], [113,15]) .
 		&define_size_t ("long unsigned int") .
 		' -D__SIZEOF_POINTER__=8');
     } elsif ($spec eq 'x86_64') {
-	return &float_types (1, 1, 33, [24,8], [53,11], [113,15]);
+	return (' --arch=x86_64' .
+		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc') {
 	return (' -D_BIG_ENDIAN -D_STRING_ARCH_unaligned=1' .
+		' --arch=ppc' .
 		&integer_types (8, 16, 32, $m64 ? 64 : 32, 64) .
 		&float_types (1, 1, 21, [24,8], [53,11], [113,15]) .
 		&define_size_t ($m64 ? "long unsigned int" : "unsigned int") .
 		' -D__SIZEOF_POINTER__=' . ($m64 ? '8' : '4'));
     } elsif ($spec eq 'ppc64') {
-	return (' -D_STRING_ARCH_unaligned=1 -m64' .
+	return (' -D_STRING_ARCH_unaligned=1 ' .
+		' --arch=ppc64' .
 		&float_types (1, 1, 21, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc64+be') {
 	return &add_specs ('ppc64') . ' -mbig-endian -D_CALL_ELF=1';
@@ -324,17 +330,18 @@ sub add_specs {
 	return &add_specs ('ppc64') . ' -mlittle-endian -D_CALL_ELF=2';
     } elsif ($spec eq 's390x') {
 	return (' -D_BIG_ENDIAN' .
+		' --arch=s390x' .
 		&integer_types (8, 16, 32, $m64 ? 64 : 32, 64) .
 		&float_types (1, 1, 36, [24,8], [53,11], [113,15]) .
 		&define_size_t ("long unsigned int") .
 		' -D__SIZEOF_POINTER__=' . ($m64 ? '8' : '4'));
     } elsif ($spec eq 'arm') {
-	return (' -m32' .
+	return (' --arch=arm' .
 		&float_types (1, 1, 36, [24,8], [53,11], [53, 11]));
     } elsif ($spec eq 'arm+hf') {
 	return &add_specs ('arm') . ' -D__ARM_PCS_VFP=1';
     } elsif ($spec eq 'aarch64') {
-	return (' -m64' .
+	return (' --arch=aarch64' .
 		&float_types (1, 1, 36, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'host_os_specs') {
 	my $os = `uname -s`;
-- 
2.23.0

