Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456F6BFA9F
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 22:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbfIZUgV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 26 Sep 2019 16:36:21 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:37943 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfIZUgV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 26 Sep 2019 16:36:21 -0400
Received: by mail-ed1-f47.google.com with SMTP id l21so445046edr.5
        for <linux-sparse@vger.kernel.org>; Thu, 26 Sep 2019 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tdoxx0eoFSOo4UJGZwhUA9OMoYY/xFXjEjJWxDk1Dv4=;
        b=TFbBMjcIDcaBm0g3/ZG4PFvt0bvT2zlxBa476h8QNp3EXQ57QYFQQxZMN5HE3bJHaI
         VRQIT/GXG6GC759ABl9Ny2qAB5yL20HwhhgkgzL8LbIWfWkyPJM4qrxiaGoozJB/mhQa
         zqNlcdwHopMBntYU1vAJb+iSzk5xnWUIGw0OoUFKe1VVC3xEK6gMZIPnso5sat4UbXWo
         HzXyfw4HCdUfiYw9s3s2ArANkicpGEBjQJD2nrgO6x873fFeERDmNv9wHewBirE5peQg
         krqBR6SZ6PhjPci5sg91E84Gd9vWjkG+vrJ3+mUVNC/x4HQdsDoR4d9tYl96rmJ2gp3D
         tVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tdoxx0eoFSOo4UJGZwhUA9OMoYY/xFXjEjJWxDk1Dv4=;
        b=nIx3/7nRrYm1WaHpkmLCEZ7Zsuv85iyKYW76DCRwK5o49ckmFiI6bsz8KlrHQhmkFh
         QMkGdi22Ibj4ytezRkwcCZmbNyBCVgtV3rx7m5ep+ixlaZwyuvc7gcuZwhac5SaBrsOX
         TAkqdJ9V0MaJuszycNPfv/vKakdn9snsnVJkj7h//NSzx4WRJSzCCdSV30ETK9qLaRiw
         KevGuCtmXs9GAEKkyM/qE/ZDXIqOHtSSC24j5j1JBI2v2S3ZIeNGWPtxl5T593K3gt2I
         17UV/L9FX7LsrKbihJnLPZKJyl2e6FVtljGWJjWZjxrhaXraSaDjz8cocsrA1OpDFR88
         fdDQ==
X-Gm-Message-State: APjAAAWoZB5KCrNaL7zPBgwAbFDgIqEWHFTm/C67yYGmjMPEckXikJbw
        9wUZf7wHVc913zYZsjQj9c4=
X-Google-Smtp-Source: APXvYqzfFJaeP6X1gmvX23AYlpDVYZaiDRI741XBKb8+Plf/saT0VIIjsxtZJ/LaKZ/ICVINPhkLZw==
X-Received: by 2002:a17:906:1c4e:: with SMTP id l14mr4912916ejg.276.1569530179730;
        Thu, 26 Sep 2019 13:36:19 -0700 (PDT)
Received: from desk.local ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id p4sm72920eda.56.2019.09.26.13.36.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 13:36:19 -0700 (PDT)
Date:   Thu, 26 Sep 2019 22:36:18 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: follow-up on printf formatting
Message-ID: <20190926203617.icnz4ztk47rupw36@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:10AM +0100, Ben Dooks wrote:
> This is a re-send of the printf formatting parsing to see if there is
> anything else that needs doing before getting it added to the next
> release.

Thank you.
I'll need a few days/a week to look at it.

Sorry for the delay and thank you for your patience.
-- Luc
