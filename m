Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBA110A8B8
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfK0CYB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:24:01 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39253 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfK0CYB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:24:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so21711535wrt.6
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kVvq5YGuEMejoNrEqhynR1SOTeJXbKn5i7bYcvJYUwo=;
        b=FiJck9fgK1RA2J8SkoiaJXAIKDoHQWC4a4zHl0kidrDZjrN4ugHhu6jUmghNa6QbIX
         AwqiKd8tqnGcT2qyloKlim8G72xf7zNqMXuorLv+5Kt7jS4izZGyuULRY8x1mLfxHX/e
         cj1jDjDCp/BAR0ulLJiINdMUcrFL2l0PoNsL0JShDwhrP8QZvvM5V53yTgua2eduFLjj
         v7AirXUgRC4fL1Wvj7gKRbsWoT2ZQf7sH21Ukm4Xp90yHzOlumGzf6p3gO6E9aaPzulI
         eZ3thvZOQhDztwXr2vsRlUQtPEtZiIdOF5ufal6LyYnDNqfri1PJXIqXYLZi2Wra9QEz
         fWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kVvq5YGuEMejoNrEqhynR1SOTeJXbKn5i7bYcvJYUwo=;
        b=kwi+ejE4oM7k8aOtvNM7ZXQMbLtR11ZdR6DI/n8Fv9vFLibCJMjQI62geDzm6nqenZ
         625nET+oWJwAGKgbdWMwrXy5CQql0HISmpBgCeLBivI0YYpIXGMT50Ss+ttuviK9XfNv
         xXcAf7vU0k1YwA1HR4gHuhpkie5yfzksotNUmlOgeohHtk6WUdrNe/TKpm9eTSOqDzSd
         dLREm0Ju2pUB95C6s9b4KMPkdptR6aGtCWgiSkx9mcxc2UFgplbPKqgKsYAoc3AdCm2b
         BcTRJd1qIhxxWAA4YaL2IEzoxzzsp/Kn9QxnyQW1Hbd2tA4K+odfV5UcLojLS5tKxCDq
         biGQ==
X-Gm-Message-State: APjAAAW7nI+JMeuhPlOSt1eTRRsjV1dsoItSvZVTBQMDgHiti9unCul2
        pbz7iocI2e7AgJDw6X0oRNnbLhtv
X-Google-Smtp-Source: APXvYqwYXTaZhYuWmzndwMqBskIhE8GcjLw+RdGiehCom5uYdao/hBDYOTe/n08tqzmit4NcY13M7g==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr6366390wrr.211.1574821439199;
        Tue, 26 Nov 2019 18:23:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id c1sm16690920wrs.24.2019.11.26.18.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:23:58 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/4] cgcc: add support for riscv64
Date:   Wed, 27 Nov 2019 03:23:51 +0100
Message-Id: <20191127022351.68902-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse itself already add support for it, so add
support for it in the wrapper too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/cgcc b/cgcc
index ef0375c50..87f4fc3e7 100755
--- a/cgcc
+++ b/cgcc
@@ -292,6 +292,9 @@ sub add_specs {
 	return (' -D_BIG_ENDIAN' .
 		' --arch=s390x' .
 		&float_types (1, 1, 36, [24,8], [53,11], [113,15]));
+    } elsif ($spec eq 'riscv64') {
+	return (' --arch=riscv64' .
+		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'arm') {
 	return (' --arch=arm' .
 		&float_types (1, 1, 36, [24,8], [53,11], [53, 11]));
-- 
2.24.0

