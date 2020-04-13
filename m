Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D561A6996
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731395AbgDMQQO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731324AbgDMQQN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:13 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85A1C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:12 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a201so10161760wme.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BXoEkAl6N0lBQNjFcxNnGSCs3XP4ew7colEaW+y4ZnA=;
        b=QIWjJYwIu9mBY+P3dSXrVwPb5mTcd9ua8DN+CKs86G9vlAhCiOheqr95OezYij1saJ
         T/XiWVdcKC21tOvcixEHRq2BZHS18AXGBq7ewW0WqXkHqmMHw/7TcGhyICGTalHU/GV/
         WCD7U8EkXkerckqtjZFZLjDSD1cOAONlu4aHgtQfI7zipHh9kSFMs+QuFQ2JzyDTKH9+
         gsyXM24PL7M08hkcj0ySZLokiK+/qK6y4fAPLbSEZ9ZzKAmdH7FaDaHijHkZ2xkcdybi
         CU8AFOycz3qQ3qmugLEPbklsdd7l+rnaWbdkQoVZ+lPqGe2DQFx7bV2wT2iudVMTqqgL
         9k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BXoEkAl6N0lBQNjFcxNnGSCs3XP4ew7colEaW+y4ZnA=;
        b=bCR8KRUnSMKUnRg0Kd1LFBFJSMcfvSNIWSuIA1vKEAep7eWjPhzoTIsprRIgRVR/ke
         0G2rI2G5nI9cVfgu/1sySa1DpRBupgQq/Uct9aZPC5cL4gd++U5Svk7obBXgQ0Yiw2EU
         cTcYCYeWn0IkGHHdEMwJKYK+BGltluPbfX6YkQPXOSIO4yGy1hl0SgLz56NOfaMbPiY9
         iQkwi6WD3MJ+ZxASMObB+yJgJiRtFxpq2Uc8T25/4mhnEA69/EHDwa0ec0CjkhMLq76I
         9ixg3PE3LhGkofd52FQiLrZo2tYP4JDNacqqU3j7HRFfzvaHuWk+NgqAyjcS+BNNyF7S
         rzJg==
X-Gm-Message-State: AGi0PubuD76bENdlMJ27zlTZPbJjxD07d17QLx91kNcf+3Lj5fqpuquS
        GvDe9TlyiOCRd77v5faPMBAcpYa7
X-Google-Smtp-Source: APiQypK/nNyvKTORfkVpDNC6d1DNEKy8qer3jWb7SzJGn0iFAkEKsAZT3TPG9IMn93HUID28IW5gmQ==
X-Received: by 2002:a1c:1942:: with SMTP id 63mr20337017wmz.133.1586794570511;
        Mon, 13 Apr 2020 09:16:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:09 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 00/17] detect invalid branches at evaluation time
Date:   Mon, 13 Apr 2020 18:15:48 +0200
Message-Id: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's not allowed to do a goto into an expression statement.
For exemple, it's not well defined what should happen if such
an expression is not otherwise reachable and/or can be optimized
away. For such situations GCC issues an error, clang doesn't
and produce a valid IR but Spare produce an invalid IR with
branches to unexisting BBs.

The goal of the patches in this series is:
*) to detect such gotos at evaluation time;
*) issue a sensible error message;
*) avoid the linearization of functions with
   invalid gotos.

This series is an alternative to the one named
"detect invalid branches in the IR" whch was posted
last week.

-- Luc

Luc Van Oostenryck (17):
  bad-goto: add testcase for 'jump inside discarded expression statement'
  bad-goto: add testcases for linearization of invalid labels
  bad-goto: add more testcases
  bad-goto: do not linearize if the IR will be invalid
  bad-goto: reorg test in evaluate_goto_statement()
  bad-goto: simplify testing of undeclared labels
  bad-goto: do not linearize function with undeclared labels
  bad-goto: catch labels with reserved names
  scope: no memset() needed after __alloc_scope()
  scope: move scope opening/ending inside compound_statement()
  scope: make function scope the same as the body block scope
  scope: s/{start,end}_symbol_scope/{start,end}_block_scope/
  scope: let labels have their own scope
  scope: add is_in_scope()
  scope: give a scope for labels & gotos
  bad-goto: catch gotos inside expression statements
  bad-goto: cleanup evaluate_goto()

 evaluate.c                              | 25 +++++++++++++--
 expression.c                            |  4 +--
 linearize.c                             |  2 +-
 parse.c                                 | 23 +++++++-------
 parse.h                                 |  1 +
 scope.c                                 | 33 +++++++++++++++----
 scope.h                                 | 10 ++++--
 symbol.h                                |  4 +++
 validation/label-scope1.c               | 42 +++++++++++++++++++++++++
 validation/label-stmt-expr1.c           | 29 +++++++++++++++++
 validation/linear/goto-and-expr-stmt0.c | 33 +++++++++++++++++++
 validation/linear/invalid-labels0.c     | 18 +++++++++++
 12 files changed, 199 insertions(+), 25 deletions(-)
 create mode 100644 validation/label-scope1.c
 create mode 100644 validation/label-stmt-expr1.c
 create mode 100644 validation/linear/goto-and-expr-stmt0.c
 create mode 100644 validation/linear/invalid-labels0.c


base-commit: 0f5a39dcea89c66236c04815b77b107763873431
-- 
2.26.0

