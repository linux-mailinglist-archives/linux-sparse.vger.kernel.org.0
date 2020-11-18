Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596E82B865A
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Nov 2020 22:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgKRVLx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Nov 2020 16:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgKRVLx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Nov 2020 16:11:53 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF119C0613D4
        for <linux-sparse@vger.kernel.org>; Wed, 18 Nov 2020 13:11:52 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id f20so4788562ejz.4
        for <linux-sparse@vger.kernel.org>; Wed, 18 Nov 2020 13:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I35qsUloKwjziM/JjuHaQllo0jniToOTDp//6SsA8NA=;
        b=aM0OGeBpaOq2EFCZ1tphzYRR8jyD3YmOW7SC9lYchZ37bkw9TGaf1O4NRC+9leNEl9
         dh74Tc2Bzl4qXnCrJsOEhO/8GkKgwJznmw84ogPDbiNQph1KUU/Ql5KInlmmP8HAx/HI
         SZjcbhq7U4DJO6TrzNjZ8VarGUGNyJCj9TU4XI7qqhD3welFy4XFP4PzY5DsHp5K95M9
         5HJaga8crfr3XGSggbAJAj4m9KjOjS1LFcd9p8S9qqxMifTRXwjh+JGiFZohyIxGumoU
         xp8vWFMSBZClUeQuCrxypJvl667tEMCAzOqf9cPMrEvKWbLglRJ7jLihLBCYzAfpj7KG
         CHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I35qsUloKwjziM/JjuHaQllo0jniToOTDp//6SsA8NA=;
        b=dr15Jv7yqM8cpxcVjd8HnYA36gTF+muikvF1iK4Lr+8hXzoBoehELTZiG0ix8cZdMP
         6gtX/ty0P13sN1J9l3YInyMmItAUqZLeE0w3SJGJOHVn4L6gJ0sKi/bR1VmKWory9bqO
         LQNIbIUGOO9PqVm8N3OjTWoGilr3ZREQFrs3rvKtzpERrR557VtSpbCW7wkFnga+g80T
         p+wXacw9MLpiOOCzoovthSbK36w2Gtfoz7uOT492x3BzPVJujsZiDgCAifYUqg03anBy
         kVgsPIx+cQoyrIg3RTmv4sI8eagZzxYWPh3oNtawRU+IhxFCAqPJjKuaLIgq/4ublpW6
         4TqA==
X-Gm-Message-State: AOAM531fVN+4pZ0V/skR0gYLOvMrqO8HsRLM9SVLo3RV30/FFN41R6NF
        6ID7ReSxhs6R83CqZeWSyGqdsbLNato=
X-Google-Smtp-Source: ABdhPJxVf/qClazSshyoGrya06CGJ34FB9EZaVMXpom1WU85et/wHPRhh73nJK8TTZZx4b5Swg8S9w==
X-Received: by 2002:a17:906:dbd6:: with SMTP id yc22mr5136038ejb.252.1605733911177;
        Wed, 18 Nov 2020 13:11:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:491a:3e51:301b:6e24])
        by smtp.gmail.com with ESMTPSA id rp13sm13510712ejb.79.2020.11.18.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:11:50 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] fix qualifier dropping 
Date:   Wed, 18 Nov 2020 22:11:42 +0100
Message-Id: <20201118211147.10680-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series fixes missing qualifier dropping in comma and
statement expressions and superfluous qualifier dropping in
increment or decrement expressions.

Luc Van Oostenryck (5):
  unqual: add testcases
  unqual: unqualify_type() should check for null ctypes
  unqual: comma expressions should drop qualifiers
  unqual: statement expressions should drop qualifiers
  unqual: pre- & post-increment/decrement should *not* drop qualifiers

 evaluate.c                         |  9 +++++----
 validation/eval/unqual-comma.c     | 12 ++++++++++++
 validation/eval/unqual-postop.c    | 22 ++++++++++++++++++++++
 validation/eval/unqual-stmt-expr.c | 12 ++++++++++++
 validation/eval/unqual02.c         | 26 ++++++++++++++++++++++++++
 5 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 validation/eval/unqual-comma.c
 create mode 100644 validation/eval/unqual-postop.c
 create mode 100644 validation/eval/unqual-stmt-expr.c
 create mode 100644 validation/eval/unqual02.c

-- 
2.29.2

