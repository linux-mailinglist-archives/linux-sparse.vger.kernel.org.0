Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86DF5997B0
	for <lists+linux-sparse@lfdr.de>; Thu, 22 Aug 2019 17:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387608AbfHVPFw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 22 Aug 2019 11:05:52 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42936 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387585AbfHVPFw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 22 Aug 2019 11:05:52 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7MF4MOO105549;
        Thu, 22 Aug 2019 15:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=hCJpxpZbwe+4r6UC+Ss/Ot/m0j56MKhrB/YB91IriNE=;
 b=lwTrTVY+BVPdb+1B41cOn0v6MJG6gJPyModl4U3AwbRTv829kwrIPo30ZFdYNpqDyaJL
 NUopb0cnOfBQnp4oGg97ZN7tgOGCRcXuHt2dKZ+dySpZCtx35YYLkOs9vNbxACxDUZ0a
 Amwhdf16u1tTyDgFMiXc9XTDqy160uuESekPUKWHGGXYCJlrr9In6nl8Lpabbsrgv/1k
 7Nvt9eoEO1xqF0xV5L7U5qMlPEE0zdoornZdxLNyf+jzTAJrgyyG97C313aDRgx94lZd
 OidL+YrLcGQz25JnWewRpVQlWlVALLfkTcI3IsF5DjyFBSPsh6lzdUVMQdwcFesdMPx3 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2uea7r6bh5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Aug 2019 15:05:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7MF43oA074619;
        Thu, 22 Aug 2019 15:05:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2ugj7r7qxd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Aug 2019 15:05:41 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7MF5ed8032219;
        Thu, 22 Aug 2019 15:05:40 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 22 Aug 2019 08:05:40 -0700
Date:   Thu, 22 Aug 2019 18:05:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     John Levon <levon@movementarian.org>
Cc:     smatch@vger.kernel.org, linux-sparse@vger.kernel.org,
        yuri.pankov@nexenta.com
Subject: Re: noreturn attribute doesn't work in smatch
Message-ID: <20190822150528.GL3964@kadam>
References: <20190815005328.GA8004@movementarian.org>
 <20190815111237.GA20100@movementarian.org>
 <20190822132800.GJ4451@kadam>
 <20190822134603.GB9904@movementarian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822134603.GB9904@movementarian.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9356 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=809
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908220150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9356 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=869 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908220150
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Aug 22, 2019 at 02:46:03PM +0100, John Levon wrote:
> On Thu, Aug 22, 2019 at 04:30:34PM +0300, Dan Carpenter wrote:
> > The code to handle that is really ancient.  You need to do:
> >     ./smatch --info test.c | tee warns.txt
> >     grep no_return_funcs warns.txt || echo FAIL
> >     ./smatch_scripts/gen_no_return_funcs.sh warns.txt -p=levon
> >     mv levon.no_return_funcs smatch_data/
> > 
> > Then pass -p=levon to smatch on the next run.
> 
> OK, thanks. That doesn't match too well with the way we use smatch, but
> this is much less of a big deal (I only needed to annotate this in a
> couple of places).

It should be the the DB, right?  Would that work for you?

It's sort of an awkward thing because I publish the list of no return
functions used in the kernel, but I don't publish the DB.  So I probably
have to keep both methods...

regards,
dan carpenter
