Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830CE1D6E06
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgEQX10 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQX1Z (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:27:25 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9347DC061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:25 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v12so9658686wrp.12
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wNU1p7GzjXAxfc4XSbZExllgNbhkfU2GzgSZJuhEUbQ=;
        b=blja383DrqdGH1qG7fqetlyPG2lcc0NjLJMtvNOAbYyqGzuZzHGjZOUA/lgBpE/juE
         g+wy6ITMrFueCjRU+7r6e3YqQ/81dCdTtQ1lmxgSybF7rGiwLndPKSycCicgyK50mFuB
         SccZ8/MVXjFQJ8r6WzE0U8UMKbHzAPTruVHD0wcWB3gsO93SmOIRz2wQrewxcbS8A7w4
         pj2yf5iZQfcXK5MNqvgzsnbYgqs3AJ8GUgT+0h94aXY46OMIdpksvmnuJTnu/GuXt6UM
         T1dMWVcbcfGawz0PzwOjtT9/mD9Y6YS1nS4OAF8HZTCJHdIPy+wNwG/cn2WtvxYTIaPa
         RWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wNU1p7GzjXAxfc4XSbZExllgNbhkfU2GzgSZJuhEUbQ=;
        b=PvrQZUOV83K7U7alE85BilM5eGxKnp7uy4IA9ZdzdI1EPTOTYWyDkbY0kxLhU9D/7I
         xITCiOhtNv+2J9VIzJWBgT+Qx2cmP3zhk4YnvIztXBdu+zxpezFRB8M/WU4CvSsHABBN
         AxXydJyp/wDuTgyHhbb7W/cC55/GzP5kSMMH6J3uHVkLrLvaPpPmZlYkStS8IaS0mANv
         QKkS+0S4YI1WyqIvpqB5X3Kuqrx3yXjp5dGCd6wNiMSGjo+gZEvgQYMPAea3JTS8hKcW
         aa6rAtI4yG04XjajZq6NZQ9u5co5ofWVwEVpzPWAVhWqmEcrUZ9ApxTvvSc6bSc1z6Pb
         EGIQ==
X-Gm-Message-State: AOAM5303ib6di7e1gFWick+m7bj8oZLGbwQmHSehKqx8JSNp07i/5N0q
        T9keL+bmCo3d8UtyfhLJUUYk1kQa
X-Google-Smtp-Source: ABdhPJz7W97+96k9+5SzRd7QcE6f86OSVrWj8wfO4V3BD1C7BiK3VTOWwdNZarsWZ7GwPGVqIniCGA==
X-Received: by 2002:adf:8563:: with SMTP id 90mr15997058wrh.74.1589758044006;
        Sun, 17 May 2020 16:27:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id d9sm14056278wmd.10.2020.05.17.16.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:27:23 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/3] doc: do not use obsolete sphinx.ext.autodoc.AutodocReporter
Date:   Mon, 18 May 2020 01:27:17 +0200
Message-Id: <20200517232719.1789-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
References: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

sphinx.ext.autodoc.AutodocReporter is obsolete since Sphinx 1.7
and removed in some later versions.

So, replace it by the code suggested in the release notes when
it was obsoleted.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/sphinx/cdoc.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/sphinx/cdoc.py b/Documentation/sphinx/cdoc.py
index 318e9b23626e..73c128cb7b35 100755
--- a/Documentation/sphinx/cdoc.py
+++ b/Documentation/sphinx/cdoc.py
@@ -269,7 +269,7 @@ if __name__ == '__main__':
 	dump_doc(extract(sys.stdin, '<stdin>'))
 
 
-from sphinx.ext.autodoc import AutodocReporter
+from sphinx.util.docutils import switch_source_input
 import docutils
 import os
 class CDocDirective(docutils.parsers.rst.Directive):
@@ -294,13 +294,13 @@ class CDocDirective(docutils.parsers.rst.Directive):
 
 		## let parse this new reST content
 		memo = self.state.memo
-		save = memo.reporter, memo.title_styles, memo.section_level
-		memo.reporter = AutodocReporter(lst, memo.reporter)
+		save = memo.title_styles, memo.section_level
 		node = docutils.nodes.section()
 		try:
-			self.state.nested_parse(lst, 0, node, match_titles=1)
+			with switch_source_input(self.state, lst):
+				self.state.nested_parse(lst, 0, node, match_titles=1)
 		finally:
-			memo.reporter, memo.title_styles, memo.section_level = save
+			memo.title_styles, memo.section_level = save
 		return node.children
 
 def setup(app):
-- 
2.26.2

