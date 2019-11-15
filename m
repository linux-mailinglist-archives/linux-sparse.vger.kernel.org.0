Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0B8FD241
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfKOBOB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:01 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39030 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfKOBOB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:01 -0500
Received: by mail-wm1-f66.google.com with SMTP id t26so8571806wmi.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/4Wjh8c+TwthyN3Ikj/okFfcAfDv0lAsmRCBhNtzSa0=;
        b=KuD3Bb/EgpRqen6d7A09//YZAL3lj1m9DXjGbckIKR+uz1d88wRoYZ9OwvWnuy5EuG
         NyxuBB2Kv5E6bKEN1YnohsiwUmc5effIYdnuotaxvdlvJr7u04yIPFDwOYlVLeh9qp1N
         wqFpyfRA0gBiGRebNTFOZjmtUf8HmZWsRRJt2JQv5CYg5RCERMN0Z/shrpZu/a6jAupd
         n+b6alrU/QUGIIMjAZcfnuscmtfBSW/Vsw8ZacO/XKlLA21+bYlbEDyciXfQofO5oo3Y
         TmR7hWPGV+01/hjkwHoqbIqHLYyY2fsy4Q4ap5nD26L4J1gyDus9LatSAUIGON5JWAQ4
         pz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/4Wjh8c+TwthyN3Ikj/okFfcAfDv0lAsmRCBhNtzSa0=;
        b=WB+H8TMsLe6yKpZvPMtVQ3jaxiIx78Qzn1A2hZPhAQ2DZaJF1k5lLluShibX2olG2w
         cZd3Uq+2jGcMuxq9wzwuqvxEJrbhBkvt4z/jEekR00G3h0xULI4wAjwk+r/fm56LvDia
         iMVc8gfaI3i4mXU+5x0ixQztLgRwXHNbyt8Hl/8gxWhOZHtrnLxAlR64GrXTC8Glehl2
         rlFVkmReb82GUfYr0idyWAwY+KGsXKpbt8nRzYwtmeCCqlkWNpdFNDqukCIDq/VInHq9
         AJU+bjzmCP9Nckbxc9EA0A3oQAAUr8IaZq9QRF5W9h36ZdqqNA3omYUKmvcTszvRIqSn
         8dbQ==
X-Gm-Message-State: APjAAAVLMzpNIwq+g18maP9Xwl5GFSv6HyS0ZRPnnrRol0/8DDoiSQFK
        RUkHGkgrrfzCxUSASPT3MohvNDhn
X-Google-Smtp-Source: APXvYqxvS1aMU8OE/trHoIySR5np6Tm1MWPsLGQ5YF2oG+3HS6LDGYjyXN/V3qu0VH/uQ6CwBN4gBw==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr11835271wme.115.1573780438822;
        Thu, 14 Nov 2019 17:13:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:13:57 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/8] Miscellaneous arch specific fixes
Date:   Fri, 15 Nov 2019 02:13:47 +0100
Message-Id: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These patches contains some fixes for the type specific types:
* signedness of plain char when defaulting to unsigned
* long double on ppc32
* char32_t
* int32_t on ARM
as well as simplifying and moving around some code about
these arch specifities.

Luc Van Oostenryck (8):
  arch: fix the signedness of plain chars
  arch: simplify i386/x86-64 specifics
  arch: keep BSD & Darwin specifics with i386/x86-64 specifics
  arch: do not needlessly set bitness on 32-bit archs
  arch: remove impossible cases with 64-bit arch not being lp64
  arch: ppc32 has 64-bit long double
  arch: char32_t should be the same as uint32_t, not uint
  arch: arm uses long for int32_t

 lib.c                             | 27 ++++++++----------
 machine.h                         |  6 ----
 target.c                          | 47 ++++++++++++++++++++-----------
 validation/char-signed-native.c   |  9 ++++++
 validation/char-unsigned-native.c | 11 ++++++++
 validation/char-unsigned.c        |  2 +-
 6 files changed, 63 insertions(+), 39 deletions(-)
 create mode 100644 validation/char-signed-native.c
 create mode 100644 validation/char-unsigned-native.c

-- 
2.24.0

