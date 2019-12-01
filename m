Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83B110E365
	for <lists+linux-sparse@lfdr.de>; Sun,  1 Dec 2019 21:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfLAUHz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 1 Dec 2019 15:07:55 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38987 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfLAUHz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 1 Dec 2019 15:07:55 -0500
Received: by mail-wm1-f65.google.com with SMTP id s14so14010920wmh.4
        for <linux-sparse@vger.kernel.org>; Sun, 01 Dec 2019 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Qhgg+6nw6emr8QeRg0Vj9GJ4PdL7LKcLHJK2/paAFQ=;
        b=CNNKxKFU6aksKmyKmNYRNd/1Dd31uhlImQnjX+lTcUQrnJvwVbj6mGfmxqv6Xjom0K
         cMKkze8aPkMgFziupRz4TOGBzHlBRqyZEOGdwoYKa+KY4v8mWWJRCp4OJqrl3IEqC09y
         imivF/V3xxnzMf2pQJqDMsHIq3hrvJH3KGH40t5QEcntNAjMQFLsVIJedwlikB+jxIu7
         D+panZOym3b+vvYHRFg9SoBg5JRg8SaCQD7z+dG2egTILsjy5qRb1eJmKsduWGn87aTS
         Z2K+qAzm4hpOCOdWXqrA+inyq2bKkaidbHli9NsaWbmBPCNpNRMAALjS/l9mw71PXHKr
         hiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Qhgg+6nw6emr8QeRg0Vj9GJ4PdL7LKcLHJK2/paAFQ=;
        b=HB3vCY2zbBqnUXthvHyA5s7gwJoYAlK7Ft7jrubomAyUHwYk/dOBAi7VvPhP2VfZRh
         8/KZgcSk11bduW8teaWtF7FOv6szaN2bqIXxoJulCBfBMBAnOf8oJuvnNlLvd2kVeVyO
         0SYVhqjsqrGkWso5nZApwseJe4xFjkODJh4lUKcQskjwaz8pdVujED8ggiiE2vIpOCtd
         OW7Wk3+8e4f8tavvrDY6vscoSRezs2HJ3o6XkBkh0JN/cO63QhxntrkhipzSdW8KDbEp
         wJnisLRtnfel6BahsrN4s/xgTUaj9Z5DL/y1nRYYlMGRBVnfd7gjnc5VyrOsv7stKkAX
         TYiw==
X-Gm-Message-State: APjAAAUZOhwxQ0kS2crqJDi3sm7j5IDcqFDnB7FugPy7UDqWS5kioyit
        q05TXOOcB+rNvH50gASqu2JzrvlH
X-Google-Smtp-Source: APXvYqwzr60eEClX/dbmt7t1rnOmSR3EmpffsC4+lMcaihFkbEQV0qEleUWf/PKiGSgZSQYPit3bvw==
X-Received: by 2002:a1c:cc01:: with SMTP id h1mr24285159wmb.172.1575230872840;
        Sun, 01 Dec 2019 12:07:52 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:319e:42d8:5e4b:7244])
        by smtp.gmail.com with ESMTPSA id t8sm14212178wrp.69.2019.12.01.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 12:07:51 -0800 (PST)
Date:   Sun, 1 Dec 2019 21:07:51 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 5/7] simplify definition of __STRICT_ANSI__
Message-ID: <20191201200751.of7rpndue2y2ly5r@ltop.local>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
 <20191128204225.7002-6-luc.vanoostenryck@gmail.com>
 <79778e18-f7f4-1070-c57f-9e19fdc17927@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79778e18-f7f4-1070-c57f-9e19fdc17927@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 01, 2019 at 04:19:54PM +0000, Ramsay Jones wrote:
> On 28/11/2019 20:42, Luc Van Oostenryck wrote:
> > @@ -1433,6 +1425,8 @@ static void predefined_macros(void)
> >  		predefine("__STDC_VERSION__", 1, "201112L");
> >  		break;
> >  	}
> > +	if (!(standard & STANDARD_GNU) & (standard != STANDARD_NONE))
> 
> s/) & (/) && (/

Nice catch!
The result is the same, but it certainly wasn't my intention.

Thank you very much.
-- Luc 
