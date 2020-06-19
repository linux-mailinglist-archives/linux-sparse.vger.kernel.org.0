Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2BB200E02
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 17:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391088AbgFSPEG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 11:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391097AbgFSPEF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 11:04:05 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1A9C06174E
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w16so10536273ejj.5
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D4lKxN+pjUdVzQyVVZGlx9xbvJI92Vd/XGeUrAK4FRc=;
        b=WKRFtvLdTspPP8uYVy9sWEpOwi870RKRYaqO+1tAEZiOu4tED8i6j3cPx521T2fGmu
         dgJQWNx6Jy4wGCVAKC4lSHISEMskV3CYVGu80cGfZSsE25J68yc0QNFMiBqE3BQof6jZ
         VF2e1XPHjW1kN9EYknSPXlCCum1yNtPFLgRScn3qHLfVctnTQ+L+eAJsjoFWLGalauKd
         pG0d7gb2cW9fCl3TeqpIrFXkW0AexoiTNnLLMWeGamObni4NspzQWgvYHq+Sm3+d2rb2
         Fa1nshsaFoCG2YZNsHtIZGO0MEc5EoripNTXimLpFo7xQ+PscMjRUXjIw2pfY8FCfEgQ
         YcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D4lKxN+pjUdVzQyVVZGlx9xbvJI92Vd/XGeUrAK4FRc=;
        b=H6jmw/jkMcct2FDPjRwQLk5p7FY60giJKTfvHapswU96mK6pbkykr4cUxCm5el2GEj
         5z8aLpKK7T95XBUpSqSCWFM0R1GS3qknzh142pZtyESBLaF8mTMgMc7WBbTOjHAndKai
         1ebVD3XevGIq8wab6KORYSovqjCgdqBf8+M70rL9m4/2ZGEACLGWnRNjWoavxkNyDYle
         Ojty76jeqpTx45As8JStsOoqOTRE/Nq3lDNSWZU1G6cqqSINw1FNk+GjyypcYtVmGl8R
         KUcFuNVPN3x97/00L4MVBEjbHYcLRfw2BmS2gwvdbkf/kUn65j5tsnjCsGl+IgnmStHe
         iu+A==
X-Gm-Message-State: AOAM5301u+UtBJjgcbhKMKHDCgYSfto+D5ZARF4CzdusT5bOyJMEMz1y
        taXD7KK/d/QhANWtXkCDOuNcXWlc
X-Google-Smtp-Source: ABdhPJx49p5r1sX5OBql/xJ0H13OZjekxL/puYuK4nqP5hl/43L3Fw3paHWzj4qzYdLd6mFuCtPmKA==
X-Received: by 2002:a17:906:a88a:: with SMTP id ha10mr4190466ejb.353.1592579042763;
        Fri, 19 Jun 2020 08:04:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5db0:70:8732:dad2])
        by smtp.gmail.com with ESMTPSA id k22sm4852307edr.93.2020.06.19.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:04:01 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] Fixes for generic selection
Date:   Fri, 19 Jun 2020 17:02:55 +0200
Message-Id: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series contains:
* the controlling expression must be lvalue-converted,
  array-to-pointer & function-to-pointer converted.
  These are the rules following the resolution of DR481
  and are also used for C17 (and are followed by both
  GCC & clang).
* validate the type of the associations.

These patches are available for testing & review at:
  git://git.kernel.org/pub/scm/devel/sparse/sparse.git fix-gensel


Note: A small inconsistency remains: a plain char
      will match a signed char or a unsigned char.

Luc Van Oostenryck (5):
  gensel: add testcases from DR481
  gensel: use temporary variable in generic selection
  gensel: controlling expression must be lvalue converted
  gensel: controlling expression must be pointer-converted
  gensel: validate the type of the associations

 evaluate.c                 | 33 ++++++++++++++++++++++++++++++---
 validation/generic-dr481.c | 17 +++++++++++++++++
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 validation/generic-dr481.c

-- 
2.27.0

