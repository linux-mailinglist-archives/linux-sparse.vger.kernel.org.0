Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F2A214637
	for <lists+linux-sparse@lfdr.de>; Sat,  4 Jul 2020 15:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgGDN5x (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 09:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgGDN5w (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 09:57:52 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7E0C061794
        for <linux-sparse@vger.kernel.org>; Sat,  4 Jul 2020 06:57:52 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n26so23419504ejx.0
        for <linux-sparse@vger.kernel.org>; Sat, 04 Jul 2020 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1CMVvnYD7d7dx8lSLsXGg9ppSJEyuO03qJbqB/U3HM=;
        b=Da7Kkqs1TG6H9A0aJwfECCOe0nNzsJU1cZ1b1UxQyUrejDqjxoPtrKphwdUYcjc7sY
         LjDaO8d3zeaOEv+1r3z4ULtJjvOVeqw/LleiShAhrFlcO4PZYwK07Y75MhCYPrTsFhzX
         ih6l6MzoCyrSyOQ2eZOU3vJMByQ+4CdpHfr1ecPTS+gj3RfHMs6wGfVHE0S0sojgj5hx
         xTkyMiptVIsMGVpkyYQVrxR7FHKwqAvoyymYQ37z7QTrkxnr6C2VvzLKP/shqdnsI5CS
         RZhu5/xhoBFwYfFQmtmTO/qUjujuglGBVBlB5q0KZyrM1r3mIcNIcZGr2RgtWVY1ckhQ
         2ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1CMVvnYD7d7dx8lSLsXGg9ppSJEyuO03qJbqB/U3HM=;
        b=mtT5aA9xsQEFLqQw3sKkmGlgz/n3ZSkt5XoOUW7NE+mqZZc7Kyj7hitXNW4LIjs3hs
         mor57SEyTgmZzPvuO6BDH4BIOxBEwfDgvIlO6VRF8kO/lEt0PRDJX7F6Y0Mz8EHF60wA
         x6A1VN3KWn9O5bIpvvxNk6PGPFAFY8YGdaWnTZApc4GXydbdweJEH2Tvk1YqeJLNf7xT
         ftKBtOOrc0/2KrkcIyLDBSI0wINZORTkXOYJjcH9uooE1WaxDFEldo9AySj60LOrtQfK
         qu9osc4LqY1m7BEqCQjZvzOAxr7h81FZ2iIQuIxG79Q28Ag8qhN77Ozg8hyQuGYbIjcN
         OrfA==
X-Gm-Message-State: AOAM532hpINWrp4WDIwe2Yg0YJda0DVK6kyz3XUw+Zi8MDQqH+VAZlq7
        odqflcNOUDYcYO+74g311lnqCCoE
X-Google-Smtp-Source: ABdhPJwogwQ33B+swLMmjuRGRKRgAie1Ss+UMEBurxdNry3gSZLLd6TrDfHssBT2E+JdVt0YdD/+KQ==
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr35478171ejb.405.1593871070931;
        Sat, 04 Jul 2020 06:57:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:41c2:9e8d:5955:8578])
        by smtp.gmail.com with ESMTPSA id w18sm16348297edv.11.2020.07.04.06.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 06:57:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] teach sparse about arch specific asm constraints
Date:   Sat,  4 Jul 2020 15:57:44 +0200
Message-Id: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When evaluating asm operands it must be known if they correspond
to a memory operand or not. This is done by looking at the constraint.
In most case it's enough to look at the common constraints but
PPC & S390 have some specific constraints for memory operands.
Other kinds of operands may also need arch-specific constraints.
    
This series adds support for processing arch-specific constraints
and let sparse know about PPC & S390 constraints for memory operands.


Luc Van Oostenryck (3):
  add support for arch specific asm constraints
  add memory asm constraint for PPC
  add memory asm constraint for S390

 evaluate.c    |  5 ++++-
 target-ppc.c  | 13 +++++++++++++
 target-s390.c | 13 +++++++++++++
 target.h      |  3 ++-
 4 files changed, 32 insertions(+), 2 deletions(-)

-- 
2.27.0

