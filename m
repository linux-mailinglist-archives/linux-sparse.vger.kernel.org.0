Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655E11D3FC9
	for <lists+linux-sparse@lfdr.de>; Thu, 14 May 2020 23:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgENVOV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 May 2020 17:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726201AbgENVOU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 May 2020 17:14:20 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD9CC061A0C
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 14:14:20 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so586240wra.7
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sn7oTPpz0t+4PhnFM2KU53rCOBivycjxBKRcPYStC7k=;
        b=QLogoR6+rM55O47MFaTvVYVF0OIAJLCOrcFI1A7lHgAddL3rwGAd4qsfaBwjiR0Tgm
         TbEelUiR5p6KQMEKchZub8DEr/uAflQocsdidBzqhhfX7rpPdyFZLtZz4NiBt9I43EjH
         sx0AY5CEeSbjJDKQZFl9cOhvfROOo+KaGt7SrJsVCHrd/B2Jn6/8SCwitDXLO5RjoyvE
         mL15ydrDZOYr1Vwd8Tio/GmQexPxzeCWaImBU/68WCJZz7gSpsZ3w0OSMfU9GrrWlI43
         cHwXCUodVnID4Uj5g0WsOTMdm+LSp7XvB/et/v238AbBufi3RzfcZehjkyWM27pOxVbv
         zC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sn7oTPpz0t+4PhnFM2KU53rCOBivycjxBKRcPYStC7k=;
        b=n9KXJR+yqtqdm97YVj7yuqr6It8hUDOoAn/odkNpxt4iOgXms7TTdhusNhrwllsHWE
         zeVKKUdQTwudlDrPyvhePV+23zKjgyH7c/wVs0RNxQRxptCi/03IeC5hoyhFxI9bUCHy
         dZ6JRYzLZ70dkcvcmUS8JxzMFsfdyhgFAhPhf1MMfpNU/Bgj+q/NTIuIwwPxiNAzIhez
         x+Yj7sy66HtRLObB7UMuUZGDtykGPyiVWLm+owRPXwaoEYhfWus7iNY1ppXLm4ubPyoq
         V0M3K2HewXtRh8xZBXS3bYjEGQVN4QRvT+xKaJASZbSY0k3JUE5JjP/a6wWmNn4xBdIj
         cH8Q==
X-Gm-Message-State: AOAM533auSaX2j5Z2Po7C2cI6x6S/U8z1vln3mHMHyuSUzzMbVUaTSV1
        lvelzuCRKhx/2wP3uDNE1Po=
X-Google-Smtp-Source: ABdhPJx+cyNtZB363QXlaKjtir0vtcMl02eDcpEM2xctb3RDNWjkwFrN9894z5tTKsKhO8iNtDsntw==
X-Received: by 2002:adf:f344:: with SMTP id e4mr356954wrp.395.1589490859200;
        Thu, 14 May 2020 14:14:19 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:49b3:709e:5c4a:780d])
        by smtp.gmail.com with ESMTPSA id g24sm324294wrb.35.2020.05.14.14.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:14:18 -0700 (PDT)
Date:   Thu, 14 May 2020 23:14:17 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Davidson Francis <davidsondfgl@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] show-parse: null pointer dereference in do_show_type()
Message-ID: <20200514211417.uibjj2jubdw754yk@ltop.local>
References: <20200511030620.10329-1-davidsondfgl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511030620.10329-1-davidsondfgl@gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, May 11, 2020 at 12:06:20AM -0300, Davidson Francis wrote:
> In do_show_type() the first if statement allows passing null
> pointers, which can cause a null pointer dereference in some
> cases, which I believe is not the desired behavior.
> 
> Fix this by changing the first if statement comparison.

Oh yes ...
Applied & pushed. Thanks.

-- Luc 
