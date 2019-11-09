Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE065F5F62
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfKINf1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:35:27 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34184 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfKINf1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:35:27 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so10053178wrw.1
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BKgWgCHnHBybjUUDjFYYLpyyuPjsHlDJcQwmt6nJZI=;
        b=rrUUFabizV3TmafgJITBF1ifN1Ob0HOACwLAVtY/zzj829NcZXZQc6w7EuNG6xjO11
         h3OjtQs6C/elg2AfIuQPTs/mPiV8+W3LTnrvgBbrD0IzvwKnDsqA1GoJd50zO4fBeNNt
         7OAYHEY/Yhhl+rftIW6ar34Ob0ihfINUuNkmtIOnXEnNpOtMhc24fySP20aKVPBKCDVL
         B9YHRa3eH6FQzYre+p1MBemqpUxUtW2BavyY5/VYqNt+ZTGkQJoWrD+V9SYkWXzOkGiu
         QmrlFg86QVrBhGmLhnu1wgLtKUMVZqbde/oMj78tHsDy3CQdvG2TW/KcRF3Ki7LPyoVB
         seZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BKgWgCHnHBybjUUDjFYYLpyyuPjsHlDJcQwmt6nJZI=;
        b=UdDv4k3CAB7o427p89hU84bFhB4iHkyOendjrIMe18DCYwgmGC1DwoTU70VRjPr77s
         zNM5OkGoxXR17n+LxT140MwPu8dyyf3dzi3keuSyNZYfwOJhKBcvsr9XeogsWHyBVQhY
         njuLrO95aVKCbuaQ+6U7XHgZS9c6YwT79uWR7Jpztisq+P4wYdHpIQjh/8uHxmNOCic2
         +/Oy0Yxg0ebGgZKZItrOK+a0FNxurcVw/D9Bb4+GLfHZe7WFEvKz/pEERjYEUAGmdP9i
         vnC4MeAs1SSR7AD5s4m7F93ldeU+VZHryjHjnrB+lXA9KDpk+BVN3YcOsC/K7/0FnKEe
         bffQ==
X-Gm-Message-State: APjAAAXhHNVL8Sz/OyfMwAsZygLcT8T8QBBiYX6nTQEWVDS6rqb151YE
        fh+KguwdZ4YgIpTKlwaIcpcUvbhh
X-Google-Smtp-Source: APXvYqyWgm3ilBLHHZYe/cBkqwBNuLqANkqb2zoSbjkgDCXFmOJi2skSZhN8XPUaI5bbnKSO8Sa6Ng==
X-Received: by 2002:adf:9323:: with SMTP id 32mr12946388wro.15.1573306524166;
        Sat, 09 Nov 2019 05:35:24 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id j66sm8124422wma.19.2019.11.09.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:35:23 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/4] clarify evaluation of SYM_TYPEOF
Date:   Sat,  9 Nov 2019 14:35:15 +0100
Message-Id: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These patches are the result of a small investigation
about the interaction of sparse's lazy evaluation and
the convestion of SYM_TYPEOF into an effective type.

Luc Van Oostenryck (4):
  show-type: add a test program to test do_show_type() & friends
  typeof: fix up comment in examine_pointer_type()
  typeof: add a test for unexaminated typeof
  typeof: examine it at show-time

 .gitignore                |  1 +
 Makefile                  |  1 +
 show-parse.c              |  1 +
 symbol.c                  |  9 +++++----
 test-show-type.c          | 28 ++++++++++++++++++++++++++++
 validation/eval/typeof0.c | 10 ++++++++++
 6 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 test-show-type.c
 create mode 100644 validation/eval/typeof0.c

-- 
2.24.0

