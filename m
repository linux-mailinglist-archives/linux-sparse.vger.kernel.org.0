Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CF92029D6
	for <lists+linux-sparse@lfdr.de>; Sun, 21 Jun 2020 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgFUJje (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 21 Jun 2020 05:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFUJje (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 21 Jun 2020 05:39:34 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28C3C061794
        for <linux-sparse@vger.kernel.org>; Sun, 21 Jun 2020 02:39:33 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dp18so14876680ejc.8
        for <linux-sparse@vger.kernel.org>; Sun, 21 Jun 2020 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4SSUNZ3GPolvD8d8XZjw/5EghHL+gBAqVq4vh37ogvk=;
        b=BujovfpattVl3euwmGC+JEobIHnH8CmyEFhdZDCjWv67hea4BNZijA8Bfnq0FsXnu8
         dlSETm1K9wJ1jWesJiDX6G0Ro8U74OYVh68BSJHTkHtmTa89NqcnRMIt+jEP5kNCWYBl
         GZRw4RRM/gRXi+EYHEyrxCEjMAx2RpdmlBF+6fO6TZnKgGFrZv6EzxMLiHJ5V4QkrmVW
         JWzQqvTj+732cTZz5kUuv6r1LXIAZg8aJdl8+P+38/ZhfZq7V/g/P5iYUd2pn8V7qLD2
         8zlIbuSB1x8HKiI1qXoQpKaxX3fTIDP4p8MU7bN6vUVH522TQZhOK4lINijDHfjXkM0o
         htFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4SSUNZ3GPolvD8d8XZjw/5EghHL+gBAqVq4vh37ogvk=;
        b=U5R826eNFGhdS3IZoJp/2FJPenYBmjzy4CM8/fgyGk59YJAdOcX6z0BMMAR1+Mss50
         hQZcy9KAZRjkxG/Jtb4pwwT53MbWVF3pmZufh0RZQIoqftGGg2Omj0rnjCcfbEichUrz
         FS/WvppoEogaXigGGqu8XdJvTd2EC1PPWL4upoTVeUAgnhcsreSFV+NK/QkzdoVb/XfY
         DQC/4330vle5rnHZj8KtJAwqsad5ATrBbb8lRZnDBYg6FWR04vjOzXbEADbAgWzeyRjE
         FaAcCbEd4s1qOETIisiBqWS4ynDNmPWTZdFM+nX1brLvHT9/IrKPHEraPnntoE/J4597
         YOqg==
X-Gm-Message-State: AOAM532fc8p14x5rnQ0RlNJCBpe3bJMSb+lW1rJq31Fo5k6F2aQHBs/k
        jcj6nS2gnS1Pky55w5P/F7SHZ8no
X-Google-Smtp-Source: ABdhPJwAsVmgW+tI1/Q1tRIaznGWEffrVBkOAASxxU0aa9aDjIjOJm655Xr7Nx6u+JQuSXXeF0qXvA==
X-Received: by 2002:a17:906:360b:: with SMTP id q11mr11424277ejb.290.1592732372071;
        Sun, 21 Jun 2020 02:39:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:f92d:f5d6:1b8e:b25])
        by smtp.gmail.com with ESMTPSA id q14sm9828350edj.47.2020.06.21.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 02:39:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: add some info to the main page
Date:   Sun, 21 Jun 2020 11:39:28 +0200
Message-Id: <20200621093928.40272-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add some info about:
* how to get sparse
* how to install it,
* the mailing list and how to report bugs.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/index.rst | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 415da4bb27af..737f442323b5 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -25,23 +25,43 @@ by Christopher Li in 2009 and by Luc Van Oostenryck in late 2018.
 Getting Sparse
 --------------
 
-You can find released versions of sparse at http://www.kernel.org/pub/software/devel/sparse/dist/
+You can find tarballs of released versions of Sparse at
+http://www.kernel.org/pub/software/devel/sparse/dist/.
 
-Obtaining sparse via Git
-~~~~~~~~~~~~~~~~~~~~~~~~
-
-Sparse uses the `Git version control system <http://git-scm.com/>`_. You can obtain the most recent version of sparse directly from the Git repository with the command::
+The most recent version can be obtained directly from the Git
+repository with the command::
 
 	git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git
 
-You can also `browse the Git repository <https://git.kernel.org/pub/scm/devel/sparse/sparse.git>`_.
+You can also `browse the Git repository <https://git.kernel.org/pub/scm/devel/sparse/sparse.git>`_
+or use the mirror at https://github.com/lucvoo/sparse.
+
+Once you have the sources, to build Sparse and install it in your ~/bin
+directory, just do::
+
+	cd sparse
+	make
+	make install
+
+To install it in another directory, use::
+
+	make PREFIX=<some directory> install
+
+Contributing and reporting bugs
+-------------------------------
 
-Mailing list
-~~~~~~~~~~~~
+Submission of patches and reporting of bugs, as well as discussions
+related to Sparse, should be done via the mailing list:
+linux-sparse@vger.kernel.org.
+You do not have to be subscribed to the list to send a message there.
+Previous discussions and bug reports are available on the list
+archives at https://marc.info/?l=linux-sparse.
 
-Discussions about sparse occurs on the sparse mailing list, linux-sparse@vger.kernel.org. To subscribe to the list, send an email with ``subscribe linux-sparse`` in the body to ``majordomo@vger.kernel.org``.
+To subscribe to the list, send an email with
+``subscribe linux-sparse`` in the body to ``majordomo@vger.kernel.org``.
 
-You can browse the list archives at https://marc.info/?l=linux-sparse.
+Bugs can also be reported and tracked via the Linux kernel's bugzilla:
+http://bugzilla.kernel.org/enter_bug.cgi?component=Sparse&product=Tools.
 
 User documentation
 ------------------
-- 
2.27.0

