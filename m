Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D586FD266
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfKOBZV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:25:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37621 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbfKOBZU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:25:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id t1so9154576wrv.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PUKvRcOWxylNLYKJDVay0ZzoX8PBNB3XWCJtQRtlq64=;
        b=sTtzQIXy32i9nxtmsRM1z5sQ3lARnuU0Rl7Qk7sPEWVj2koDyVmDICmUO0+CNbQAqN
         Dl0DP4Y1TOvrqKoc0wUPzqZKh9pSbqdFaRQlF3RtPwnL3RQZx7Omh2tvzrCkwixweRcF
         mqP0phrZkCzY1OFqJaIqreMa1y8WovC+LLDJJ3Nw/X1p9ux34NqrBG1J9tBKQR6nm08Z
         mp5Ib6BbZ5VAoxWgS8dWGqWKsjDrLGX5ugl6DJF4Z+KOTZennDLTrruJLEZpawH0fQW7
         T9aZ1CHQYFZ8m7joG6xPsF++JH050G0zoz0TTbrTTaOFsa0d47Hf+XA5wyjLpnpNFQ5h
         vUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PUKvRcOWxylNLYKJDVay0ZzoX8PBNB3XWCJtQRtlq64=;
        b=RkvyqNoND7kFXkI9y0kSSM3Bf8KHKgc9Lenmd+bNlds4mfDiBPtX5QIFHwPFtT7oF1
         neXME4tJW/MS5ELCIfVMYFgft7JDSRrp2RO3AxycujoU1rRLqaMKeXKRj/ba+Mh2aL1u
         Wg/y4AA9YD5HMvibtMZzaz+5dBKmofAzBl94behhVTdr8fqbc8ZMwquXZhGWCBjKbEMl
         hV3nl0+gOP15hzEIpChO/+odxr5EvuCdEnF9Hbgm/6OkOFdN/mvwToz/LIb+9Y86xYpF
         E5mtxVyPIL5g5+tnRkXx6OOmVLIr2Ho8kjFEcu/InJvaKrsq2yZ7V5otaJLGr0Wz9enP
         bFmA==
X-Gm-Message-State: APjAAAXFeKVGt1Vfe00NMgVK2fb7PcN3WMqvJjSWR6nI3CgGiICbMwVU
        jCn49ZIVKSPgd6nY62yl4Eb3neq2
X-Google-Smtp-Source: APXvYqwJHgbAnIUAiw4a6Tg70eidrA/O83OklVJRkPsSDRbK8GCz63wYJNIrxlJ9IoWzFzVvV7V/Rg==
X-Received: by 2002:a5d:414a:: with SMTP id c10mr4362529wrq.100.1573781118519;
        Thu, 14 Nov 2019 17:25:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id j22sm10736216wrd.41.2019.11.14.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:25:17 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] make wchar_t be correct on Cygwin via cgcc
Date:   Fri, 15 Nov 2019 02:25:12 +0100
Message-Id: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Cygwin, wchar_t was correct on a native build but
with these patches it's also when used via cgcc.

Luc Van Oostenryck (3):
  arch: keep cygwin specifics with i386/x86-64 specifics
  arch: teach sparse about -fshort-wchar
  cgcc: let cygwin use -fshort-wchar

 cgcc                          | 1 +
 lib.c                         | 2 ++
 lib.h                         | 1 +
 target.c                      | 9 +++++----
 validation/arch/short-wchar.c | 6 ++++++
 5 files changed, 15 insertions(+), 4 deletions(-)
 create mode 100644 validation/arch/short-wchar.c

-- 
2.24.0

