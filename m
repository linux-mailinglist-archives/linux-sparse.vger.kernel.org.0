Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3370810A8B5
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfK0CYA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:24:00 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44761 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfK0CX7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:23:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so24779796wrn.11
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99VpaTtwa+yquk/rB9Q8EH69cw8a7ETUlC/v+CA3+5Y=;
        b=fnqnOxHQ1vsonslOQ/53gqzI7NypKxK+zZVfZwC4/w4OAqUbTCoO5ZISLUQ44AJrPq
         0RmAmu8f6XYAXZ2xSFI1B97zqYnkV3y3euQtizfmc5qyhDiLdBjckcpr6cR1n7WtadS7
         K7HLQU9O9yaWm4gPT9cJZ9OXuZp80196Tl2550vCubhSh6vGcP7yzvzSWNfeU7vXdA1l
         8S7TrFgQh9aTwwI1YOqMTTDCH4FbI3TCoygEbT2xO0pDDUGKn0pMtkA+bvckCvBrZ5/i
         vZ8SqPMyp+lwi3NNM890gWp7CumiOJpbXIBtuUfnfPwQA8XYhNQTI+guazJA2dQhRdBO
         dIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99VpaTtwa+yquk/rB9Q8EH69cw8a7ETUlC/v+CA3+5Y=;
        b=W3U+UlyYl5deShCyE/rrw+lBbXTWgYGAlxQEtDkUj6Tr/BKdwODwx6vmXnxCsERczL
         LQuMHVtu4Bnx1FBAs2WgLfIKfTyREe+GMZ2wK/iSlEYWnLNhbjiHO7XkgPsvZQIWzJVf
         U8MRjfs/W+3VGUm5u+dR4l5DtbpV4wC0ROBWkErKgeZFknH+C3fwkLX63/s+nUHX0XON
         LMqmiW/Xv6JxvgDF4/UVSZ080R3kedF6cWxjTRRkIWsYil1EnGD8K6itX4/5Dtsx1Z1M
         xYQAqEazFPqPblXPLXqLnxEwZYQOX/EzU21ZEdHdQr1V77ciBJYAN0ww2a2cvZ8v9jfT
         /ARA==
X-Gm-Message-State: APjAAAWbS9CkeAbvx58eZbqX4GDCuA3dzLFlxjR1JNR2I4MUS3OkUDzB
        KOkiFjmIN9f/MtQOckyBLTojWamA
X-Google-Smtp-Source: APXvYqyQOIunynSQ5uPCLdoKyQPNYbzbDjbhAzSn/YTVrzoOToQaDBLI0QkLjy5TVDR16hHHpBkENQ==
X-Received: by 2002:a5d:6b51:: with SMTP id x17mr42085199wrw.148.1574821437376;
        Tue, 26 Nov 2019 18:23:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id c1sm16690920wrs.24.2019.11.26.18.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:23:56 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/4] arch: add missing predefines for PPC
Date:   Wed, 27 Nov 2019 03:23:49 +0100
Message-Id: <20191127022351.68902-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The macros __PPC, _ARCH_PPC & _ARCH_PPC64 are predefined by
GCC for powperpc (well, it seems __PPC isn't anymore but
it was, at least on my old tolchain for ppc32).

So, do the same here too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib.c b/lib.c
index 28ca49c7c..f0b546889 100644
--- a/lib.c
+++ b/lib.c
@@ -1574,12 +1574,15 @@ static void predefined_macros(void)
 		predefine("__powerpc64__", 1, "1");
 		predefine("__ppc64__", 1, "1");
 		predefine("__PPC64__", 1, "1");
+		predefine("_ARCH_PPC64", 1, "1");
 		/* fall-through */
 	case MACH_PPC32:
 		predefine("__powerpc__", 1, "1");
 		predefine("__powerpc", 1, "1");
 		predefine("__ppc__", 1, "1");
 		predefine("__PPC__", 1, "1");
+		predefine("__PPC", 1, "1");
+		predefine("_ARCH_PPC", 1, "1");
 		if (arch_big_endian)
 			predefine("_BIG_ENDIAN", 1, "1");
 		break;
-- 
2.24.0

