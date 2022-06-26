Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A35655B22B
	for <lists+linux-sparse@lfdr.de>; Sun, 26 Jun 2022 15:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbiFZNIE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 26 Jun 2022 09:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234280AbiFZNIA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 26 Jun 2022 09:08:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A852B5E
        for <linux-sparse@vger.kernel.org>; Sun, 26 Jun 2022 06:07:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 40BD9B80CA6
        for <linux-sparse@vger.kernel.org>; Sun, 26 Jun 2022 13:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0B3C341CA;
        Sun, 26 Jun 2022 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656248876;
        bh=lJd1owcsLNjXzJU3+zKE1ZxKKATyb8Vu9aAqVTuMdfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pTIzU39rcH/g7I7zmCkjltI7Qen039/3SDxwYMtcsHIgfuR51q9EtB4JFOWG1+eTf
         gAfFFLNIXq3OemGl2SHXFT5cvwBVq17cxhv1RF98DwHpKlBG30OSLoKBZ3uRkkeH+U
         GM2hwnXNXK8fl9F36+9StU8IUPkBevjWW/GO0r/+/GwGizxlSP7rrcDYXugu/4li6n
         bEVCWqKDEi/sOQq1qDfvPkxUjEgrZ/Rn5fqiQ0EVwo6mltMk1bihKRbMqC4KpsLL/l
         DIY9KhnysCzIrUKjf9aWCZEeE2ZghjsTR0QC75yYujl60XNs8kT08iR00wIImgbtQ7
         solWgrREDj4xA==
From:   Luc Van Oostenryck <lucvoo@kernel.org>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/6] inline: add testcases for inlining of variadics
Date:   Sun, 26 Jun 2022 15:07:43 +0200
Message-Id: <20220626130748.74163-2-lucvoo@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626130748.74163-1-lucvoo@kernel.org>
References: <20220626130748.74163-1-lucvoo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Inlining of variadic functions needs some special cases.
Add some testcases for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/inline-early/variadic0.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 validation/inline-early/variadic0.c

diff --git a/validation/inline-early/variadic0.c b/validation/inline-early/variadic0.c
new file mode 100644
index 000000000000..566e129f029d
--- /dev/null
+++ b/validation/inline-early/variadic0.c
@@ -0,0 +1,13 @@
+static inline void fun(const char *fmt, ...)
+{
+}
+
+void main(void)
+{
+	fun("abc", 0);			// will be a SYM_BASETYPE
+	fun("ijk", (const int)1);	// will be a SYM_NODE
+}
+
+/*
+ * check-name: variadic0
+ */
-- 
2.36.1

