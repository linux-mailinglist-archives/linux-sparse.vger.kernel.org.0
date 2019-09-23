Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E46BBC50
	for <lists+linux-sparse@lfdr.de>; Mon, 23 Sep 2019 21:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfIWTjH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 23 Sep 2019 15:39:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37848 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbfIWTjH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 23 Sep 2019 15:39:07 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8NJDhEw170663;
        Mon, 23 Sep 2019 19:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=gA/KvlKio+33NUFGnDBD6VeRYh62T77ij9FDBa7XUQ0=;
 b=Dd3ZBE4unQT8Y8RCEQATt4y967kNMR40QdKO3CvKFqDEUiEX1NDh99948U/vCQufCzWY
 GlgdOVKD0SXRrJY577YvcPOuEV2r1h8iPtMpLcOeDx+t+K3niE7sKzDzOB8OWHHxYxo1
 AUoNMUIjrHWxz8Gqb3tubQ4CuWnqSUT1y/DkD3RllXER3FQ1BEdBL08SAIsxA8w6atuT
 zQ3/cxZWdEUrIQja8Dx0MFARHAk3hkI5zIUeq+2+fl4EAaZNzNKUtnDLSBYL2P0LNZoU
 fisA7k+L/k5yrU1CHZCiM+WhB0Q/7jrfkZh8jLSTGSJraAV42BWJx0y9oqy+F97SwiEu lA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2v5cgqs2wg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Sep 2019 19:39:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8NJd446120724;
        Mon, 23 Sep 2019 19:39:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2v6yvq1213-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Sep 2019 19:39:04 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8NJd3b3026268;
        Mon, 23 Sep 2019 19:39:03 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 23 Sep 2019 12:39:03 -0700
Date:   Mon, 23 Sep 2019 22:38:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: enums and EXPR_VALUE and sign expansion
Message-ID: <20190923193856.GJ20699@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=653
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909230165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=751 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909230164
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

I'm upgrading to the latest version of Sparse and it's mostly been easy
and full of improvements but I'm running into one issue:

The problem is that if you have:

enum {
	a = 0x80000000,
	b = -1,
}

Then Sparse doesn't handle that correctly and it leads to a false
positive in Smatch.

drivers/scsi/stex.c:1879 stex_hba_stop() warn: always true condition '(st_sleep_mic != 4294967295) => (s32min-s32max != 4294967295)'

In GCC the enum would be a signed int, but in Sparse it is a signed
long (on my 64 bit system).  That would be fine except the second issue
is the signed bit isn't expanded correctly because a long -1 should be
0xffffffffffffffff and the expr->value is 0xffffffff.

regards,
dan carpenter


