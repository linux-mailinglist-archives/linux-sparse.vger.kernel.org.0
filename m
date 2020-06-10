Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A2A1F5D26
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgFJU1o (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728674AbgFJU1o (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:44 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22ACAC03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:44 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y13so4103572eju.2
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ODpVbW7WwjBI2M34X+L4Y/wgtGw/G6dxAnWOO7KPZ3o=;
        b=Lu5nJYBO/rjQlTisqWN9cJP1q3ESU2M8PFNTNKtqkGrq+PgpvRiNbQa3VmLh2AKd4c
         vBHXw8XqZWZ+ahYaMkjfvG6jO0hRzZTK8ukTxHv/DIjX8oeM2sQKsjselsydqEZzN+KI
         NA9Sdi7mUKMhTmmxjKsT7M1i8sAKYUDldqveIbVTqoFPMy8MXTQQh3dPo/VyECXKbEpt
         hfZD+8wcpq5gW1rLB6sS+KavNJ+FoiylElRVmAA8RyKTNcqtoUqqd4mqwzphPUXGqsL9
         SdYLjVAAAYk+p8Uw4h10RlfTp9TJfNxcNzkgQoFgmy+ti3zvsqx3FbSkqkCfk+lxKdIL
         ip4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ODpVbW7WwjBI2M34X+L4Y/wgtGw/G6dxAnWOO7KPZ3o=;
        b=CcHJZg9/dRAgLyoweAQC0oqUU8vSxbylBH1A0fyMsPzWi4zwBfQXWZ6ES4jwlr920/
         5pP94Hif5vcKNx3vDF2zhrHy0/NAxterBTmzIw7skbKFqfEHmlDqjNx3qmIrN9YKMn7g
         4YlzsrtksyRCDcnDapDsnvTVKVlGoeqP7pbznFYdHyvuOUnLnkhDRHvf9L1WHWZRNO3x
         REjVt/OG73su9JJzpiMqYlSQyWYurVzPTKT9XQ8IsWCc4tv7K0IXKYbr9RRtIhMTA3Sk
         GD1YZ91K+OTeSsB1GiCMCZUSf2KGSG2dlyuaJ+buJ1sc1XqIX63/pEBaGhTbbTSYGJYC
         2k9A==
X-Gm-Message-State: AOAM530lQ28X/KwDZpayDbU+8E08cD3854iPnjy/0t6GnaKGCWMvywOD
        wy+K1VVOe43jj8AU7i9nk6t0MDVh
X-Google-Smtp-Source: ABdhPJzzHP1GEeZ1+nqFUv/d8Qw6y14NNzvwOLTEa7RrYZwCSOae6i1bpCbM62UMoV960GoCX4GsCQ==
X-Received: by 2002:a17:906:c53:: with SMTP id t19mr5454135ejf.143.1591820862426;
        Wed, 10 Jun 2020 13:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/7] move arch-specific builtins to their own table
Date:   Wed, 10 Jun 2020 22:27:28 +0200
Message-Id: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The goal of this to avoid the declaration of arch-specific builtins
when the architecture doesn't match. As nice side-effects it also:
* add support for arch-specific builtins in their target-<arch>.c
* let these builtins declarations be done via a table (it was done
  via a serie of function calls, one by builtin).
* add minimal support for the architectures Alpha, Blackfin & Nios2.

These changes are motivated by a recent report from the kbuild test
bot (which seems to find lately much more sparse-related issues
in the kernel than it used to, often address-space & endianness
problems).


Luc Van Oostenryck (7):
  builtin: can be initialized later
  builtin: use a table for the builtins
  builtin: unify the 2 tables of builtins
  builtin: add support for arch-specific builtins
  arch: add specificities for Nios2
  arch: add specificities for Blackfin
  arch: add specificities for Alpha

 Makefile       |   3 +
 builtin.c      | 439 ++++++++++++++++++++++---------------------------
 builtin.h      |  15 ++
 lib.c          |   2 +-
 machine.h      |   5 +
 symbol.c       |   1 -
 symbol.h       |   1 -
 target-alpha.c |  30 ++++
 target-bfin.c  |  26 +++
 target-nios2.c |  31 ++++
 target.c       |   6 +
 target.h       |   7 +
 12 files changed, 321 insertions(+), 245 deletions(-)
 create mode 100644 builtin.h
 create mode 100644 target-alpha.c
 create mode 100644 target-bfin.c
 create mode 100644 target-nios2.c


base-commit: 42323db3955557b223268ec4196acb77308ab204
-- 
2.27.0

