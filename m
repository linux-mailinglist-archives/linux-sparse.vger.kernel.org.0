Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940FE1FC09A
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 23:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgFPVDl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 17:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgFPVDk (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 17:03:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6B3C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:03:40 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l12so23200238ejn.10
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pJVauyZGINO/l69PFLrwsQYVGqLmbyQ/D6Fm4ue+xdI=;
        b=treP+UJ4v/3xVM70U1fUGpQfx0h+KRO26ETKBYEvxzTBcqvc48HKTgqMuQIYuRfRbd
         kmvBmyZ8P2OLYP40fth924VeIJW934p6WXL+jAN+IOCaQV1wRpGNsaP7re61LfUDXCxw
         1aU6G/CKeuQ3d4bIZal8NdYYy58GScU6Sbbnx1Mcr7j6KUXZYWdJZNj1TCf3zsUC4ydP
         JQS+sZ2jjQUCncVXVVUiqqYoJLP6gGXE/6B1XilgBqEZQsscYoSiUckQ9vGnfL+rl5lm
         l9ehBYUQOQ/zGK6+HvL9RijzlOHw2sb3BxcBK29rEx6QM/Of/lTyCheyVxiyzahA9QUg
         0orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pJVauyZGINO/l69PFLrwsQYVGqLmbyQ/D6Fm4ue+xdI=;
        b=hI0KBugUxSQOZyyj7rsJ34k9vVIECm/qwkh7PE0lzHGeNdypNRSVrbeD+DOwWN8uKF
         gxvLrNPF24Anow+qo/nrGaQ9kSNaL3w3ffxtfota1fMEA8sOXXyfIu7ZfXjr6UCTXbiC
         N0CyTnxpq8enav6ByMj6dM1uUTtbUu/1L95QZB6VWwMZMc4yfkKAcw9v6dviTa0q3L9T
         ipemPJGREb5NZgsS2P6o7lL+GugxB15c7ecxVBvHVxo/bFEMjEfaqNrVkVVlZxLEr6JG
         kIT4DidIOlCuTcJa7o7ABMKJS0wLjr6o6aG2mM1vT7wb7+KOBN8vRsk36i8mUmL0+Rz8
         rttA==
X-Gm-Message-State: AOAM533qPZns3yzbTvJ+gj88UG32eA5qAsLHTLVg5hmLItCrqQpXauEi
        N0f6ik6rCpPcLbJh20Cx0mWHyoH3
X-Google-Smtp-Source: ABdhPJwWooJ3M8WbsnoeCzsUatcgGfEneAq5DtEeJ7OU7QPcOJq3B/QD1AV8Kh9VO+HDKj+1PvQD6Q==
X-Received: by 2002:a17:906:f8c2:: with SMTP id lh2mr4459343ejb.112.1592341418829;
        Tue, 16 Jun 2020 14:03:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id l8sm11772365ejc.85.2020.06.16.14.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 14:03:38 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: fix some typos
Date:   Tue, 16 Jun 2020 23:03:33 +0200
Message-Id: <20200616210333.77780-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Fix some silly typos.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/types.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/types.rst b/Documentation/types.rst
index e5d07def0bc2..5c10725fa71a 100644
--- a/Documentation/types.rst
+++ b/Documentation/types.rst
@@ -13,7 +13,7 @@ For the purpose of this document, things can be simplified into:
 		struct ctype {
 			struct symbol *base_type;
 			unsigned long modifiers;
-			unsigned long alignement;
+			unsigned long alignment;
 			struct context_list *contexts;
 			struct indent *as;
 		};
@@ -68,7 +68,7 @@ have their own modifiers, address_space, contexts or alignment
 as well as the declaration's identifier.
 
 Usage:
-  * .ctype.base_type points to the unmodified type (wich must not
+  * .ctype.base_type points to the unmodified type (which must not
     be a SYM_NODE itself)
   * .ctype.modifiers, .as, .alignment, .contexts will contains
     the 'variation' (MOD_CONST, the attributes, ...).
-- 
2.27.0

