Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CF74E2528
	for <lists+linux-sparse@lfdr.de>; Mon, 21 Mar 2022 12:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346730AbiCULXZ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 21 Mar 2022 07:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346740AbiCULXW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 21 Mar 2022 07:23:22 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628368AE65
        for <linux-sparse@vger.kernel.org>; Mon, 21 Mar 2022 04:21:56 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 1AA091F37F;
        Mon, 21 Mar 2022 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1647861715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Br6sLaT5hGw1ctl289im1QR6EBomudm69hXVIWl9VR0=;
        b=FQuOTwQqrXbKNnMlbJ+0biOJPgxmC/LaiSDLTUU+mR4ZXMtFN/7jIXkOQhEToDiYNLArCu
        9GjdkN9u20eygbG53wzBh5U/2YFUBijIo0LFmcMI8dsR1SbQb13xoG6nG4tHqzqkj40xbx
        T0RDt21RAJnYJYIYcRjKDisTzit50YI=
Received: from g78.suse.de (unknown [10.163.24.182])
        by relay2.suse.de (Postfix) with ESMTP id C8BFCA3B93;
        Mon, 21 Mar 2022 11:21:54 +0000 (UTC)
From:   Richard Palethorpe <rpalethorpe@suse.com>
To:     linux-sparse@vger.kernel.org
Cc:     ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Subject: [PATCH] sparse: Use offsetof macro to silence null ptr subtraction warning
Date:   Mon, 21 Mar 2022 11:21:19 +0000
Message-Id: <20220321112119.23308-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Subtracting (char *)0 is undefined behavior. Newer compilers warn
about this unless it is done in system headers.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 token.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/token.h b/token.h
index bccac0e4..9000e0cb 100644
--- a/token.h
+++ b/token.h
@@ -201,7 +201,7 @@ struct token {
 
 static inline struct token *containing_token(struct token **p)
 {
-	void *addr = (char *)p - ((char *)&((struct token *)0)->next - (char *)0);
+	void *addr = (char *)p - offsetof(struct token, next);
 	return addr;
 }
 
-- 
2.35.1

