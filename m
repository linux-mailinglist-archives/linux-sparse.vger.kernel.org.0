Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51ABB23FEB2
	for <lists+linux-sparse@lfdr.de>; Sun,  9 Aug 2020 16:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgHIORi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 9 Aug 2020 10:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgHIORh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 9 Aug 2020 10:17:37 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2483C061756
        for <linux-sparse@vger.kernel.org>; Sun,  9 Aug 2020 07:17:36 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i26so4582046edv.4
        for <linux-sparse@vger.kernel.org>; Sun, 09 Aug 2020 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h5pLLrhUVzNVRDWSVdmmZd3G+EKSPtQPOgRoVKNkDI8=;
        b=vIsJ2detG4J3dH/8fQWRWJ9dDWEolm1ZVKcDjiWBCl1aKoRKlNJZAkOI7/Dt0DRTb+
         7KEbRoREdo88Dr8p67USWOlBv7+hIlGTTMf6uICNmCTsaUoXZc5A+pOJzxAzW6Poli4H
         3hAUFdh6tEn+YGsLPPt5R02s2bogN78nEOMaDNbsA0tVy3TlRkgA5dpshwOOBBUCe6Ve
         hRI8AQVxChfQOeCStVkpPIuu2h1OCIvAlIhnsuk0Hgf28gCbq3uE1mwlKESDjOXhQ6Zd
         Aj77q/QpjJbcu4dWv5nbXOIJXwMJM5b542pvixSCoxJ27AoEazw09c+emvn9Ydt7R1YL
         I1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h5pLLrhUVzNVRDWSVdmmZd3G+EKSPtQPOgRoVKNkDI8=;
        b=JtZWR85NYp8+v1VgH3bvQ0SwXQDKQu9T/3yXDvAn7lffxbRNfqBNamcdOLg9wxL8Hn
         Qudl8f5g3uwZkOZ+9HxyyRQ/coO0BNLJjUebSN78knryQsXMfmD2R2F27kw6wohiQJJg
         JORtXZ3tFhdxXBLxGCqFm8rPWgUE0j2trPC/HOCa3vFsi3AVU7pWtH2IOjYpTStAIhL2
         YfIysoM9uQCqFaHO+Wkd5QCX4eE+6aox+xNToC6pjnVkRnyxXaEdIY/4sen9jhW7BG5n
         WZJDrD2uCRUQU3cRMCdePMV6VG3qomlExdZGgAvo+cnXBDnIko8R3vh6eWj9tSaWz/Ps
         i7Mg==
X-Gm-Message-State: AOAM530RDBHJxXpvc+qyMRnuj0coQgfWZ9RijdK2YDoJ6O9tOhh1KXo/
        BsyeDRdvT/cz8DuLGl9WFctqkW36
X-Google-Smtp-Source: ABdhPJykO0o2mjjY16KDuVZ/e28+mgM8hfTeey6Q3A8S5LwoC6rh9IBVu1NqCenIfNvEMAxzdaVxrA==
X-Received: by 2002:a50:f687:: with SMTP id d7mr14901989edn.306.1596982655025;
        Sun, 09 Aug 2020 07:17:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:a7fb:e200:788a:816d:ff27:8087])
        by smtp.gmail.com with ESMTPSA id p1sm9917956edu.11.2020.08.09.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 07:17:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] improve presenttation of the documentation
Date:   Sun,  9 Aug 2020 16:17:26 +0200
Message-Id: <20200809141731.32433-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series contains a few small improvements to the documentation,
mainly to the sidebar of the online documentation.

This series is available for review & testing at:
  git://github.com/lucvoo/sparse-dev.git doc-annot

Luc Van Oostenryck (5):
  doc: replace nocast-vs-bitwise document with its lore link
  doc: simplify the toctree
  doc: add index to the sidebar
  doc: remove link "edit on github"
  doc: shorter title for "submitting-patches.md"

 Documentation/index.rst                  | 29 ++++------------
 Documentation/nocast-vs-bitwise.md       | 43 ------------------------
 Documentation/submitting-patches.md      |  4 +--
 Documentation/templates/breadcrumbs.html | 11 ++++++
 Documentation/templates/layout.html      |  8 +++++
 5 files changed, 28 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/nocast-vs-bitwise.md
 create mode 100644 Documentation/templates/breadcrumbs.html
 create mode 100644 Documentation/templates/layout.html


base-commit: bdf3eca7298e5d57864c83329e979a7746d7c130
-- 
2.28.0

