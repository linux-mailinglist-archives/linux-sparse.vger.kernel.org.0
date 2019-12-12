Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D00311D907
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Dec 2019 23:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbfLLWFB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Dec 2019 17:05:01 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34410 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730814AbfLLWFB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Dec 2019 17:05:01 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so4469887wrr.1
        for <linux-sparse@vger.kernel.org>; Thu, 12 Dec 2019 14:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uUyO8GkBwohNHa75jY7AvtYgbNLReTqAeCCqPfiRb4=;
        b=sL6jegZpglAVbVUpyhHcY+GXaEDboNwt0WetSgQ5WASyOobnPxEZ5xdMx0yitksP7Y
         1O2YMqYpVRjmtXNZ5VOtNzw2L8ASg/xTsU325sGkqouDMAiEdkKkvZQpqNZBRS0oYnoV
         mrrxAEhQq6zvBe9jadiBvGGKfyD57hdDun2T6BcHXsr/zRRhGK2BmGAiUFH8/QjGCwxN
         L7Lxa9oXKVtAbYTOVjgAcRgAT/z/K9+LjyyOT8Hb3gPVqsi0x96DD6WmwmCWfrwbRr9l
         1Pg3hQgbLA/Y5A99Mir+hZnJDPm3EbbzKTvODgv954bb81aI/TzkdQHNn1MszzItn8Qk
         OxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uUyO8GkBwohNHa75jY7AvtYgbNLReTqAeCCqPfiRb4=;
        b=OpBE18S49gayICV0Nw/LsF5/wegDcUXCFvrMhHhNMDrhTT8CRtOOS/OzDwF2Ub2NFW
         TzP2IDU5xXhrpXeSMOlLFblMf+MC2x6/+DpMr+oMN4idldglwSwaDuxy+04X+teeqHjc
         ufv5q8HJ9qNlH0XHWVCUDUQmuz+CNS2Fc7pzdQVYeoMYg6lAegUDlYOIsWSij2GVbgHg
         BMcQ3MhE3PVV3FLMZ0HsY6+IIUJF2fukP2/pLcQnT5oRP9SUKtaOdwIJ4UezGBlODX7f
         d5+QljM0T3ATkIbDk8R90M8WE5bjqqOZl0lHsaI+pJupKfbjXGfDPEoCZTRd57k2/D1i
         Uxjw==
X-Gm-Message-State: APjAAAWocqwFggBS9UA96ftuPVspBgr72XySa43H9nVUEqWglsWOcl/3
        VmFpRHHZJ1nkFV7adnZOg5gabO/M
X-Google-Smtp-Source: APXvYqwkqtlOa8VhMzRwaZogxIl2VLBI+XP/bL//k2jsIbwarfVmpXag7kjcTabuhTDITHrPdj5B5g==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr8687376wro.128.1576188298690;
        Thu, 12 Dec 2019 14:04:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:34fa:4b73:5583:32d1])
        by smtp.gmail.com with ESMTPSA id z12sm7694926wmd.16.2019.12.12.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 14:04:57 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] fix testcase with non-constant initializer
Date:   Thu, 12 Dec 2019 23:04:53 +0100
Message-Id: <20191212220453.52217-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These 2 top-level declarations had a non-constant initializer.

Fix that by moving thme into a function.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/nocast.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/validation/nocast.c b/validation/nocast.c
index 6c5da968776b..cabcff622676 100644
--- a/validation/nocast.c
+++ b/validation/nocast.c
@@ -26,9 +26,11 @@ static ulong_nc_t good_deref(ulong_nc_t *t)
 
 /* assign value */
 static ulong_nc_t t;
-static ulong_nc_t good_assign_self = t;
-static unsigned long good_assign_sametype = t;
-
+static void assign_value(void)
+{
+	ulong_nc_t good_assign_self = t;
+	unsigned long good_assign_sametype = t;
+}
 /* assign pointer */
 static ulong_nc_t *good_ptr = &t;
 static ulong_nc_t *bad_ptr_to = 1UL;
-- 
2.24.0

