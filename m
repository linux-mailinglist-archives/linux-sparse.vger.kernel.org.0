Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6E41F889C
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 13:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgFNLax (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 07:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgFNLaw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 07:30:52 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4909CC05BD43
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 04:30:52 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id t21so9452169edr.12
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58rNZE38uIgxWkYGf1DqcZNDarmkdEsSB0rjt2iCE7c=;
        b=KK6DAO4TiZJAZFU4wzl6Yt3Ctq+A0222mVrG/OcU5LvSBfFBy/kXVw143h6L6Sfvqz
         BZ/NzvQ8QHDd1YRkT7Gjs0IfCjRiea0AuqKZwi4CWKc3hDfzrA4jSsQnn9ySTJCIQhjF
         d2qlDXif7g77Pg7gyc689pgm5s2NUrBqUe3l33If8+Hnt9gWug7JV6ExCWDQuUn5lXFD
         CWAbroahoRpujaF8mc0D5xw9L0oJJZJGXUIdsYFZ8ttqY6ORdwccTvyTeQQ8GeiFR4ep
         vdL99YoRq7CulE/anvsGOvaKSPuoRiKMLfEmvDXVuH2THQyQ2zlml+0tfmjQ6ns06JHu
         0AIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58rNZE38uIgxWkYGf1DqcZNDarmkdEsSB0rjt2iCE7c=;
        b=biPgwPB3phWYr2ZLqkGhTjABRf01MAq1s5fUsE965SMtccMZirgSfTkTgJ9TZmNAhC
         39ETwkFj4kMCfskO4+SyN+7QwO8tVdYDwJMq8VIcr1OaGglDW0ogLIn+W8jkNd7MTL01
         Scr6/Ci0ToviiChJWQsfLtxDkHJQHCilQzai9xjLyJcHe3yknFZqEt3QDv93Lh0rgUUL
         jnhVYlLU3gE4Z0IsgjhrtOczBygUOnFjLkpgiCtGOOUnwz+7G50jhvkGwFeLPgL1wDjZ
         nEKrRxX0FA8hJpWzUSM3I1mZK7Mctr8y6w8s59PD0TCIbgO9zkLYZzwoOt+mbta4HA0u
         T45A==
X-Gm-Message-State: AOAM532KnKt/+AtyvEOwPkqnIsnt0ycFLJSEu6d5jMGEV4otmjLR96O1
        SaHS8k6r6Ed2I+lpQWjx0jO7ulUr
X-Google-Smtp-Source: ABdhPJyrlr0hcbb/+38JnGuxBQtB6TZFr4tATy0j2/nIF/KJdmOzIqZOzR6Meo99Vp+eE4mNcmUBug==
X-Received: by 2002:a05:6402:21c2:: with SMTP id bi2mr19276316edb.296.1592134250434;
        Sun, 14 Jun 2020 04:30:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:3121:abf6:2daf:f274])
        by smtp.gmail.com with ESMTPSA id g20sm6822928ejk.16.2020.06.14.04.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 04:30:49 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>
Subject: [PATCH] sindex: minimal version for sqlite3 is 3.24
Date:   Sun, 14 Jun 2020 13:30:17 +0200
Message-Id: <20200614113017.19776-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

sindex uses the sqlite3_str API which is only present since version
3.24 of SQLite3.

Fix this by adding some checks in the Makefile and refuse to build
it if the requirement is not met.

Cc: Alexey Gladkov <gladkov.alexey@gmail.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index f46654e79642..d1486a0ce373 100644
--- a/Makefile
+++ b/Makefile
@@ -145,12 +145,18 @@ endif
 
 HAVE_SQLITE := $(shell $(PKG_CONFIG) --exists sqlite3 2>/dev/null && echo 'yes')
 ifeq ($(HAVE_SQLITE),yes)
+SQLITE_VERSION:=$(shell $(PKG_CONFIG) --modversion sqlite3)
+SQLITE_VNUMBER:=$(shell printf '%d%02d%02d' $(subst ., ,$(SQLITE_VERSION)))
+ifeq ($(shell expr "$(SQLITE_VNUMBER)" '>=' 32400),1)
 PROGRAMS += sindex
 INST_PROGRAMS += sindex
 INST_MAN1 += sindex.1
 sindex-ldlibs := $(shell $(PKG_CONFIG) --libs sqlite3)
 sindex-cflags := $(shell $(PKG_CONFIG) --cflags sqlite3)
 else
+$(warning Your SQLite3 version ($(SQLITE_VERSION)) is too old, 3.24.0 or later is required.)
+endif
+else
 $(warning Your system does not have sqlite3, disabling sindex)
 endif
 
-- 
2.27.0

