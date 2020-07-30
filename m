Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965E023398E
	for <lists+linux-sparse@lfdr.de>; Thu, 30 Jul 2020 22:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbgG3UFa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 30 Jul 2020 16:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgG3UFa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 30 Jul 2020 16:05:30 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43221C061574
        for <linux-sparse@vger.kernel.org>; Thu, 30 Jul 2020 13:05:30 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id bo3so6571372ejb.11
        for <linux-sparse@vger.kernel.org>; Thu, 30 Jul 2020 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cgYrMq2/o4oYShFCAFaD60Sug9QOOoDZ3LDRscoqAag=;
        b=smHmMTelHSv2z5it/4nj1u4533SC3tXFa3TdwekQPU/GmkTQFeZ1iRqSlcYuh0TuNd
         bxIByfAh+Tz3ZfTe+Q/ILW0zQ3nz9nNhXhGpfhR2zuUvS88wYqkg19dhnc/483aMnI2p
         ucGIPvFgHWuSfs7I3ngxMMQ9NzIaykxEtmmb50zNU087UZ4Hw2PO4ogaCHE9doWfppVM
         gsOmj+Tvx4Z1Si1CPdSk3PbdXX8EzBC+2t8dcwUDxlidVLX96HzBdk5IkRauAdaMcepO
         oNQf7EoGLD7PO6TTW1ClP5yf2kh/dcDWJ8iMruLa4AZx5X/NIcIC4vnOYHYPm+162G3D
         LL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cgYrMq2/o4oYShFCAFaD60Sug9QOOoDZ3LDRscoqAag=;
        b=I5g4v8fLPTz/rXQwCtGqUsFFE415PVSg+bY6mwlsWoZnASY5frOXb4bBNe/PSXufDP
         UEidtYjnydjI6YSvcJXg3wowTb1i1pjUGk3UYDeZyz6ckvSvzsQPZVYsNPEFPcHsS726
         IuceV1FvWXTTrGeZGDWv/7QSuPBJR8KZvpsPgbxkmpPEukJS4XDdrCudkPbX57fEww8B
         PwHnpmrXY1saylHyA7WUoCQ+/RKnGZzZlKVBb3DzefkHe8hO7yjHna4gij4dVXFTVeJi
         snHawwr2TpqNrQGQiGRBtmE4lIBa+8KN/z/gwmqyOfcs7XTXvoEHnsLi+vGrMioDV/l1
         kB9A==
X-Gm-Message-State: AOAM531dVKEgPLLRVLBdHxEk3YUkDMhItrsrzMgFhhOWTHNhqr7L5g3h
        7MFCZKGLzRGt/1rdBj2iVQU2M0vU
X-Google-Smtp-Source: ABdhPJxePFUZnKq7xaAv/WGGcsUdB+Ar8k7YElbSYlki/cnBeM18dbKO74HJtFFjM/eV9aikCw1Dtg==
X-Received: by 2002:a17:906:5ad8:: with SMTP id x24mr707960ejs.329.1596139529057;
        Thu, 30 Jul 2020 13:05:29 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:ac45:7ad7:8f03:534f])
        by smtp.gmail.com with ESMTPSA id qk30sm5587881ejb.125.2020.07.30.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 13:05:28 -0700 (PDT)
Date:   Thu, 30 Jul 2020 22:05:27 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: support _Generic() a bit more
Message-ID: <20200730200527.j3rs3r3vsuomai3n@ltop.local>
References: <20200728183507.422662-1-gladkov.alexey@gmail.com>
 <20200728194937.GA2467@redhat.com>
 <20200728231058.3yakpfw3dqslxq5t@ltop.local>
 <20200730150958.GB6956@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730150958.GB6956@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Jul 30, 2020 at 05:09:58PM +0200, Oleg Nesterov wrote:
> Change do_expression(EXPR_GENERIC) to inspect expr->control/map/def.
> The is the minimal "better than nothing" change, technically incorrect
> but still useful for the indexing.

Thanks. Applied & pushed.

-- Luc 
