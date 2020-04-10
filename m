Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF991A4A03
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDJStb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:49:31 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:45745 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgDJStb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:49:31 -0400
Received: by mail-wr1-f50.google.com with SMTP id v5so3240057wrp.12
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8nXbGMF+h8vcgBKdd8PjpOnsuvA8ZJ2s1hFln8O2CU=;
        b=nw8Tgt8MV5KKjv/ryKBxF8bVsjXGhuqPFM0YF08twcF49RCv+CqlfCY17RH59zfq0c
         BrH3RScUoEPeAiylk/YyP7Z645IPi3FswcxHG+9ENVk5zRRCX2RzpMPmxRLwU/SPHgue
         +UFHt1LpY57tYEGXt0nhZnJaByLMyXmolBTEUAamRy7USTTG+4gNy2IriXlD6lhOznI/
         nWllh4gnQrmrgTg52wOwVrZ8o7oB36CJtvixrAsUHc5vJl9+FzMFTz43jnWxqLUDUxPf
         FownX3psXjwKHDEp2tvmcnuTvLfPl8hw7lRV4nsUw2a8iuLzB88CWkfKWB8u7dgBUg0E
         YdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8nXbGMF+h8vcgBKdd8PjpOnsuvA8ZJ2s1hFln8O2CU=;
        b=lIZCBx7ylc1Bd0EG8MxchOng6pIZfD1rBP/fY0TM0U9vbutb6GJPvRnevyv/iZcJqz
         eBMLEySU6G3h/7VF9nRFjZnN9W800ZUUJqQMw4FdJYbhrKg2+eHUlyicnym9D3bF8T6k
         TlqchvWVtzMe0UMmrFkIxlmnYvjzSEbrFyMizlexMhpK1gJb1643uno1b4/rko1BuhW6
         syuQCvPZUTMEH2TzC5LGWAW9fRBcNnLn4pSUPELYyBQe765iTcJYp5PADG5S0i7sw29J
         LkH6GklyDzAK1/vIZHiH/06RSY7sfL7EQjSmsaN276PRwyv3KtRknTZfeNRNpqTDYjXu
         xy8Q==
X-Gm-Message-State: AGi0PubJRze9VDHb1Vpi9wzVj97/KCl1Pdu/4Wlk2VyXkl4FQToETuj8
        B+Vr1N5FvkTUmB7qQW8SiS+9o5nE
X-Google-Smtp-Source: APiQypINVi5KJQFgBmABiB/o7RBghQnbOlyeFB/DnshUc4YwNYDR9jNKfJpyIVsTJdZ9vsuIj50KHg==
X-Received: by 2002:a5d:5226:: with SMTP id i6mr5756231wra.257.1586544568044;
        Fri, 10 Apr 2020 11:49:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id u16sm3935364wro.23.2020.04.10.11.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:49:27 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 0/5] detect invalid branches in the IR
Date:   Fri, 10 Apr 2020 20:49:13 +0200
Message-Id: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's not allowed to do a goto into an expression statement.
For exemple, it's not well defined what should happen if such
an expression is not otherwise reachable and/or can be optimized
away. For such situations GCC issues an error, clang doesn't
and produce a valid IR but spare produce an invalid IR with
branches to unexisting BBs.

The goal of the patches in this series is:
*) To detect such gotos and issue a sensible error.
*) To make the IR somehow valid. Since the original
   expression has been optimized away, the IR replace
   the goto by a branch to itself.

-- Luc

base-commit: 79f7ac984473d031dfb9cef00119c2d542d0d4a6
-- 
2.26.0

