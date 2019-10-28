Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07FDE7C2C
	for <lists+linux-sparse@lfdr.de>; Mon, 28 Oct 2019 23:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfJ1WL4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 18:11:56 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51087 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJ1WL4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 18:11:56 -0400
Received: by mail-wm1-f65.google.com with SMTP id 11so577602wmk.0;
        Mon, 28 Oct 2019 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YjMWv87Txz8ruISksDEwTY/yiCDggkCZffCKhGJVPqo=;
        b=a6WH1c4A3Zp2KbScjqDYgpeYNoumQEFfWVGo6UgRuVMOiL5sHK7jRmR5ZDlTNjSmre
         t1+uA2Lv1NWloGTHH5bAooKYLv85rP6Gj+xTMT45L9dh1NeWI+ZJcGTfnIxtFvWFtsaI
         QnZUQ3HI1FUHsnAtB5zaLSINszDZgYfP+TR8dRx1LpN3DGxMoIVLVZBMzb+vk6/A1rb8
         nBr9Hn6+6Fj/D8baXWVHftCCzOX7+lZCHwhnNGbLK7ActolTE8p4ZEVjRkdMO6+DjhBK
         WTiijBceKnhXmwUlyLQ3zYxsW1GB3Thr6s5EoPDAXEMIqDZ0tEDYtz/lcVIUrnkltqnX
         Cw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YjMWv87Txz8ruISksDEwTY/yiCDggkCZffCKhGJVPqo=;
        b=l/74bDcJbZNMAmaouzBFI5QH7XMIz/R85W2rdFvjbqtwSPXl4tiLwHRVuhZ3dm9nN/
         aVQFNlU9dmjdttd5qgc7K5uOgB1kRPc7yQaoQk+sS5uI3Vs99zS6CgU5Pyq3w9kHqJ0D
         V3c5J3DtvTWVQMLJrRIKmvCP4ghR5OaCJQBi3tq2InTM5DM8oQ912ZctfbdY9cy5usXo
         V/T44+RHt5ThXwvUq7x/EE/9FYeM9dJrn7DcuT3G15VfTcJiji402Ss5PlvYBwA+Uzk2
         rUJL9s/jVbNbLsx5aQ5Y4Wv1+WzdJOIRfyRjvIKZNV+YuEXw9nAkf6lvIWM6YB3eDlYk
         BjYA==
X-Gm-Message-State: APjAAAV5x1QRvJh3yLdOleb2g+S+LK2xC64OtJs5Qm9eucSkXwKxR5QH
        iOJz/zTVkvm3w/GqS+M3le4=
X-Google-Smtp-Source: APXvYqxVhyqboSyYmsgvo32+aV4wHUK0cx8Hd7TlVaxn75jcJJUtRP9dEehXjF3+7RcW6VFNqRPZIQ==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr1159537wmb.49.1572300714030;
        Mon, 28 Oct 2019 15:11:54 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:6dcd:e18f:2cd1:7611])
        by smtp.gmail.com with ESMTPSA id r1sm12939065wrw.60.2019.10.28.15.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 15:11:53 -0700 (PDT)
Date:   Mon, 28 Oct 2019 23:11:52 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Palmer Dabbelt <palmer@sifive.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH 4/8] riscv: ensure RISC-V C model definitions are passed
 to static analyzers
Message-ID: <20191028221151.bpbp27x6xeotbvm5@desk.local>
References: <alpine.DEB.2.21.9999.1910172138320.3026@viisi.sifive.com>
 <mhng-8e06672c-a3e1-4dde-bbe9-ba1d8ab79645@palmer-si-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-8e06672c-a3e1-4dde-bbe9-ba1d8ab79645@palmer-si-x1e>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 22, 2019 at 08:09:59AM -0700, Palmer Dabbelt wrote:
> 
> It's probably worth going through all our argument-dependent builtin
> definitions at the same time.  They're generated by
> riscv_cpu_cpp_builtins():
> https://github.com/gcc-mirror/gcc/blob/master/gcc/config/riscv/riscv-c.c#L35

Yes, I agree.
However, these are higly dependent on parsing -march and this is quite
arch-specific which sparse is not really needed for.

I'll add some infrastructure for this in the followings weeks.

-- Luc
