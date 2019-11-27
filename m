Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8D10B4BD
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 18:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfK0Rst (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 12:48:49 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40638 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK0Rst (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 12:48:49 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so3109894wrn.7
        for <linux-sparse@vger.kernel.org>; Wed, 27 Nov 2019 09:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YY+tGCvTDl876HoJiYUKyQDKlk7z44n6n90hyjt0obQ=;
        b=NgZ1VpLZ/aE4uGpAAoEdtPsmYBlc/I/H8gTG/eUt5fy7TO4c/GLG5bxMUyFqiqLC3R
         F6gGMo0dQ1zLq4fdMRGIurCzhnxZELKnUbYWFlCziB5b3AJ3W/zR2LBsZaGJVEliiaiW
         lreQkw+xpgwL6vXpwPeJDNxpmbeqpeOVFt+A/cfCSl8ixqDO7Ylcp0gIL9o/ZKhk53a2
         XqswK0c5mZ/sooYh3ZE5Uks0JBajH6Kcb82p2lwa1xRMyn5iqrQOCIqUcsHrNDvxsRug
         eHyLqBz1zLUd+eDJvNHgf3lmZsEPiwFVmcgFfiGKRPjiU4HtukK6rLNti4CZzEaQvJYb
         mzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YY+tGCvTDl876HoJiYUKyQDKlk7z44n6n90hyjt0obQ=;
        b=Jqn6fIVm5dGUVERbY52VitQRPti/JAdU3sIu4cjT5qHGrcfKljqKhlJY/ZM9ndgYR4
         h4s9NIJUQ3ha4+iNOMd73HiXzu8e2ilLiZKVj1uHU+1f463UbZvhN+eG7YOC7raC7Idy
         1Yxf+FfedlEpst+F7ZYHhiZod/HT8ma+kLqLTyCBX0x95Y7QJ0P2V0u2C2jWmuXuiEwC
         FgdyzPHtOOx57UWWeREhVnzaOKYccbcHwnnIVH5Fgd1AnU/+ttsON8RJQHLlAk28/n0w
         5SoE7fBl6pPo1p2J2BYSnu1pPc9g2GOFQ85k2uMyu0ecqK2an6D4cDo0VyeXf3mD8jlo
         degg==
X-Gm-Message-State: APjAAAUowDYkquZrlwcXYGZll7xjruF1tNyi7FXtckBvTJYZ1/i8PHsQ
        0v4C6J+5lyB6+wZsoCdvi9A=
X-Google-Smtp-Source: APXvYqzEsUfGy6g6Fu/ibcpxceRi4xHHlRvq2G+OKAnK0se8qEV9nHWC0eNOVUsF1MDGdQI3Y8eyWg==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr27394749wru.398.1574876927687;
        Wed, 27 Nov 2019 09:48:47 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:fd24:9122:c21d:b679])
        by smtp.gmail.com with ESMTPSA id g138sm7898170wmg.11.2019.11.27.09.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 09:48:47 -0800 (PST)
Date:   Wed, 27 Nov 2019 18:48:45 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 0/4] More arch specific fixes
Message-ID: <20191127174845.uol5jdfdqpso6o3h@ltop.local>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 27, 2019 at 05:15:20PM +0000, Ramsay Jones wrote:
> 
> 
> On 27/11/2019 02:23, Luc Van Oostenryck wrote:
> > These are small tweaks going on top of all the previous ones.
> 
> Hi Luc,
> 
> I only had minor comments on this (and the previous) series, but I
> haven't had a chance to apply and test them yet.
> 
> I was going to just test 'luc/int128_ctype', but looking at the output
> of 'git log --oneline --graph master..luc/int128_ctype' I can see that
> several other branches are merged into the result. So, I will apply
> the patches from the mailing list directly to test them (hmm, _hopefully_
> tonight).

Hi Ramsay,

Sorry, I should have added in the cover letter that the series
with all related patches is available at:
	git://github.com/lucvoo/sparse-dev.git next


Best regards,
-- Luc
