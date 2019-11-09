Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F161F5F56
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfKINK7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:10:59 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33984 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfKINK7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:10:59 -0500
Received: by mail-wm1-f66.google.com with SMTP id v3so9342553wmh.1
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DMe5z8tg1lIYNzhdjOEWW0FeHQqfnXJrbCnJe/A9bYo=;
        b=GISk5J1tSMKnVxBer3Wbybfyhz+PsJQMS0pk2DgIui7P9fruMkpK0uSspBecCBBzmE
         v1mnOVD+N6bsIE0KvDARGGPtfNvNgUrSx7BnMVcuBTW85gQSrcH4mbLR9urpEn2m2KEe
         tXV6XUq1PYMwzyFoFyhaDkjpqTh8im/1kiyEZjlg3ttqyWrR8sVeuNMUzTJ0CMgotO6/
         iEKT11qemEMpdfrzbrQ6Uxw37PhGsCwUbb3OsmGuh6gEbz67cUgl3Fbw63n4o6d+bBeF
         ims94JOjhNPhn3jKnAg9KAQCY0xrFdFrpsL9dhN/0MrLyKTzeRVw3TS93zHAb0DV7j08
         KmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DMe5z8tg1lIYNzhdjOEWW0FeHQqfnXJrbCnJe/A9bYo=;
        b=lJjLjE8I1vtIx6vaF/Fj53qUdn9+WVHFv5sRC+0hcsX6O7Bqlwwj2CAbHEeVtPmhG4
         jv143Ft24uOCyKKy/+0XB/2b4AqUJ/XcK2ZuwHy/7DlLe/Llt84GOhrtYz/PupDs/9mo
         36xofcAEePGffVPU8pdhTLp6NbkkL4w/iOhLYrDCUfSCu89ZJnT+EPD9QUfYEvmsmQJ5
         1EtdyB6nrIbidofL51xut9vVljK56fpDcBK+Qw4CdJAx/VjpF8yHF6jJAOpa6yjQSuFi
         gb5unK0qCRWeG98He1whQ20WgfUs09JH6BnXHVzJce67UsYmkpLuuXPHgL/hcxC1TpbR
         SMzA==
X-Gm-Message-State: APjAAAU/rkdCkgvSulqEwCEF6dSaJK1doOH7h7nfMgb9jUp+uXUYWa2j
        EQiVezQxE5k3r1qymPH/upaLuakH
X-Google-Smtp-Source: APXvYqxlb+8vn4axMO8eDRXFmkca6Isu3g6KcBUzQWDOO7jPcaG/M9wxmUV4hpzv8+c+X9l6mi1elA==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr6283499wmk.144.1573305057066;
        Sat, 09 Nov 2019 05:10:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id 65sm16200067wrs.9.2019.11.09.05.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:10:56 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/2] cgcc: remove _STRING_ARCH_unaligned
Date:   Sat,  9 Nov 2019 14:08:48 +0100
Message-Id: <20191109130849.62559-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191109130849.62559-1-luc.vanoostenryck@gmail.com>
References: <20191109130849.62559-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

As far as I can see, the macro '_STRING_ARCH_unaligned' may
be defined by glibc, not gcc. So, there is no reason for
cgcc to define it.

Worse, cgcc defines it to '1' while on some platorms (at least the
few ppc64 I've access to) the installed glibc defines it to '0'.

So, do not let cgcc define this macro.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cgcc b/cgcc
index 8e8c510e3..c97085e74 100755
--- a/cgcc
+++ b/cgcc
@@ -276,11 +276,11 @@ sub add_specs {
 	return (' --arch=x86_64' .
 		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc') {
-	return (' -D_BIG_ENDIAN -D_STRING_ARCH_unaligned=1' .
+	return (' -D_BIG_ENDIAN' .
 		' --arch=ppc' .
 		&float_types (1, 1, 21, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc64') {
-	return (' -D_STRING_ARCH_unaligned=1 ' .
+	return (
 		' --arch=ppc64' .
 		&float_types (1, 1, 21, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc64+be') {
-- 
2.24.0

