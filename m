Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC60219474
	for <lists+linux-sparse@lfdr.de>; Thu,  9 Jul 2020 01:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgGHXl7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 8 Jul 2020 19:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGHXl6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 8 Jul 2020 19:41:58 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD31C061A0B
        for <linux-sparse@vger.kernel.org>; Wed,  8 Jul 2020 16:41:58 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id dm19so338263edb.13
        for <linux-sparse@vger.kernel.org>; Wed, 08 Jul 2020 16:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wf2Yy4DmjFFHq5SjBrxJiOKQUplTtt8zAP/eO4WRvqg=;
        b=AK3FX07Zy/spedDKvhkjruYUgtdRsxg46iaQnf496hSkGmxyILKfS8fiijtPyjN+gz
         YBSeGJZqziqY3D6tNnrsltNWxJ9RQezP1hU9fzXhWGjqB6y/UWDkXxD9xDa9rIAa1s+S
         xpxtQ4Ht1pOasP5WAv3cIG1IugmXtMD/ZM+cu8IsPoWudQpfzqbJAwThO2huXYokrq3F
         PMPb5HJgSycqUxzQ8AfDUX2LV8+Gd2E8n9tZtfR2ul6pRbs6LWGrWcy1EnvE9MnAeK6d
         y49m27zqkb4D7/rlkEEhQAe4bHf3e+sDH8caR3/rnr7b9QCtmCB9OhuUkds4Jf/8ayZc
         jUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wf2Yy4DmjFFHq5SjBrxJiOKQUplTtt8zAP/eO4WRvqg=;
        b=V2ir51W97GLPOZrMIUNg6OD/lVn8KWbTzy7uGsCUExyxkKHgNVzoW40zLN96NVC7fx
         aWd4PzAFSWig7fIs76h3pULidHxzAVSpRZF3uEtDWUHiuE+KRmniVETvAlKHmwBJdmIk
         droOcwrNTPtsCgndjVWwwKDDQUML8WJsmWHoqqE++Kd2jblsifRUWAZ8rfrtrLNKmR/Y
         wM9SPIIrT+AcgIc/ah/SpDJpbL9a9OhoScjgQ/9bg02I8VYAN9/jQKPcM0TdKWZhAnHj
         ftJegvLh0oSDODKzpP9yj0nLBY6h+LxdIkbwrR8VXjAJpJDBCMGcPweU2g64JASH166c
         XCQA==
X-Gm-Message-State: AOAM5302vo/hvujdh1RYYgRKUYxjOkrr+lM19nd0qmqmgClJrAAHCTIm
        ZuzCunZN5aoqdA+mod9V89C9jbRT
X-Google-Smtp-Source: ABdhPJyu+9k5yuOOX3aSUAO58s8zbZKSW2Z18u0ZP4SIDaLN8wQyHiaWt+lG46An1MBnCZ8PQsxjiA==
X-Received: by 2002:aa7:cf94:: with SMTP id z20mr71244724edx.82.1594251716643;
        Wed, 08 Jul 2020 16:41:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8478:3ba8:10ed:37ab])
        by smtp.gmail.com with ESMTPSA id z25sm616464ejd.38.2020.07.08.16.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 16:41:55 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/9] OS-specific small fixes & cleanup
Date:   Thu,  9 Jul 2020 01:41:42 +0200
Message-Id: <20200708234151.57845-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series contains a few small fixes concerning OS-specific
predefined macros or builtin types. For this, a new option
is added: '--os=$OS', mainly to facilitate testing but also
to avoid duplicated definition in cgcc.
Finally, the now unneeded arguments are removed in cgcc.

Luc Van Oostenryck (9):
  x86: reorg the target file
  arch: add an option to specify the OS: --os=$OS
  predefine: add __linux__ & __linux
  predefine: no __unix__ for Darwin
  x86: fixes types for NetBSD & OpenBSD
  sparc: char are unsigned on Solaris
  arch: add predefines for OS identification
  cygwin: add the predefines '__cdecl', ...
  cgcc: remove now unneeded options & defines

 cgcc           | 32 +++++++------------------
 machine.h      |  1 +
 options.c      | 11 +++++++++
 predefine.c    | 38 ++++++++++++++++++++++++++++--
 sparse.1       | 10 ++++++++
 target-sparc.c |  2 ++
 target-x86.c   | 63 ++++++++++++++++++++++++++++++++++++--------------
 target.c       | 29 +++++++++++++++++++++++
 target.h       |  1 +
 9 files changed, 144 insertions(+), 43 deletions(-)

-- 
2.27.0

