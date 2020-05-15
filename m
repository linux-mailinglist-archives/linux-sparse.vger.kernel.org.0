Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C3A1D4F56
	for <lists+linux-sparse@lfdr.de>; Fri, 15 May 2020 15:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgEONga (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 15 May 2020 09:36:30 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43976 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgEONga (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 15 May 2020 09:36:30 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04FDHCEf189831;
        Fri, 15 May 2020 13:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=yht5AN7nsRlTHkemAY/khU4KOVoRzUM5PZbvrdLC00A=;
 b=JQ/y6vRMD2/e1IsJyOWkm1CFBcT3ShT9vs/Ll+LIgBtVv6UKVl01MZNhQ3obJYNjhs6g
 kw0KJ15yxhiTnNNPZDLBzloOKkuYySu6LqQY4s1mIgOdwZHnkaWT1M50x0YL4CSlTohi
 MnNBRK1EpF8rpSAOasew9V3dckMqbUPT5dAKJQP3zlpryctZ76tcr8R2Kr0M61pwjm6U
 yQXwjICps447Wxv/slg0RiD7SdqjQ+ybnOIU7kadPgf3QDuruhpKFvhkqqKZBoN2lW01
 tT0WnugPXGMMnbn+mJl2CsKz9RTEgvCU9gmFzp4lVyPdTKHISHxey8kRRxrSwK/jHwKO kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 311nu5kgtj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 13:36:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04FDIBI9169444;
        Fri, 15 May 2020 13:36:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 3100yevk6g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 May 2020 13:36:24 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04FDaNNm032137;
        Fri, 15 May 2020 13:36:23 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 15 May 2020 06:36:22 -0700
Date:   Fri, 15 May 2020 16:36:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: complain about re-declared functions with different modifiers
Message-ID: <20200515133617.GF2078@kadam>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 cotscore=-2147483648
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005150116
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, May 14, 2020 at 10:56:04PM +0200, Luc Van Oostenryck wrote:
> Not sure if it's related to Dan's problem or not but with the
> following code:
> 
> 	static inline int foo(void)
> 	{
> 		return 1;
> 	}
> 	
> 	extern int foo(void);
> 	
> 	int dummy(void)
> 	{
> 		return foo();
> 	}
> 
> the static definition of foo() and the extern declaration are
> distinct symbols (in the sense that neither has its sym->same_symbol
> pointing to the other). As far as I understand, this is correct
> because they have a different 'scope'. The problem occurs later,
> when doing the lookup in dummy(): which symbol should be returned?

Yeah.  That's it.  When I see the call, I want to parse the statements
so I need the symbol with the implementation.

regards,
dan carpenter

