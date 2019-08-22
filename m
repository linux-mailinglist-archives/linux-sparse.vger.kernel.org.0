Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C369951C
	for <lists+linux-sparse@lfdr.de>; Thu, 22 Aug 2019 15:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbfHVNcw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 22 Aug 2019 09:32:52 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:54080 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfHVNcw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 22 Aug 2019 09:32:52 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7MDTXws014076;
        Thu, 22 Aug 2019 13:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=C1Wv3tdAVw2xDUAYsEtzApTXudLtXKogSkiT0+24GLw=;
 b=ZjEeX8MOsIbG688D+jm2Qn8bvZ1uoJaq68iyoY0lY2mNLEXlkvx63YN2PbTsqZQV6SsT
 qk7uukyJrIqRJn0unXF5gCgxe2DcjnkfujjKYJPDj937P4Q1OqcOXP6a6Tkx/9TN0jed
 TL/yAuezZl3To+RzCJgnus1hW+Je1+X5cGPkJek3pXq41/bEyOuuTeBI7+6Ie8oPLGPj
 St4xQMxZCS8uGp3d1QwcQXgJ7vY1GmcT4D5FvQ/6ESVOs7ApAGWxVfoFANhvNSQpPUk/
 B67iOZSxqMfIHBliHXZenQ5h2qBN2Fd0WPmj6muSIkIQjhBaNBAZp2arNMGvZqXH3MGI Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2ue9hpwjcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Aug 2019 13:32:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7MDSkqf184953;
        Thu, 22 Aug 2019 13:30:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2ugj7r4j6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Aug 2019 13:30:42 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7MDUfb7019190;
        Thu, 22 Aug 2019 13:30:41 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 22 Aug 2019 06:30:40 -0700
Date:   Thu, 22 Aug 2019 16:30:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     John Levon <levon@movementarian.org>
Cc:     smatch@vger.kernel.org, linux-sparse@vger.kernel.org,
        yuri.pankov@nexenta.com
Subject: Re: noreturn attribute doesn't work in smatch
Message-ID: <20190822132800.GJ4451@kadam>
References: <20190815005328.GA8004@movementarian.org>
 <20190815111237.GA20100@movementarian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815111237.GA20100@movementarian.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908220144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908220144
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Aug 15, 2019 at 12:12:37PM +0100, John Levon wrote:
> 
> I took another pass, and this works for me:
> 
> diff --git a/parse.c b/parse.c
> index ca4726b8..44c59707 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -2859,6 +2859,7 @@ struct token *external_declaration(struct token
> *token, struct symbol_list **lis
>         /* Parse declaration-specifiers, if any */
>         token = declaration_specifiers(token, &ctx);
>         mod = storage_modifiers(&ctx);
> +       mod |= ctx.ctype.modifiers & MOD_NORETURN;
>         decl = alloc_symbol(token->pos, SYM_NODE);
>         /* Just a type declaration? */
>         if (match_op(token, ';')) {
> 
> (I suppose a proper fix would collate all function-level attributes
> but...)
> 

This patch seems like a hack, but I will apply it...

> 
> However, it seems like smatch is still not quite passing its knowledge
> along: if I have:
> 
> extern void die() __attribute((__noreturn__));
> 
> void mydie()
> {
> 	die();
> }
> 
> then the die() call is nullified, but smatch doesn't realise that means
> all paths of mydie() are __noreturn__ too.

The code to handle that is really ancient.  You need to do:
    ./smatch --info test.c | tee warns.txt
    grep no_return_funcs warns.txt || echo FAIL
    ./smatch_scripts/gen_no_return_funcs.sh warns.txt -p=levon
    mv levon.no_return_funcs smatch_data/

Then pass -p=levon to smatch on the next run.

regards,
dan carpenter

