Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A194E214C84
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgGENCa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgGENC3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:29 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B82C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id w16so39593361ejj.5
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8rVTSNT7qSNBYYU88eXlRO+5zGsWfOE96Txo5lXfA0=;
        b=FipFcDHTIBD93YyDYVmLxvLL2nWHwpKiaRFPQ1nfZG8wdSbOUZSV+tzyphRUP213sE
         q6UG1tEbi4+UETdmO1bhsma3B0tHNtzymbUq1sbT0gVNiTj4siqAfC+DUvDC3voo3H+y
         NHaCTX5oO05L6iaB8cgnKocW/qfk+CTNQA1BykxGLsQ2rHY3b5FFhp8ztKSsTHMrjde5
         Pn4Zo/xkQVvE02gaQ/sXUapXJYYiLzTKeuSn0hS2RwoNi3ddi3yAutoPMGw6FD4EmrYT
         aac/0wdIBz1xQz5DiZsLkJw4qUeatVQgZO101gWiBqDH5lr91FzDNY3G8fHJVNceK5ZL
         BgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8rVTSNT7qSNBYYU88eXlRO+5zGsWfOE96Txo5lXfA0=;
        b=Y+INxTqSP01CCTH4L8t+6NxWYhlcm9UqVakZ7+dLwFi2Dw0oBuictgFsFjW3yj73AC
         DZei90Mc8R4uWw5M5dsMMSe1ZOaJ0itRUAs5mkDUXFo/8DUBgnNpJUkEv/Je3JsHhFwT
         LfN9temwLdLp0x14VLxAI3nb8M9saFfdneZ8y5oIJsKeLXar8OdFa/VYTtwSlG8xZvqI
         +WUt88LpJaNS2oNfPJ3zoNVMIsNIbFsBmpfpcmYDoxqEP8z68xVnswq/ZflscTn1ZNXp
         z7I5lWG+QHmHx1D2vqxUMml5GbvmWovXl/3HlT0U1mlaDIQYKEMbubgjI+RZXNDoR/JZ
         MwNQ==
X-Gm-Message-State: AOAM533+XSHDDU2Aa4ab/8Yd/DiPaADfANVCe4luYxNykZi9E/bB8h87
        7xSkpqBTGxwpvVhQFzbsuluvtaaf
X-Google-Smtp-Source: ABdhPJzGK7WiJNLrzSfcgbdWoPxmw9JRycKPLIkKd7iX2XdzgFlUf/YgATJq/r3+8u0BJ89Yetcn4w==
X-Received: by 2002:a17:906:5f98:: with SMTP id a24mr38415520eju.241.1593954147774;
        Sun, 05 Jul 2020 06:02:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:27 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 00/15] tidy-up options / reorganize lib.c
Date:   Sun,  5 Jul 2020 15:02:05 +0200
Message-Id: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A lot of content in lib.c have been added by just appending at the
bottom of what was already present. As consequence, things are now
not well organized at all, especially when related to the options.
So, reorganize things a little bit here:
*) move all helpers on top
*) keep things alphabetically sorted
*) move options parsing in a separate file
*) move predefine-related stuff in a separate file


Luc Van Oostenryck (15):
  options: let handle_onoff_switch() use null terminated arrays
  options: move -Wsparse-all's processing out of handle_onoff_switch()
  options: move on top the definition of warning type enums
  options: make Wsparse_error less special
  options: handle_onoff_switch() can handle any flags, not only warnings
  options: move helpers up
  options: alphasort the handle_switch_[a-zA_Z]()
  options: avoid spaces between function name and arguments list
  options: move declaration of tabstop out of "token.h"
  options: add a small helper: handle_switch_finalize()
  options: move option parsing in a separate file
  options: keep the options sorted
  cleanup: move predefines in a separate file
  cleanup: move parsing helpers to parse.c
  cleanup: move hexval() to utils.c

 Makefile    |    2 +
 lib.c       | 1256 +--------------------------------------------------
 lib.h       |  119 +----
 options.c   |  998 ++++++++++++++++++++++++++++++++++++++++
 options.h   |  137 ++++++
 parse.c     |   38 ++
 predefine.c |  225 +++++++++
 token.h     |    1 -
 utils.c     |   17 +
 utils.h     |    4 +
 10 files changed, 1427 insertions(+), 1370 deletions(-)
 create mode 100644 options.c
 create mode 100644 options.h
 create mode 100644 predefine.c

-- 
2.27.0

