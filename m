Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93FA52FA81
	for <lists+linux-sparse@lfdr.de>; Sat, 21 May 2022 12:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbiEUJ7x (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 21 May 2022 05:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiEUJ7x (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 21 May 2022 05:59:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5809613CA2C
        for <linux-sparse@vger.kernel.org>; Sat, 21 May 2022 02:59:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0FBCAB826AE
        for <linux-sparse@vger.kernel.org>; Sat, 21 May 2022 09:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241ECC385A9;
        Sat, 21 May 2022 09:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653127189;
        bh=LfOzvkWuvEBfsAglXSZbkmu2pMMSTE6nLb4N7+qG4dk=;
        h=From:To:Cc:Subject:Date:From;
        b=cmrF9MDICLm7JjzJMBPGoMewuz8edR7Br2yFngnwYEDo3mcyDAzTwUP+f9QhsM2nl
         lPO5nKEW2afNnXnRxH8IQWtA5z3MPxotItqk0sckUv0NdDv3cJC7h5NZYEyT/pKfob
         3pIGCpfLW9Qy/pFYR2erfWE4RNCqJ5v9jZUb1YSJRJsmCqBwKfF7yM88jzaneihuj0
         OKG2uxjQ/eQMKPrWsGkYY3WXIIoSyJUqw9IjYBS57EpLdSCSZf8AHllAHnnqSrzSIB
         nppRrMh2NGfJ3nWmYbOxRxnauF4C/Q88Fej8SalOILBL0/jfa6YHOr32AXjO9i0JDA
         sjjNOPsuSlEnA==
From:   Luc Van Oostenryck <lucvoo@kernel.org>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Bernhard Voelker <mail@bernhard-voelker.de>
Subject: [PATCH] fix one year off in v0.6.4's release notes
Date:   Sat, 21 May 2022 11:59:44 +0200
Message-Id: <20220521095944.49066-1-lucvoo@kernel.org>
X-Mailer: git-send-email 2.36.1
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

Bernhard Voelker noticed that the date in the release notes
is one year off. Fix this.

Reported-by: Bernhard Voelker <mail@bernhard-voelker.de>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/release-notes/v0.6.4.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/release-notes/v0.6.4.rst b/Documentation/release-notes/v0.6.4.rst
index 387870fa161d..08830bd83ad5 100644
--- a/Documentation/release-notes/v0.6.4.rst
+++ b/Documentation/release-notes/v0.6.4.rst
@@ -1,4 +1,4 @@
-v0.6.4 (2020-09-06)
+v0.6.4 (2021-09-06)
 ===================
 
 Fixes:
-- 
2.36.1

