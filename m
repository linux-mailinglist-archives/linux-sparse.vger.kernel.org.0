Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6E7A11FABE
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 20:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLOT0t (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 14:26:49 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54650 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLOT0t (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 14:26:49 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so4364972wmj.4
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 11:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6bJTz+mDxtbcJyyP7103sNeBjPBpUjcbUHvU778/z+E=;
        b=MGLQdNY7dEkZKMytpvqAu/hl7V7UXAYrR73UMv0RCZZnXn4r5rpyrS7/1A3ESOreM3
         A7KfPgJC42sp5cKi2N3AixGNFWwPTyNXtm+Kmn5NT/8LU8jdAyce1lO+1X0xmGVDt/a/
         G/XYcJrI/s+fNawZmMpS7v/GglwurQn3RxTMb/nOFiwxL1iWdB/qk7h3JZZWFTXAh63P
         Z7l5e1QjWHSz2nI9KWWRe8FFuZo0Fl5BrHgDeaupSXdW5Y0redicBKq3t176TOW/6Oet
         NfAHU/ab9p07OMiiwG6s1SHirUeytfr/XkFTFc/9cfyG3e6AERMvQGC1atzACP4om7/N
         4pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6bJTz+mDxtbcJyyP7103sNeBjPBpUjcbUHvU778/z+E=;
        b=Xk4SOoMolQMgmH1tUD6arO2+dGZ7BngFX+BDMgSKrWSgq5P2U2Ne33rd1I//qY39mK
         zzTlhqQ2NYhhfKRJZZ8HM3we2YtriFittfUVRE33D/c+coVaofIFGXJWRzfIPvmJXYSk
         /w4scXeBzRFLgph/OKtqmkBl46cDilhaT1e3iisVJWguIw+evYngRGmdg3z1jaFkTlfQ
         d3KjOQ6XSRGZOa/6smZL/EfVSYhM8PsNIbZebKVgqGG7pyjzrPIe3c+sDUk41cyX7wFG
         ciYZF7KyGGTh5WOUt0nm7D3g+MLS/MHDFpeyggEnZsKTXt2NqgMl1C78lNGVCDBmPN8l
         sXyA==
X-Gm-Message-State: APjAAAUxoV0tceNzzqMI+fO28GjA8hH9DKXngYIT7Jhw0KZC9Sv8TEZ0
        LJ7CWpgBbY4av3ndPRLs7YdQs8oJ
X-Google-Smtp-Source: APXvYqxcdCwBy6QaWbpeOiVs7bgPVx4FQzktpJWluGeuI5aXhPUMDi0qjMdBqhF9kBfneG4YNp6HYw==
X-Received: by 2002:a1c:7d8b:: with SMTP id y133mr25490310wmc.165.1576438007087;
        Sun, 15 Dec 2019 11:26:47 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:4d3d:d98:1fc5:2616])
        by smtp.gmail.com with ESMTPSA id n3sm17895386wrs.8.2019.12.15.11.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 11:26:46 -0800 (PST)
Date:   Sun, 15 Dec 2019 20:26:44 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/4] typeof: extract examine_typeof() from
 examine_symbol_type()
Message-ID: <20191215192644.rcbtlhsq4trc3lvi@ltop.local>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
 <20191215110425.76533-4-luc.vanoostenryck@gmail.com>
 <c76acb9e-ab0d-23d2-06dc-361187851468@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c76acb9e-ab0d-23d2-06dc-361187851468@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 15, 2019 at 07:20:34PM +0000, Ramsay Jones wrote:
> On 15/12/2019 11:04, Luc Van Oostenryck wrote:
> 
> Hmm, it was not immediately clear that the '!base' path did not
> introduce an (effective) functional change. I suspect that it
> does not, but I wasn't sure if examine_node_type(sym) for the
> above 'bad_ctype' symbol would add alignment, bit_size or rank
> to the symbol (and even if it did, would it matter?).

Mmmm, yes. It shouldn't matter but I prefer to avoid this.

Thanks for noticing.
-- Luc
