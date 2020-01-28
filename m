Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1AD014C362
	for <lists+linux-sparse@lfdr.de>; Wed, 29 Jan 2020 00:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgA1XGM (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 28 Jan 2020 18:06:12 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:42452 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgA1XGM (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 28 Jan 2020 18:06:12 -0500
Received: by mail-wr1-f42.google.com with SMTP id k11so3357072wrd.9
        for <linux-sparse@vger.kernel.org>; Tue, 28 Jan 2020 15:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yOCbbU5TsMlg1zt90XDfC6oerAFHa8lUWcBtcIob1Nk=;
        b=sDZhjScGK1t1KuOpuLh2gz+gC+29Sl1Bhw5CkBsIkfhq17wmRVi/P255+JHwmVzX5M
         LA4Gw++NGqzvft3TD8tO6jy11sEZfRoiSGabkFdjKMQYGc+vi3qXCLSA+gs6TSh8gNit
         iLDE8aQLw5jAaTd5sYXBW0RICmpY6Qxcq5xFX7u167ImTUtBuyMXTmLw7URilTRKnIZD
         /O+m7026WU83iUpX3PZNdjD5uH5bTUvrkWB9ZDjIKpou+UpfDmUhTbL8vZXfJuOn3I2F
         mu4FxBEU2YD01Uu6utSWF3iJZxdMMfXlQMNdmo9epng9NVE4tAICqmpzi0rRz7652RH+
         p93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yOCbbU5TsMlg1zt90XDfC6oerAFHa8lUWcBtcIob1Nk=;
        b=XhP2mWX+9VVL/ReYmONnZhLKLxMp8lNKrIg3nZsJRH+s8rlprxY5X1Q9Rumld+CPX0
         kOJ7mfLDquLP/avlSsJ8RfhKRSMhLuO3+jZQrforOL63SyXOVDrwrFYyzKwZ+8A2mE8b
         m/O16AUEx4fvIJPPCYsXcCIlUO18qQVWz2KkfXKqkeRBoDBnWbabONJqhMUnMmnSnc/h
         AeWf+6qyz1rWds0N+MS/pwmPkMgjwuhCp+SfPHp8tLAGMWaJeatrWyRenq5TPSCFRsva
         rUdyf5TU/aMa+IEIYiWbiOYVpkEczlglNQBLLJakSjxFZ2Fo0vEhXQNI9zsiMfWVjAcG
         WuTw==
X-Gm-Message-State: APjAAAXSEeUXPS4tOhab4spcXHNGwJNQp4q+gPuLdiMnXTvTtDPFx3r9
        2QWXJ/ctkAbZJqipdIzHRJ8=
X-Google-Smtp-Source: APXvYqxu+LXlnhIVeg/k81lphQ/iLFNVVUiy9NSrjc+qDX6Vq7mNOq/tyS7uZRSbMPwJE0xc0PTZ/A==
X-Received: by 2002:adf:a746:: with SMTP id e6mr31000591wrd.329.1580252770843;
        Tue, 28 Jan 2020 15:06:10 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:1cb0:8484:fc94:3528])
        by smtp.gmail.com with ESMTPSA id q6sm256831wrx.72.2020.01.28.15.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 15:06:10 -0800 (PST)
Date:   Wed, 29 Jan 2020 00:06:09 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Xan Phung <xan.phung@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: PATCH: domtree_build() creates extraneous bb->doms entries
Message-ID: <20200128230609.bgbhamef6tunqqpy@ltop.local>
References: <CAO6moYtTsA8niRvL135+OMXDjAEnGEGMf8kG+CYgq+YDKPi4UQ@mail.gmail.com>
 <CAO6moYti-1npHSaL8ibH9gDOSPCsnR=ufWrOCQyEBidSn2rRnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO6moYti-1npHSaL8ibH9gDOSPCsnR=ufWrOCQyEBidSn2rRnQ@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Jan 28, 2020 at 12:48:11PM +0800, Xan Phung wrote:
> Hi Luc, I have added a sign off to end of my patch below as requested.

Thanks!

-- Luc 
