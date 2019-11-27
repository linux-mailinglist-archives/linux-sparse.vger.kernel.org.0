Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA6510A8B3
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfK0CX5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:23:57 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37617 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfK0CX5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:23:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id g7so4136055wrw.4
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vgG+NaxE94yghEVi90ejJBcsLHvO/zliSm0+97WYznU=;
        b=jBzXCA7+fcRDPTb7dXEzimDc2YK/ld0/aK8AdHS/B/cnUbZHHqBmsiCAsyOG3njuHe
         HcQHUZ8OVFvkPdymr+/1a+mG1SxxrwsT9Vgova5WlPbAAyDwDXIeNEaOwx0EmM/SZjsd
         sbBtXTDEzVRl35+CbDZWgTuDs6HB55zIQhxyQ/bPd7ho6KKBSeQzWm6j6pFLg+piZXrL
         8LuU+Q+vNKpQ54f+YcuA98oHyDPoVMZA3LudL5GyKCsWsFc864JTupcxevquyiBe4qHh
         rGney+JbzQQmXGW/kiu5G6PhKOAaYfNV2d4kaIWHBAxQro+daCzggH1VsC5J2gNwaq88
         oYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vgG+NaxE94yghEVi90ejJBcsLHvO/zliSm0+97WYznU=;
        b=EMUDybfRaxbAuyCgUQ+Q27J84spz9YN1zCRKfBbyvJcfGdii4KJw9AP7utYoeBCaIF
         Qnadv1mPlshyFG2XqpXHxuunFzCD/XAvnZ8Dy5xzC8768U4GYMZvBE9RK6J0qsUFVA56
         /RwDJ/zMk+Xw6PP6IoGu8ctQ5Fc/TA2ad7x2DLmB2DSshCMB4ZGa26VLHwxADAqwN3ih
         JynlMlen+WhqJpyR7E/6p+eNymDxa+lwdKCRV2f8d2427XUEI7f4hIvXxvZQW2/KMChC
         SDHaGOcfyPTszOB103ugln2de+sDVbE5NnSKRIQJ/4VVTzp3G4t0ScZ3MNg89JYP/8YN
         psHQ==
X-Gm-Message-State: APjAAAWdzY6RSEaVajNg0aRfswUWFObRjI11L9aZEYMhEbT7ID8UQrIv
        VGIjaCZFWb+OHERtdcpwIGOhPL7s
X-Google-Smtp-Source: APXvYqyIiNFCut3kSrVsCx3ZKIfOVT2pMSRa8tha/2ZJlTu1aOw/e9BDBkXiwxGedCca01mMEfgprw==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr42357130wra.194.1574821435474;
        Tue, 26 Nov 2019 18:23:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id c1sm16690920wrs.24.2019.11.26.18.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:23:54 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/4] More arch specific fixes
Date:   Wed, 27 Nov 2019 03:23:47 +0100
Message-Id: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These are small tweaks going on top of all the previous ones.

Luc Van Oostenryck (4):
  arch: add missing predfines: __amd64 & __amd64__
  arch: add missing predefines for PPC
  arch: fix wchar_t & wint_t for openbsd
  cgcc: add support for riscv64

 cgcc     | 3 +++
 lib.c    | 5 +++++
 target.c | 4 ++++
 3 files changed, 12 insertions(+)


base-commit: 28f3149490ea905dedbb892b5f7bed7078d3fd23
-- 
2.24.0

