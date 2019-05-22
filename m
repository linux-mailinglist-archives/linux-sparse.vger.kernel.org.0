Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAEFC26045
	for <lists+linux-sparse@lfdr.de>; Wed, 22 May 2019 11:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEVJRE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 May 2019 05:17:04 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:59906 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfEVJRD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 May 2019 05:17:03 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4M93rAB157470;
        Wed, 22 May 2019 09:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=vFz9R4zMb1Z8VNnKWFSqc1PSfx9zK15h53U49h73i1s=;
 b=cnyCy3jXlMACyRsNNQcrYB4ZeFcWDDifS8aXOl8NR7jykyat3xIoCHr7DKKjyniTymAx
 AL9R+kxxRVbYcYI57owMOr9hc9nh3Mw1BmRHIkTuGNqztAvr9Z4XchL3o72XlM0PM81F
 s0gDWmDZsI/JztYX2tUxx5g2CY7pVqkrBpRNFq+552vl/YqHRvLRhfvGKCAcmobOW87h
 6ALXTvTxDcBYuStmcjz+GlQGDketmHerEBCnGUULNJ9ltL8qfECIpOxsharMqdsA34+v
 hESyDMlaJHUGCK4WeY0BROTmitJRT8QQHbqi3zn8+YlOHwIhon9l0iHxxgtZItKzxfTl 1w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2smsk52e1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 09:16:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4M9G59A178192;
        Wed, 22 May 2019 09:16:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2smsh1g80t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 09:16:53 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4M9Go6D001700;
        Wed, 22 May 2019 09:16:51 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 22 May 2019 09:16:50 +0000
Date:   Wed, 22 May 2019 12:16:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Himanshu Jha <himanshujha199640@gmail.com>
Cc:     linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
Message-ID: <20190522091642.GQ31203@kadam>
References: <20190520164214.GA14656@himanshu-Vostro-3559>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520164214.GA14656@himanshu-Vostro-3559>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905220067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9264 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905220067
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


On Mon, May 20, 2019 at 10:12:14PM +0530, Himanshu Jha wrote:
> o Why do we have so many open warnings for context imbalance ? Or
>   Why did we stop at some point annotating the codebase ?
> 

What we're looking for here is mostly bugs where we forget to drop the
lock on an error path.  Sparse isn't a great tool for this because it
doesn't have very sophisticated flow analysis.

Smatch has decent flow analysis but it too sucks for finding locking
bugs because I wrote the check_locks.c code 10 years ago.  I said I
would re-write it seven years ago but I never got around to it.  The
smatch check doesn't do cross function analysis, for example...

> struct foo {
> 	struct mutex lock;
> 	int balance __protected_by(lock);
> }
> 
> Can this be done ? Or lock should be global ?
> 
> Because clang analysis wants it to be global!

A __protected_by() annotation sounds like a good idea.  I don't really
care about the format too much.  If the information were in a comment
and we could parse with a perl script that would be fine.  Or we could
do:

	struct foo {
		struct mutex lock;
		__start_protected(lock);
		int a, b, c;
		__end_protected(lock);
	};

In Smatch, I would add an "if (is_probe_function()) return;" and similar
hacks to silence the majority of false positives.

regards,
dan carpenter
