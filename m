Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C45ED3DC
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 17:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfKCQ2m (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 11:28:42 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42614 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbfKCQ2m (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 11:28:42 -0500
Received: by mail-wr1-f67.google.com with SMTP id a15so14366376wrf.9
        for <linux-sparse@vger.kernel.org>; Sun, 03 Nov 2019 08:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jXcqhxmz3le36Ab+EGJYHloX8GrNkfZ4W6/tlcpkm80=;
        b=dDALWm5mHCoTHUkuS2k+Df1DA5RP2TXRzSJi5TH5Sd5H0N5XlE7c3Y28Gmkezqmgyi
         l8a2WSFDaditA8RfINPnZCDyoN/uAxLXIN7BPawlCOM0ig3VOAY8ZkzyUNnhtj7a/tgV
         MK2r70yRBn7cghJuVMQu0e6JH+6CwC/myr6e/1UE6WYP+FeNX8PwkFyqLHHNPhvNLfAW
         SbfvCqTNL8Zwbavl5iAWQPq/c+LcvBMKgHuXGD/P80pOleugMNBly3vXHxNlDlsaQRnw
         /q4lCMYt+ZO3Ol2eLEVeUqWzgX+0kibhuls6gEQHKznWLhxT1PgvRHs4Niq8MQDL5iwH
         0Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jXcqhxmz3le36Ab+EGJYHloX8GrNkfZ4W6/tlcpkm80=;
        b=e/pkLyC3Jh9foJHIFZwfrI8XJn1nh75zS651iY9XYTMlFOWMr0zuaqxVB2qhF5t6ze
         KmARu4KLEIisxrECsXbQNi2AMfAdURE+JFKV2Yk14e8+kyk8fwMMvDS5ONrMnfEZTnQI
         Su+63SVHZIjb/ouYEbcbAE0W6nCwwwaLrDsOy2TSBE+RtfTXi+4MVuBv7m2QHhx0+dPa
         rWTiDLcGwENtQqCRllA41TdY+ttDAwekxNgN3jQ+FVHuOs7Lt70ajkZg868nOOZg50aG
         iLmwuYVLuYNg7w1emH6QEU86tIi9imN/ZslnY9pFAN7z4fXAKK/Vweuh+BRTnuruMxbB
         iwUA==
X-Gm-Message-State: APjAAAXD96A3M6gizq5Sfg2qfAA3uTWN/P/p/wW40KJDVft9a+NbgAkd
        4cFWnQkdZlb8Z7jOm+hgGvHTpoqm
X-Google-Smtp-Source: APXvYqxPf6PkokNPA2hE3HwzpWvNoGHcbr14TCDlpm/RJo5H0ZjTo6YG1GSumM989LhJfxLL9zo5Nw==
X-Received: by 2002:adf:c413:: with SMTP id v19mr1526938wrf.208.1572798520642;
        Sun, 03 Nov 2019 08:28:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:d83d:1405:3788:2299])
        by smtp.gmail.com with ESMTPSA id o189sm20902060wmo.23.2019.11.03.08.28.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 08:28:40 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/4] remove unused KW_STATEMENT
Date:   Sun,  3 Nov 2019 17:26:32 +0100
Message-Id: <20191103162635.66442-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
References: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

KW_STATEMENT has never been used.

Remove it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/symbol.h b/symbol.h
index ac43b314f..a27392fa4 100644
--- a/symbol.h
+++ b/symbol.h
@@ -80,7 +80,7 @@ enum keyword {
 	KW_MODIFIER	= 1 << 1,
 	KW_QUALIFIER	= 1 << 2,
 	KW_ATTRIBUTE	= 1 << 3,
-	KW_STATEMENT	= 1 << 4,
+     /* UNUSED		= 1 << 4, */
 	KW_ASM		= 1 << 5,
 	KW_MODE		= 1 << 6,
 	KW_SHORT	= 1 << 7,
-- 
2.23.0

