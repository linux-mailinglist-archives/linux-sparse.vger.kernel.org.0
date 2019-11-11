Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB055F7549
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfKKNry (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:47:54 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46754 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKNry (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:54 -0500
Received: by mail-wr1-f67.google.com with SMTP id b3so14665519wrs.13
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ek2VgBZSEUhsHoq0ulLUZO8m4E11em2LrnTPVGX8cKU=;
        b=KAsp1/PCi2LDMsxhRuOkllcZBNO8alKTC6qirgCvNC+dmAyiLVsWdO6oFDAaRdPnQG
         e3DOW8qZNuojg9RbYVfa/pIb8OzH/Rvy+GzzSLeWmnaYvL2JBqe2FV53t75Y/QMSY2tj
         5C8w78MXifMNcGlzdrk56N/e0v93AREtc742qDBsHrCrZR3LWryd+cQRcgrz1MW+R/rq
         avUZNQfsA0XnAlYjhbea1a6/ZgnXWRjsU+Phd472Ay/zqC2+Ve0Zy9lOG98BeP1w5BPo
         zqbVNBz82nEvxw3VYg2jiILR7o2kDHuUiXP81Gj1ZHfVa/Ye3bQxp5nBS8XdQcM6JTx4
         Su9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ek2VgBZSEUhsHoq0ulLUZO8m4E11em2LrnTPVGX8cKU=;
        b=pMN7hLYwYN5wYyXZ8CWSUilfWm5HcJ8Glx1eLsACsK3I706hAoquaaTQGLOQzML/B/
         MjtcfdH7559YNSbqHM881ikMxxuVSSnKahdC3rZsngvcF7hCio3VNX3upEVwPEyLF5CT
         65NsCcDv6uEMuCQtbAtw3/wV6uHSxOW3vXGdOCwSgt9k/C8hGP5E3qc/eDMbiMmdhNHN
         4KtFu+njuuYrg39Urybwjre4HLAYxaxOh7OqV9R17S4spgnJSn2XnR5Nb5c0cE7dGD9W
         YwKPxj7Wirnt60aFwYJuAw3bGRUsykWBZfQOG5XVBCZLpCWhZLfgCXzqaESNqCe9rF1A
         6Qlw==
X-Gm-Message-State: APjAAAVAkqS8zf1TUxGA8n94Jz/CqIE4aObPYqwyuZ8PbTYN747VylUv
        /pJcEIepaWYiGSoh8177MjYZXNdq
X-Google-Smtp-Source: APXvYqzi9o7rkUHTrluApv5L7eAIuzp/dlrVNYw80v4ZzAS0CgnQRApPzATj9BlUfE9JuSNbgV839A==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr2687083wrr.341.1573480072103;
        Mon, 11 Nov 2019 05:47:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:51 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/9] simplify parsing of specifiers
Date:   Mon, 11 Nov 2019 14:47:38 +0100
Message-Id: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These patches, hopefully, help to understand hwo the parsing of
specifier works by making slightly more direct.

Luc Van Oostenryck (9):
  spec: process chars like other integer types
  spec: types[] is indexed by the specifier class
  spec: add '.class = CInt'
  spec: improve parsing of __int128
  spec: KW_SHORT is not needed
  spec: KW_LONG is not needed
  spec: s/size/rank/
  types: use llong instead of longlong, ldouble for ...
  spec: make ctype_declare[] more readable

 expression.c |   2 +-
 lib.c        |   2 +-
 parse.c      |  47 +++++++++++----------
 symbol.c     | 114 ++++++++++++++++++++++++++++-----------------------
 symbol.h     |   4 +-
 target.c     |  10 ++---
 target.h     |   6 +--
 7 files changed, 101 insertions(+), 84 deletions(-)

-- 
2.24.0

