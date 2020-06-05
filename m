Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834851F0366
	for <lists+linux-sparse@lfdr.de>; Sat,  6 Jun 2020 01:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgFEXJ5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 5 Jun 2020 19:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728296AbgFEXJ5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 5 Jun 2020 19:09:57 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1993BC08C5C2
        for <linux-sparse@vger.kernel.org>; Fri,  5 Jun 2020 16:09:57 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id q13so8693747edi.3
        for <linux-sparse@vger.kernel.org>; Fri, 05 Jun 2020 16:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VEi1jD9i1/2p54iVGabRW10tCUVEM1jfRPO6s6xXErQ=;
        b=bYVxhDuSv9eyGA8ejAtyKIoUctTU2eRSW/KIhd+yY3Kpwj2BujVWeL2LI37mhFlOyW
         H7ZFRx+tb9SG5eRk9Jv5iow/sASFSVk2DotbQgQKNVAcWFHmsto2SEvxz/GaLCr9sluK
         1qU6Bwf0b1UCzf/8ZX8GoqJ19S4hpdq0VsAup8YafLEES0vsdSelSgCcU2HiOtKmQPmU
         V0lUXKc45Ul+0C1cdxWSE07wtw6UJOZSoQgGcdWcJ3wP7t7WR936IrJaEEE6fmDUNZs5
         XMRpa41tVCT3EJn6VfpNP+lGggBkFLtkDkqGqAHqZFpJpLQDh0qjawwNkLD7fZGssZnr
         qUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VEi1jD9i1/2p54iVGabRW10tCUVEM1jfRPO6s6xXErQ=;
        b=nhqFHVzWMmjSm2XDRYT2vxngUPRqDNHEOdYhEJMBv71k2LOs8/bV7PLhBXuGYYz4EM
         fgkI9SCQmr4/8aYjU29ocUy1M0LDvmJeARzL6O4xcpfyMfhnCgkhwFIAeYZf002FIruw
         I9OGez6tIHKq5ltHGrBxfoLWAKfpFgxP2h5z+Vv2/PiVL4XHSIAmG4dA0Siyffw75ymp
         VNUSoOOdodpR3hK3CD7WTurqrryv68b2AuazDWWDoCOF8JbeALFa8o7zURWvRT9F+AYy
         lfev3XlECoVdF9YrL16JaxBRMXjzQFnmWfPTD/xIqfckwHchWga1aTVsxTuH+DkDOVHp
         qgdw==
X-Gm-Message-State: AOAM530dT8vRABZQ7ilFBPCqHFlPjK+kZDzEL8ner/YH9jMymNTdeMOy
        fGgLJzEyTAzPdObaYQvKPeLzw1F2
X-Google-Smtp-Source: ABdhPJxqBeTJ1oWR7J6Uc0k0l1jSIrIXuV7UnoCIsHnBrotXLKpwJ7IKc3CQl1yoT0A0vgY4xmAiVg==
X-Received: by 2002:aa7:c489:: with SMTP id m9mr12164093edq.102.1591398595844;
        Fri, 05 Jun 2020 16:09:55 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:8001:598b:2e9d:dd4e])
        by smtp.gmail.com with ESMTPSA id g25sm5889818edq.34.2020.06.05.16.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 16:09:54 -0700 (PDT)
Date:   Sat, 6 Jun 2020 01:09:53 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] pre-process: fix a compiler array subscript type warning
Message-ID: <20200605230953.oe5pfjmpuvkxdkl3@ltop.local>
References: <fbb9ba2b-14fa-c6e1-a730-80d35547ea52@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbb9ba2b-14fa-c6e1-a730-80d35547ea52@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Jun 05, 2020 at 10:29:24PM +0100, Ramsay Jones wrote:
> Hi Luc,
> 
> Having not done so in a while, last night I updated my cygwin
> installation. This resulted in updates to the versions of the
> libc/headers/gcc, among other things. (eg. gcc is now v9.3.0).
> 
> This patch fixes the new compiler warning that results!

Nice catch! I really hate the spec of these functions.

Thanks,
-- Luc
