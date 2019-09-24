Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0DE3BC255
	for <lists+linux-sparse@lfdr.de>; Tue, 24 Sep 2019 09:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502403AbfIXHJF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Sep 2019 03:09:05 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59052 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502364AbfIXHJE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Sep 2019 03:09:04 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8O78X91126924;
        Tue, 24 Sep 2019 07:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=RFwwaUFLxGTQO51wJw5yePdlB9q+s/0qXF7i/YfO1ds=;
 b=GzQXg2omH9ICFsvgVpa9SfNp38/OoeU9mLdY0+3mlIWcgL9BTisONKHc93JB5QcM2oTI
 +gbIhvZ6KD740mJ91JkVm8Y/0lgyIqs/aKkeaghleiDgwIyFot7VSZAGf+t4DeIM6CkU
 Q6OhIQldvlslG3iV8tCFK+ERgYzOl+v6+1hzZ7UcNMd8sNhqkVuZyOGKLPKDlbdg2bGa
 9i7hWQdYe+xg9X8nNdVT61H6lnr40ZHN7LzlRoMQRp85+kITKxdNxwlgIcnk9RN+A2NA
 xZqzNnwHtRJkENSRkJQjqMbtms086/vCddkt9ccrcLOniuF2J42IAcO4dRGPDUkOA2pg pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2v5b9tkyb2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Sep 2019 07:09:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8O77mq2159123;
        Tue, 24 Sep 2019 07:09:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2v6yvr2t2q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Sep 2019 07:09:00 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8O78xf9027663;
        Tue, 24 Sep 2019 07:08:59 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 24 Sep 2019 00:08:58 -0700
Date:   Tue, 24 Sep 2019 10:08:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] parse: Fix sign extension in casting enums
Message-ID: <20190924070852.GA24834@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909240071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909240071
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The problem is the sign isn't extended properly when this casts an int
to a long.  The expr->ctype has to be the original int ctype for the
cast_value() call so that the "value = get_longlong(old);" expansion
works correctly.

Fixes: 604a148a73af ("enum: fix cast_enum_list()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 parse.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parse.c b/parse.c
index 7954343..5ced2f4 100644
--- a/parse.c
+++ b/parse.c
@@ -890,10 +890,12 @@ static void cast_enum_list(struct symbol_list *list, struct symbol *base_type)
 			expr->ctype = &int_ctype;
 			continue;
 		}
-		expr->ctype = base_type;
-		if (ctype->bit_size == base_type->bit_size)
+		if (ctype->bit_size == base_type->bit_size) {
+			expr->ctype = base_type;
 			continue;
+		}
 		cast_value(expr, base_type, expr, ctype);
+		expr->ctype = base_type;
 	} END_FOR_EACH_PTR(sym);
 }
 
-- 
2.20.1

