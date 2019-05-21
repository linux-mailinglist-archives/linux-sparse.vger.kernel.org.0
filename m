Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8965A25748
	for <lists+linux-sparse@lfdr.de>; Tue, 21 May 2019 20:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfEUSK4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 21 May 2019 14:10:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40145 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfEUSK4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 21 May 2019 14:10:56 -0400
Received: by mail-pg1-f196.google.com with SMTP id d30so8970321pgm.7
        for <linux-sparse@vger.kernel.org>; Tue, 21 May 2019 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TTyQD9QaI0OqHSzzIopy+eehgDh3eF46NGVBwjvYSYs=;
        b=eC0gHnndTgNdx4+iUH43nhYp3wN/7d+tPqa0CHOCjf3SAsDsZH+H3vvPiP9oMplpqQ
         cU7zL6KR9Zb+Uyq1wU/+534pZUsqPD+T/mmSBXVY0TGiw5e7Xr/vq2jz0N7tAWzRIdGe
         A83c+LPpcr6btMZ/deipwJdyBqFwQFZys/vwSz5OJhGIpwhS87y7MV78c4BdlwTtCefz
         B3aX9oi9y7S8LRhSip9qT2RrFfNjabrq2wFx7EAo9g738YMUWO+ZEZULHKC5zaS1tsYg
         N/F4cYL+kSjXpEApSlsl7rUhgKht+BbQUE/TqOG9wVmf0xe7LH2STJoN7QfUGPJdfXMc
         iCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TTyQD9QaI0OqHSzzIopy+eehgDh3eF46NGVBwjvYSYs=;
        b=iXbuQWADWNYgCXCXn+LnsIy/BwFtbgr7xJyMDO4231bJ/9d7c0TP6ptu+58YPRfx+u
         TzjMh+NsEGidfmWk4leVPg85GyQoyjZ2QfvHKSzmp5ZRgEysY/ApUlEhCluiIViiDhtU
         q26NhpluQUy32w95Sh6RbgaJYkHKNk9fZj8GEkWC0J4QIL1XgpgVuoi5a1v2MTzgswzv
         5+ZhS/nUM/OA3/uREyJu+vZDjZprFCpS5aOFuTlHD4DGVg8s2dCabZ+GeoflHbmVZLsN
         FkSfMBO/ICXScHUaS6zxydINvVvsdVSlDU21d78i6EFM1dREiJpNHTIzi7P+mN6LmIkg
         341A==
X-Gm-Message-State: APjAAAXZxWcIOvSQuiH5tIs9CT083bfnxlgZg/M/VWIDJVKlbTbfE9ww
        ISRW6BdcPPtFjTkTAAm3+e7dHO3E
X-Google-Smtp-Source: APXvYqzmn4/sYjMITV+5hQiz3waazy/8ZOm4G2yCegw4tqqtXrwNLNgemWLfiX93W279d6NpDmVsiw==
X-Received: by 2002:a62:1ec5:: with SMTP id e188mr89732237pfe.242.1558462255858;
        Tue, 21 May 2019 11:10:55 -0700 (PDT)
Received: from himanshu-Vostro-3559 ([103.83.145.175])
        by smtp.gmail.com with ESMTPSA id i12sm26822422pfd.33.2019.05.21.11.10.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 11:10:54 -0700 (PDT)
Date:   Tue, 21 May 2019 23:40:47 +0530
From:   Himanshu Jha <himanshujha199640@gmail.com>
To:     Derek M Jones <derek@knosof.co.uk>
Cc:     linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
Message-ID: <20190521181047.GA15859@himanshu-Vostro-3559>
References: <20190520164214.GA14656@himanshu-Vostro-3559>
 <1511500c-ccab-1702-2813-d063ebf7aa0a@knosof.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1511500c-ccab-1702-2813-d063ebf7aa0a@knosof.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi Derek,

On Mon, May 20, 2019 at 06:10:31PM +0100, Derek M Jones wrote:
> Himanshu Jha,
> 
> Good luck with your project.
> 
> > Could you please point me some critical data examples that you know in
> > the kernel source which should be protected. This would help us a lot!
> 
> Hopefully not the sort of thing that appears in the kernel,
> but a problem that the C committee continues to grapple with:
> http://shape-of-code.coding-guidelines.com/2019/05/17/c-considering-support-for-background-checks-on-pointer-values/

AFAIK kernel doesn't follow ISO-C standards.

There are many warnings reported when `-Wformat-signedness` flag is passed
to build kernel.
https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html

which is undefined behavior:
http://port70.net/~nsz/c/c11/n1570.html#7.21.6.1p9

Eg.,

drivers/iio/trigger/stm32-timer-trigger.c:228:24: warning: format ‘%d’
expects argument of type ‘int’, but argument 3 has type ‘unsigned int’
[-Wformat=]
  return sprintf(buf, "%d\n", (unsigned int)freq);
                         ~^     ~~~~~~~~~~~~~~~~~~
			                        %d

Your blog is interesting but my current project is a different experiment.

But you might want to explore:
https://lists.elisa.tech/g/main


Thanks for your time!

> 
> -- 
> Derek M. Jones           Software analysis
> tel: +44 (0)1252 520667  blog:shape-of-code.coding-guidelines.com

-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology
