Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D42B1F7ECB
	for <lists+linux-sparse@lfdr.de>; Sat, 13 Jun 2020 00:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgFLWNE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 12 Jun 2020 18:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWNE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 12 Jun 2020 18:13:04 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8572CC03E96F
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 15:13:03 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w16so11017650ejj.5
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJbA0xTY3NVXhcZbG3Vf9Gc3aOv/AaULjqYS4jTqOJE=;
        b=NlW0VVC8BV8meQahQDN5W2qh4b3PG1evgZurEeF9C/MPwTTbsKFp9TP9Oq8skSKLWD
         ng4C5vtp6CX/MiR2RgOpAVyW1kTf4GgiO37UHiAP4rkgLUK3QJizr6nitg31CB+aXkSy
         zQGKs6XDwk4AqAYEjmXM6vRbCY2vkWzLW7XIqqwnzzTiDQhQXxwmofCaJHX2KYuH0inw
         XlPXw+4wTxOj2uAA56Yax5nfP9y1BTxNAbCyYK4kaRZql202Cwi6vHJe5vHDHMwznyXm
         ebT0gqSHfIJdKInokZHQq562RlBQcml0MmTeqpi0y8tQddmvhhmUYwnvO86ed1YgTGvu
         n/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJbA0xTY3NVXhcZbG3Vf9Gc3aOv/AaULjqYS4jTqOJE=;
        b=lIUSWvWfmxsjl2LkBvpe87PJRWiBJqo2ttQYka2x9h5Grf1lI26SagBFikuow//zwR
         iNViORsFJDARhQfYW+StWraXyQtLVdZURnPWgaXMVypwZCPSJ7WI3aoRmqboJHz8GTe+
         +gJdB0T7iLDtteYd35GCXcDecmAtv78VVc4Qk+I94RP7iH3/nycuPmsQJDZSiz7D4yx/
         owW9kof4XQNR31BNUKLxm+xeGGtJuS6NGSqr7SAUuNoUiQal56l0+HzcjIANBvJ1FiEh
         Zfaj+mqA5pOuuQnJcxW9gsCHg3uf7syMye69tD5xKwNK4Mov7kG6CqissoRSRzwTA21v
         mpUg==
X-Gm-Message-State: AOAM531OFRhPx7EAUdO6jnvQAkR4L+UU3fLo/yHqLhgBk/pBk5oBeQYx
        o0gKp8SUg1mhInpKT97J9RI39yhb
X-Google-Smtp-Source: ABdhPJxgFWHS+T0xZLDZOLChaDo/0oruSIOiukm97b7eF+diHpxFlDIEI7sQE1EcmMHPlMeZhCoW3g==
X-Received: by 2002:a17:906:33ce:: with SMTP id w14mr2708612eja.35.1591999981916;
        Fri, 12 Jun 2020 15:13:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8042:28a0:1c43:de41])
        by smtp.gmail.com with ESMTPSA id w3sm4206384ejn.87.2020.06.12.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 15:13:01 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: move meta-doc to its own section
Date:   Sat, 13 Jun 2020 00:12:55 +0200
Message-Id: <20200612221255.12173-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The documentation about the documentation is in the middle of the
documentation about sparse itself.

Move it to its own section.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/index.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 9f907c9f7aae..5dd87e43d264 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -22,7 +22,6 @@ Developer documentation
    dev-options
    api
    IR
-   doc-guide
    types
 
 How to contribute
@@ -33,6 +32,13 @@ How to contribute
    submitting-patches
    TODO
 
+Documentation
+-------------
+.. toctree::
+   :maxdepth: 1
+
+   doc-guide
+
 Indices and tables
 ==================
 
-- 
2.27.0

