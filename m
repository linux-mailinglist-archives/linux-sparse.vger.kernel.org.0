Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332F5F5F63
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfKINf2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:35:28 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37252 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKINf2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:35:28 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so674157wmj.2
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmpGOeSo1fFRXKb533u6zgd8iRTv/lN4i76dcinBFKw=;
        b=Dn2jlcXUqeusiC1DDWVmO3KKg4cMo21bw6KAJsBpYzIpMxdB6NcREfaLWpc4HohfPv
         ZI2qCJVp0w2a/DC4uaeVEJTiG1KDakE+GUE1ZXSu+afEsVsTG6l68inGJ9zS+SvZzOqS
         bPWexgaeJgPPYhA6E+8/xi/nAlUWEK7t4bd9X7Pc5iyi4Ytj8KM4RbxxhVcKOP/VBBcP
         AdK2gccyKNxUf5k53aBzGYxhWKSHAo7pYYWAD8StTsBrNiH/CRfH5wAbeVJglcL7q4DA
         IRljXZV4KGAtSH8/ofdN0Z+kZSgj8KRKyRmRzg48hBslvCRbs1Xl/5U4opdo6KpTWCVL
         iB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmpGOeSo1fFRXKb533u6zgd8iRTv/lN4i76dcinBFKw=;
        b=cIN90PUTneai2MEJXqxvgfRJSfx4r9oDC6ONevoRoI0IcCC2TpL5F2+kRKn+GNAd8R
         Sm3XRAAjIFlZUYHOzkQ8xp+chtVC3821ms/VL5RWG2L288+lQBJ353ABUuQ9gPzr7HhA
         JE2vYw21z17ivYmcMaSWB7LsRH6ADdbfTL5McWotv0jrAd/HsodXwm+D8qoGp4Naqlip
         0/iH+BJw7QNkbEZxYUMILxIX5A8oEfY3/ZNYaSfHxVENA8K+LLSIgnmBKtdQGEg+n0AF
         1ddvZ4a3OBmBZU+/0sYsoDoBw5EN9Gkt5jclifyNtpw+uy+5hDEDssr5dO96VjwGvjik
         KJ7Q==
X-Gm-Message-State: APjAAAV81DENuXJFBKfrHwmHOODzKuxoperZpOa0bJ/kZ/YxZ7DoXDQK
        iE6LwD0rYgvw3+led5BgzgQ8EwQe
X-Google-Smtp-Source: APXvYqyvAls7LsnLOjB44d3wxtAYmsnLlQmh7vF9JqnIf+92QSrd6FuT+rD4/3SS9nImRz1uhp25/g==
X-Received: by 2002:a1c:3d57:: with SMTP id k84mr12155927wma.156.1573306526370;
        Sat, 09 Nov 2019 05:35:26 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id j66sm8124422wma.19.2019.11.09.05.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:35:25 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/4] typeof: add a test for unexaminated typeof
Date:   Sat,  9 Nov 2019 14:35:18 +0100
Message-Id: <20191109133519.63010-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The base type of pointers are not examined when the pointer is.
It neends to be done later when looked at.

This may be a problem when show_typename() is used on a pointer
which has not yet been 'deep-examined' and, for example, has a
SYM_TYPEOF as its base type.

Add a test case showing the problem.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/eval/typeof0.c | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 validation/eval/typeof0.c

diff --git a/validation/eval/typeof0.c b/validation/eval/typeof0.c
new file mode 100644
index 000000000..abef63865
--- /dev/null
+++ b/validation/eval/typeof0.c
@@ -0,0 +1,11 @@
+static int i;
+static typeof(i) *ptr;
+
+/*
+ * check-name: eval-typeof0
+ * check-command: test-show-type $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-excludes: unknown type
+ */
-- 
2.24.0

