Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65982142886
	for <lists+linux-sparse@lfdr.de>; Mon, 20 Jan 2020 11:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgATKvZ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 Jan 2020 05:51:25 -0500
Received: from [8.12.47.4] ([8.12.47.4]:3980 "EHLO jlevon"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726148AbgATKvZ (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 Jan 2020 05:51:25 -0500
Received: from jlevon (localhost [127.0.0.1])
        by jlevon (8.15.2+Sun/8.15.2) with ESMTP id 00KAlh92020858;
        Mon, 20 Jan 2020 02:47:43 -0800 (PST)
Received: (from gk@localhost)
        by jlevon (8.15.2+Sun/8.15.2/Submit) id 00KAlh8Y020857;
        Mon, 20 Jan 2020 02:47:43 -0800 (PST)
X-Authentication-Warning: jlevon: gk set sender to john.levon@joyent.com using -f
From:   john.levon@joyent.com
To:     linux-sparse@vger.kernel.org
Cc:     John Levon <john.levon@joyent.com>
Subject: [PATCH] define __PRAGMA_REDEFINE_EXTNAME
Date:   Mon, 20 Jan 2020 02:47:24 -0800
Message-Id: <20200120104724.20812-1-john.levon@joyent.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: John Levon <john.levon@joyent.com>

As per:

https://gcc.gnu.org/onlinedocs/gcc-4.6.3/gcc/Symbol_002dRenaming-Pragmas.html

we should set this define.

Signed-off-by: John Levon <john.levon@joyent.com>
---
 lib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib.c b/lib.c
index 14e51979..9b03895c 100644
--- a/lib.c
+++ b/lib.c
@@ -1507,6 +1507,8 @@ static void predefined_macros(void)
 	if (optimize_size)
 		predefine("__OPTIMIZE_SIZE__", 0, "1");
 
+	predefine("__PRAGMA_REDEFINE_EXTNAME", 1, "1");
+
 	// Temporary hacks
 	predefine("__extension__", 0, NULL);
 	predefine("__pragma__", 0, NULL);
-- 
2.23.0

