Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1CA10CF4F
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfK1Ume (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38707 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Ume (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:34 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so32658925wro.5
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=naSpy5fujvFgRG92I+Bk8S/DulaVyXIWWSde0uURaDk=;
        b=j7+/9tMgtD6kpnu3p96TCsYW9LS7ERnYiBU5M4XZNCKrrthAqUejg1sPfmpjC7oyps
         6pRMyr1jrIVuWRraBoikt9dKVXfictTrpl0oK4kW1MlcKvxWIcY8/oRprKQVRM6o2ddt
         Fb49wYIKGroTBYL8X7nCCHiYXL0JeaYcqfF5uIQ/ZWZL6fzrd9sVa+m0lgtKn5pmFJbD
         Eh7LT/aA/jgpVlEusJo8joIoUKMgBjndG+zB9eutIhUccTtTwGMPHumFMPt42a1u37/J
         85C1l7qYe6tJ/Mp4jPZpF7Rw9f2cn0DP2+peojlqqLszVMMy2EM4UbbHWe+YuRAbbdIJ
         R/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=naSpy5fujvFgRG92I+Bk8S/DulaVyXIWWSde0uURaDk=;
        b=JPZ74luIL8FOWr0bELSCXQEnoWXGTLQHewaOXqO86Q9HbvI+l55/RTmffenqdUxNG6
         vJ51AAkF9kLqJxxOoKjlnZLTA4lWs4K9MvTzV4EGI1cjY6Ri+XsUsgp8Nz7ienb/OuWe
         peffyoUzMlmrNh3htOTJZdKoh2E2S9pE2bb0XIWlYDZlVbDvj/sYGtgYu77I2ZpNJ8FJ
         DzcORcGvQsNsAvLLJqNq7/XE0yEMX3BfmiT8Al32tTGjXRWPB1kQtUMBq0gv9A1lsYDt
         XSvJ/PLUb9TfEVnBIorjNVjeeo7kDKhuDnkNsGaMwd+CSQb1P2iWZjjCZuBAhxx8hD2v
         pFZA==
X-Gm-Message-State: APjAAAXMuckLQGE7BvEAm3fBuC3pk6JDDi84fGVcS3dIcQgjgo4BjSM/
        EbTA1EkbCM/lizvQ+feV8yOSckev
X-Google-Smtp-Source: APXvYqxe5roGEZwG+c3MmOtN1Gqs7Mp8TIxwI+GJMAvLkiDqvhbbj0QbvlXPL+Q86v2t6lYwyu0zrA==
X-Received: by 2002:adf:f290:: with SMTP id k16mr52970719wro.224.1574973750707;
        Thu, 28 Nov 2019 12:42:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:29 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/7] add support for '-std=c17'
Date:   Thu, 28 Nov 2019 21:42:18 +0100
Message-Id: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series add support for '-std=c17' but this is mainly
an excuse for cleaning the associated code and to easily
test 'strict' vs. 'gnu'.

Luc Van Oostenryck (7):
  simplify initialization of Wdeclarationafterstatement
  allow to test the standard version outside of lib.c
  alt definition for STANDARD_GNU89 & friends
  reorganize the __STDC_VERSION__/__STRICT_ANSI__ switch statement
  simplify definition of __STRICT_ANSI__
  separate definition of __STDC_NO_ATOMICS__ and friends from C11
  teach sparse about C17

 lib.c | 59 ++++++++++++++++++++++++-----------------------------------
 lib.h | 16 ++++++++++++++++
 2 files changed, 40 insertions(+), 35 deletions(-)

-- 
2.24.0

