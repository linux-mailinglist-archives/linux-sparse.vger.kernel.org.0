Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21983E98BB
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfJ3JDp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:45 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38811 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfJ3JDp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:45 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so1214939wms.3
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JuiKSEAUqC/rCV9UXwR+oSzRtwR3dOAYzJ6cAsQFd3E=;
        b=EZZzE18pXyt79dQZX1qSTU955PLlD7Mz+mOGxhXXQW5ApKlTXaT3GcKp0avKF/BMsu
         xHMZ331o0IzN5fVHQ9yrrsMPgOxfC8kM967QiZ78nRZcnCZm/099tQGcgWX+iZAZOtbl
         7Df61YZKoS28egMHKTBvepNqX/5eUNsUJq2rAkIc1SiW+8utEaJyfvsBzI+/WPrtvROT
         Gnw3O8uqRcmxhapruJIDB1KLATwm7x4czbQjri/Wbw8z+bCS1JZeZcJErZnPhSi7KoPj
         5PgZ/bLmHYPrXJvx+tjietuNXUl1/GZB5/D4P2NOLuwW92966Zko32o1rbeeQUEfN4RQ
         jmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JuiKSEAUqC/rCV9UXwR+oSzRtwR3dOAYzJ6cAsQFd3E=;
        b=I6di03NvxBz7QbTVURIUhOjnBDTgXtgcnMjGvqsivlCsTMhdtNC/j1hB+xy9HYaT/p
         jzY+XxLmPsA2rUHW43QLLHUn84Q0gsThh8NjECKqIg0FOr+1A9XsAElqu3SEZ1aoRASt
         x+zEP89r8ceP5oWAG9ZeMtzmj+1JCTqoLbhYvOLWWzqsLV2skdthoCUsPGZBjk4eO3DH
         /FMolH+8kS19RwrDQPqGlXkaGycCDFoM5xRyNQpu2VqgCtdYRvKhufhvIcWz7rhvsARf
         7SFFOANCeWMpvvzCJ7v1NT9P0BMSuo65p9biuIrzepf3kUnmwdH3TCk6H+SIIFibfolW
         /C6Q==
X-Gm-Message-State: APjAAAUNuz9ntyp97FTSxlZFQabqcE7JSI1O6SPPqvo5ZM9tAAgFeBfG
        K3UqdyoBvwzVq6NvM4Pv8ZOIz5kv
X-Google-Smtp-Source: APXvYqy/EcLW1NMGDhMK6VIeHJTPOyD/Gz+lThFjMJO1g+uVfIcmdKJPGAwJ6mI3mXv3laFKGY3zrw==
X-Received: by 2002:a05:600c:22cd:: with SMTP id 13mr8490300wmg.52.1572426222681;
        Wed, 30 Oct 2019 02:03:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 0/6] improve cross-compiling usage
Date:   Wed, 30 Oct 2019 10:03:20 +0100
Message-Id: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse is architecture-agnostic and details like the size of
a long or the type of size_t are parameters. These parameters
are either given via some option flagsor are based on the
machine used to build Sparse.

This normally gives good results with few complications but
is unsatisfactory when using Sparse during cross-compilation.
This series aims to improve this situation by adding a new
option, --arch=ARCH, which allows to specify the target
architecture.

Changes since v1:
* add support for 32-bit s390
* keep architecture in sync with bit-ness.
* with --arch, default bit-ness doesn't depend on the build machine.
* --arch also set the default endianness of the architecture
* use --arch to simplify cgcc
* add some tests

This series is also available for review & testing at:
    git://github.com/lucvoo/sparse-dev.git option-arch


Luc Van Oostenryck (7):
  arch: add predefine for __mips__
  arch: reorder MACH_XXX defines
  arch: add support for s390 (ILP32)
  arch: change the arch when changing -m32/64
  arch: add an option to specify the desired arch: --arch=<arch>
  cgcc: specify the arch via --arch
  cgcc: removed unneeded predefines for integers

 cgcc                      | 67 ++++++++----------------------------
 lib.c                     | 72 +++++++++++++++++++++++++++++++++++++++
 machine.h                 | 22 +++++-------
 sparse.1                  |  8 +++++
 target.c                  | 22 ++++++++++++
 validation/arch/arm.c     | 27 +++++++++++++++
 validation/arch/arm64.c   | 23 +++++++++++++
 validation/arch/mips32.c  | 29 ++++++++++++++++
 validation/arch/riscv64.c | 27 +++++++++++++++
 9 files changed, 232 insertions(+), 65 deletions(-)
 create mode 100644 validation/arch/arm.c
 create mode 100644 validation/arch/arm64.c
 create mode 100644 validation/arch/mips32.c
 create mode 100644 validation/arch/riscv64.c

-- 
2.23.0

