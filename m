Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0238EEC6D
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 22:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388500AbfKDV47 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 16:56:59 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:33495 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388490AbfKDV46 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 16:56:58 -0500
Received: by mail-wm1-f41.google.com with SMTP id 6so15042361wmf.0
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 13:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SYqnVPV4vCe3+LJLDBtNgLv6UvaNa+1hUb+MJgr6Zn0=;
        b=tLW9hpW62CpbSo00B7QcmTMLKCmB4jpMgO0+PCgRw7ki6VC/DdJ39LDNmnlf3MKEiH
         l5n5FuhS7YuFj3Ck1VpBrEcVa7yF48S9Ga8d3YV7EIEyhZBwMyXSHc2hajRay58zixzK
         khKnfJM1lIZb5UBB2RZrB2UGtS9Cz6LBt65qemlPHUZlglOl0PlsiRCU2Fz9cWwyIhcZ
         +1xiy+o9Cwug1YYWJRBjkilw+eoVLHe4hYFPPzcQpAjb41TN9F5eJokAD/Xv/bpmp7NQ
         C6aBWwp4mY/8KyYRijPGn4RRGG0VMglO73OskwWy0MK6lx7fUvnfNVJQWTN2su7V7beA
         AVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SYqnVPV4vCe3+LJLDBtNgLv6UvaNa+1hUb+MJgr6Zn0=;
        b=DAQuPI2GhAshH8g38MX4wd2kgxpozFxC56Hxm8Eq6Rpy/6yILo08ZbX4/WGAl3eBi7
         bLe1eGEWDtgNFplnGmugqngP9QSD4NznAbt6aRVZKtAl9pvqwljiJUL9Tib/xXM9Av3Y
         FGTTesQusdshBt0vzuabARmCJCw+vKYrDstfJfbVuoKxGqlyCiZn9bXBANXYtSYrSPd6
         y8KdpyuP1ZAhI0X8Pq4/XxVyxLNwJKIY1ReIbob/gbpydm7GDOR63iKWqy6GT3aRoGcB
         JTzjMfTFVZc29zcVqsVyHcFekWtzTQs5DP20LCm55BxmNaMO2AeaoZMJCkFuq5U5E72c
         jx+Q==
X-Gm-Message-State: APjAAAXeW+QGNkYLL6l13AXSSumS1/lbwNrTPV5DSsFTIGCG1TjCrgSr
        REkYeqjBI3mb4t7qtJPoE+qzyFDf
X-Google-Smtp-Source: APXvYqxmvI5twPx78JdEgLdR1ONmAuPHM8yNXaDUoywSKDoSVH+bEdQcqxR8Wl+NFESK5LPjLcoC+Q==
X-Received: by 2002:a1c:96c9:: with SMTP id y192mr1140051wmd.8.1572904616237;
        Mon, 04 Nov 2019 13:56:56 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id q17sm7461868wmj.12.2019.11.04.13.56.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 13:56:55 -0800 (PST)
Date:   Mon, 4 Nov 2019 22:56:55 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104215654.dhmrtnmg36eabvd7@ltop.local>
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

'struct format' is a bit too generic. Rename it.

From 07bd6a35ce437617b8c0d2bc32273bcd9dfd84a0 Mon Sep 17 00:00:00 2001
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date: Mon, 4 Nov 2019 21:44:54 +0100
Subject: [PATCH 3/7] s/struct format/struct attr_format/

---
 symbol.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/symbol.h b/symbol.h
index 5bfaac588..228c3a392 100644
--- a/symbol.h
+++ b/symbol.h
@@ -98,7 +98,7 @@ extern struct context *alloc_context(void);
 
 DECLARE_PTR_LIST(context_list, struct context);
 
-struct format {
+struct attr_format {
 	unsigned short index;	/* index in argument list for format string */
 	unsigned short first;	/* where first variadic argument is */
 };
@@ -109,7 +109,7 @@ struct ctype {
 	struct context_list *contexts;
 	struct ident *as;
 	struct symbol *base_type;
-	struct format format;
+	struct attr_format format;
 };
 
 struct decl_state {
-- 
2.23.0

