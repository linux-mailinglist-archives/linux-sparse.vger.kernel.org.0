Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1D0EEDD0
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 23:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390028AbfKDWKR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 17:10:17 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:36305 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389916AbfKDWKR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 17:10:17 -0500
Received: by mail-wm1-f52.google.com with SMTP id c22so17786591wmd.1
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 14:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WnjJ+5eqn9NGxtrxwzaWlzPIIAXKXb8eVBtWqnxJbG8=;
        b=IV2UGO5PyojFfF3fooWAXIzwQR/f5xEPFRlYkl3cpYsBKeaCv54scMsdBvuzU7Z4/6
         fp1uUzDqm1Rr9u1TrXSq8rtdPRlYclhZgZyNr8VNAx2fCA5f4EkzdgrA2F3YgLojoxsh
         KjfZMOALU9m8CQVOQk6RfEvzgE4/T9p+VLWjxcchY5LrFf6V5UNFgXyKsTyENsWfZCz3
         xS3SWu7khj6KdY8qYdDBgIQ9BPNM0EYTdsNk71bnxbRFY/5zKO63pVfpQx3BVNANjKyc
         8DfpWo2QbFVYp7B54pMWCMQNS8UQX4WMdy75zsoNI0v/LVVdQjSrfQYtRLF5WTTcsYJp
         Rppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WnjJ+5eqn9NGxtrxwzaWlzPIIAXKXb8eVBtWqnxJbG8=;
        b=QCDl0sbIStsmFAQuuBiYJtXf8BeNvPS0aL1AYiZU5et+L3Ki/qCDi9R3W/cr5P++wS
         R7TPw7FWokvpy9Cwmp2CDmXfo0w91foWbvP8p6DGxuhnk+X23gBImZszKKeFDpd2vQ/c
         P7l+M/Jr/yHEYqZw467VTJwIrI3FQyRTxz1vL0sjjcXKsBeFHio4meTeuqB+IoicPs10
         ht5lnSRWM8axLSGO601Fvz7qJSpZUTB41OFjRVA8ytzHJSIb+1jLp924YJ4mZHS4IPZ6
         po7Bldp7ZU7tPE+XBItb/6pw48tgDs5bfhgWUAr2rmrSztSKM5FCWGEGcuIUcghgCZEV
         LMoQ==
X-Gm-Message-State: APjAAAUUGzDKHgmPmxhS6lO6xfOkxMuqBmeM23utsnouYtVRDCB4S01m
        cyi0yW9/Y59WgKZP5PXl6UsQM2AD
X-Google-Smtp-Source: APXvYqxBgjYR3p0jghQ4/zkl91dDP4nTdRFVJ4ifafPouAiWFOJcETykm88wR4wUxDqpF2AxTEvxSA==
X-Received: by 2002:a1c:f718:: with SMTP id v24mr1077293wmh.82.1572905414968;
        Mon, 04 Nov 2019 14:10:14 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id z8sm13581704wrp.49.2019.11.04.14.10.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 14:10:14 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:10:12 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104221011.pkflv2cpullewkag@ltop.local>
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

In some of the checks you're calling evaluate_expression() and
degenerate() but this is done on the arguments and these have
already been evaluated (and degenerated in evaluate_arguments().
It's thus not needed to do it again, expr->ctype already contains
the right type or can be null (or can be &bad_ctype).

From e6cf4b8c20f3d53d92df55173e786fdf81d5f0d9 Mon Sep 17 00:00:00 2001
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date: Mon, 4 Nov 2019 18:40:12 +0100
Subject: [PATCH 6/7] evaluate() & degenerate() are already done

---
 evaluate.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index fc340c2c3..d27499ccf 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2583,16 +2583,14 @@ static int parse_format_printf_argfield(const char **fmtptr,
 	}
 
 	/* check the value we got was int/uint type */
-	ctype = evaluate_expression(expr);
+	ctype = expr->ctype;
 	if (ctype) {
-		struct symbol *source, *target = &int_ctype;
+		struct symbol *target = &int_ctype;
 
-		source = degenerate(expr);
-
-		if (source != &int_ctype && source != &uint_ctype) {
+		if (ctype != &int_ctype && ctype != &uint_ctype) {
 			warning(expr->pos, "incorrect type for %s argument %d", which, argpos);
 			info(expr->pos, "   expected %s", show_typename(target));
-			info(expr->pos, "   got %s", show_typename(source));
+			info(expr->pos, "   got %s", show_typename(ctype));
 		}
 	}
 
@@ -2666,7 +2664,7 @@ static int parse_format_printf(const char **fmtstring,
 		type = &printf_fmt_ptr_ref;	/* probably some extension */
 
 	if (type) {
-		struct symbol *ctype, *source, *target = NULL;
+		struct symbol *ctype, *target = NULL;
 		const char *typediff = "different types";
 		int ret;
 
@@ -2678,11 +2676,10 @@ static int parse_format_printf(const char **fmtstring,
 			return 0;
 		}
 
-		ctype = evaluate_expression(expr);
+		ctype = expr->ctype;
 		if (!ctype)
 			return -3;
 
-		source = degenerate(expr);
 		ret = type->test(type, &expr, ctype, &target, &typediff);
 		if (!target)	/* shouldn't happen, but catch anyway */
 			return -4;
@@ -2690,7 +2687,7 @@ static int parse_format_printf(const char **fmtstring,
 		if (ret == 0) {
 			warning(expr->pos, "incorrect type in argument %d (%s)", pos, typediff);
 			info(expr->pos, "   expected %s", show_typename(target));
-			info(expr->pos, "   got %s", show_typename(source));
+			info(expr->pos, "   got %s", show_typename(ctype));
 		}
 	} else {
 		/* try and find the end of this format string by looking for a space*/
-- 
2.23.0

