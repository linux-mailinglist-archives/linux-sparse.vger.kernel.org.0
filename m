Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A516D121E5D
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbfLPWiD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:03 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39743 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfLPWiD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:03 -0500
Received: by mail-wm1-f67.google.com with SMTP id b72so990057wme.4
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/U26WewB/AAMCSiOm/EEQWs3r5bknC3LH3DUKjJQYo=;
        b=IvnMOe05OjRc3cgQuI8gVehL5y0BHE01P09lOAtr4XFhy5FzZYdNTNhIimXGsNnt+2
         ucUKxxxqelAKHTPzateYtL/zqONl6PoZTwfvdQt/NKlE1Ya6fFeX6+w5PmA+0f7ecBWM
         xLmy6gt9XbI1cFpvSc+qTsUTtUS6PUquxdZE6Hb8jbI/o9YphxHh9y5It8D5RbyNcLuZ
         eys/ANMAHr1azoQF8UIOb1qcvp5iXzRREISCtHAb22a/q7mcJy/SDL0lCozZS+JtbtZ0
         K2TsSHPxlkZYya31dnHUZIL8DZzhoRL73fckbYyl0rljLYG8myvVh3lStUtfrz7nQQbQ
         T6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/U26WewB/AAMCSiOm/EEQWs3r5bknC3LH3DUKjJQYo=;
        b=bEYoslsXQLpNOPKuYBwAglzNGFTY3iMQlSojIXfVvky+oskwHBlzcL1bo2uV5M5bAX
         nNiCRR58Hc3FKypP23fJMyyfWRa6Fwx9zn0xr1aBXBtPS9Xvi7lufvP+S4i1urMHAH0T
         kMpPcJGc2IXCsNh2otHWZCzsIg7IZiRidVFCzvmca8HRySLEFJgQPc1FaYUx0ql6DYnu
         eZC3r1P6amBloTkwjKTZu1dXpG+vfTBUdnuazOuOdE90p+C8D0kaGqrzO5doA27cKzg/
         ui7RpwfrDg83Tuk7QnYpgGAyYYEpAG0HnjfuZcKMe72jzEiDxNoJUAVKoPFVsmbrYpKQ
         ylkw==
X-Gm-Message-State: APjAAAVOYeERaYtmocn08MvYIRrooQrJqFoCUBOdau7V1/lOGUaWX/Jo
        jgfPdiv+vdH6G1AYFlLMH/6o/StO
X-Google-Smtp-Source: APXvYqyyK1+sAl41Q54C2LyodWH0FQUBg6mVglrIXFWZuY/nYo/MFwRMJk44YDRpd1UWivyImb0KXg==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr1472638wme.108.1576535881095;
        Mon, 16 Dec 2019 14:38:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:00 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 01/10] cgcc: add support for riscv32
Date:   Mon, 16 Dec 2019 23:37:47 +0100
Message-Id: <20191216223756.2428-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/cgcc b/cgcc
index f5a8b3529da2..fc6f50f103eb 100755
--- a/cgcc
+++ b/cgcc
@@ -294,6 +294,9 @@ sub add_specs {
 	return (' -D_BIG_ENDIAN' .
 		' --arch=s390x' .
 		&float_types (1, 1, 36, [24,8], [53,11], [113,15]));
+    } elsif ($spec eq 'riscv32') {
+	return (' --arch=riscv32' .
+		&float_types (1, 1, 33, [24,8], [53,11], [53,11]));
     } elsif ($spec eq 'riscv64') {
 	return (' --arch=riscv64' .
 		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
-- 
2.24.0

