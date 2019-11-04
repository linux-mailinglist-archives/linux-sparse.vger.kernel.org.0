Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 680B3EEE9E
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 23:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389781AbfKDWQC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 17:16:02 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:52861 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389376AbfKDWQB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 17:16:01 -0500
Received: by mail-wm1-f44.google.com with SMTP id c17so11134702wmk.2
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 14:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CZNRWRGZGSrb6nQeFH7nycNFxycLzKIWIx2ZaL2FxW8=;
        b=kyiKkO9dVq0dtNIQfhWhmaWq/iiA/JYVRamaMApqKFKJjJt5Z3m/xfpzoDwvxhg64R
         1fgAuHGQgSkqrLw8IyoY6EwmMA0QHW6Nj8XK2iNIHZAZPwBah+pYDlGBy9VCFkV8hVzC
         0k+pRzIlwh6RN0sY8mQMLt5upPpXTPjZ1TlpFmzWgsvI4tW3t4RuvQjggC3U10yPZw8E
         BIiAucpTS8J9u/LgG7ChJIpbRruawZ0EHt49N26fRwvr3d+VRnU2vARqoRz6u/ZQGYxa
         rzHetmodxSRXB4LwvQE0Fiuh2Fi7xGxi3r/yxfq+1ThMMZ0oco2e411smdMyDpVcslRs
         XWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CZNRWRGZGSrb6nQeFH7nycNFxycLzKIWIx2ZaL2FxW8=;
        b=az5ManzD6MVrh01qVk2fN3YJFUQ6hAPxi/kZcRn/q4eSthgYIy3QJXHhF7u+VLC43L
         H+IhOThMcA15RLv/FTq85tszMiG7wVLazVQP6QkQq4LQUWG/tREzArG00J/kZdVuTTuF
         kaXXAAzzk10NlNd03yKh7HB8dS0aEH9QHQLmr95+SqRAFvYMUV+tfJiSizMzPBGJHr5G
         SInTNQ1vc4rOQohwsL5io6aF7bFsvmfuxW7oWzMenEGXvazKmwRyU4rBOjGZAcyTLcLl
         L4WTvdJFRX3Qcn4b5DmnbK0nkc67G0y0Igb8PXDofmuXOcglBbz+NiVvKxpr1N3e0nRG
         St5g==
X-Gm-Message-State: APjAAAWv8YAfaGlYaKnXftJ7gRjhwZoot9uN4XDi/HOw6NiuajFLzszL
        bJRNta0XUtunTGJnEVuLEh9eUTCt
X-Google-Smtp-Source: APXvYqzFb+l6XZPvw2MnY1etvbOxWDYQAJiq/7aLGTfaGXeoPsbqKB9HCzFx1+hJPJX2lvB0J0Ih+A==
X-Received: by 2002:a1c:560b:: with SMTP id k11mr1191028wmb.153.1572905760137;
        Mon, 04 Nov 2019 14:16:00 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id l4sm33068137wrf.46.2019.11.04.14.15.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 14:15:59 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:15:58 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104221558.nmujqsd7ffcz6k4u@ltop.local>
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

In sparse's parlance: 'evaluation' is, essentially, to give
a type to everything needing to be typed. For this it also does
type checking but I see it more as a kind of side-effect.o

Since evaluate_format_printf() is purely doing some verification,
rename it it accordingly.

From 2048d796dccb6b2997d03a53b1667d1f80c98fbd Mon Sep 17 00:00:00 2001
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date: Mon, 4 Nov 2019 22:24:24 +0100
Subject: [PATCH 7/7] s/evaluate_format_printf/verify_format_attribute/

---
 evaluate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index d27499ccf..e0f9ba5f0 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2709,7 +2709,7 @@ static int parse_format_printf(const char **fmtstring,
  * in the parser code which stores the positions of the message and arg
  * start in the ctype.
  */
-static void evaluate_format_printf(struct symbol *fn, struct expression_list *args)
+static void verify_format_attribute(struct symbol *fn, struct expression_list *args)
 {
 	struct format_state state = { };
 	struct expression *expr;
@@ -2802,7 +2802,7 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 	FINISH_PTR_LIST(argtype);
 
 	if (Wformat)
-		evaluate_format_printf(fn, head);
+		verify_format_attribute(fn, head);
 
 	return 1;
 }
-- 
2.23.0

