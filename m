Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49982C939A
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 23:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbfJBVpD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 17:45:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46778 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfJBVpD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 17:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6mfjJ61ZOriShInThe6KuZ5zam610WpEenQpP858nk4=; b=JqrTnqxvtPRY0nLJQSyQh5rFk
        b2txP+/Stdf6qSg6ZnHV3EdC4NE9Tsq9iHSQ/zwJ4Y5TRbbCfuMUrVCf/leUPZvlAoa2JQtokj4y+
        BtFESud3GT1OKPRQt7394opmUcKGVlEUVlvDGXZ0TlZ0qFPr4IxFg+F8TJF8gALQnRigQnR+XVLQx
        HK7l6an5utF2dv3gUHQHuqVMsC4kNAPStqIZRdltKjo1X0w3T7i9OerFV83vQ6O06RLoi+eItROCI
        B1fNeoUva8naFtkoNi9EpB38ATwHQHdXdplxKdUVrecfjgD4TDGk2PzBLDXiwPWAng6nhsuOHW9rG
        EUhWa6OdA==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFmQf-0007x7-Ne; Wed, 02 Oct 2019 21:45:02 +0000
Subject: Re: [PATCH] void-cond: allow void in conditional expression
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
 <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c8d2bf4c-c1b5-73f9-e044-0be5b2dfafc4@infradead.org>
Date:   Wed, 2 Oct 2019 14:45:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 10/2/19 2:23 PM, Luc Van Oostenryck wrote:
> As an extension, allow conditional expressions (?:) with one
> side of type 'void' and consider the result to also be void.
> 
> The warning can be reinstated with the flag '-Wcond-void'.
> 
> Note: I only see a single occurrence of this in the kernel.

Yes, I would prefer to eliminate that one.  :)

> Suggested-by: Randy Dunlap <rdunlap@infradead.org>

I prefer
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

I didn't try to Suggest this.

One man page edit below...

> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c                   | 7 +++++++
>  lib.c                        | 2 ++
>  lib.h                        | 1 +
>  sparse.1                     | 7 +++++++
>  validation/cond-err-expand.c | 2 +-
>  5 files changed, 18 insertions(+), 1 deletion(-)


> diff --git a/sparse.1 b/sparse.1
> index beb484423..71ac0c646 100644
> --- a/sparse.1
> +++ b/sparse.1
> @@ -117,6 +117,13 @@ Sparse issues these warnings by default.  To turn them off, use
>  \fB\-Wno\-cast\-truncate\fR.
>  .
>  .TP
> +.B \-Wconditional\-void
> +Warn if one side of a conditional expression (\fB? :\fR) is of type
> +void and the other one not.
> +As an extension, Sparse consider the result of such expressions as also

                           considers

> +having the type void.
> +.
> +.TP
>  .B \-Wconstant\-suffix
>  Warn if an integer constant is larger than the maximum representable value
>  of the type indicated by its type suffix (if any). For example, on a


Thanks.
-- 
~Randy
