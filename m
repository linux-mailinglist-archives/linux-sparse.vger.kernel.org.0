Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC34159E75
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 02:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgBLBBs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 20:01:48 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:46991 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbgBLBBr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 20:01:47 -0500
Received: by mail-pf1-f169.google.com with SMTP id k29so312662pfp.13
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 17:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aH6WiKgRZO79ki4ihSRSHFVzruz5zkCM2Bp/NgHrJyE=;
        b=mKCb335k4fn/21jQJF//ysNPTKFGJeThB34fbkzHyX3C5riS1Lo932mZx2TVFF+0KZ
         JysuaWVoQkaa2auJPsFPLz3+5HTwZrRe05sg+4kNH+gueW3fnV1PERZxdSILl8RrYR1e
         6cKB7Iq0i2vHeJSFpv78vjJJmY6uL1+K9NdqlTqxRPAZrW+0c1e1sMG/DgLaMKMALhOo
         SVgMdA1vU7AXdVgXaALzh1nEzWeOuIbSzy2C3/wBMQUv9xJwUcyz/aqz1CEKIqJRSaHC
         87ZFwZhJOP5bEarTRbsJ4mLPuWtWg/KetYvQHqV4are8mbfIo83TUyYgKpwiCjiEekng
         8Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aH6WiKgRZO79ki4ihSRSHFVzruz5zkCM2Bp/NgHrJyE=;
        b=V9C1SDVfZMT0epG1JZQStcxcr82GmwgWGmlfDFt2bfJSKCp3GKKhzEFEjB0LJL26Nh
         LMGpkWwRVVeAFG1lo/BuuX1weehBzQEXVFQm9apSNnHewTsVIstHSDw+uwbbnEilwpo7
         QssZUzYy2kfO+kMVNIXuIcmu+ws27PRbFNK87Szhig4kGO5aTdGoW6w7IDreloArCLDc
         VrWzdUXyFTQnRIP5jiW2NqYxyxIMCCif7ftJB8m5Sh+qObKWg73FS+JHnlGVGkT/Zufv
         vBcb7dUzgY6FzOfLqDNrI/fSgtx/dhyo0pFi5H/migUzTCBNnzpeXBrkNmPHeyb+rzHa
         Dpsg==
X-Gm-Message-State: APjAAAVbcfa+YFEcrnpEgLt6wqYs3hBzK/b8omoY2ls2oSpV1aLsR7ti
        p4w3AGUTPasPWL1fWeJCVy+B5g==
X-Google-Smtp-Source: APXvYqwOfBshHPuoOCb84/6DG75zwEke4UR/4T4wxwle2Wbvw1f1whZtgKqbjWoVi7Od2OE5g6PglA==
X-Received: by 2002:a62:cece:: with SMTP id y197mr6067425pfg.9.1581469307098;
        Tue, 11 Feb 2020 17:01:47 -0800 (PST)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id t11sm79087pgi.15.2020.02.11.17.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 17:01:46 -0800 (PST)
Subject: Re: smatch/sparse complaints on static assertion
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io>
 <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
 <20200212003128.pieng2rlw7mykhvk@ltop.local>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <23e34336-22fa-d14d-c765-877abc05df12@pensando.io>
Date:   Tue, 11 Feb 2020 17:01:45 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212003128.pieng2rlw7mykhvk@ltop.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 2/11/20 4:31 PM, Luc Van Oostenryck wrote:
> On Tue, Feb 11, 2020 at 09:41:05AM -0800, Shannon Nelson wrote:
>> Hi All,
>>
>> I'm getting complaints from smatch on the ionic network driver's static
>> assertions and am not sure why it was complaining.  Dan Carpenter suggested
>> this might be an issue in sparse with how it is calculating the sizes of the
>> unions.
>>
>> I ran this at the top of a pretty recent net-next tree
>> (v5.5-rc7-1839-g8192c36)
>> $ ../smatch/smatch_scripts/kchecker drivers/net/ethernet/pensando/ionic/
>>
>> And got several copies of this:
>>
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:38:1: error: static
>> assertion failed: "sizeof(union ionic_dev_regs) == 4096"
> ...
>   
>> These static assertion lines have been fine up until now and I'm pretty sure
>> they are correct.
>>
>> Has this issue been seen elsewhere?  Or is there something I can do in our
>> code to get rid of the complaints?
> This is caused by the packing of the structs. It's using
> 	#pragma pack(push, 1) / #pragma pack(pop)
> which is not supported by Sparse. Packing via __attribute__((packed))
> is incomplete but the pragmas are currently completly ignored.
>
> -- Luc Van Oostenryck

Ah, that makes sense.  Thanks.
sln

