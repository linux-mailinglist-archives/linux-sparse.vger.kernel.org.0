Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5EABC259
	for <lists+linux-sparse@lfdr.de>; Tue, 24 Sep 2019 09:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404288AbfIXHKc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Sep 2019 03:10:32 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60964 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404243AbfIXHKc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Sep 2019 03:10:32 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8O78dUs127053;
        Tue, 24 Sep 2019 07:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=okhgsaKedUCwWr7pKuWbIx3Y/HTQYaIo0pRhZ1zxCYc=;
 b=TSxc++A7swnjJakzuGrojrjqiwmiECvpC5JOqC+StG5+royIhQbwdtoknBwqBVKryaOu
 oWKSFCE/SJTOTVW8upcZeAwqsQK9TZkUAI7B0csc0nR5l0IKMmBdh0w9aOaCAoYdF6nW
 ccL7NuLzWqYE/4XEahxzRIGHrzXhn0UozjCgNmPuzwKaykfzjwHwqF9jyRZnfDhdaB5I
 04I9I4t/5et3EGAyv1LwrS2RZs1fyBweO4+9do4bSjnIkxSlvJpuNnyRvuP4E2bqvtY4
 vLGNgeHDeynVKFPagpEXxBTB09/wMKwFC9pQulH3q5oSbfceZKiBN8mY1XUo8Jxogvzd rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2v5b9tkytb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Sep 2019 07:10:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8O78X40096394;
        Tue, 24 Sep 2019 07:10:28 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2v6yvpk26d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Sep 2019 07:10:28 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8O7ARYV025966;
        Tue, 24 Sep 2019 07:10:27 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 24 Sep 2019 00:10:26 -0700
Date:   Tue, 24 Sep 2019 10:10:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: Re: enums and EXPR_VALUE and sign expansion
Message-ID: <20190924071020.GK20699@kadam>
References: <20190923193856.GJ20699@kadam>
 <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909240071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909240071
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Sep 23, 2019 at 03:16:56PM -0700, Linus Torvalds wrote:
> Luc - I _suspect_ that what happens is that it now does that
> 
>                 expr->ctype = base_type;
> 
> in parse.c, which is correct in the long run, but AT THE TIME it is
> parsed, the type hasn't been finalized yet. That's fine - we'll fix it
> in-place eventually.
> 
> HOWEVER. We also do this:
> 
>                 if (ctype->bit_size == base_type->bit_size)
>                         continue;
>                 cast_value(expr, base_type, expr, ctype);
> 
> and I think it's that 'cast_value()' that gets things wrong somehow.
> It probably uses a 'unsigned int' either as the source or the
> destination, or something.

Thanks, Linus.

That was the problem.  get_longlong(old) has to have the original ctype.

regards,
dan carpenter
