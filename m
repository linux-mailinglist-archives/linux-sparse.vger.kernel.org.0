Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344A712D1C8
	for <lists+linux-sparse@lfdr.de>; Mon, 30 Dec 2019 17:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfL3QOu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 30 Dec 2019 11:14:50 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42507 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbfL3QOu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 30 Dec 2019 11:14:50 -0500
Received: by mail-wr1-f68.google.com with SMTP id q6so33032200wro.9
        for <linux-sparse@vger.kernel.org>; Mon, 30 Dec 2019 08:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EF2BsHSjH3a+GW6WizYLyFkkOQBhtv+CQLTBigT0Ys=;
        b=FXCOo7/F7ttiMQmNnp92mQTYYwEL+Ij21g0zRIh416raQ33SqaVVwOfR2zFE69U3LN
         pa7Ea9SABtLNCohwBgc/1C/XPBXUnkQeLskhFkvbTsJzuPHzKtKl7So6pQJ3A//hASHN
         nYZxUyS0zb0PvMGaQRB+lQanJeCQdqLx3Hoo21OYV0uB0YqfXq84KAp40w3AR+UBzjGD
         c6oKlID01eeKZL/3e1NGYnutAH04RhHK1MIILfdi+hzp70C9weYCbSesHiTWSfgSW5QZ
         kx2V1UeKqgjwELUlN73wf+cn/Og9Nbj2LOR7An7+lw3dbVD7zd7PW9jpxgWwr8wVzPzN
         2y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EF2BsHSjH3a+GW6WizYLyFkkOQBhtv+CQLTBigT0Ys=;
        b=Eqt0G4beIDJ7yJwO2u7iNqu2MjfZXVAi6FTo/UwK9k8r8inNgu1Obvbp4XatXlg/RA
         WZgdSAH6PkqBJRW71DPAo5TvHlJHp8RcP129xf2Aascvsp6+8k9sCsd6cBt1zcTQ2H/7
         iC8OEFIBlGNyn1tM8eLbWVgUyxAy1MAR7WFUzSt9OktaXN8+JIkcRfkrJHf8vf2au66e
         H9p+brGUdThyBj4TU5oe4laSeXJ4nbJd6f+k3hoF6dpRjbhuf9i5BsYA2JkA5Hbh9cYu
         weqXhyXZxpke7QnYHYdG7Ik9VoQwV1X2ZZggkq9mcMAG0EOffF3Y+l/cWxa13qeN2hWJ
         h1FA==
X-Gm-Message-State: APjAAAUMaQivf4+gdicE3itSKed2TDo6p5+UkNhbS52/U4hL7MPuMhw9
        dx+7qsJsImIlG9KJ6jj4f9cyPLHH
X-Google-Smtp-Source: APXvYqwZM2ncaJBc7tOrjvIsQn5ffjHdZuvJCi47a8ga/YslVVrhEa3a/MxGOn/cmW2SJb/LiZAQJg==
X-Received: by 2002:a5d:6901:: with SMTP id t1mr63244102wru.94.1577722488280;
        Mon, 30 Dec 2019 08:14:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40c7:f800:40c:3991:cf8:d2ce])
        by smtp.gmail.com with ESMTPSA id s10sm46559768wrw.12.2019.12.30.08.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:14:47 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] ptrlist: fix typos
Date:   Mon, 30 Dec 2019 17:14:32 +0100
Message-Id: <20191230161432.76360-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Fix some embarrassing typos.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 ptrlist.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ptrlist.c b/ptrlist.c
index 0fb28127498e..3af0b2c5fbaa 100644
--- a/ptrlist.c
+++ b/ptrlist.c
@@ -215,7 +215,7 @@ restart:
 
 ///
 // split a ptrlist block
-// @head: the ptrlist block to be splitted
+// @head: the ptrlist block to be split
 //
 // A new block is inserted just after @head and the entries
 // at the half end of @head are moved to this new block.
@@ -363,7 +363,7 @@ out:
 ///
 // remove the last entry of a ptrlist
 // @head: a pointer to the list
-// @return: the last elemant of the list or NULL if the list is empty.
+// @return: the last element of the list or NULL if the list is empty.
 //
 // :note: this doesn't repack the list
 void * undo_ptr_list_last(struct ptr_list **head)
@@ -389,7 +389,7 @@ void * undo_ptr_list_last(struct ptr_list **head)
 ///
 // remove the last entry and repack the list
 // @head: a pointer to the list
-// @return: the last elemant of the list or NULL if the list is empty.
+// @return: the last element of the list or NULL if the list is empty.
 void * delete_ptr_list_last(struct ptr_list **head)
 {
 	void *ptr = NULL;
-- 
2.24.0

