Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0421DE02A
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 21:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfJTTMv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 15:12:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39385 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfJTTMv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 15:12:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id r141so1024702wme.4
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 12:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E7hz2FQ1Vt/CdLyxp2n/cNpW4sT0pzREg6jkxoXGMaY=;
        b=mNt9tYd/aJiuYCtRtVApcDFsEwiRsQUqZLLa7z2KON5y9rTH9WOH/iLDUN1elg0byw
         80YnUY3RF0CnnN2BsYPCGaKtxrtTiVFFBzxGFXzvAJFm2V9e/NqKIq1XLmnZR6sJ/inw
         LHxoLYqSX+mUa4iC+f3mqJzN/XWQX62/SvtEeQ621Hk6jx/xKuS5aq7F2BzdsAe5Ww8p
         N/x08ebV46sLqpVWjBrYyArDhhN5e2zLOYE2UqOLNoUvEjTNuPXFO7TbDzpbYazZlBTE
         Tekbrx2a95wIP/BkEP8VJ5b1b/mk0YGF8vxJCGILS/hyjLkeV2K34DyG44FhMTV0fIlw
         W0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E7hz2FQ1Vt/CdLyxp2n/cNpW4sT0pzREg6jkxoXGMaY=;
        b=k0N/WRDgegXrsoeH6J/TpRYSi+WZqfReM2hkTFIoEPwLqfMNQd1t7TMis0n+DwNwtG
         dQqEL3kbJaYMXIHTpii8KBWAq0s29JebxQtmwEA1Uf/fx8QsGtC/JY6TL+pYcC+fMjmo
         59/P7cZz1LjnbKgb+36vN1auUu21x1Z195CtoT3XZoNcHg96TBdOdQ5h5u7LGTkgYEbi
         pHktksP65gzMj6mIFvGYQYWUa2YA4/Q37f7/0ZJKOu9DrlytOCZOy26R2IcAs6bCHEdx
         bDYXWVIfMG2WWtiA86/81RtSZVCTSE44D/1R+1ujcc+s1k8hO2plKR8j89IfdhAy2113
         bNOg==
X-Gm-Message-State: APjAAAVRhlQjQKQsmUolxwOz6i3SOf7xve/zrjexMH+8JpkBFI7JM4y3
        zaiOfLTt3OT6gFg/X4dg/r0wozdE
X-Google-Smtp-Source: APXvYqxUQySs5NeyldS0e++0VgReHYob5wUMpsSxdX1XchavmCQ8ZvO4u7V0w8LF2oVv1WWkhpIG8g==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr16475318wmg.105.1571598768908;
        Sun, 20 Oct 2019 12:12:48 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id w15sm2342809wro.65.2019.10.20.12.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 12:12:47 -0700 (PDT)
Date:   Sun, 20 Oct 2019 21:12:46 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191020191246.p65zl3dr557vkt3y@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-4-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
> +static int printf_fmt_numtype(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
> +{
> +	struct symbol *type = fmt->data;
> +	*target = type;
> +	return ctype == type;

Comparing these pointer will never be the correct way to compare the
types. You have to use something like check_assignment_types().
Currently, a simple test like:
	void print(const char *, ...) __attribute__((format(printf, 1, 2)));
	static void foo(unsigned int u)
	{
		print("%x\n", u);
	}

gives a warning like:
	warning: incorrect type in argument 2 (different types)
	   expected unsigned int
	   got unsigned int u

-- Luc
