Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D085C1FA4EC
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 02:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgFPAL2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 20:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFPAL2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 20:11:28 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00604C061A0E
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 17:11:27 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id l12so19434523ejn.10
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emieuv4oCsH4gJOCEQ2qY1LUzzTpWwnD5fpKHO6zAcU=;
        b=ey7LnpwqJd0+fDoLAy/CaEm65NkmI9NAq+ojKdQbStoc+2mIKRezB+MPG1jrP+bRl/
         pcZYggt3Xp83RoIjzNMz9YpqMTyCxEv2GHYTciMcNhG+69sAE7jwy+L+AA7odNXElpS2
         9emYNP1Cz6HukuCoZzMItEVotfwm25Ivk0w9M+hoLqHfYy4/DS9+sWuhr0kOJswqMbYu
         1HDnmqkyry7oIFDky9TVyh6BrTpG49EkvukVDvmZgMdbfJyZjiK5GxzHL7wl4LvwW/0C
         0seTzQh+bMOkOLYxo4tdl+y6ceyKmtYvjGMwqP3jQwCcPTLIzdM/iNfXBAo6c4J/42FU
         aLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emieuv4oCsH4gJOCEQ2qY1LUzzTpWwnD5fpKHO6zAcU=;
        b=TeCbh0WHNi8pXvatZ4nQ+F/Zn92FIJLjdmuPOOpZybOGt1iUkUKxQZmAriyjNPL3tP
         sId7Ibv9zgNJRsSRBMKW0cc4vgCHeNFMzzZlDf5yUn61aiZ8hP7KpCS4Hp5lc7M1ZALe
         opd+S0uVJOQet+VV30viaiXePPlGi99r83xheCLSEggh9AN8AbLiGZy5XESzfjib2wt5
         evSS68X1X0E617hyk+cMZ+RT9NqBrx1EFLtT7tc0vWhRskbaU/YWgGywUowGS9ztuAvi
         JpnOlRqLFWx7lGCYIkKEfb+jUZv/Ed/OSipd+n2wAj++HFQSSouNy/qo4XQs7w0TA7n/
         Kc5g==
X-Gm-Message-State: AOAM532DR1IvVXC9GTMoU7CObtVJ4nFh8JKrD4jr6ErBfXiV500+pwaL
        bLjAPWYw3LbXaURPf3E9rMdl/Uzw
X-Google-Smtp-Source: ABdhPJz991Q5mu5+agNU3wsWvoQuFo7W066lDolYKsLnOnPQp/CI34FBg2hQajSHEWMnbAEbcLodpg==
X-Received: by 2002:a17:906:4f87:: with SMTP id o7mr285954eju.233.1592266286362;
        Mon, 15 Jun 2020 17:11:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4a3:2242:1764:b7bb])
        by smtp.gmail.com with ESMTPSA id j2sm9186761edn.30.2020.06.15.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 17:11:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: add intro stolen from the wiki
Date:   Tue, 16 Jun 2020 02:11:22 +0200
Message-Id: <20200616001122.65350-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The wiki has a small into, perfectable but nice
enough while the doc here has no such thing.

So, copy the intro from the wiki into the entrypoint
of the documentation (and convert the wikimedia markup
into restructuredtext).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/index.rst | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index eb3de63c9ca7..415da4bb27af 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -6,6 +6,43 @@ Welcome to sparse's documentation
 .. toctree::
    :maxdepth: 1
 
+About Sparse
+------------
+
+Sparse, the semantic parser, provides a compiler frontend capable of
+parsing most of ANSI C as well as many GCC extensions, and a collection
+of sample compiler backends, including a static analyzer also called `sparse`.
+Sparse provides a set of annotations designed to convey semantic information
+about types, such as what address space pointers point to, or what locks
+function acquires or releases.
+
+Linus Torvalds started writing Sparse in 2003, initially targeting issues such
+as mixing pointers to user address space and pointers to kernel address space.
+
+Josh Triplett was Sparse's first maintainer in 2006. This role was taken over
+by Christopher Li in 2009 and by Luc Van Oostenryck in late 2018.
+
+Getting Sparse
+--------------
+
+You can find released versions of sparse at http://www.kernel.org/pub/software/devel/sparse/dist/
+
+Obtaining sparse via Git
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Sparse uses the `Git version control system <http://git-scm.com/>`_. You can obtain the most recent version of sparse directly from the Git repository with the command::
+
+	git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git
+
+You can also `browse the Git repository <https://git.kernel.org/pub/scm/devel/sparse/sparse.git>`_.
+
+Mailing list
+~~~~~~~~~~~~
+
+Discussions about sparse occurs on the sparse mailing list, linux-sparse@vger.kernel.org. To subscribe to the list, send an email with ``subscribe linux-sparse`` in the body to ``majordomo@vger.kernel.org``.
+
+You can browse the list archives at https://marc.info/?l=linux-sparse.
+
 User documentation
 ------------------
 .. toctree::
-- 
2.27.0

