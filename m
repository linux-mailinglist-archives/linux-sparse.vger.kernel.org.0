Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A791E116417
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 00:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfLHXV1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 8 Dec 2019 18:21:27 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46008 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbfLHXV1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 8 Dec 2019 18:21:27 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so13950878wrj.12
        for <linux-sparse@vger.kernel.org>; Sun, 08 Dec 2019 15:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y560V/CG8w/fUHzmiotjzTWBxS1DGv/Wk6lYFhyLHNU=;
        b=QnbcajcNSnfyd396pMUJh9EE9Lp9j0J7qR8Iykod59TeSl0wTcISkLCWk0zrN6RK4B
         Lp2EOpyk7IrJS1yISTIBUja/t7tcXDiHnK/clUdt1AYB4h/jCAB0CE+pNyuc8IJorT4k
         AgbM0jeG8sQUNGvpcQeTBjFCzJ7szaGf3/oDQm8NvvmaSJIuc0Wb8hDReW5ZjImXvyge
         GpMt+AzWolFNqEElpXcSraS/tCqsm3ryprfj9RHVj5pk/H7nlxyK/U5hwxtQ6xIbABNt
         yfSj+yv6g1eOW9Q1CPrW7CEzm4c02+S+5Luv1pBKgXA0NPG7+yP3OHrR+tG4KfCUH1EW
         fNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y560V/CG8w/fUHzmiotjzTWBxS1DGv/Wk6lYFhyLHNU=;
        b=p5v3jum7nSQffik5NLNh2EjyoQLYUbVzeMkK4mNjZvadQYjFHdO8bfBEWYk5LS1nJ6
         WT3PbMD7Rfn5gFpnHWCExSFHMCvb6VobdnuWhWMvqHckdYJq9zqpqXNzSMgy8L6uiq4Q
         uVCdbkgjJWVLYgr1bd3GjdkE7mEJX4BlQq/4AHwTtbi9v38LPT+jir9L9OMliI2TZSKL
         A/98dSL+LbXxb37TnbgcRzL2vMqGhH/hWN17BRF+mpMcOsGrTHyAqLUquR8gUsEXudpq
         CEXmjkeQPQjLtjEY+dTTFiVhvnZI5LJS1LAN470UdhVjJBVkum//qTk1pf0yktltRurd
         xP6g==
X-Gm-Message-State: APjAAAUoI+t9k8OeQ7c/fLg1SVRjT3Wm3wQobScxzxE1sqXLWVQbAgcD
        S+vigVD5rLriTzo23aFKVM7ff7B9
X-Google-Smtp-Source: APXvYqxCK0gLZJ4WYQppJgCMPCyL+MZyVoDPWltkdJB5sv4MTkcM9yAWLEHVfBI+Q6jw3G7FYPVTcw==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr27168232wrh.272.1575847285330;
        Sun, 08 Dec 2019 15:21:25 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40d5:8a00:61ab:d604:b478:87a3])
        by smtp.gmail.com with ESMTPSA id w17sm25377996wrt.89.2019.12.08.15.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 15:21:24 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] improve diagnostic messages concerning bitfields
Date:   Mon,  9 Dec 2019 00:19:16 +0100
Message-Id: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These few patches contains some fixes or improvements
of diagnostic concerning the size of bitfields.


This series is also available at:
  git://github.com/lucvoo/sparse-dev.git bitfield-size


Luc Van Oostenryck (5):
  bitfield: add testcases for invalid bitfield width
  bitfield: don't warn twice on invalid width
  bitfield: oversized bitfields are errors
  bitfield: keep the bitfield ident
  bitfield: display the bitfield name in error messages

 parse.c                     | 10 ++++------
 symbol.c                    | 10 ++++++----
 validation/bitfield-sizes.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 10 deletions(-)
 create mode 100644 validation/bitfield-sizes.c

-- 
2.24.0

