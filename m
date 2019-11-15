Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCEEBFD26C
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfKOBZY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:25:24 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:36322 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbfKOBZY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:25:24 -0500
Received: by mail-wr1-f46.google.com with SMTP id r10so9154157wrx.3
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B4QpSXeowraIBWpNryl5bzZhDHSkGBcJXdBK3zFefA4=;
        b=tbmRmzKiGV4KTFyIJGVsADGQv3IgsATHGR8JqYEStjhAXhTJR1g8UtqUUtgiJj24kV
         GwVOQw/djJCme7A51V9OUBg/4MxkFqRT/gJZtLsX8arjeS38f8Sek6qfkpL3DfFmwajo
         4gA0r9UX6tU1FtzmLroYv2QKAsLEAryjfDzwQZB0Y68pEAJ/x0XFYLDXY7B9F+QDg8T/
         NKVeGZrWmMLk9nZbxYHGoI83XOJ4LZkWGptfYAJMie2P5EVldwKepj6DDeTIPsCUtBA9
         G/XLBdTxuUWh3WdO4qQmL43b6ZRG0pSjWXPwk8iD+ZXBacI4EGe7UZmwWu2Mptw//Jjb
         Cbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4QpSXeowraIBWpNryl5bzZhDHSkGBcJXdBK3zFefA4=;
        b=lSQOMWvZx6yLwGoEmeibXG9ZrxrEAlno+i4Yc6WpCgTnAa9W35Q13vTXQW4g7BO92H
         0dmxJG92Mr9Q0ugwLOFy/wI6WZ5SgJB6/eqeJ+P0+K8aEQMGC3m2yf39ZF11L/mzBdbo
         NOYFJqwfJ0OCXQN8ejF8R4mevoZ39FkyqXUFSYxp+umZ8rxWpdgCK+6f/78mfSgsbiCu
         jiPAf4AN2mA1al/UchUCowI3kyy9/LNLcc2vaFJowEDGfBg3B7dLgBacx8gDtq77JluS
         45jfOWDA3qkATMdNnXFd+/+0BFoDOdX54465laOz1AGSa45QOOQn1AFnRAiJQieUZMBu
         OW2Q==
X-Gm-Message-State: APjAAAUhKVFal6weMmGRxMA0QTpF6W6cBHr3pW2P7PaevNrlbmuKIXdQ
        7SkI0U0WtjfgffHO9DX02rQaCxli
X-Google-Smtp-Source: APXvYqwXTIe2sqK0l53MTOpOVciySr5U4GOVuCOIQNdNG7zVcL9gd5TLDJ0TE9H2+DhsGIM+42byXw==
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr9632219wrm.106.1573781121892;
        Thu, 14 Nov 2019 17:25:21 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id j22sm10736216wrd.41.2019.11.14.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:25:21 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/3] cgcc: let cygwin use -fshort-wchar
Date:   Fri, 15 Nov 2019 02:25:15 +0100
Message-Id: <20191115012515.53725-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
References: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Cygwin uses 'unsigned short' for its wchar_t.

So, use -fshort-wchar for it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cgcc b/cgcc
index 201fbc9a0..239f713da 100755
--- a/cgcc
+++ b/cgcc
@@ -252,6 +252,7 @@ sub add_specs {
 	return ' -Dunix=1 -D__unix=1 -D__unix__=1';
     } elsif ( $spec =~ /^cygwin/) {
 	return &add_specs ('unix') .
+	    ' -fshort-wchar' .
 	    ' -D__CYGWIN__=1 -D__CYGWIN32__=1' .
 	    " -D'_cdecl=__attribute__((__cdecl__))'" .
 	    " -D'__cdecl=__attribute__((__cdecl__))'" .
-- 
2.24.0

