Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11424107A72
	for <lists+linux-sparse@lfdr.de>; Fri, 22 Nov 2019 23:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfKVWRD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 22 Nov 2019 17:17:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55457 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKVWRD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 22 Nov 2019 17:17:03 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so9038073wmb.5
        for <linux-sparse@vger.kernel.org>; Fri, 22 Nov 2019 14:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O/Oge5YswAVdrsKSMOS0GphfsMNvA83Xul1qzR/tyW4=;
        b=oxv8ieneP5z7FSqhLJubQ3GaQfjJt20MN1EMv2Z0HDasM8jmHRunXxLeqDxdJNym0l
         n81KH43uKyfHbY9ASHwp/yzIcQps/dmbGC9Kr8EJQl7E5oRCcstYE+QLe0vrbVXP/U3l
         KqHLkZB70sQBtsg/mFPzQDjflYx3jY0l1+kEq1kx2jGXvWkJbb4XU9Cug+FbmBl54A7z
         fDWwngDMwCW79Pftqh3I+z67ONnfw/9A6tky9CIhwJih2beWHceQZJ14RAXSZj9bbTEt
         oX5g18AVBWmQ8a8uXPXb8ddDzENQ2NOARHuKSCAaZpsquPw/v0xojsvwdqpo83a2RYN7
         6w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O/Oge5YswAVdrsKSMOS0GphfsMNvA83Xul1qzR/tyW4=;
        b=FfmeTtQKXlLW5bvRI7Gr0BXVRvH5rfpP0YJgbWAXH/VwJsTfW6bwlHqSxqQQOMm5+x
         y9+FTJthIBXUrMrjUFG7u5fp7PyOD6ptd81wQ8WRtVuF5Y8uyfB4V/4aoRnqdbkpavFI
         pD1CYpAPpY+JRNqzfCfEOLV7kHwhsINRd3bYQO03b9Y7Xam5x4pkSJA0TO7RSUlhLCNc
         33zDgcmJzalMdNHqcyrzc8vSeui19HULxThu/7RQ02HNtQCW8NExivVko/cGs09NO1qN
         qdk1VP2NYJPZXoiHXTaAB79Qxl/+a0HwlMAEKhTs8dLskDhSfSeU7Qd+dUytWbrkCwWy
         stBg==
X-Gm-Message-State: APjAAAVYwN3A3W7IAuiFapx7v+lXFU8QmVDP2N2JmpY4KRQe0N4K3UOR
        2z+dHPOtL3lD3mn59S0nfIpQepea
X-Google-Smtp-Source: APXvYqxfI0prFFkxXjjCuMBplJPgEH9XWvLsbBymNxSAyhvPK5r3RIdbxNg0d3IAC+V2NNF1+7O2ng==
X-Received: by 2002:a7b:c44c:: with SMTP id l12mr12079839wmi.71.1574461020047;
        Fri, 22 Nov 2019 14:17:00 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40e1:9900:471:5dfd:45d1:2eca])
        by smtp.gmail.com with ESMTPSA id b15sm9058023wrx.77.2019.11.22.14.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:16:59 -0800 (PST)
Date:   Fri, 22 Nov 2019 23:16:58 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2] let function definition inherit prototype attributes
Message-ID: <20191122221658.3cmkxw35fguvfbvo@ltop.local>
References: <20191121131128.7563-1-luc.vanoostenryck@gmail.com>
 <8f474daa-4c17-3012-6cee-d68807d48a6b@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f474daa-4c17-3012-6cee-d68807d48a6b@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Nov 22, 2019 at 04:23:27PM +0000, Ramsay Jones wrote:
> 
> 
> On 21/11/2019 13:11, Luc Van Oostenryck wrote:
> > It's common to declare a function with the attribute
> > 'pure' or 'noreturn' and to omit the attribute in the
> > function definition. It mak somehow sense since the
> > information conveyed by these attributes are destined
> > to the function users not the function itself.
> > 
> > So, when checking declaration/definition, let the
> > current symbol inherit any function attributes present
> > in previous declarations.
> > 
> > Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> > ---
> > 
> > The patch is also available for review & testing at:
> > 	git://github.com/lucvoo/sparse-dev.git fun-attr-inherit
> > 
> > Changes since v1:
> > * the old name was 'allow omitted function attribute in definition'
> > * change the approach: instead of filtering out these attributes at
> >   check-time, let's inherit them at declaration-time.
> 
> Yep, I noticed that you didn't push the last patch #5. I had also
> thought that this would be a better approach, or rather that the
> test should be that the 'attributes list' given on the function
> definition should be a subset of the list given on the declaration.
> (so that the 'extra' attributes would be inherited by the function).
> 
> This would imply, of course, that sparse should issue a warning/error
> when the attribute list on the definition contained some attributes
> that were not present in the declaration. Well, it seems reasonable
> anyway! ;-)

Yes, sure. Ultimatly, maybe the disctinction should be made between
the attributes:
1) that matter for the user of the function: in this case the
   attributes should be already present in the declaration.
2) that doesn't matter for the user: in this case, it also
   doesn't matter if already present in the declaration or not.

Note: some properties, may only matter for the user and not to the
      definition. 'pure' & 'noreturn' are not really in this case
      because, ideally, the definition should check that it is
      indeed pure or doesn't return (or, at least, may not always
      return).

So, simply inheriting the attributes like done here is too simple.
 
> It seems gcc has other ideas:
> 
>   $ cat -n junk.c
>      1	
>      2	extern void exit (int __status) __attribute__ ((__noreturn__));
>      3	
>      4	void func0(int a) __attribute__ ((pure));
>      5	
>      6	__attribute__ ((pure)) __attribute__ ((__noreturn__))
>      7	void func0(int a)
>      8	{
>      9		exit(0);
>     10	}
>   $ 
> 
> So, sparse (with this patch applied) gets it:
> 
>   $ ./sparse junk.c
>   junk.c:7:6: error: symbol 'func0' redeclared with different type (originally declared at junk.c:4) - different modifiers
>   $
> 
> But gcc, not so much:
> 
>   $ gcc -c junk.c
>   $ gcc -Wall -c junk.c
>   $ gcc -Wall -Wextra -c junk.c
>   junk.c: In function ‘func0’:
>   junk.c:7:16: warning: unused parameter ‘a’ [-Wunused-parameter]
>    void func0(int a)
>                   ^
>   $ 
> 
> So, I don't know ...

In my case, with gcc 8.3, the result is different:
	$ gcc -c junk.c 
	junk.c:4:1: warning: 'pure' attribute on function returning 'void' [-Wattributes]
	 void func0(int a) __attribute__ ((pure));
	 ^~~~
	junk.c:8:1: warning: 'pure' attribute on function returning 'void' [-Wattributes]
	 {
	 ^
	junk.c:8:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'pure' [-Wattributes]
	junk.c:4:6: note: previous declaration here
	 void func0(int a) __attribute__ ((pure));
	      ^~~~~
	junk.c:8:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'pure' [-Wattributes]
	 {
	 ^
	junk.c:4:6: note: previous declaration here
	 void func0(int a) __attribute__ ((pure));
	      ^~~~~

but this doesn't invalid your point. 

A priori, though, it seems to me that simply ignoring these function
attributes when checking the declaration/definition compatibility,
like it was done in the previous patch, is inferior.
I'll need to think a bit more about all this.

Thanks for your feedback.
-- Luc
