Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961FC119EE4
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfLJW72 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:28 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:53183 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfLJW72 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:28 -0500
Received: by mail-wm1-f41.google.com with SMTP id p9so5021586wmc.2
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OI2JfMIBTIYAXzKPx6WWKoGBPFUKvZEI1Y+QoBgjDg8=;
        b=He/h0iGFkYjlwASYKpbMozy5pUFW8omd1XqUEqYwD6W/hEeZWLy3WO7Za2WeR8laEQ
         oe1w5C7CLQr6bY7btzqLti/ceVNpT3F23G+d/R8DBfTzLhbm/Xt4MBnpgzAWIDrsYYlG
         edH8K388bMyA4/5i/HHKEvyA/Ai0IDdn5sKuD6EL9Eqi9XbW9CtKwjELygitVHpD2mCt
         8N7tolrIlyR1GtXgpWXlPLZ/GfrLvmrtoJuiQqwzxdMUx6hKoEsIVRUajAIHmabFtoTw
         V70tA9NUMdBdf+CLAsbfE4l59d4KfrlEn9qGt9m2hhvAO8CvL6wUJsbSg7BqlaOxgmPn
         +tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OI2JfMIBTIYAXzKPx6WWKoGBPFUKvZEI1Y+QoBgjDg8=;
        b=OHchOWWlAph7Cae8BMHPH2EXzgWrcpxJEit5E36asbywDkBDaBvBupCGZlBkS3qy2N
         ofGAISF+2D98Gw2lFph+e5x6VzllruGgFFuHHtpRgIXT3vd3+OciuMm23sruSzfryiVS
         0tQ9j0XvhK+zxse+seSkkTjonIDDugFwqPArdiZ6Z8OZd4MdetK7VMD3g2597/LxkAyA
         TkyAgyyaHy0UyOreQwtgxfmaBFAVKBv8d5oeuhR4vs8zUDDPGLH/M9iWzQBwjVbb0eZB
         yApuFnv8PiHTo5XTMtpU/qoSMtC51k+J0bOm0f/24iabEPYb5mi9WBG8SpI3/llafttr
         oMvQ==
X-Gm-Message-State: APjAAAU4bGdVVbSJUYVgaFqvBt3DwckL5uMh6raljH9H4aTExpboLhCb
        /Ikj1Vnj2bd9XzJo8PrUtxsBMj9C
X-Google-Smtp-Source: APXvYqzAYaC298HyEVPDqkTxNAXVFGC9nPie8yuBekCuP8vy/Kg0Zden1M1uxcEx7JdMVM26Bq0LUg==
X-Received: by 2002:a1c:49c3:: with SMTP id w186mr7964488wma.53.1576018765971;
        Tue, 10 Dec 2019 14:59:25 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:24 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 00/17] improve expansion of constant symbols
Date:   Tue, 10 Dec 2019 23:59:04 +0100
Message-Id: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series looks as trying to improve an optimization but
is in fact the result of a (failed) attempt to improve
the diagnostic of non-constant initializers. Such diagnostics
are currently only given with -Wconstexpr-not-const which
follows the rather strict rules given by the standard for
constant expressions. These rules can be handled at
evaluation time, when the diagnostics are currently issued
but we want, at least by default, to accept more general
expressions as being constant, maybe anything with a value
known at compile time. This can only be done later, at
expansion time.


Luc Van Oostenryck (17):
  split testcases for type punning & constant initializer expansion
  add testcase for expansion of default initializers
  add testcase for addressability of degenerated symbol
  add testcase for addressability of 'complex' symbols
  add test for union cast
  add test for dereference cost of symbol with complex type
  add test for constant expansion of complex initializer
  extract mark_addressable() from evaluate_addressof().
  fix addressability marking in evaluate_addressof()
  degenerated arrays & functions are addressable too
  fix expansion of initializer (mismatching size)
  fix expansion of initializer (mismatching type)
  fix expansion of initializer (default)
  fix simplify_loads() when doing type punning
  fix cost of dereference of symbols with complex type
  RFC: allow expansion of accessed constants if 'static const'
  constant expansion of strings

 evaluate.c                                    |  16 ++-
 expand.c                                      | 124 ++++++++++++++++--
 memops.c                                      |  11 ++
 validation/eval/addressable-complex.c         |  23 ++++
 validation/eval/addressable-degen.c           |  17 +++
 validation/expand/constant-init-array.c       |  15 +++
 .../expand/constant-init-nested-array.c       |  15 +++
 .../expand/constant-init-nested-struct.c      |  23 ++++
 validation/expand/constant-init-string.c      |  14 ++
 validation/expand/constant-static.c           |  16 +++
 validation/expand/constant-union-flt2int.c    |  20 +++
 validation/expand/constant-union-int2flt.c    |  19 +++
 .../constant-union-size.c}                    |   7 +-
 validation/expand/cost-deref-nested.c         |  20 +++
 validation/expand/default-init-array.c        |  15 +++
 validation/expand/default-init-struct.c       |  22 ++++
 validation/expand/union-cast.c                |  27 ++++
 .../type-punning-flt2int.c}                   |   5 +-
 validation/memops/type-punning-int2flt.c      |  19 +++
 19 files changed, 404 insertions(+), 24 deletions(-)
 create mode 100644 validation/eval/addressable-complex.c
 create mode 100644 validation/eval/addressable-degen.c
 create mode 100644 validation/expand/constant-init-array.c
 create mode 100644 validation/expand/constant-init-nested-array.c
 create mode 100644 validation/expand/constant-init-nested-struct.c
 create mode 100644 validation/expand/constant-init-string.c
 create mode 100644 validation/expand/constant-static.c
 create mode 100644 validation/expand/constant-union-flt2int.c
 create mode 100644 validation/expand/constant-union-int2flt.c
 rename validation/{bug-expand-union0.c => expand/constant-union-size.c} (56%)
 create mode 100644 validation/expand/cost-deref-nested.c
 create mode 100644 validation/expand/default-init-array.c
 create mode 100644 validation/expand/default-init-struct.c
 create mode 100644 validation/expand/union-cast.c
 rename validation/{bug-expand-union1.c => memops/type-punning-flt2int.c} (63%)
 create mode 100644 validation/memops/type-punning-int2flt.c


base-commit: 9b2efc158c5c9700ffe355c59356879df7c9cc12
-- 
2.24.0

