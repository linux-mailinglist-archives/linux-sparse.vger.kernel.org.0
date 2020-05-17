Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1409E1D6E05
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgEQX1Z (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQX1Z (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:27:25 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B19C061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:24 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l18so9712370wrn.6
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YjMf5XVQ16+lHZ9xAwJ5qVYioMneVGlZ/E4nUa7gHCY=;
        b=UcP7ZhrI2Mpf2fbAq/Q4lzWzPK1xcKQrOynQ99knlAlunVr3phdJTfGKyC6hg2lLMc
         efBFINlJ3ZU3kRlFF5pI6oVGsOHqqsZckaTAAcEYsbr3nba6NiweCRJNfWH/9w8Mgwj2
         mQUqOP9VWdXEzQ8wAHZmp2hjEPpYxsudBZkDxmX1oqTjy51VFwBLBtTG20aQWd8uo7x/
         uIX0u676HcR9/90owYnxlopbYAYIxnr8NzXQpU1u/s/57M29KshirXyWFWDll4/cX6oC
         +rYhZkgqnT3MvR3aHWXi7G5rvhBbhpOyLXmtUcbUBP80HzFqVCr17raeMwYiBuqNRSsO
         Q0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YjMf5XVQ16+lHZ9xAwJ5qVYioMneVGlZ/E4nUa7gHCY=;
        b=oQq7KrqlVb+JEVr3R9qm15MSXuOwjkaQxvmzbvrh7UTPS4mbpjQFlzv+Q0F6WB5VeF
         G66SruE8QxHr0VxNi5hUn8g9nco9rlOGJhWgJPuDVCVdNbOcfiT8+30x03GHYaI1iS09
         C6y1ojxuK5O+a+qy2mrXYQlykpkzMh/z+2jeWcJTkeBbDh9IE/j39BlDav7TgDuXqV/O
         TorkuictK8DGogh8uMt76/LXKQRRzJoW6HBlQrXP27QqahF7FIjM0+WpkNKU/OFtLUKc
         mdg+SmIfyRlCKPbrP8ZGl+3A4Ab528oP10h1hhFg1FaDCU/TSKk5bB7isUC+Ptq9ViOH
         VtSg==
X-Gm-Message-State: AOAM530rdgB+ps7hNc/9ygxUq1SHbc2Xb3ocN7EVljjn8dpyA+LIGzU3
        WkKe04HpE/8y/A3uXqLy81ogA7wH
X-Google-Smtp-Source: ABdhPJy8wHqy5e1oLdy2IyjEbuQu9fti9G2MKo5Y85fsY9MjosHk63Wm9iCDdHoYTByUibSiaD/XFg==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr16284824wrt.322.1589758043055;
        Sun, 17 May 2020 16:27:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id d9sm14056278wmd.10.2020.05.17.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:27:22 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] documentation related updates
Date:   Mon, 18 May 2020 01:27:16 +0200
Message-Id: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Fix the doc generation with recent version of Sphinx,
fix the warnings in the doc generation and update the TODO.

Luc Van Oostenryck (3):
  doc: do not use obsolete sphinx.ext.autodoc.AutodocReporter
  doc: fix the warnings when building the doc
  doc: remove done item from the TODO

 Documentation/TODO.md              | 12 +++++------
 Documentation/nocast-vs-bitwise.md | 34 ++++++++++++++++--------------
 Documentation/sphinx/cdoc.py       | 10 ++++-----
 3 files changed, 28 insertions(+), 28 deletions(-)


base-commit: b8fad4bcd02210912de8cbdefcd77e9ca743a575
-- 
2.26.2

