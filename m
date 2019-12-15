Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006C411FAE0
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 20:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfLOTzc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 14:55:32 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34000 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOTzc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 14:55:32 -0500
Received: by mail-wr1-f67.google.com with SMTP id t2so4711363wrr.1
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BLcNkkqj1gkLDv4pBKbxG+tAkD46tW2jWTP9fy3rGA0=;
        b=kBZaEDbAGv+RHf5rctFo3mnTN5f8R1Ab50jw9rJPTNuOo2hsiSlwuQKjLVZBgxLCTy
         FulferUeN45H95JQZ7esWSo2GQ6UhnBtQRCwW+KUNEYarAmkjQTkxU173cgm3AxD/mTt
         PhG0LZBoEXTsHTwfNiRJssBgY+EOxX9kZNK2DRfXwgoLAXCq6Q8ElPNeoj93ngjHDlGJ
         0B3l5oNqgX0F7a1wdhhewRRLR9wMt/jvgf+YFFqs5JpU+Mm1t0HOAbcyn2ruMiYbojRw
         o5DqmOmg97d3xR5hlf9elFc8HfEI97eQIz84Y1NcGvnaBAO3F1iunhQgQggE3iPVpC2f
         PctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BLcNkkqj1gkLDv4pBKbxG+tAkD46tW2jWTP9fy3rGA0=;
        b=bQ4wlXIho0sWo2j0laAH0XTKGxbLFCvCagIh9JoP/+L5uu7K7ybt2gZSibmXIvhkGx
         WIhxgEn9EL+WVgue4zpOC4NcxBFyPtGRNarPoPxCpB2nRaUbxnv6vU7xLibnDryPaDKi
         Hx0kqsal1ofZG92QU3jbVJYUT4niZr9ifl6/76ezGe8mFMJg9CPjBfcVHEHVXjWxFU8g
         ezREn7rEVJi2AayLCSCPPs5EnxVkypelndwRHAjIsZYyN3lgoGCRMwYV+SFZrmGZBYqA
         FJUe0V5NrELxz0GkQMRkWZ70gKaQozjJ0LnCvkV1WPg4w817Sgv6Ftlb7A9yaB9yH456
         lLJg==
X-Gm-Message-State: APjAAAU03Gh0WOfeNd+ikxE8vEvcIbrhTaUY0esgDxAlGmkhG2eZEWsB
        HqKlw2qw/WKr0NkyWSszLGx9VHgP
X-Google-Smtp-Source: APXvYqy9O9x7IoKncir1Sye+uwUviqwcWHWIUWfp2D342ZuoilUSxefuMt2aaULKUxCKezEZ42ILFg==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr26011132wru.40.1576439729914;
        Sun, 15 Dec 2019 11:55:29 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:4d3d:d98:1fc5:2616])
        by smtp.gmail.com with ESMTPSA id c4sm18386078wml.7.2019.12.15.11.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 11:55:29 -0800 (PST)
Date:   Sun, 15 Dec 2019 20:55:27 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/4] typeof: extract examine_typeof() from
 examine_symbol_type()
Message-ID: <20191215195527.smteoeu77bs3rn7x@ltop.local>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
 <20191215110425.76533-4-luc.vanoostenryck@gmail.com>
 <c76acb9e-ab0d-23d2-06dc-361187851468@ramsayjones.plus.com>
 <20191215192644.rcbtlhsq4trc3lvi@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215192644.rcbtlhsq4trc3lvi@ltop.local>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 15, 2019 at 08:26:44PM +0100, Luc Van Oostenryck wrote:
> On Sun, Dec 15, 2019 at 07:20:34PM +0000, Ramsay Jones wrote:
> > On 15/12/2019 11:04, Luc Van Oostenryck wrote:
> > 
> > Hmm, it was not immediately clear that the '!base' path did not
> > introduce an (effective) functional change. I suspect that it
> > does not, but I wasn't sure if examine_node_type(sym) for the
> > above 'bad_ctype' symbol would add alignment, bit_size or rank
> > to the symbol (and even if it did, would it matter?).
> 
> Mmmm, yes. It shouldn't matter but I prefer to avoid this.

OTOH, examine_symbol_type() can anyway be called on it later.
So, I'll leave it so as I find it more readable.

-- Luc
