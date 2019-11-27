Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B29F510A899
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfK0CHD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:07:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39322 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbfK0CHD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:07:03 -0500
Received: by mail-wm1-f66.google.com with SMTP id t26so5599523wmi.4
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ui+iT/8v88KYtQOvQE7VntPoBSEll6vr9OUHgXK4F1U=;
        b=Y50Go424ciYtAvAT57uIT3aLVVe+v5ICbNDmkkOdm3RKu4/IBTB4VcGYMVAA4sBZUb
         Z8KhcLoeS6XONUGL5g+GnSBz0viQxn/63pR2z+Q2ZCulFBJ4ikhbZfGhKkB9MLhY8YXo
         gSux+oJHPtDG9fw3RJknlcj6mhnKEqB1cSeieKKzudbO3U8AStYteQms+Zyco8OOKmuC
         6r6YbXALLF51/AGF2hSOrIoo/PEfx1GOSo7EhTVZt07MMN7v/gFopuPBMq5QaMO6EjEZ
         sgin8dcHaxmySE7QOFq9NhGXSaEyCqY1SrcfliyKB+mehLZw3hCsXnnMBJzo1DMXjHhu
         f/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ui+iT/8v88KYtQOvQE7VntPoBSEll6vr9OUHgXK4F1U=;
        b=sOvJT/28SJVY+Nu96k5Q+1gxBumdfjPWiIL7svIvOxoyhDvhaHdJKimRSfuYh5RtuT
         epJJ7Lz2PopRNXIw3WhZqDGKHYGuw+O+57kuKabuzSUED2iJfUKS55zY9Cvm9XFufdtK
         Rcbd85hLs4EisiTfLLfmVQq0nt0EnbOOYu2XFG7mQhBq9wzocAJzUHK7vaXvCxWz958s
         74XVKLFKLohUxhfz6gATfvQLiD+ap/fIb83bGtLIWJeEMRX++Cx5mm2qMFvQomdl3tnZ
         pkJYLozdxDKtiJuxLSNQJwUfCz0igHKeswedRXTx+2fFgwaxPiHT17FZU3gSOeBawkcl
         lSpg==
X-Gm-Message-State: APjAAAUhEU37FKf/QalnK9LJlMxCtjb73iaLu1kLiAeTY2jyymT0N05A
        ciI9RpmUNUbIRtg63Liu+by7Fubs
X-Google-Smtp-Source: APXvYqwHtUC4pBKpwUZL0PuENK64z1WKD7uZmDov6MSbUxvgcXs6EMgqIjcNZbaOXyV64mCz9GcEkg==
X-Received: by 2002:a1c:2b82:: with SMTP id r124mr1774535wmr.112.1574820421053;
        Tue, 26 Nov 2019 18:07:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:07:00 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 12/12] arch: add note for 128-bit long double on mips64
Date:   Wed, 27 Nov 2019 03:06:43 +0100
Message-Id: <20191127020643.68629-13-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On mips64, the 'new' ABIS have 128-bit long doubles while
the 'old' and the embedded ABIs use 64-bit.

Add a note for this, since currently the -mabi flag is not handled.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target.c b/target.c
index ebc7d493b..6ea08c2f2 100644
--- a/target.c
+++ b/target.c
@@ -121,6 +121,8 @@ void init_target(void)
 			break;
 		/* fall through */
 	case MACH_ARM:
+	case MACH_MIPS64:
+		// FIXME: ABI n32 & (n)64 have 128-bit ldouble
 	case MACH_MIPS32:
 	case MACH_S390:
 	case MACH_S390X:
-- 
2.24.0

