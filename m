Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33399C0EA0
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbfI0Xn0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:26 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36969 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbfI0Xn0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id r4so3744508edy.4
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7fiQDLt/e0YblclfbSRk4NZtIiuA+92r5E6TOB38X2A=;
        b=tC25sAd34CZ4ekYG4N3FohDJFBD/AeSEhrpOqdCkS+DvlC95R8zR2IBbmaV46NnFVK
         tcNRnPcuAIjbuGeK3gEtP7HVdLL51B3i0lc5bpdgzq7q9cUmB454R8IUnmRJaDut9OyR
         ue7P5WZU5cYjZz0AtJ5RepAJAGPbdJdd5J6r2Ljswz++RQEa0FchrIOkf9r1684eQtqT
         /hA7BT+2tC5rM0BmCcVSVbwilNSxQ8HZy61SMwqaU+NX38IZziVDPC1zmUORzynPXbiX
         YwikBGAt4ML+T5J6jcZAtY0f/pUuNa9sQrvwt3MOADweHlGeyVf3DqEtYugzC+zw55w5
         E3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7fiQDLt/e0YblclfbSRk4NZtIiuA+92r5E6TOB38X2A=;
        b=OR91rO8lV/Ogg3XliJpUK0vgPFrQ9UawdeqWCMjh/aAB2BhsE+4V8SfBQymSJKF8Yk
         1NGjdSdEaRN82nbEfTrq3qjNJ43hEfBXHYq2tJLteCsKL09gYTUCXO1TfHmZu9bKYCqU
         f5aJ7o0uRNDz+YEVLKbMeRskvKwOMp1GOqmzTtb+AY34So0gzeffEX4DVcxAPTv5HOCh
         05mH5tYttdiYFc6xHwKBq8DDhD+qi009qdqyDPiTd8x09rCih9xoAxANBVMSsPQKpUaZ
         /Z7lEBmrB52eXEuQYZl8MbpmZhzG/CHcZgESar5c8FYpl2MPzLbuoejtTUfAFt53t4wS
         EUKA==
X-Gm-Message-State: APjAAAUV4wrw2frxaH3lBiuelBd2mzBhS8UGEe3fzehz/1lDS+etTc8Y
        qfV3NPgUbNZm/VGGL7qI4Yc9bFOx
X-Google-Smtp-Source: APXvYqyMzTR/4IP3xxM9Z77sGN8hTtPj1nnJPSnChFu4oPJoYoIkluUXuCl5exGaAI/3gEKi7Riasg==
X-Received: by 2002:a17:906:3110:: with SMTP id 16mr9964861ejx.306.1569627804022;
        Fri, 27 Sep 2019 16:43:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:23 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 00/18] add missing expansion of ASM operands
Date:   Sat, 28 Sep 2019 01:43:02 +0200
Message-Id: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, ASM operand aren't expanded or even evaluated.
This causes Sparse to emit warning about 'unknown expression'
during the linearization of these operands if they contains,
for example, calls to __builtin_compatible_types_p().

This series contains a number of preparatory patches before
adding the missing evaluation & expansion.

Note: the correct handling of ASM operands needs to make
      the distinction between 'memory' operands and 'normal'
      operands. For this, it is needed to look at the consraints
      and these are architecture specific. The patches in this
      series only consider the constraints m, v, o & Q as
      being for memory operands and, happily, these seems
      to cover most usage for the most common architectures.


This series is also available at:
  git://git.kernel.org/pub/scm/devel/sparse/sparse.git fix-expand-asm


Luc Van Oostenryck (18):
  more consistent type info in error messages
  shorter message for non-scalar in conditionals
  expand: add test for expansion of compound literals
  expand: add missing expansion of compound literals
  dissect: fix processing of ASM statements
  string: add helper string_expression()
  string: use string_expression() in parse_static_assert()
  asm: add test evaluation, expansion & linearization of ASM operands
  asm: check earlier that body & constraints are strings
  asm: use a specific struct for asm operands
  asm: keep using struct asm_operand during linearization
  asm: parse constraints
  asm: use parse_asm_constraint() to verify constraints
  asm: missing evaluation of asm statements
  asm: linearization of output memory operands is different
  asm: fix liveness memory operand
  asm: fix missing expansion of asm statements
  asm: arrays & functions in non-memory operand degenerate into pointers

 allocate.c                             |   1 +
 allocate.h                             |   1 +
 dissect.c                              |   8 +-
 evaluate.c                             | 158 ++++++++++++++++++-------
 expand.c                               |  29 ++++-
 expression.c                           |  11 ++
 expression.h                           |  20 ++--
 inline.c                               |  28 ++---
 lib.h                                  |   2 +
 linearize.c                            |  48 ++++----
 linearize.h                            |   1 +
 liveness.c                             |   5 +-
 parse.c                                |  22 ++--
 parse.h                                |   4 +-
 show-parse.c                           |   3 -
 validation/asm-bad0.c                  |  41 +++++++
 validation/bad-type-twice0.c           |   4 +-
 validation/bad-type-twice1.c           |   6 +-
 validation/compare-null-to-int.c       |   6 +-
 validation/cond_expr.c                 |   4 +-
 validation/conditional-type.c          |  32 ++---
 validation/enum-mismatch.c             |   6 +-
 validation/eval/asm-degen.c            |  36 ++++++
 validation/eval/asm-memop.c            |  47 ++++++++
 validation/expand/asm0.c               |  23 ++++
 validation/expand/compound-literal.c   |  26 ++++
 validation/linear/asm-memop.c          |  23 ++++
 validation/linear/compound-literal02.c |   1 -
 validation/static_assert.c             |   6 +-
 29 files changed, 455 insertions(+), 147 deletions(-)
 create mode 100644 validation/asm-bad0.c
 create mode 100644 validation/eval/asm-degen.c
 create mode 100644 validation/eval/asm-memop.c
 create mode 100644 validation/expand/asm0.c
 create mode 100644 validation/expand/compound-literal.c
 create mode 100644 validation/linear/asm-memop.c

-- 
2.23.0

