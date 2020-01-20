Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5914E142888
	for <lists+linux-sparse@lfdr.de>; Mon, 20 Jan 2020 11:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgATKwJ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 Jan 2020 05:52:09 -0500
Received: from [8.12.47.4] ([8.12.47.4]:12737 "EHLO jlevon"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726619AbgATKwJ (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 Jan 2020 05:52:09 -0500
Received: from jlevon (localhost [127.0.0.1])
        by jlevon (8.15.2+Sun/8.15.2) with ESMTP id 00KAmUFb020960;
        Mon, 20 Jan 2020 02:48:30 -0800 (PST)
Received: (from gk@localhost)
        by jlevon (8.15.2+Sun/8.15.2/Submit) id 00KAmTMN020959;
        Mon, 20 Jan 2020 02:48:29 -0800 (PST)
X-Authentication-Warning: jlevon: gk set sender to john.levon@joyent.com using -f
From:   john.levon@joyent.com
To:     linux-sparse@vger.kernel.org
Cc:     John Levon <john.levon@joyent.com>
Subject: [PATCH] add necessary defined for sunos-derived systems
Date:   Mon, 20 Jan 2020 02:48:25 -0800
Message-Id: <20200120104825.20915-1-john.levon@joyent.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: John Levon <john.levon@joyent.com>

Signed-off-by: John Levon <john.levon@joyent.com>
---
 lib.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib.c b/lib.c
index 739074d1..7181c84f 100644
--- a/lib.c
+++ b/lib.c
@@ -1630,6 +1630,13 @@ static void predefined_macros(void)
 		predefine("__PIE__", 0, "%d", fpie);
 	}
 
+	if (arch_os == OS_SUNOS) {
+		predefine("__sun__", 1, "1");
+		predefine("__sun", 1, "1");
+		predefine("sun", 1, "1");
+		predefine("__svr4__", 1, "1");
+	}
+
 	predefined_cmodel();
 }
 
-- 
2.23.0

