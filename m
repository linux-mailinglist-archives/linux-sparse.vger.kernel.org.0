Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E21A18A18F
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Mar 2020 18:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgCRRb0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Mar 2020 13:31:26 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33367 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgCRRbZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Mar 2020 13:31:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id r7so2841591wmg.0
        for <linux-sparse@vger.kernel.org>; Wed, 18 Mar 2020 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZixZt4rSDy+wCwcqTJJy3Xr0api+0KoEUfL/GUPDvg=;
        b=fkDAoTgtkQBj9asoDRLFshTpLUblld7St/HAvt3etarWUEmKyrkehgR+qSSriWuPD5
         z7U1SxlGIM6b//E6/Nzy0T838/0ggIGSyGZNjN8ZiAvdWXOyUx3ZenoiBW2GQCB5PU24
         xhuQ8gwAJ2JpV53cNk16DiXpM8ecAy7Alxdy+WrJ4tt8wtNxLNEulyhICmNB5cdxFwPe
         Ht7ufswz3YPT16jmtQOTo+0+Kiun9rO19Gc9luhHPkoZedn55NJ6f71ruAwCy+eGraIL
         vbJVnN8KGhnqgLqgeuhoYS94Vl1Ro1WdJcto+3N5UczInyJVhTPMu8bpnMHjlidwffYF
         2W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZixZt4rSDy+wCwcqTJJy3Xr0api+0KoEUfL/GUPDvg=;
        b=AyR2Ma2TMx254dpH5+wSoPD2Q81iRqSux27pVKZLXJUiv+C1draPCd/CIADr9tZQDm
         +PBMyBgFnRMwlD2qgLVo3Iwg0Aq+8vjfo3NMFQ8bZfzqQnFknU61GfC9M416nqY0iS3r
         ZMqe03zJeK4rZ3ILcY9QniwEEN9QE3WzBOUFtI2RX/V8mbKuY3hDY+vBxCshYzqa9geg
         +bowAcndzHNlXyuJ+u++dqRnzX4bRgvzdmjemJtawBKbmTFzBQjFl0JrNihBY7Asak1y
         Ivk+JZ0MV950ejqpkI/oJx9zpi4BPcg5Xox4uaXF5oVDevLPP+Od2q0cBhMrLCEEogVz
         h/BA==
X-Gm-Message-State: ANhLgQ2zDELrVjzwYk9F1K0JKgygsPmFzbiU/LTx9B5a/UKzVYpchWAn
        sqFAv6ZEuCqkV0AqqAyntB1iRbZe
X-Google-Smtp-Source: ADFU+vsQLZyoUp8UqYGLmXkpYHh9xu4k/d5CL2pZ6nw9qYnDQ4YAf4CpBeCoHasbDLkwSlFpmOfCjA==
X-Received: by 2002:a7b:c118:: with SMTP id w24mr6389040wmi.77.1584552683372;
        Wed, 18 Mar 2020 10:31:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:81ce:3038:2a0a:bf02])
        by smtp.gmail.com with ESMTPSA id u17sm10268051wrm.43.2020.03.18.10.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:31:22 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] add support for __builtin_unreachable()
Date:   Wed, 18 Mar 2020 18:31:15 +0100
Message-Id: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

__builtin_unreachable() has direct consequences on the CFG
and should thus not be ignored. This series add minimal
support for it, motivated by some improvements in the
processing of contexts.


Luc Van Oostenryck (5):
  add testcases for OP_UNREACH
  add instruction OP_UNREACH
  add an implicit __builtin_unreachable() for __noreturn
  add support for linearization of builtins
  teach sparse to linearize __builtin_unreachable()

 Documentation/IR.rst                          |  3 ++
 builtin.c                                     |  2 +
 linearize.c                                   | 52 +++++++++++++++++++
 opcode.def                                    |  1 +
 symbol.h                                      |  7 ++-
 validation/context-unreachable.c              | 15 ++++++
 validation/linear/builtin_unreachable0.c      | 29 +++++++++++
 ...n_unreachable.c => builtin_unreachable1.c} | 15 +++---
 validation/linear/noreturn-unreachable0.c     | 22 ++++++++
 9 files changed, 137 insertions(+), 9 deletions(-)
 create mode 100644 validation/context-unreachable.c
 create mode 100644 validation/linear/builtin_unreachable0.c
 rename validation/linear/{builtin_unreachable.c => builtin_unreachable1.c} (59%)
 create mode 100644 validation/linear/noreturn-unreachable0.c


base-commit: 0558317d0c7a2e20a6d82b7ef35357ec02e2ad38
-- 
2.25.1

