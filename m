Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220191F7ECC
	for <lists+linux-sparse@lfdr.de>; Sat, 13 Jun 2020 00:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgFLWNV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 12 Jun 2020 18:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWNV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 12 Jun 2020 18:13:21 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D75C03E96F
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 15:13:20 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gl26so11531748ejb.11
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 15:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C46ZpKAZwX1RKehjQlHSbnoGBwEYVoMI2zrNgTtjw1U=;
        b=J+QL+pK0VaK+V+EnUeb5jQfgM4gFHB8ido189SnnPJfTjnzHu5x0UNlR0R/ddft18s
         9wX496pny2jiGU9gOYSwr3PtLnUgrafi7GAMYYJQ8Mg1uEcTl2+OCxAdzLQAT8IhIVoV
         LlLStvkF3UYgr5z31slstiSHoWQ7Er/0m3rBZkTEAYXFZYmcsfeFM0H53zdNDzAfS0ZQ
         hRpzlSpFVVPgzjoTqW8xmjAP8kb2/YCmkx2Bxs+aiPHOxnE+SzieUXWgDHrPXOE3OHh6
         P09f8Sime/FQKePhv9kZnr+/RCc8FAqRj6qyp5zHr2K/aSMNxIzrTZLP/efTlxZxaKam
         EWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C46ZpKAZwX1RKehjQlHSbnoGBwEYVoMI2zrNgTtjw1U=;
        b=AtPXTt8Z0Zigz7ZFn4gzfbVcTayrxjqyeZ/mnojGMglmBUN8wFeoIvEVeKdnEb3/JQ
         122Ad+K3k4eZPUxDucAsLSBOAtQfKn7Ho8KOP/jQst7QlRbvwSQ9AQvwgE9VtbAWV47w
         1va6r6JVVvA6JyXOXO1vWGD2hYdnF7wm56fIVj4/k0vmGPXqecbF7HwJ53+Z1EFQ9FVB
         Yyi76Y7BuLIfcJ5qWiFNpwSQZapcrYoGDnXx8iub772ii/VVTxg2ot6FNNLHxBZ0cbSX
         VwZK7bDNmsx0HhbVJxxqodffZ6L59YLIvXWW5Qlyh42Orn3QwMT7JB4dEgEljh7w1lZW
         5Urw==
X-Gm-Message-State: AOAM530kucekN7Qeoc1OyqJBjiLAYLyJuN/0mSKpcxtxlOfFr204XD2H
        g0Ilzk2zQgDka7nCtSiIicGxP4EE
X-Google-Smtp-Source: ABdhPJxqYlvOxOORvDnCiMTk+rufro5wzyzCdE/NcpguajZC1hTY7m3pJEFCRtN0sJ78h133sQux2g==
X-Received: by 2002:a17:906:4310:: with SMTP id j16mr14729828ejm.511.1591999999221;
        Fri, 12 Jun 2020 15:13:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8042:28a0:1c43:de41])
        by smtp.gmail.com with ESMTPSA id bo26sm3742686edb.67.2020.06.12.15.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 15:13:18 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: add link to the doc on kernel.org in the man page
Date:   Sat, 13 Jun 2020 00:13:12 +0200
Message-Id: <20200612221312.12223-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The generated doc is hosted on readthedocs.io since a little
while but:
* it wasn't much publicised
* it's now also live on sparse.docs.kernel.org

So, add a link to this doc on the manpage.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 sparse.1 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sparse.1 b/sparse.1
index 9a2df0a2df36..bbcffc418f9f 100644
--- a/sparse.1
+++ b/sparse.1
@@ -511,6 +511,10 @@ You do not have to be subscribed to the list to send a message there.
 Bugs can also be reported and tracked via the Linux kernel's bugzilla:
 http://bugzilla.kernel.org/enter_bug.cgi?component=Sparse&product=Tools .
 .
+.SH DOCUMENTATION
+More documentation about Sparse can be found at
+https://sparse.docs.kernel.org
+.
 .SH AUTHORS
 Sparse was started by Linus Torvalds.
 The complete list of contributors can be find at
-- 
2.27.0

