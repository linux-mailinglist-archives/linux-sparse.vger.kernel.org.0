Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DC1154D14
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 21:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgBFUpV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 15:45:21 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52190 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgBFUpU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 15:45:20 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so337201wmi.1
        for <linux-sparse@vger.kernel.org>; Thu, 06 Feb 2020 12:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DL6GFZltpalWz1xUNvWECb37DaHA1+5MpkLammH5teY=;
        b=aJpTO82KG4vbtSuR/UVdVOGJD6Rayjh8ZgySQ3RiyCInipsc2MSAAF2V1gC082fwVG
         Zp9TYGKQHSIV0wAJvPBYv3w+UwJ+6XAq3hmcjfFj9hEBYvZq8fG0rHTjJnp0ONeJirHx
         YG4qthTPZ6w3tf6/2xXvkEhhwWgrbdChZZrzv4rgWkzdqAeC1/gKBdPTOO6bMDCfrJeb
         jZfs2WLvoyIvDNgwvIbekSiD4VATqkdbjgsrmfKmT1LUK3mgrCA//VYwIPa1wncTqode
         NoeX7aj/tUMVoTmp+JSXSeYiqLp75w0lVFG7/gXYIGM2OFHg4VED4vO2DbxU3XT8EZKe
         juqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DL6GFZltpalWz1xUNvWECb37DaHA1+5MpkLammH5teY=;
        b=bw73oOrYaWKuU4mEZul+pZN99P9l/BjsTEPChS3lFDr+ozupQ/UkVJQ0OMHRIiibvC
         0pq6VbG+3nX0mOwurW3z/G2ldAdjVJJztadm9MTmrzPV/yZqKQUuP1XNTuxYPAXk78bX
         45NDbKtElnd63FMLZ5dreYvTdBnKkdZae0Mc4VldQHYXQR1ZwGCUIefQprPgZQCPY9yM
         X7gMley/lPu23KzAROF+h7Ne0v4V1fnDAxO7MA93UmvgTFPGKqGuwbis7MT/8GL0ImJ0
         c6eEgJdsmedvT8+FFzbqf/0EyNHbeYtp7SR8k9VVfBNhL4AW10ej3zE4P+gmfGrAda4I
         dRww==
X-Gm-Message-State: APjAAAUwa7fgJ1dX73E0qvlyOknQ0RnD3RVKUOllHdpvPiyBrigjvyY3
        MZPiTE6lZzsvILJNMFiWOfE=
X-Google-Smtp-Source: APXvYqzgM6Ve/r1NiSzONQ+DnlF5jVC7u2mWGAEwscJbuZFTSZshWMe8FtSXXUMALWCJRTFIQlosBA==
X-Received: by 2002:a1c:113:: with SMTP id 19mr6749760wmb.95.1581021919733;
        Thu, 06 Feb 2020 12:45:19 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:7c4c:6743:ca73:a9e5])
        by smtp.gmail.com with ESMTPSA id f1sm520753wro.85.2020.02.06.12.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:45:19 -0800 (PST)
Date:   Thu, 6 Feb 2020 21:45:18 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: introduce dissect_ctx
Message-ID: <20200206204518.qx5qtyl52al37njy@ltop.local>
References: <20200206170132.GA8908@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206170132.GA8908@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 06, 2020 at 06:01:32PM +0100, Oleg Nesterov wrote:
> Points to the current function or to the global variable in case of
> compound initializer.
> 
> Kill the ugly test-dissect.c:storage() and change print_usage() to
> report dissect_ctx->ident instead.

Having the ful ident will be good, I think, but the cost is to have
to maintain this context. I suppose it would be too painful to 
propgate this context via an additional argument to all involved
functions?

-- Luc 
