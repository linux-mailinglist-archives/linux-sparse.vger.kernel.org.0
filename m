Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F524C8E31
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 18:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfJBQXI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 12:23:08 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:43951 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfJBQXI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 12:23:08 -0400
Received: by mail-ed1-f51.google.com with SMTP id r9so15806117edl.10
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pjje6g0U6Ae8D5xdrKLDqJ1IQ5Wb+9hWkY8Ym0WIajU=;
        b=Y8rqPW+Ima1In5k5/1O92zFDjBiRSOTf8hLzcP3uUgVnqD5FgDf0vKRPERlHu+h9Kw
         qpUOoX1RkWQ/QNjUC7ciO98HUblaPH4OuVuZPV6lV873vw41ZbW0auCJqHSjqub5homZ
         J6pQ6x81fAq7P4l1NGD3Wow/fSF0LXZiN0HuJnqAlwOF4y376t/t8wFVdWVi3WF7Oydk
         wURiXpLceGXdgvlkl2OxjFcETACV6RXFMttwfJODl/LyKerKqj0MhL4TTpKiD8c7Thsz
         KWONRn04MXHlqc/Kqq/zx1NM6mXo6NShOSzT7QJq3UwQq0rl3mzh44ExkoM6IU7+TsLY
         YL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pjje6g0U6Ae8D5xdrKLDqJ1IQ5Wb+9hWkY8Ym0WIajU=;
        b=sgzrubWxJmEM53FQoP7rf5Az7ZfIY5SGFuk3MOxv5APtgV4MWVpt116T4/RHfD0uYI
         7u2rtVwWnIWMdezlTOtKBWVd6nH5ZPTNhBEQoSRjYwOFtON6YfGKI8dc3xa6qMeDxAVo
         p/nohBcpxNPyPf5BAlg4httSGqHSdXH2qht+TjbITXPjSAheEPTVKnHSc7Wf3wgQgcfZ
         84CVb/SUeBorv7v9h+Ri5js7QA1lTYIwbK/OKagy/grUqpWkUqZlVf9Pl2s73ThKFJTB
         K+kqu3snq4aFHU2Ph3NvrTA6GM3Ro9bMXjPA/2C3SwCantNGiOcg/Wuv1B12aXw1hHES
         xs0w==
X-Gm-Message-State: APjAAAWQwmIIZkwWb4lwA9sO4XqTHLl7i/p/h6drRDym/VF49AYEXnjU
        a7gpgkAC6a7hKj1SiFSx627o3MbZ
X-Google-Smtp-Source: APXvYqx6fYLPGn2mT280wCSyAbJLBT8bWbbmC6aITrFGJmEIQFUe3nrMrWRGrBOnKXhEQZ3In1JW+g==
X-Received: by 2002:a05:6402:1202:: with SMTP id c2mr4581592edw.190.1570033386531;
        Wed, 02 Oct 2019 09:23:06 -0700 (PDT)
Received: from desk.local ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id d2sm4010381eda.20.2019.10.02.09.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 09:23:05 -0700 (PDT)
Date:   Wed, 2 Oct 2019 18:23:05 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: problem with bit field sizes
Message-ID: <20191002162304.lhmpippekptzcqtl@desk.local>
References: <995abb2b-5ece-c256-ef8d-d772c6164ac1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995abb2b-5ece-c256-ef8d-d772c6164ac1@infradead.org>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 02, 2019 at 08:18:02AM -0700, Randy Dunlap wrote:
> With sparse 0.6.1-rc1 and Linux kernel v5.4-rc1, sparse is complaining about
> bit field sizes in 2 header files: include/linux/sched.h and
> kernel/sched/sched.h.  They both use a calculation + define macro for the
> bit field sizes.

This is corrected in upstream: v0.6.1-rc1-37-gd466a0281

Cheers.
-- Luc 
