Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB9D6E7B81
	for <lists+linux-sparse@lfdr.de>; Mon, 28 Oct 2019 22:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731743AbfJ1VlK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 17:41:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43653 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfJ1VlJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 17:41:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id n1so4001025wra.10
        for <linux-sparse@vger.kernel.org>; Mon, 28 Oct 2019 14:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSS3zS/qVILSQ/ATbfcMUIuzQ9kmFjd/mtUIz6e0ohE=;
        b=KFJu00YZTFbtGwKzEW34hetliLQG493s7cqUQDXj5L8/dRDqI6hjYw7C+tf6/Z7l8L
         6ORpb6IRzR1+tVyJPKWmCSBmKfmmIg8HI9cAwtJtVOyBW5+oSYASKulwa9r4esWnOyiJ
         v9xTnEV0Bn4YOBhJmtR8PcMd6R5+FNSwrYWXNlAcn8grd77Mllc9fx1YPYsQxtxmox1r
         sb8kRuSwlDl1Xz6jvstpWRnKgKJs0Lx0BkVJjHCYaoyQm7zLub6agg1qM7a6zGjL2JOu
         9bvXSLS5g4E++HIp0/OckTBVxsfaR6h2Q65CBAThfBO1PQk/9DeiIdnMA7wkCtrHonUD
         B+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSS3zS/qVILSQ/ATbfcMUIuzQ9kmFjd/mtUIz6e0ohE=;
        b=c8qVvTMetW+VsnJZvJcc5yEim7CQc5sbhtM8yXnS0awV9CqPdlnQqSXD4qUgKQhlwf
         Ud1zg4/sGJOBhxsaMsCzhiFJEa2jXL3VuLxIcbykEWC1IjPI86nbeOIPhVDJES+NlfN2
         gvi29UiUGJv6a0w/C5kY52BEx4boKg6x/NNSxMZNitXyiW55ixiZgP+yO3dEjdRCGbdP
         dSs+GSrAXjim8/DPpztP2fnMoQOqVWHnczy9IuSQ1e7D0IHiML4RUiKAUzEg3cmS2Yt+
         pk0nAbD48cMpUDrzri+T4HF6dkyartgHBZRAPToGgZOsshh1gSL6qmj3GaciiPaCEy4B
         80rQ==
X-Gm-Message-State: APjAAAVsTUjfm93c41FZSK7bR4P2lpKqLIvNwVF7cCAY5VRilePV7Or8
        UMK1cmH3J8L9/MmkpcA0grTB0HcT
X-Google-Smtp-Source: APXvYqzTSVpEzCocFaYlpPem3TfCztral08dQEPdVKRcx5gmgLJvsBmZnoUkBzGnPBrj0mYXn0Cixg==
X-Received: by 2002:a5d:4808:: with SMTP id l8mr16404459wrq.118.1572298867729;
        Mon, 28 Oct 2019 14:41:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:6dcd:e18f:2cd1:7611])
        by smtp.gmail.com with ESMTPSA id k1sm11708889wru.10.2019.10.28.14.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:41:06 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 0/2] add support for -mcmodel & -f{pic,PIC,pie,PIE}
Date:   Mon, 28 Oct 2019 22:41:00 +0100
Message-Id: <20191028214102.70737-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is motivated by the kernel using the predefine macros
__riscv_cmodel_medlow & __riscv_cmodel_medany.

Luc Van Oostenryck (2):
  options: add support for -fpic, -fPIC, -fpie & -fPIE
  options: add support for -mcmodel

 lib.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib.h |  15 ++++++++
 2 files changed, 125 insertions(+)

-- 
2.23.0

