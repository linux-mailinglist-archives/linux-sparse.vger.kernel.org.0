Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444306CD01
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jul 2019 12:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390006AbfGRKvY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jul 2019 06:51:24 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:33760 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfGRKvY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jul 2019 06:51:24 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6IAnPBQ053229;
        Thu, 18 Jul 2019 10:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : sender
 : to : cc : subject : message-id : references : mime-version :
 content-type : in-reply-to; s=corp-2018-07-02;
 bh=wwXC44A4PPjZ3DHkTvIb4ZeGgYqv0I1E/ugLXF1u4F4=;
 b=nMjOmhRnWbxh0V8f9hkERLpNolWgUiAmKXwB2WapKsi3wIjuxZvcxTmQHKTCAXkSPPo8
 /zL5pw35T/Mz04cf3hKs9QbbnywHjLVFJ69FKAZq85m9rM3IPLbjRzdQHP9j9liXTuPD
 UzRhcZnmJ0p7ChdMxPLWIqLn4YCOBHidjYs2U5zfBc19I5MMM3PR+qEHgz9ur7L3IXL4
 QcnuRFQD6pWqfydpNqpMkp83+BuHXVkzcJjsXdGdXldX+2A/7XKsSZ2cf2o2s7aREW90
 pm3igLZk2yDeGQzyytsu9nq6sYV50X5tW2Ru+TsVLzBpsKWAx7QPDEy2GFerK9SzEEVy EQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2tq6qu08js-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Jul 2019 10:50:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6IAmFGu012952;
        Thu, 18 Jul 2019 10:50:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2tt77hnpq2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Jul 2019 10:50:42 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6IAof8m018588;
        Thu, 18 Jul 2019 10:50:42 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Jul 2019 10:50:41 +0000
Date:   Thu, 18 Jul 2019 13:50:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     John Levon <levon@movementarian.org>
Cc:     smatch@vger.kernel.org, andy@omniosce.org,
        linux-sparse@vger.kernel.org
Subject: Re: Packed struct size issue
Message-ID: <20190718105035.GE3111@kadam>
References: <20190717134234.GA5551@movementarian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717134234.GA5551@movementarian.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9321 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907180121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9321 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907180121
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

[ resending to the correct Sparse email address ].

On Wed, Jul 17, 2019 at 02:42:34PM +0100, John Levon wrote:
> 
> Andy Fiddaman discovered:
> 
> $ cat ./test.c
> #include <stdio.h>
> #include <stdint.h>
> 
> struct t1 {
>         uint8_t                 critical_warning;
>         uint16_t                temperature;
>         uint8_t                 available_spare;
> } __packed;
> 
> _Static_assert(sizeof(struct t1) == 4, "bad size for t1");
> 

I've added Sparse mailing list to the CC.

It looks like the packed attribute is broken on upstream Sparse (from
April) as well and I would prefer if they fixed it and I pulled in their
fix.  It's probably better to use __attribute__((packed)) instead of the
__packed macro in the test code.

regards,
dan carpenter
