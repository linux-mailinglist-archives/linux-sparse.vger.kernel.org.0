Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF0BF67FE
	for <lists+linux-sparse@lfdr.de>; Sun, 10 Nov 2019 09:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfKJIh2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 10 Nov 2019 03:37:28 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34309 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfKJIh2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 10 Nov 2019 03:37:28 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so11463799wrw.1
        for <linux-sparse@vger.kernel.org>; Sun, 10 Nov 2019 00:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KB1bJSB0JioiVO08kikEPsjy8ISCKduAkl8+HriVLzc=;
        b=lxp2z67PAodWK1S76EKziyXntaNtwrWayZHrKF18a5/D4P2n1gJYCZ6KGXSKozs19M
         oU8i0s663xG6dsv0PswQOsugDzzRhe5NDDDA1Mqew10zbG+t4qKzzHWd7Rx+R8xcXJvp
         6tKPVgya1sZhWSXX7v2Fi+baDxeXnlexdXGLTeD8HmBj5qO7pQWW803htXMaNN51mLlL
         LTEKFPdHf72e29P8wEKwLl2wJQnP0jnSAkccJuVLpaVdeTdYBrZEhS/fdRf1OBXd6fA8
         EcYmdLGEcD1TVcdQ6QEHJf/k4wxyirU68O6kdl0M7pJsChPBgMM2fqU5DQPfwKRYO4HC
         DkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KB1bJSB0JioiVO08kikEPsjy8ISCKduAkl8+HriVLzc=;
        b=rA9nRn4yxoCj/RPeA0XCUuF0VRM1nYH3chuUThB/Y5zM7wsWB8qbD5lGYuhGu8xPu0
         NTDkbM2fZ6EtOJwIFju8+logmAN+JAofiZWmGjDahapM5RlADSBSOnXHgqKV5Eqrf2nA
         K+++JYtBNaNW49yB14lk6JlO6UVjyYbFV5mfzfmG6KhCwRBrpdmYcyg1+fmRUeuraWN/
         F8iO0xRoDq2/B+CPH04V2Wv8fR83IP8P/gDaj4RGBwMjuJxHakbgv+xY/pFTppQ2VbmK
         DM3WSArzQ2rplHssR7N2mzZDqzXvJU4AJnvyzwBX+TC68J9cQtQzhvz/emUaQcmuFD55
         IuVQ==
X-Gm-Message-State: APjAAAUQ6eNLOLEwDejA8r2aBLEMVAC7eOS9UuYGjdJvUx19t5Br1+Tw
        /2bNKBaWI/SZtq4LewnppvgsDhzv
X-Google-Smtp-Source: APXvYqzkSaVtt3US6s15o9UZIEK9hJVHtOTWnEbAYxTDOgCm+ceaFY5Fg8GIWwGxAnwxShvAbXtkCQ==
X-Received: by 2002:a5d:5282:: with SMTP id c2mr13856007wrv.64.1573375044465;
        Sun, 10 Nov 2019 00:37:24 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:b861:14dc:6a81:f1a7])
        by smtp.gmail.com with ESMTPSA id w18sm10849523wrl.2.2019.11.10.00.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 00:37:23 -0800 (PST)
Date:   Sun, 10 Nov 2019 09:37:22 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 2/4] typeof: fix up comment in examine_pointer_type()
Message-ID: <20191110083722.xl37vswdcbot5rdw@ltop.local>
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
 <20191109133519.63010-3-luc.vanoostenryck@gmail.com>
 <7029af3c-e9f6-043e-b3de-dd6d8f3be078@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7029af3c-e9f6-043e-b3de-dd6d8f3be078@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Nov 10, 2019 at 01:30:31AM +0000, Ramsay Jones wrote:
> 
> 
> On 09/11/2019 13:35, Luc Van Oostenryck wrote:
> > The comment was added in commit c72032ad3 ("Add comment on what ...")
> > and explain why the size is set before recursing into the object
> > pointed to. But since commit 017034ed4 ("Fix up type examination.")
> > the object is nore examined.
> 
> s/nore/now/?

Arggg, I meant 'no more'.

Thanks,
-- Luc 
