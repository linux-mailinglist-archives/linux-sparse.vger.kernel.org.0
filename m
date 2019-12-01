Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6FB10E36E
	for <lists+linux-sparse@lfdr.de>; Sun,  1 Dec 2019 21:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfLAUUo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 1 Dec 2019 15:20:44 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38897 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfLAUUo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 1 Dec 2019 15:20:44 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so7958985wmi.3
        for <linux-sparse@vger.kernel.org>; Sun, 01 Dec 2019 12:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Huj1lVNOQlHWyWSvS+0MaOpVkVIxjZkdZF/5CE4Eghs=;
        b=fEBVkf0PhG+7qDFdUnWJqCtViilFI4ITDwd0sVX/B3T4IvT3GE2iFdx6h/RFcOs3en
         aBqZZSNrbxHDZJF8TklQYT9BwBp38hnGJfdF1k4EozmTfhcDB45bTZ90nVZ5tcQRvR6x
         Oufsxen//c3QmEosJ1htrBR6KzEX4vUWvAHQhIyQ/nL6dio5yx4J7NKhjEx0zY1I62I9
         2Wc2FXPCDMGWc3xogNCNRcxXj+vHusd8+6g2IG1sV0PEep2gnJEw4p9B1AsU78EC3+mi
         ulcJAjaXquGN5mVnzYkJfNumnpSEuk2Jq1MIYbw/M/iiBWkKoGi1Earag6qtvBCmr5qD
         cdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Huj1lVNOQlHWyWSvS+0MaOpVkVIxjZkdZF/5CE4Eghs=;
        b=dBlYswfXReaBnMAmnqaJAQl+jnMoAdgEE1NgNEcsNA5iUmZgAMkyAy3FqNACenM3zO
         8A6cQ4sKdz13eej8iN5NYC1BAV8fjc888ZD0z1DGZDyt3LfCXd9veWyd83g+HCW+DsTt
         eyK66nyjvdPGvZhgh02DmA8k5ay5R4TPP/hWUbRSAUftvIF7tWwe4AtwZd8f8SjsGpE8
         +lmOzzBEHOqZDywknfNslQOiZI5FO4NasmcdVkG+yXlw7V0W7aTwzZHmu+PAuaVJvegc
         niVtDu3RS2Jfzfzs5NrCjq3o0sVoPSmSyDP+MuwRPR684/nLZg6smabXSLhQo+s3rE8W
         HGOA==
X-Gm-Message-State: APjAAAXEcHUJ7TjVTwiZrxtRieXm+zUIPZL6qnrlHdp+J4bB6TCzuXCq
        p4ANIMuBSsexr5hvhtIMbh0=
X-Google-Smtp-Source: APXvYqwRDXcLo0sLYc9woQis5zPekDjR7mpCJ84AlPfrOFhXUvDki2g08TInep/vnQ03TT6eiE1rSQ==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr3861485wmg.163.1575231642458;
        Sun, 01 Dec 2019 12:20:42 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:319e:42d8:5e4b:7244])
        by smtp.gmail.com with ESMTPSA id v3sm10331455wml.47.2019.12.01.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 12:20:42 -0800 (PST)
Date:   Sun, 1 Dec 2019 21:20:40 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 4/7] reorganize the __STDC_VERSION__/__STRICT_ANSI__
 switch statement
Message-ID: <20191201202040.74zguy6ahnd6e7gs@ltop.local>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
 <20191128204225.7002-5-luc.vanoostenryck@gmail.com>
 <d0872bbe-394c-6cbc-023d-e443ce60017c@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0872bbe-394c-6cbc-023d-e443ce60017c@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 01, 2019 at 04:17:49PM +0000, Ramsay Jones wrote:
> 
> 
> On 28/11/2019 20:42, Luc Van Oostenryck wrote:
> > Move some of the cases so that each STANDARD_GNU* is just
> > under the its corresponding STANDRAD_C*.
> 
> s/STANDRAD_C/STANDARD_C/

Thanks,
-- Luc 
