Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC568BDB94
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 12:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732949AbfIYKAS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 06:00:18 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:42937 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfIYKAS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 06:00:18 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD45o-000248-K0; Wed, 25 Sep 2019 11:00:16 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iD45o-0008Dg-3i; Wed, 25 Sep 2019 11:00:16 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/5] validation: ignore temporary ~ files
Date:   Wed, 25 Sep 2019 11:00:11 +0100
Message-Id: <20190925100015.31510-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Ignore any ~ files left in the directory.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 validation/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/validation/.gitignore b/validation/.gitignore
index 77276ba..e82b70e 100644
--- a/validation/.gitignore
+++ b/validation/.gitignore
@@ -2,3 +2,4 @@
 *.diff
 *.got
 *.expected
+*~
-- 
2.23.0

