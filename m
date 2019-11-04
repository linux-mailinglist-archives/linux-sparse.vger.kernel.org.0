Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 016FEEEFB6
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 23:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388371AbfKDWWm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 17:22:42 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:40748 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388265AbfKDV4C (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 16:56:02 -0500
Received: by mail-wm1-f48.google.com with SMTP id f3so6624903wmc.5
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bHbRAEMkjj6CHpJKv7dPt3t2Gt2IzoYctppBaZ6ZdxM=;
        b=X38LeTAG3RxUVVaXajeQ73zyNryVhcUPL5jIYpujCOcBynMnddy3lES9/6TMZ/EyRW
         ruXquyXv/w1WVuYu4ZtULP2Xs3eKVjdNPQrGoHXxewhgEJIa98Sps9B2w5SoKHPFGtea
         0byFRQYFqa1ygCG9r0vAulCcEqI7H70VZntZB29m07ngcqyb91ZUh1Q496GhoTLmogNJ
         /KeLH252gnh8vSWiSsliPI3N0JYq6v0l1Fi2GHZX1ZRNrhX3lXWVw2bWLTMIJW/ir8Y5
         quSn6FzrIqDKnd7wBlFKkYAnHizT1jx0IyW/olqJYNjCye2o9VKM7cA3eYU7xzTQ6+p3
         eS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bHbRAEMkjj6CHpJKv7dPt3t2Gt2IzoYctppBaZ6ZdxM=;
        b=POfrCeS0PhdQ018Ql02D3S2Esb6Ei6dp96NlM0eKYqxBuNRN0NUWU08ombqk/D4H5b
         hkiqTL6saJT9HrE78BixE4aa92Ch9DvWfJFc/z4X8fYv6C5Xo77v73qri4fIUPfPr4J2
         mZ+ZJraECl+ICnaAXPrAwnBN6Wk/2f8sfnEMZjaEjpcYl6mgw+DlFXgTj3fz04vSDjWm
         Zpmr+r+86vu538tJGOFXh+xlbHQu1JmuYiDMtkTGZBUhTFo98u6IBr1hZCxYKAzJb6Y3
         87Y5ppQT4GFh4oCukaoTkA15J/fl8k6whbujhZVE0OwKPFSTc2Tok/IoA81MlC8/QQul
         iAUA==
X-Gm-Message-State: APjAAAWERzbVz5145YL+eFsObtxY58OA425rEmvHTkfrfabE1OzCDoYA
        KHXoNxStfM6XKYpIbu3bzB4iBz6H
X-Google-Smtp-Source: APXvYqzEmgAB5qHpi88gffxOEo7G+WPhZcFbyKb/SepvP9jRR7RT/+LhSYeGGsy+YSSbrkk/4DGgZg==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr7626wmc.121.1572904560462;
        Mon, 04 Nov 2019 13:56:00 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id m13sm5776615wmc.41.2019.11.04.13.55.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 13:55:59 -0800 (PST)
Date:   Mon, 4 Nov 2019 22:55:59 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104215558.qgkh55dkqamce4xb@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104214643.d6ta3xok4jypkrjo@ltop.local>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Nov 04, 2019 at 10:46:44PM +0100, Luc Van Oostenryck wrote:
> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
> > I've put the latest code up at:
> > 
> >  https://github.com/bjdooks-ct/sparse bjdooks/printf20
> > 
> > I think it has all the issues dealt with.
> > 
> > I can't currently post or do a final test as away from work laptop.
> 
> Thank you.
> 
> I've a few more remarks about formatting or naming and
> also some simplifications I would like you make.

A typo and some formatting issues.

From 0522fbfc145c948401b9057a505428df83749cb9 Mon Sep 17 00:00:00 2001
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date: Mon, 4 Nov 2019 15:45:10 +0100
Subject: [PATCH 2/7] misc fixes

---
 evaluate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index ee1d69c53..c415773f4 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2362,7 +2362,7 @@ static int printf_fmt_print_pointer(struct format_type *fmt, struct expression *
 	// TODO TODO: fix this here!!!
 	int ret;
 	*target = &const_ptr_ctype;
-	ret =check_assignment_types(*target, expr, typediff);
+	ret = check_assignment_types(*target, expr, typediff);
 	if (ret == 0) {
 		/* if just printing, ignore address-space mismatches */
 		if (strcmp(*typediff, "different address spaces") == 0)
@@ -2780,12 +2780,11 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 	int i = 1;
 
 	/*
-	 * Do the va-arg format parsing here. This is done as the arugment
+	 * Do the va-arg format parsing here. This is done as the argument
 	 * info may get lost or changed later on in the evaluation loop by
 	 * calls to degenerate()
 	 */
 
-	
 	if (Wformat && fn->ctype.format.index)
 		fmt_string = get_printf_fmt(fn, head);
 
@@ -2826,7 +2825,6 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 	} END_FOR_EACH_PTR(expr);
 	FINISH_PTR_LIST(argtype);
 
-
 	if (Wformat && fn->ctype.format.index)
 		evaluate_format_printf(fmt_string, fn, head);
 
-- 
2.23.0

