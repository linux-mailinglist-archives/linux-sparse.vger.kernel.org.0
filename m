Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A167145FA1
	for <lists+linux-sparse@lfdr.de>; Thu, 23 Jan 2020 01:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAWAFj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 Jan 2020 19:05:39 -0500
Received: from [8.12.47.4] ([8.12.47.4]:29003 "EHLO jlevon"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725911AbgAWAFj (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 Jan 2020 19:05:39 -0500
Received: from jlevon (localhost [127.0.0.1])
        by jlevon (8.15.2+Sun/8.15.2) with ESMTP id 00N01tF9024155;
        Wed, 22 Jan 2020 16:01:55 -0800 (PST)
Received: (from gk@localhost)
        by jlevon (8.15.2+Sun/8.15.2/Submit) id 00N01tgP024154;
        Wed, 22 Jan 2020 16:01:55 -0800 (PST)
X-Authentication-Warning: jlevon: gk set sender to john.levon@joyent.com using -f
From:   john.levon@joyent.com
To:     linux-sparse@vger.kernel.org
Cc:     John Levon <john.levon@joyent.com>
Subject: [PATCH] predefine "i386" if needed
Date:   Wed, 22 Jan 2020 16:01:36 -0800
Message-Id: <20200123000136.24109-1-john.levon@joyent.com>
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
 target-x86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-x86.c b/target-x86.c
index 01d213ef..d770349c 100644
--- a/target-x86.c
+++ b/target-x86.c
@@ -29,6 +29,7 @@ static void predefine_i386(const struct target *self)
 {
 	predefine("__i386__", 1, "1");
 	predefine("__i386", 1, "1");
+	predefine_nostd("i386");
 }
 
 const struct target target_i386 = {
-- 
2.23.0

