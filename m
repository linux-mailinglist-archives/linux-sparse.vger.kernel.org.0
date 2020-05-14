Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDFA1D3FB2
	for <lists+linux-sparse@lfdr.de>; Thu, 14 May 2020 23:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgENVKH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 May 2020 17:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727904AbgENVKH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 May 2020 17:10:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2679C061A0C
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 14:10:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id v12so520244wrp.12
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=orpVNMAF5uZ5JH1R+GZwKjypsxXhQ4kccKq7Rw4RShU=;
        b=V2J25cR4fhdQVLZk6lDN/PC4UEKyNEUYyDdJnqjoz/Zh/un3SXsk34AgiZ9zJemYJe
         vy/qhzh2GWvUKtu7AciF0FuoTF3Fx7ODkS3BGNmV17h92ibu2soOitIiEN4afQfb0k4+
         y0MiDh25SmptSPIwzejlPltyFaRry2obpUUywi4Vvf90MEKlpr1QwSTtviPS4/rrukK/
         9lnvBoUCa158SvtC44b3ykeq+Nw3WhrufCkqd50M9GFCYy+MNWZ2lYIZF3Gv0/1yJj1U
         4Csx3AnddkDTHw+CiB3yCE1B7stjGSBjKZQyZZpRROsW1rSDyEHjgX/UGkwLnHjac7AM
         +otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=orpVNMAF5uZ5JH1R+GZwKjypsxXhQ4kccKq7Rw4RShU=;
        b=ERA+BBj9UpTYJ9Jy4qqq2cUtzJ25kwP8H+8w6CoZe7krdsOd7bh1wn0ItfOeyT4i9c
         0jdmvfFkXYpGKVFrh5tjCPj9Syh2rQ9o6FOLjIXkENlHWwCH96qFI3W5s7c9c9bDwWbC
         Ti+dTxnRliUizWSqB6z3Xz1NLnmcor5/YvX+n3XCjh4m1A0uyEnJItnxqpVXomlA6YNA
         lufa/BkZ3jLZR2Co1L+JmgKlcGW3hfjCY5TyRxhkrPE2ChC/ruxWwkQDamBQCKgB15Nu
         lpuNNCAQaR1yRe3vfDq5xoRartNgSYhz6KxnmkW+QT+VaXd4grrfXbEITKFZnTqmd6kB
         rbPA==
X-Gm-Message-State: AOAM530CifX8EyPsiDhasOojiBNUwW/nNUM/apR2uRxyb0Eo8XRF7ijx
        o+taYLQuLCj+RWcCoJi+iidv8K+m
X-Google-Smtp-Source: ABdhPJxGBWNcDmu3YyQLx6Pnm4oWHYfDHMfM01sHWdpcoC1/UhCo9/BSFJVp/OmrwGwUeQlpEa78Iw==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr368917wrp.371.1589490605560;
        Thu, 14 May 2020 14:10:05 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:49b3:709e:5c4a:780d])
        by smtp.gmail.com with ESMTPSA id q14sm286995wrc.66.2020.05.14.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:10:04 -0700 (PDT)
Date:   Thu, 14 May 2020 23:10:03 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Quentin Monnet <quentin@isovalent.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] build: fix LLVM version detection
Message-ID: <20200514210908.74w6gzgdotigx4ns@ltop.local>
References: <20200420155352.11364-1-quentin@isovalent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420155352.11364-1-quentin@isovalent.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Apr 20, 2020 at 04:53:52PM +0100, Quentin Monnet wrote:
> The regex match used for detecting the LLVM version works for versions
> with a single-digit major number. Now that LLVM v10 is out, detection
> can fail, resulting in sparse-llvm not being built.
> 
> Fix detection by extracting the major version number to compare with the
> minimum supported.

Sorry for the late reply.
Applied & pushed. Thanks.

-- Luc
