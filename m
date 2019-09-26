Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 361FFBFA9B
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 22:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfIZUdb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 26 Sep 2019 16:33:31 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:40856 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfIZUdb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 26 Sep 2019 16:33:31 -0400
Received: by mail-ed1-f43.google.com with SMTP id v38so422468edm.7
        for <linux-sparse@vger.kernel.org>; Thu, 26 Sep 2019 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KppJQDu+4A50GcyYLx/fJzJq5qZsrfF/yPEbA7zBv0w=;
        b=PGVKD9t0qCvguA16utafSVnzVElgWgXHqpm3LQa2u2VTwlyR4FMPFEZI5j5tWFDqle
         lsA34gyVhlluHhWah6PQgeNKpzG6ftxcn2mFASMtqVEoJ3JhIMXJpvpcxRXTAKWzlV2u
         J4HejPEXCeWxY9als6Mll4PUQ9L5oirx1oJSuLYh80VTHRmkkUiiKxN1FDBQBY4r/5Ps
         afnVpo+ROtmyjAWQgUAx4ASKTb84F7HcJZjpoQ+9lsMxhwDS3ZZxRDCF91hsziRNy2LG
         p0yYLxp4rLQsVYvss3WSueyKYzIUtCr/Z2vz0JeWnAnEV33uaZk3/j45yi6BYAPPW2BL
         mpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KppJQDu+4A50GcyYLx/fJzJq5qZsrfF/yPEbA7zBv0w=;
        b=AMRpsU3gk0JN6uiqijhNnH30jvAYZ4BZqpJ21BYNT40oUjXj+YuhVt+Jz6v8sXcKQW
         iCDdrPg9KpCrUzMEdNYi952KZhGeM+kaJC7gRx8AAO6WgpnRE/jUxMiAhLJby/NgMq7l
         zGlTP/h2WG6EXrArxYI19ujghwILIy6IR0wufosRZQQDvrTFYGN1FaFWkHaxN0ffLOow
         ug743vZ+c94qwyCQI6uetzqcF2x6JKeviRigUZRFKHEGeG9s+bT22AoUKyUiIwS4KGjW
         sJUiwc44/4hoiub0ienJix7nhg2+YVSgMzq1GE9IZs5MnTEeaphYPWr86GF5U6rz34PL
         4r+Q==
X-Gm-Message-State: APjAAAVmE2Dmm3s/JTE1a6KP7Uu+VNfqZ/cGRUFdhyz8uJfsfdKJRdi+
        FjHvwB8Qlm5i0pUKRthgzN0EcKI3
X-Google-Smtp-Source: APXvYqwHn/6cVTvTax+s+7Kp7Sp+WiMBaxzFH2r4Mw9GCglGrugK80ZqE1DOvQnProiFLBWJQ1jg1w==
X-Received: by 2002:a50:b6a8:: with SMTP id d37mr795780ede.63.1569530009456;
        Thu, 26 Sep 2019 13:33:29 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:5de2:f287:160f:22])
        by smtp.gmail.com with ESMTPSA id s19sm350579ejs.78.2019.09.26.13.33.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 13:33:28 -0700 (PDT)
Date:   Thu, 26 Sep 2019 22:33:27 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
Message-ID: <20190926203326.t6or7pbvybtnussi@desk.local>
References: <5ebc73fc-1c4f-e97a-f626-ec0d35ec4e69@infradead.org>
 <c03600e0-057a-fb59-78b4-60f363c1b44d@infradead.org>
 <c037bde7-84ea-a7ed-ab81-f5a054093069@ramsayjones.plus.com>
 <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
 <20190925221610.srmkmsqkmqh4uzd3@desk.local>
 <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Sep 26, 2019 at 07:50:27PM +0100, Ramsay Jones wrote:
> 
> Welcome back Luc. ;-)

Thank you!
 
> [BTW, we are still in 'RC' period! I have been using sparse
> version v0.6.1-rc1-7-g2b96cd8 in 'production' all this time ...]

Yes, I know. In March-April I was close to get v0.6.1 out but then ...
 
> I just fetched sparse and tested master@3c74809, and it failed
> on cygwin!
> 
> At first I thought it was this patch (ie it was all sparse-llvm
> tests which failed), but I was equally sure I had tested back
> when Randy sent the patch (_not_ just compile tested).
> 
> However, if I go back to v0.6.1-rc1-7-g2b96cd8, it also fails, so
> this is not the smoking gun. Then I remembered that the cygwin
> package for clang/llvm was updated recently ...
> 
> Back when Randy sent the patch I was on clang/llvm v3.x.y (I _think_
> it was 3.0.1, but don't quote me), but now I am on v8.0.1.

Randy had the problem on llvm-3.8.0.
 
> I haven't looked into the errors/warnings yet, but they seem to
> relate to 'unknown/misused' pseudo-ops used for debug info.

I really don't think it could be related to the last patch.
I don't use or have access to cygwin but I've tested on Debian
(bullseye/sid) with gcc-7 & gcc-9 and there wasn't any problem with
llvm-8 (on Ubuntu I can only test with llvm-7). So, I'm curious to
know more about this error you're seeing.

Two years ago or so, I had once a problem with the version of the C++
library (libc++ vs. libstc++) and the Makefile currently contains a
hack for it (the line using llvm-config --cxxflags and then grepping
for -stdlib=libc++). Can you check the output of this comand and, if
it doesn't report '-stdlib=libc++', try to explicitly add -lc++ in
LLVM_LIBS?

Thanks for the report.
-- Luc
