Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E0F202415
	for <lists+linux-sparse@lfdr.de>; Sat, 20 Jun 2020 16:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgFTOM3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 20 Jun 2020 10:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgFTOM2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 20 Jun 2020 10:12:28 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D17BC06174E
        for <linux-sparse@vger.kernel.org>; Sat, 20 Jun 2020 07:12:27 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id w6so2015977ejq.6
        for <linux-sparse@vger.kernel.org>; Sat, 20 Jun 2020 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/XXAuJHW2JH96mQ6qh7lHaCkpSVjPZpHBirl03+zqXc=;
        b=E++rICiwXe1nWauDmvBXPz+pg+zxiM5TKfBVwEtKut6puHu8mZnB7Ra3Qg6rWDW9Yb
         mBNvZwgAdc6l8impp2hE2vMF1bZJ2ZYWEjeHEHkenSefug0cyFxz9qICCQ9wEuBd78lq
         qo/7jBVGtiI6qpiagwAG2R2U9w0PMSBkdTVqnS10pckt/2d8ns/kV6MpPMUsxNtxAaJj
         p2zDva4S9w1uxOBonmHVPn8mchz9hOi0xyw4xRpwIrl3ajxH1FkvnPXHffveyAq6SUZf
         oGAnRSRyCb7e1JAM7yU6+5X5ipnaSDZB8UiGvAgGr7tvyYohQ/1mlNmGZdg6AEo6Idkp
         7V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/XXAuJHW2JH96mQ6qh7lHaCkpSVjPZpHBirl03+zqXc=;
        b=hOs+iivX0J0A6/ejNJvCa/EPd8mZe4MJSyFB4GTBXxG9lceNoUSPvzSR/AqHo4T/P3
         Olf+EwxTx958l0Ct1e8hDDsjsj67HUvw6wkL+sX1pcHxp0uhMf+oxf6qH3qfs3i82w9L
         Dwg57Nvtbo4rZ2YL53isqKE1hlnxT76D8EptvRsCrgoLF9k8iWAnfMijqBWcBkc1tIkA
         CcP0W1M1GXj/FN2Mr29/vkACOZtOnw1zmedXt2QkAhVRj4jq17NnwUZ7EKbUxtnIllFd
         DeATIpf5DcRWG4BuNdmXTUgoQ38P9AIb1PRljr4rKmV46JM034/6E++ea5yKuRmZNJrH
         2hyA==
X-Gm-Message-State: AOAM532ywc9DAZQ5z180D3IrbA6u5Zu9BmT/RgWPdee4uC437t71mZb6
        A+4bo7pb+UeD8pdX8v5EzkjXQMZM
X-Google-Smtp-Source: ABdhPJyI4aqnshQT3ofnPVkthEwRnjsFUSRzb+saiH7FBVYhhBKmR1xonEv5m/XK++9ndhAIamjOJw==
X-Received: by 2002:a17:906:76c4:: with SMTP id q4mr8506263ejn.371.1592662346508;
        Sat, 20 Jun 2020 07:12:26 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:44f8:43e:83bd:4b8d])
        by smtp.gmail.com with ESMTPSA id a13sm7262630eju.59.2020.06.20.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:12:25 -0700 (PDT)
Date:   Sat, 20 Jun 2020 16:12:25 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc2
Message-ID: <20200620141225.q74amobti2us4onq@ltop.local>
References: <20200618221540.gvibhjj5fxiu4g4h@ltop.local>
 <ce3f1a29-e7d1-a18b-dec9-a0e794c6d7ac@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3f1a29-e7d1-a18b-dec9-a0e794c6d7ac@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Jun 20, 2020 at 01:11:13AM +0100, Ramsay Jones wrote:
> 
> 
> On 18/06/2020 23:15, Luc Van Oostenryck wrote:
> > Sparse v0.6.2-rc2 is now out.
> 
> As expected, no issues found during testing. :-D
> 
> Thanks!

Thank you to you!
-- Luc
