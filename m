Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A639DEEE84
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 23:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387476AbfKDWPV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 17:15:21 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:36296 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389911AbfKDWGJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 17:06:09 -0500
Received: by mail-wr1-f50.google.com with SMTP id w18so18934915wrt.3
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 14:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/jyTqqf8yJj+tZVK+yw+BqmQ6JGuPLGwjz/BklJSLJ8=;
        b=rZgQGjbNfhi7VnFTh/ZaTVKUSIaI4PwrQQcraoPYaEY4S3RsBCTX8NE8DCra3VeVSu
         T4ZYdj9wOCnhJw8EFvCpna+tAaBCVo5kXw7h1KqX3fTw1xXUYbuLv8mE8R6BBolMUmwA
         RtrsHSz8zy6B8mKe4iyKh2lgzsslY0M0e5+TlQ4HIpSn31PenN+lly2wx9d50c2DMmuZ
         NUjIG+EUsTOfIriE8S8buV6qw0007990b+NXLOxig4AZneDWJdOjXH3OrmRQ1cXn7pc2
         Ki8uveXNRO7zlRLziHtUcIonIfVAVLHopEsKoDrqKYEDZszBgvo+8Wzf/6Zpqi7KWobK
         EHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/jyTqqf8yJj+tZVK+yw+BqmQ6JGuPLGwjz/BklJSLJ8=;
        b=txd0Pq0kxYdF+DnNUQ09d1YDBbiOvkksen8Qg98T09NlJ/y9IHshpCGd0VbLFSJfUj
         ESDuSPCU5tg/5m6Gz1mcUBCLyPAmJyhRCqU+dRUO5yoaRqcuTMdvI6WNUVS+UCbAsKI1
         WetQAEYLjjkopW/aEFSlbp3SPyzIhWuqpMnf71hPCR67K6nPcKtPlipWnENtNPbbkhAo
         f4Z/JALnv1a7vpVSt6et0g88iH9bby3xX3N2TEDZzMV37CS2KUI1K5/yQh+fHYvBRTjm
         PxHKQizdSLyGCFiIXTeWvQ2RHQMFdam9MKFwK0TRANO8Xj8JeMFidXL4Oh72QMBhzP8+
         BoMA==
X-Gm-Message-State: APjAAAV+v8WncZR4dYfKkHUSaenf2XqtLoYGC7Tr3D5OQC6sK4BYo2JS
        Gvs/mQ2gYFAezzgh1ZmMs2tK8BWM
X-Google-Smtp-Source: APXvYqxr7dtHgdL2keteLyMUCcZPYQAegbmBbwHXVPHuU3nuLimq+t2WVkCBTqzOje9QYZFU0TvF4A==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr25762865wrp.296.1572905167909;
        Mon, 04 Nov 2019 14:06:07 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id h140sm18931978wme.22.2019.11.04.14.06.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 14:06:07 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:06:06 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104220605.shbfduyg4lrlnbzf@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104214643.d6ta3xok4jypkrjo@ltop.local>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Nov 04, 2019 at 10:46:44PM +0100, Luc Van Oostenryck wrote:
> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
> > I've put the latest code up at:
> > 
> >  https://github.com/bjdooks-ct/sparse bjdooks/printf20
> > 
> > I think it has all the issues dealt with.
> > 
> > I can't currently post or do a final test as away from work laptop.
> 
> Thank you.
> 
> I've a few more remarks about formatting or naming and
> also some simplifications I would like you make.

s/head/args/ in order to use the same variable name everywhere
in your checks.

From cf2e3f8fa9ddba85c14ee40b2191fd702a907c2f Mon Sep 17 00:00:00 2001
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date: Mon, 4 Nov 2019 18:10:25 +0100
Subject: [PATCH 5/7] s/head/args/

---
 evaluate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 76b37e045..fc340c2c3 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2712,7 +2712,7 @@ static int parse_format_printf(const char **fmtstring,
  * in the parser code which stores the positions of the message and arg
  * start in the ctype.
  */
-static void evaluate_format_printf(struct symbol *fn, struct expression_list *head)
+static void evaluate_format_printf(struct symbol *fn, struct expression_list *args)
 {
 	struct format_state state = { };
 	struct expression *expr;
@@ -2722,7 +2722,7 @@ static void evaluate_format_printf(struct symbol *fn, struct expression_list *he
 	if (!fn->ctype.format.index)
 		return;
 
-	expr = get_nth_expression(head, fn->ctype.format.index-1);
+	expr = get_nth_expression(args, fn->ctype.format.index-1);
 	if (!expr)
 		return;
 
@@ -2750,7 +2750,7 @@ static void evaluate_format_printf(struct symbol *fn, struct expression_list *he
 				continue;
 			}
 
-			if (parse_format_printf(&string, &state, head) < 0)
+			if (parse_format_printf(&string, &state, args) < 0)
 				fail++;
 		}
 
-- 
2.23.0

