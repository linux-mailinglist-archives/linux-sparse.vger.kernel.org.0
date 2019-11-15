Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC2BFD247
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfKOBOJ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:09 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44897 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfKOBOJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:09 -0500
Received: by mail-wr1-f65.google.com with SMTP id f2so9114450wrs.11
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mQRYRVi2hk8/IOHhleHbRlef3p6lDukljskkek9V7g=;
        b=K5H8PLPkRxlX5QTuMLk3r4M2T/npw9hjBqlBrhLSRGuhQ5qkGgzpBEV5WNGldAuEHe
         MJibmRNQVfFREHrm2zfoP+NJjmhss9WagBGHeNYJxBdaCudYxU4d/a7LNTjR6xRpxI8z
         2s08WWGs3E7LXAHd+ZI+YfejTmdIUNXYX8Jkags0jNm79cxVWMuqpyZnELDwBzLY0TOJ
         sZ36ekE4dJlROctga5NDQPrO3CgdP4EoSiHv20EFyYtuudU6z8yHc4ti8H/6MVGwUs5Y
         gnIpCn9pe12YBL/L6JGtXEDnpkobajBh/ZDi9O5DpbEdNyEREVsBct+TiTL3/DGe9MNB
         Qo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mQRYRVi2hk8/IOHhleHbRlef3p6lDukljskkek9V7g=;
        b=rFFssBN1pkUbP9dEG1kcJfULOmmMmeaLlMVGgLCL5L9mSFpnRb6AU65ggRU0Onq2tu
         eFcvoRYgzKyFlF5mhK2oeG/ZaL5S2wXY3zJW+OAvUwe30IqrFAkD5O3ecwtpcuGVyBjB
         Z/rU38LJbAs6UOgJVPCt5ip39xKdUN4GLYrbYKxPTpzWyY8WT9jgbmwXcHwj0BlzJwyQ
         VtpWK68GSgSK7GHlF3QTuxOrem8iXkDfzFct5nRFyDarsZ0jqNEN5NhOPNq3xfpKmt34
         2fLNdbjS+3vCiZNZMlzIJvpz6Wj0OCe8s3CIKrR3EoTqowTz7zGQTvJAUfJ2mURK9Jvc
         WFKQ==
X-Gm-Message-State: APjAAAWrqSD4Th/8na8+ttZ01rILNLkuLR0IMayxQSrEwZAvEPeTN+m5
        HTWacVlDnA1u3+yeZDH1uYZ58e/w
X-Google-Smtp-Source: APXvYqxvH2gtrjprp7BhytUm8z4MsNi6n9BRZ5SvT6xSBiRs6gTbB877mUDRoC5jr59pkVsySTF6Ag==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr11989542wru.159.1573780447024;
        Thu, 14 Nov 2019 17:14:07 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:06 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 8/8] arch: arm uses long for int32_t
Date:   Fri, 15 Nov 2019 02:13:55 +0100
Message-Id: <20191115011355.53495-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It seems that ARM uses 'long' for its 'int32_t' type
('seems' because I can't make sense of GCC's source about
this point).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target.c b/target.c
index 530970912..eae88bd5d 100644
--- a/target.c
+++ b/target.c
@@ -105,6 +105,7 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
+	case MACH_ARM:
 	case MACH_M68K:
 	case MACH_SPARC32:
 	case MACH_PPC32:
-- 
2.24.0

