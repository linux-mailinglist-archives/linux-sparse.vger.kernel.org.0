Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFEA1D8BB5
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 01:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgERXmO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 19:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgERXmO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 19:42:14 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B677DC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:42:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u188so1377522wmu.1
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/KdDP+T12IwBEC+bJIMDNlmvscMe/A0CTxJJh/1Pv84=;
        b=fRDNes5KJhSHaPrpq+DfwQvP2S6ih0Wqo3HQQC1XMZOShjElSGJQVEZr8jxH1Q/SA7
         jnnG4o4BAfIrSRMSAZYI8rsoadJe++wWqOqqN/jY8jQxMAZpjCkrVB/TCLk2XwcW9/B9
         mTqsth3Zk1BXnRzhfPo1y+WVaJsaHS1YaRGaijw8EUDzQW4hT72maIofx+5RVrE3aUQJ
         9xhhmncWEopTA8BWgs47pO1oOLHINeYaUnqCxzHXXXfZ8mBTQnQHPE4F9ONye/ZrhQ/p
         8eTr7OezVYnrDvtXSSsFrlEptxvo2DNyBvbyUzuJQNP+W0LBK43TR8amyrxHyL+3oTRA
         dryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/KdDP+T12IwBEC+bJIMDNlmvscMe/A0CTxJJh/1Pv84=;
        b=pypXAmJGJ8YzbJnsIaOgWaBGDclgJexwDza5j+KAIVWndYIyZkVpbTsP4czdUCLVt4
         8tHPfQ2NlXAO9jDnSDG2RmBcMWdbir9i7FS9sjqY293unEkw0jzcJwqlRG/SWfZFfzfL
         2Tt0eGSk9NPqziQwAJ+5mDVZA+3a1nv5vbgtYBAoc5SkvDO/C69MOGsMfYF5fmrYatgF
         dDDTEj3L+6814ck4sbSXvO6a9i1fHpDqEWZqtkx6rkFDemgfGtGt2KQuSCtu54hfVL88
         JpB214UtUF8NCJCzyB66A67hzLaolKZy1t+KrvFSjFOb5GQYy9S+Vxt0lE0kac0ECYFV
         CVNA==
X-Gm-Message-State: AOAM5302KLDZXG3zeaRyCCHRM8LhNXR1ciz4kS0Mv7nPgAX6kwLuSbmE
        wpwR2c/criVqmV5G55qX4p7nrB3+
X-Google-Smtp-Source: ABdhPJxyQYkd1SWzFuYL+/xx1gembbV+bWcB1pZouHE2OkVTXcFgNZHeN9Bl1ZKqU299m9S7YjHBYw==
X-Received: by 2002:a05:600c:2dda:: with SMTP id e26mr2004751wmh.42.1589845332301;
        Mon, 18 May 2020 16:42:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id l11sm1597264wmf.28.2020.05.18.16.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 16:42:11 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] simplify parsing of inline/__tls/__visible
Date:   Tue, 19 May 2020 01:42:04 +0200
Message-Id: <20200518234207.84150-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is a follow-up of the previous series "improve handling
of function attributes" removinf the special cases that were
needed to parse and handle these 3 specifiers.

Luc Van Oostenryck (3):
  attribute: '__tls' is just another 'declaration' modifier
  attribute: 'inline' is just another 'declaration' modifier
  attribute: 'externally_visible' is just another 'declaration' modifier

 parse.c                    | 26 +++++++-------------------
 symbol.h                   |  5 ++---
 validation/attr-visible.c  |  1 -
 validation/attr-visible2.c |  1 -
 4 files changed, 9 insertions(+), 24 deletions(-)


base-commit: 146e6a63e715e0c3e08aacbcaa79ff8930289297
-- 
2.26.2

