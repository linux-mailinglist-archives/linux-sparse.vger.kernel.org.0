Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0891D1860DB
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Mar 2020 01:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgCPAq1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Mar 2020 20:46:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51462 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729294AbgCPAq1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Mar 2020 20:46:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id a132so15834969wme.1
        for <linux-sparse@vger.kernel.org>; Sun, 15 Mar 2020 17:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=orVlvqy4cyOxBTTIV0cI7HhAtW1gpzZGyJU9Sd9iSRk=;
        b=mFv1ls8RLm8XJWxCE+wM6sTaMpej3PN9n3HNx4wWq1NMtUSwbHIS3Og1OiXaCdcSRp
         JoIVyyjs+7vS+fUJ6+7k45XatDvMxuE05vLqld4VNX+MlGZblLiPjOh/vNtcA87PWxzK
         FMr5BU/r4u0z7wbLL2wP2mfRKjjWjSnu2cY29DUn9P1wJcmflwOHVY0KtJ6s/NSZN6J3
         hsHqG7IZlwXG3PUPqO2GOf4r2AvtwhmA6OVGc8OuspPYIOQDngy/j90La7F1RfF4urlg
         ZVh7Ctn+7hKU5JGRqtDQLC120HLS/Gdm6wCYTuP9YoMarNWm4uVjW/o0rBOF9MSXbccq
         KmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=orVlvqy4cyOxBTTIV0cI7HhAtW1gpzZGyJU9Sd9iSRk=;
        b=d+MHpWLKneFAicpQLPqEnmtV3gu06RboJjn4j38IxadJCeYUUc+PUB5yu22hb7z8iX
         uu8Fuq3w1JpSYZOP2WRp8PghtLteS+N7XgaUtlkkmJRUHKSKvLFaHLmp5BQa+OnwXHDj
         +PzAmvkfrmIDv9wyP0phiRaqWGqBwF6qJUCPrTg11A9sHNLl9aK88RbrQvH5Bi3Xxp70
         cLMAM8yBkwGi4ii6UUQUAg7IPNVubhDEWeeT89BvzXfNXXKbNMuAKL0hQK5wJUCM02Re
         Y++togOs4B5ZwgvqPxhJioSm58ioYtArQDCRlDab1ZzhWfKixYbgZaWLMI1REVaqZeF2
         K/Vg==
X-Gm-Message-State: ANhLgQ1wYdRyKguX+9InQegaztDiHU94XHuy3EhBzn7qwZSlKcxHkNJz
        lZOsFfQLralENRGVy4Xs0CnYu62t
X-Google-Smtp-Source: ADFU+vvqxkZsOyf5nIB0k/hDHUcfAqeXqsuGTwBrUY2zFPeMwldG2fODnnBXRenez+3VjO1LXgc36w==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr23298318wmh.113.1584319584031;
        Sun, 15 Mar 2020 17:46:24 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40a4:c800:887e:5f4c:6cd8:4f03])
        by smtp.gmail.com with ESMTPSA id w1sm25992708wmc.11.2020.03.15.17.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 17:46:23 -0700 (PDT)
Date:   Mon, 16 Mar 2020 01:46:22 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     linux-sparse@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] cpp: silently allow conditional directives within macro
Message-ID: <20200316004622.hoiz72yi2wloz25g@ltop.local>
References: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
 <20200312211630.53710-1-luc.vanoostenryck@gmail.com>
 <20200313161748.GA22910@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313161748.GA22910@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Mar 13, 2020 at 05:17:48PM +0100, Oleg Nesterov wrote:
> On 03/12, Luc Van Oostenryck wrote:
> >
> > @@ -2098,6 +2103,12 @@ static void handle_preprocessor_line(struct stream *stream, struct token **line,
> >  		if (false_nesting)
> >  			goto out;
> >  	}
> > +
> > +	if (expanding) {
> > +		if (Wdirective_within_macro && !is_cond)
>                     ^^^^^^^^^^^^^^^^^^^^^^^
> I am not sure Wdirective_within_macro is really useful after this change,
> I'd suggest to drop my patch but this is up to you.

Yes, it makes much less sense now. I've replaced that by supporting
-pedantic.
 
> > +			warning(start->pos, "directive in macro's argument list");
> > +		expanding = 0;		// warn only once
> > +	}
> 
> then you should probably update preprocessor22.c ? See below.
> 
> I am not sure about validation/preprocessor/expand-redef.c added by the
> previous patch,

Yes, I hadn't updated the testcases because the patch just a RFC
to see if just allowing the #if/... was OK (but I forgot to mark
is as such) and they also depended on the previous RFC patch about
the expansion of newline.

Series updated and pushed now.
Thanks for the review.

-- Luc 
