Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3581D7B89
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 16:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgEROnP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 10:43:15 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:46310 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgEROnO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 10:43:14 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04IEbxA0113205;
        Mon, 18 May 2020 14:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=JNnxX4jBorixlrmPtY2MhWPzFHgn74vw5axLpt8/1q8=;
 b=qmbVLVdYqyioOLUyiKrpO/QzaK6wHwC34grxBugewb+vUlTlfrwLrSX0OSVLP9HfTDmm
 kmzJ/3rONzLYS1AmrGtjLCJeF2gcTHKCXZKwgmcHyNkXa1YfWGDiyaWTAoLxIieTCINL
 S87f9kqJjFvL5AH8G1Sd8niBmBBzwj2iA+mz8s6ax3I0mG/hFwMRdoPjUHRF4p7Brq+A
 xGF2Y574aeNyCGVUxIlv5kGCnW/PEAvqk5FMogva24gfcv+AZYyjU5jciMj5/Vl+KfnC
 AKd8XymTcpA05YzRlCzc9elYT9NCnwd6P7KOLnI+7KIEiYszXR9RATY3girnWEE2VQtQ 6Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31284kq6ab-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 May 2020 14:43:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04IEdHDk195989;
        Mon, 18 May 2020 14:43:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 312sxqhqc7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 May 2020 14:43:11 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04IEh9LN016353;
        Mon, 18 May 2020 14:43:10 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 18 May 2020 07:43:09 -0700
Date:   Mon, 18 May 2020 17:42:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: complain about re-declared functions with different modifiers
Message-ID: <20200518144257.GL2078@kadam>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
 <20200515133617.GF2078@kadam>
 <20200517045637.5e4l6pxiuwsimjxf@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517045637.5e4l6pxiuwsimjxf@ltop.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9625 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005180129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9625 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005180129
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, May 17, 2020 at 06:56:37AM +0200, Luc Van Oostenryck wrote:
> On Fri, May 15, 2020 at 04:36:17PM +0300, Dan Carpenter wrote:
> > On Thu, May 14, 2020 at 10:56:04PM +0200, Luc Van Oostenryck wrote:
> > > Not sure if it's related to Dan's problem or not but with the
> > > following code:
> > > 
> > > 	static inline int foo(void)
> > > 	{
> > > 		return 1;
> > > 	}
> > > 	
> > > 	extern int foo(void);
> > > 	
> > > 	int dummy(void)
> > > 	{
> > > 		return foo();
> > > 	}
> > > 
> > > the static definition of foo() and the extern declaration are
> > > distinct symbols (in the sense that neither has its sym->same_symbol
> > > pointing to the other). As far as I understand, this is correct
> > > because they have a different 'scope'. The problem occurs later,
> > > when doing the lookup in dummy(): which symbol should be returned?
> > 
> > Yeah.  That's it.  When I see the call, I want to parse the statements
> > so I need the symbol with the implementation.
> 
> There must something else too.
> In the example here above I added 'extern' to the second declaration.
> But in your first example no storage was given:
> 	void nvme_put_ctrl(struct nvme_ctrl *ctrl);'
> and in this case, Sparse give it the storage/linkage from the previous
> declaration which was 'static'.
> So in the case, the second occurent has its ->same_symbol set to the
> previous static inline version and it's ->definition points to it too.
> 
> So, I think everything is correct here regarding Sparse (the question
> of a warning is something else: IMO none should be give for a static
> declaration/definition followed by a plain declaration (thus implicitly
> static) but well if followed by an extern one. One is also when
> a static follow an extern or a plain (implicitly extern).
> 
> Doesn't smatch uses ->same_symbol and more importantly ->definition?

Ah...  No I wasn't.

I also need to merge with the last Sparse.  The last time I merged was
in September and back then the ->scope pointers were different so the
two functions weren't counted as the ->same_symbol.

It should all work now.  Thanks!

regards,
dan carpenter

