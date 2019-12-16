Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354A0121E5C
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbfLPWiC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:02 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51841 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfLPWiC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so1007062wmd.1
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSAS/PPaEcOef8xD76OvyOCZQb9yMW9Eo9VqGd4cJx4=;
        b=vCpWUsp7j8WqR0u8NUgg/LNcdsu7K5Wc85VB5zZ9pFobvnUcdD5xDWOum3rKJIdR2e
         M2nu0+hSOQ4pEtpYLzPkaxo1zltAAyWbVYshoHGiwdutA4tkuq+obCnIhP1R5BMew/wJ
         tTVSYv+tDRxs1Z4UPiQ3TxI+mWCv3gTgqB9HsTGhqG2qv4iKvDfQ7XX/w+aeiD39/0/n
         jCgXRVKgiNOkPSUMB83IoSYn9/psD/kXdlilk2QcoAwdGHOqcJ3zZa8l4L5bAeC6bnVe
         mFAlg95DDuEutia/TOaNFCsTiLwSSBuVoziRclE7EER+Q0XeVY5UHNVsnwye+8NMGm2X
         pHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSAS/PPaEcOef8xD76OvyOCZQb9yMW9Eo9VqGd4cJx4=;
        b=QAk5Y5inX6uuecJx6Yr1I/t4P8VUvrzEgJh7uglRYRH2MHPJpMB7ygaInNZewf0epi
         YhnMO52W+JbkmTs2yZmdsU93Cgnh5ski6XGX7wE4QO0EDwA0ILPfagnJqXCd6D6tY8M4
         1dqqh912w7KKh1gDyvGi4q3zw11FfEB4hvTvl13CbLwQ2Qo7IUMDCfy2yj5zxjrYPGj1
         KSZQppDX6pdavhmrzAnl5iY8jsxWhWAZwGMI0tgcotB6uMNjKKSUt0loDVoPhIBzmS7b
         Emt04FL5fva14cecp7MIPnaMQSZvh8oJvouLa2mT0W20LtShbor8qgeqYoiH1MDt6PTC
         81TQ==
X-Gm-Message-State: APjAAAW0L8ZMtdtd7j7Ss7tqPIdXo7SY927QqYnmgCuq9UEeF6USsyE5
        js+xgiw3q6ivifQgXWv4GAuX9sN6
X-Google-Smtp-Source: APXvYqz83ORYd/rio8x3yBGWEvvHbG+jwknrO5ROpKKkydtvTwagfmaNrIJee5qsCxgyzMWv7vxCuw==
X-Received: by 2002:a1c:dcd5:: with SMTP id t204mr1572874wmg.34.1576535880092;
        Mon, 16 Dec 2019 14:38:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:37:59 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 00/10] move arch specificities in their own files
Date:   Mon, 16 Dec 2019 23:37:46 +0100
Message-Id: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is the continuation of previous series aiming
at better supporting arch specificities. Further changes
in this area should now be much easier.

This series can also be found a:
  git://github.com/lucvoo/sparse-dev.git arch-spec

Luc Van Oostenryck (10):
  cgcc: add support for riscv32
  cgcc: rename 'ppc64+{be,le}' to 'ppc64{be,le}'
  arch: move arch-specificities to their own files
  arch: move parsing of --arch=<ARCH> to target.c
  arch: move handle_arch_finalize() into target_init()
  arch: use an arch-specific default for -msize-long
  arch: move target-specific predefines to the target files.
  arch: move cmodel predefines to the target files.
  arch: use arch_target for INT128's predefine
  arch: arch_mach is not needed anymore

 Makefile         |  10 ++
 cgcc             |  13 ++-
 lib.c            | 247 +++-----------------------------------------
 lib.h            |   3 +-
 machine.h        |   2 +-
 symbol.h         |   1 -
 target-arm.c     |  36 +++++++
 target-arm64.c   |  39 +++++++
 target-default.c |  11 ++
 target-m68k.c    |  23 +++++
 target-mips.c    |  53 ++++++++++
 target-ppc.c     |  58 +++++++++++
 target-riscv.c   |  53 ++++++++++
 target-s390.c    |  48 +++++++++
 target-sparc.c   |  66 ++++++++++++
 target-x86.c     |  73 +++++++++++++
 target.c         | 262 +++++++++++++++++++++++------------------------
 target.h         |  48 +++++++++
 18 files changed, 673 insertions(+), 373 deletions(-)
 create mode 100644 target-arm.c
 create mode 100644 target-arm64.c
 create mode 100644 target-default.c
 create mode 100644 target-m68k.c
 create mode 100644 target-mips.c
 create mode 100644 target-ppc.c
 create mode 100644 target-riscv.c
 create mode 100644 target-s390.c
 create mode 100644 target-sparc.c
 create mode 100644 target-x86.c


base-commit: 817270f9e1de294bd2a82514142544b273f7428a
-- 
2.24.0

