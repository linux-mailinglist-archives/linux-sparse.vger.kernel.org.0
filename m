Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6064BBE844
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfIYWY7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:24:59 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34896 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfIYWY7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:24:59 -0400
Received: by mail-ed1-f68.google.com with SMTP id v8so196524eds.2
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UDtOSg/Ljcvap7iypLlOdXOD8I8mzN9pPeVOsIDJtN0=;
        b=L986dRQEBTIkiUoL6vTAW8U5g3MWkgswZKSzH7MVWOMRNvwfG4i3qYqB0xn/ncXwPq
         4pIU6ETmwJUZDB5V4q9nZMcpmpapn892a/hSnh/W4Iwi/yvuRW7A0z5fTrq2Ltc56A5J
         J7W+s8IieAThDVMqip0JV6mBqM/38+gEGDVFs5xH1UsJ0S2Yfo+b2xDrcpnvmRtz9hAN
         jrRpCoOazATLzE1iaC2ZItppxxBcwa+y8W6wcAr8lH0R9rj2i+E+WAEjoUxCMVEAQFUH
         +FpKYvzPukZSrgMOti3zqOEasvx08wMI5cUN1H/gglw6Ttsoky9l+aH10Qhhu0X7dEV5
         HAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UDtOSg/Ljcvap7iypLlOdXOD8I8mzN9pPeVOsIDJtN0=;
        b=mAAUd4qImIz479o1TnZgQoY4OtNtSRbqYqmIl/snFW5lm3U3Xaz3dtxmq5o88lJAgt
         l3LB7ef753ePlNTjGEJ4yVWozNRy7IWhT7UZxSOi9k/LNgamUne4Qn75UCuWHMrbf9cU
         fhyp+mu5R6Fayi7KhWKqxijTQNJIAAebRoyoilW5jEicb4TdaWKxHgbKPIh/DEka7GGA
         YNvBllwtecJaggvcsaxuz4O5eBVWHszkPO8lkancgw8vySOyUPpHUaiyMkjUcFArrgYQ
         llFGgxcxUx0mfEg0Chm3PYRn/qSc2lNMetu2ig+jklIRQgF9h1O+gYEFLhJaUO8S4/vT
         Qszg==
X-Gm-Message-State: APjAAAUuEJ6tJfi4Y32ySrtIpN/xiMpjuRVUKBYYNRo77YqkuuIJCGtR
        AWCqxRo5WUY+Gp2Vft6AsiU=
X-Google-Smtp-Source: APXvYqx/DuL2L18+jAiYBuO/iMkKt6Q5WvCY+D1ENHZzxnQApGdACLjNTYOx+0rnwJIjxzslkAxiFQ==
X-Received: by 2002:a50:baab:: with SMTP id x40mr363585ede.60.1569450297843;
        Wed, 25 Sep 2019 15:24:57 -0700 (PDT)
Received: from desk.local ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id l7sm65737edv.84.2019.09.25.15.24.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:24:57 -0700 (PDT)
Date:   Thu, 26 Sep 2019 00:24:56 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ilya Maximets <i.maximets@samsung.com>
Cc:     linux-sparse@vger.kernel.org, Ben Pfaff <blp@ovn.org>,
        "ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>
Subject: Re: [PATCH 1/2] cgcc: gendeps for -MM, -MD & -MMD too
Message-ID: <20190925222455.ti35wndmha7ahovg@desk.local>
References: <20190220133423.77834-1-luc.vanoostenryck@gmail.com>
 <20190220133423.77834-2-luc.vanoostenryck@gmail.com>
 <CGME20190424131233eucas1p2006a71c2c711ec184189ae3106aae6c9@eucas1p2.samsung.com>
 <023bde25-5038-427b-77f6-34a2bfa3b10e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023bde25-5038-427b-77f6-34a2bfa3b10e@samsung.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Apr 24, 2019 at 04:12:32PM +0300, Ilya Maximets wrote:
> On 20.02.2019 16:34, Luc Van Oostenryck wrote:
> > These flags must set '$gendeps', just like a plain '-M' do,
> > since they implies '-M'.
> > 
> > Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> > ---
> 
> Hi.
> 
> Unlike simple '-M', '-MD' and '-MMD' doesn't imply '-E'. And according
> to man: "Since -E is not implied, -MD can be used to generate a
> dependency output file as a side-effect of the compilation process."

Yes, this should be fixed now in sparse's repository.
Thanks and sorry for this huge delay.

-- Luc Van Oostenryck 
