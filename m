Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE80CBEE7
	for <lists+linux-sparse@lfdr.de>; Fri,  4 Oct 2019 17:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389224AbfJDPSJ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 4 Oct 2019 11:18:09 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52730 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388802AbfJDPSJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 4 Oct 2019 11:18:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x94F3pib086708;
        Fri, 4 Oct 2019 15:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=F93/dPJMls7OUeM2fw7DaG25w0sp/KmZsARP5JvqG6k=;
 b=PWr4GGIMtTgmljiTH6pzWGmgrB4t2YWBBMaU+A45XLJu9Z3ey31sY/GF84t+N4keBqVP
 EjwQLEtHNF89+fbX+xMnRVIvMvWBq0Zjw8orpcYIj6JkQeWNBNfhu2/bfcvsEfmsV0PA
 iGWg9bQnYJNgpJ5gLHPlmiG5o1rZ0SnjdYaDZXbH9JqwTy7rPyCEfBuDjnROSZ6Kn0bV
 5Al51N3n/yWQ/dc14pF1Gnv6wN6vwuDEttSwDv3Ia6m/I3gb7nIYxwtL1p4to4FmYxaV
 TEkp2fXD6TmmUdxKEDiEdUkL+2x51PEU/PLh1chfhM7K5A6mAsoBzmcW7p1E+E80jP1a yA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2v9xxvc93s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Oct 2019 15:18:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x94F6H7C031009;
        Fri, 4 Oct 2019 15:18:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2vdn19y9e2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 04 Oct 2019 15:18:06 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x94FI5R1001473;
        Fri, 4 Oct 2019 15:18:05 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 04 Oct 2019 08:18:04 -0700
Date:   Fri, 4 Oct 2019 18:17:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/1] Makefile: Add back rule to make (touch)
 check_list_local.h
Message-ID: <20191004151757.GA21515@kadam>
References: <20191004150434.2299-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004150434.2299-1-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910040136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910040136
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Thanks, Lee!  This is for Smatch.

This is for Smatch.  I will push this in a few hours or tomorrow
morning.

regards,
dan carpenter

