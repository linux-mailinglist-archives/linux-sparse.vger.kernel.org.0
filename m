Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009CC234D4B
	for <lists+linux-sparse@lfdr.de>; Fri, 31 Jul 2020 23:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgGaVtp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 31 Jul 2020 17:49:45 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:49474 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGaVtp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 31 Jul 2020 17:49:45 -0400
X-Greylist: delayed 490 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 Jul 2020 17:49:44 EDT
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 9E6469ED669; Fri, 31 Jul 2020 23:41:33 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     linux-sparse@vger.kernel.org
Subject: [PATCH] sindex.1: Use ' for a plain quote char
Date:   Fri, 31 Jul 2020 23:41:25 +0200
Message-Id: <20200731214125.21424-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

lintian (a linter for Debian packages) warns:

N:    This manual page uses the \' groff sequence. Usually, the intent to
N:    generate an apostrophe, but that sequence actually renders as a an acute
N:    accent.
N:
N:    For an apostrophe or a single closing quote, use plain '. For single
N:    opening quote, i.e. a straight downward line ' like the one used in
N:    shell commands, use &#92;(aq.

I'm not following its advice but stick to ' as is done in other places
of sindex.1.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 sindex.1 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sindex.1 b/sindex.1
index e3e14ca3ad23..d7c5173a85f2 100644
--- a/sindex.1
+++ b/sindex.1
@@ -128,8 +128,8 @@ struct member
 .
 .SH MODE
 The \fBMODE\fR is dumped as a 3-letter string. The first letter denotes address
-of part, 2-nd - access by value, 3-rd - access by pointer. A special value
-\'\fIdef\fR\' means a symbol definition.
+of part, 2-nd - access by value, 3-rd - access by pointer. A special
+value '\fIdef\fR' means a symbol definition.
 .TP
 \fBr\fR
 read
-- 
2.27.0

