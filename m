Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3B9142887
	for <lists+linux-sparse@lfdr.de>; Mon, 20 Jan 2020 11:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgATKvr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 Jan 2020 05:51:47 -0500
Received: from [8.12.47.4] ([8.12.47.4]:10474 "EHLO jlevon"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726148AbgATKvq (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 Jan 2020 05:51:46 -0500
Received: from jlevon (localhost [127.0.0.1])
        by jlevon (8.15.2+Sun/8.15.2) with ESMTP id 00KAm7W3020909;
        Mon, 20 Jan 2020 02:48:07 -0800 (PST)
Received: (from gk@localhost)
        by jlevon (8.15.2+Sun/8.15.2/Submit) id 00KAm7YN020908;
        Mon, 20 Jan 2020 02:48:07 -0800 (PST)
X-Authentication-Warning: jlevon: gk set sender to john.levon@joyent.com using -f
From:   john.levon@joyent.com
To:     linux-sparse@vger.kernel.org
Cc:     John Levon <john.levon@joyent.com>
Subject: [PATCH] pre-define __unix__ and friends
Date:   Mon, 20 Jan 2020 02:48:03 -0800
Message-Id: <20200120104803.20864-1-john.levon@joyent.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: John Levon <john.levon@joyent.com>

GCC defines these, so should we.

Signed-off-by: John Levon <john.levon@joyent.com>
---
 lib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib.c b/lib.c
index 9b03895c..739074d1 100644
--- a/lib.c
+++ b/lib.c
@@ -1507,6 +1507,10 @@ static void predefined_macros(void)
 	if (optimize_size)
 		predefine("__OPTIMIZE_SIZE__", 0, "1");
 
+	predefine("__unix__", 1, "1");
+	predefine("__unix", 1, "1");
+	predefine("unix", 1, "1");
+
 	predefine("__PRAGMA_REDEFINE_EXTNAME", 1, "1");
 
 	// Temporary hacks
-- 
2.23.0

