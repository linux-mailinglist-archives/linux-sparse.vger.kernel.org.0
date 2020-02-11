Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3911B159654
	for <lists+linux-sparse@lfdr.de>; Tue, 11 Feb 2020 18:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgBKRlH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 12:41:07 -0500
Received: from mail-pl1-f172.google.com ([209.85.214.172]:37775 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728797AbgBKRlH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 12:41:07 -0500
Received: by mail-pl1-f172.google.com with SMTP id c23so4548040plz.4
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 09:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:references:to:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9OPbalWHry5yIdJqtF0qAs8oRqLN2ZWbIhLAEBaU5dw=;
        b=XHj7Hf0+Di+gg5SMmM2GkX3cuIBUp/EpohIMt/wneXr5kNxiYcYQ5tO7hiv2y+uGs5
         JNJwF5h6p/Mx9CV9/sTOjwrwXiBcmgB/4iQ4LypPIFih5CsXeH9INEV12U6SjuvJvST1
         5JV/aAqyC/oYjW/0aZEFboSGDxck7a2IfedQpVbc7Xd5pdAB3jd1ENi8nKpCHPqDOmBp
         LqMNF2MBN3P/6IS83VYG6vEkUDvJTajs/BzZOKOiiwcUHjkB9jOU/pj3tpOihv0wKnsz
         VyStvGatUR5uxn07ozn4hE7GqTkm+3lDyxuOgmGcmGRwHM3eb4Vwc8byIPN6iMxd2H5a
         CP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9OPbalWHry5yIdJqtF0qAs8oRqLN2ZWbIhLAEBaU5dw=;
        b=caycEYmPKzw9Qf9/f5Cwg9Hy9CAI49HHJnl4jEy+lcTqN4ITXb5U8SiZbuDZFvlvqd
         tFtijTySuzOCqpFuAODYdrcBtwolo1pFvR4IVtrEPmiAC6QwNXeAFkWr+F7FaHTHsz11
         r0xN+u2zs+pV2t5Mk2flpXWMu5dZTAYZ+DTNMdMGpB5+YoWk5CXn/wdf6E+Tv/xj3vfJ
         Z1FJheovkoGsy07ln7Q9dM2M2DJgOPGoyv5Gvkl9ADWzH4BZ0qnvdQvZHmLbbuf1YneZ
         MXQswFehxcYegpOLxOeZkcB1toOhcpYlL+ahgWRfNkPHbO9SypUjFKsblAR+/ef0mb4K
         8Wrg==
X-Gm-Message-State: APjAAAXN1cTQQw7z0kWBrg1E0l45APijxtbX2xrknnpoDm64eunsLahy
        CT8s1zBPtE6/noYtCS7+LQ676w==
X-Google-Smtp-Source: APXvYqy0Z/UrxEunK2KyEB1ouZhkDmEDfliKIDaTXeeygblkG/D+Jfm7Ko2Act8NEPQn2zPaEmLw5g==
X-Received: by 2002:a17:90a:d789:: with SMTP id z9mr4990057pju.5.1581442866923;
        Tue, 11 Feb 2020 09:41:06 -0800 (PST)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id y16sm4779243pfn.177.2020.02.11.09.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 09:41:06 -0800 (PST)
Subject: smatch/sparse complaints on static assertion
References: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io>
To:     linux-sparse@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>
From:   Shannon Nelson <snelson@pensando.io>
X-Forwarded-Message-Id: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io>
Message-ID: <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
Date:   Tue, 11 Feb 2020 09:41:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi All,

I'm getting complaints from smatch on the ionic network driver's static 
assertions and am not sure why it was complaining.  Dan Carpenter 
suggested this might be an issue in sparse with how it is calculating 
the sizes of the unions.

I ran this at the top of a pretty recent net-next tree 
(v5.5-rc7-1839-g8192c36)
$ ../smatch/smatch_scripts/kchecker drivers/net/ethernet/pensando/ionic/

And got several copies of this:

drivers/net/ethernet/pensando/ionic/ionic_dev.h:38:1: error: static 
assertion failed: "sizeof(union ionic_dev_regs) == 4096"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:40:1: error: static 
assertion failed: "sizeof(union ionic_dev_cmd_regs) == 2048"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:56:1: error: static 
assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:57:1: error: static 
assertion failed: "sizeof(struct ionic_dev_setattr_cmd) == 64"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:58:1: error: static 
assertion failed: "sizeof(struct ionic_dev_setattr_comp) == 16"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:68:1: error: static 
assertion failed: "sizeof(struct ionic_port_getattr_comp) == 16"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:78:1: error: static 
assertion failed: "sizeof(struct ionic_lif_getattr_comp) == 16"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:79:1: error: static 
assertion failed: "sizeof(struct ionic_lif_setattr_cmd) == 64"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:80:1: error: static 
assertion failed: "sizeof(struct ionic_lif_setattr_comp) == 16"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:82:1: error: static 
assertion failed: "sizeof(struct ionic_q_init_cmd) == 64"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:117:1: error: static 
assertion failed: "sizeof(struct ionic_vf_setattr_cmd) == 64"
drivers/net/ethernet/pensando/ionic/ionic_dev.h:120:1: error: static 
assertion failed: "sizeof(struct ionic_vf_getattr_comp) == 16"

These static assertion lines have been fine up until now and I'm pretty 
sure they are correct.

Has this issue been seen elsewhere?  Or is there something I can do in 
our code to get rid of the complaints?

Thanks,
sln



