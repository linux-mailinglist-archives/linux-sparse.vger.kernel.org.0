Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D47DEB55
	for <lists+linux-sparse@lfdr.de>; Mon, 21 Oct 2019 13:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbfJULrn (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 21 Oct 2019 07:47:43 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43056 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfJULrm (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 21 Oct 2019 07:47:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so8360787wrr.10
        for <linux-sparse@vger.kernel.org>; Mon, 21 Oct 2019 04:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mK7vvvlI446rvzUUFIB6q7F9EIbS4nT5XWzc/rKEyWI=;
        b=jQbfJry84+Eq8IDpBO05FiJPp7GYnuLQzH8FEe1KRPFiHVRYaZ4SxYT3uECMShgl3H
         8oRzvMCnzZviFqbHCWcSS+G4KbvQFpRP+1q+FCu3E3FdYpLRUryW4Pf1lHDWQXQl4i/a
         xDD7609m3uBF3IaKSRn4cx0pZ/PHLxs9Srimb2GeG+GjX5V7nvmpCDSJsUDi8pXGdXay
         1MjisPjAAdQQ+opHj7lRlMHOTKcPgamP2bv3OulBQAmA197gXnOCoXQ9fbDXFCV/0BnM
         Y8S5j+z8IOVfTipK1zLtYR45bZdGr0t2MIntnE/zC6IYPtCRHlXc0PpYbG8vbfJxsM3w
         qfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mK7vvvlI446rvzUUFIB6q7F9EIbS4nT5XWzc/rKEyWI=;
        b=bJm3Z3uYhR7W5LYFY9Kdl73RIVEBDwFV91M+TX1pcrLvj9IezHdDkD4Kv+EBvzam0Z
         DfaMoUhvFanNfojM9+WFNblA0H7gtVQ73yq7q5m9cibIyeo0hB8WyjolviIuQ4gp/YLp
         4ANO9BRXv5vSVs/5aQqRZiMK0Q+3Ex3BrwLnKi/X2EILgUI8kyIiFTXwGlq/J/23gBi9
         +GfGW2SdbqVC3YAuEfdGNfAbKC4FLZvutwDQgGfVOinmJqLvZiTfdi+jnJFk2TSdtKsp
         6iW2sJhWDD90OwgsUOHUezm3IUiwcwcth+VnyFZDxigEN91GTwYZyZWxARk53faE5upz
         hI2w==
X-Gm-Message-State: APjAAAUrHQUUldEb5C5vAwbszMAThslMwG19sHDCkmmGRD0ygJ9Nwrxi
        0oLHCJhQOw48A5LCMZ9yiRXCCVoT
X-Google-Smtp-Source: APXvYqwZMhjvqhaMW5dZcZcr08G2moxVqAtL73Wqoa7uhBOBOac9UdJt1e3+a6gmmzCH8ec4HQ0fPw==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr18593173wrs.63.1571658461232;
        Mon, 21 Oct 2019 04:47:41 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:c5ad:d5a4:7423:9b74])
        by smtp.gmail.com with ESMTPSA id a17sm10070142wmb.8.2019.10.21.04.47.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 04:47:40 -0700 (PDT)
Date:   Mon, 21 Oct 2019 13:47:38 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191021114737.pnpgdx3taiwn2ovy@ltop.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020220129.pr4edy5t64rizqyw@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020220129.pr4edy5t64rizqyw@ltop.local>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Oct 21, 2019 at 12:01:30AM +0200, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
> > +static void evaluate_format_printf(const char *fmt_string, struct symbol *fn, struct expression_list *head)
> > +{
> > +	struct format_state state = { };
> > +	struct expression *expr;
> > +
> > +	expr = get_expression_n(head, fn->ctype.printf_msg-1);
> > +	if (!expr)
> > +		return;
> > +
> > +	state.expr = expr;
> > +	state.va_start = fn->ctype.printf_va_start;
> > +	state.arg_index = fn->ctype.printf_va_start;
> > +
> > +	if (!fmt_string) {
> > +		warning(expr->pos, "not a format string?");
> > +	} else {
> > +		const char *string = fmt_string;
> > +		int fail = 0;
> > +
> > +		for (; string[0] != '\0'; string++) {
> > +			if (string[0] != '%')
> > +				continue;
> > +			if (parse_format_printf(&string, &state, head) < 0)
> > +				fail++;
> > +			string--;
> 
> This last statement is wrong, it just needs to be removed.

It's more subtle than that: the string++ should only be done
when stripping the chars before the '%'.
Thus the loop should be something like:
		while (string[0]) {
			if (string[0] != '%') {
				// strip everything before '%'
				string++;
				continue;
			}
			if (parse_format_printf(&string, &state, head) < 0)
				fail++;
		}

-- Luc
