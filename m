Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA19181412
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 10:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbgCKJH6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 05:07:58 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40856 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbgCKJH6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 05:07:58 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02B94U0X167398;
        Wed, 11 Mar 2020 09:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=qSArWpwHs0jY7VVZekJtWjPziSOUOHQpU5TxgeAQGNs=;
 b=SQBcI8WHalQb35Dn+DLBeNTIBxFkEzia4lL/qgSrGFJlT8uQOcfXokKWuC21M/DCzAvd
 2kEAr3wOw7yc56wRftghvSlywlqjn337LAQ1ukDtNWI/PDtj0sopJqLMmg5zg+iplT2l
 yNJ1IbTvkW5LaTWtDvqf7TjZcqb06Fs1NEPiWmk/8LrIsQ0C6CxcFXi8DK3keqWuMEJs
 klnZGOwalYriC8POVSq+eUHeYIXnJJFTi7TxuiKUHAdvaA0K+PHSrNB/ZMgHLatFWk5Y
 BXs3vl9TRXEXFPCpIvYyVeD85C0Kq3fE3580a4iZP4UaYhNCUH+cJsL1C8NkI5sdRFl4 Kw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2ym31ujc7b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Mar 2020 09:07:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02B93jTa002640;
        Wed, 11 Mar 2020 09:07:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2yp8qukdj6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Mar 2020 09:07:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02B97pl8029837;
        Wed, 11 Mar 2020 09:07:52 GMT
Received: from kadam (/10.175.218.27)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 11 Mar 2020 02:07:51 -0700
Date:   Wed, 11 Mar 2020 12:07:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200311090745.GD11561@kadam>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310150713.GB19012@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110059
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Mar 10, 2020 at 04:07:14PM +0100, Oleg Nesterov wrote:
> Annoyingly, this triggers a lot of sparse_error's in pre-process.c:collect_arg().
> And just in case, of course this is not specific to dissect/sindex, ./sparse or
> anything else will equally complain.
> 
> For example,
> 
>   1011  static inline bool page_expected_state(struct page *page,
>   1012                                          unsigned long check_flags)
>   1013  {
>   1014          if (unlikely(atomic_read(&page->_mapcount) != -1))
>   1015                  return false;
>   1016
>   1017          if (unlikely((unsigned long)page->mapping |
>   1018                          page_ref_count(page) |
>   1019  #ifdef CONFIG_MEMCG
>   1020                          (unsigned long)page->mem_cgroup |
>   1021  #endif
>   1022                          (page->flags & check_flags)))
>   1023                  return false;
>   1024
>   1025          return true;
>   1026  }
> 
> leads to
> 
> 	mm/page_alloc.c:1019:1: error: directive in macro's argument list
> 	mm/page_alloc.c:1021:1: error: directive in macro's argument list

This does:

	/* Shut up warnings after an error */
	has_error |= ERROR_CURR_PHASE;

so we probably end up not seeing some warnings.

> 
> and it is not immediately clear why. Yes, because "unlikely" is a macro.
> 
> Can't we simply remove this sparse_error() ? "#if" inside the macro's args
> is widely used in kernel, gcc doesn't complain, afaics pre-process.c handles
> this case correctly.

s/correctly/the same as GCC/.  The behavior is undefined in c99.

regards,
dan carpenter

