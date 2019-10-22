Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAFDE0D6D
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 22:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731904AbfJVUpy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 16:45:54 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:36238 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbfJVUpy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 16:45:54 -0400
Received: by mail-wm1-f49.google.com with SMTP id c22so8338888wmd.1
        for <linux-sparse@vger.kernel.org>; Tue, 22 Oct 2019 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5trSgZBHkQAkv3hTOZZYz1SIxVxxwkk6MES104WTUA4=;
        b=CblVu0t2yhPHrrxkGKZv+LCoz8GK4A5K4sFrEMKu1MUMLB3k3IkQCfHH1S7R511fA7
         uQr/KRGPB6WCBDc91f6oF/BkQ/EIilDJ9EZ30zXEjEN89YERLcow1ezXMaWF0uboRC65
         7Dwf9y8hip1kDZcx2ydpAmnzwcD8EJYWY4q2iffcAg2/oa4HKGnRDkapgOm7J9TidYwz
         mU1H6WQZMUbV73UCPRut/4S16U3bl5o/vy8hqcgG3Z88cRBbTFStcnxvLi0GcKsld5Td
         zLk/96Tdo/5NZtzhux/7XfJsetFfjmKGoklJjPVzrsJVHMckwUGaCV7pH0hr2m3WbZL5
         ealA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5trSgZBHkQAkv3hTOZZYz1SIxVxxwkk6MES104WTUA4=;
        b=H3JIcCyZ836K4Rig+qsogLuL3hjSabmjvtzqkZK0tRW0WbpmUGLvehO6CsbTbrv5Fk
         Z2UEzjTTHh9b+ibIs8XmKaI45fvNPCRoMen3dFucIGPzLK3Kj0/jtKDJB0JxD8gU7wEs
         36EQnwxaLuCwAWIQ0vCVgKhSo2aqJ0v3FLErGwj6xa9h8/rfswl21KXfmlsWcSE2URjp
         VpBJJwoAJZZAD+C0C2RavWnINx2EVlZigtBSrY0wzQu7gEgZy1ivPEInHt0yomF3zHSy
         i8eBPpukT2E42dvApq6lMzX70AT8EnSAdUC5U/Ckj9FHum+UL5uIrSxz53RlbwtoGJmG
         BY+w==
X-Gm-Message-State: APjAAAXG8pPaKaczuM5J+cvqQf89mdftH8h45GkIbGTLNl0wwpnOqFQQ
        PK+iaMsCKVs+bQkiT0qgAUpaM3Yr
X-Google-Smtp-Source: APXvYqxOK8T+enDdprf6xOVxpwWNqm1jyOG/dWXKISeWNTL8X+WGg65oKDuvkKXsRqdLxYVlY/mK6g==
X-Received: by 2002:a05:600c:2049:: with SMTP id p9mr4508841wmg.17.1571777151999;
        Tue, 22 Oct 2019 13:45:51 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:9ddf:7b8d:bfc3:e4be])
        by smtp.gmail.com with ESMTPSA id l18sm17542884wrc.18.2019.10.22.13.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 13:45:50 -0700 (PDT)
Date:   Tue, 22 Oct 2019 22:45:49 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: follow-up on printf formatting
Message-ID: <20191022204548.umu7fg3oxozxyxs6@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <6c2d55be-82b6-c226-a978-a005908cfc23@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c2d55be-82b6-c226-a978-a005908cfc23@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 22, 2019 at 01:06:28PM +0100, Ben Dooks wrote:
> On 25/09/2019 11:00, Ben Dooks wrote:
> > This is a re-send of the printf formatting parsing to see if there is
> > anything else that needs doing before getting it added to the next
> > release.
> 
> I've put a new copy of this up at:
> 
> https://github.com/bjdooks-ct/sparse bjdooks/printf19

Thank you for the quick updates.
I think everything is covered but my 2 last emails:
* an update about string-- in evaluate_format_printf().
  a test case is the following:
	void prt(const char *, ...) __attribute__((format(printf, 1, 2)));
	static void foo(int x, int y, const void *p)
	{
		prt("%02x%02x %8p\n", x, y, p);
	}

* one about get_printf_fmt() and the dereference of expr->string and
  expression's type vs. expr->symbol. A testcase for it is:
	void prt(const char *, ...) __attribute__((format(printf, 1, 2)));
	static inline void fun(int x) { prt("%08x\n", x); }
	static void foo(int x)
	{
		fun;
		fun(x);
	}

If you could also add to your tests one like:
	void prt(const char *, ...) __attribute__((format(printf, 1, 2)));
	static void foo(int i, unsigned int u)
	{
		prt("%d\n", i);
		prt("%x\n", u);
	}
This is surprisingly not covered by your more complex ones.
 
> we're back to having some tests fail as it looks like the current
> evaluation does not care about int vs long.

Yes. Sorry if I wasn't clear enough but I said that it needs something
*like* check_assignment_types() instead of directly comparing the pointers.
But, yes, check_assignment_types() itself ignore the size and signedness.

If help is needed, I can look at this in a few days.
-- Luc
