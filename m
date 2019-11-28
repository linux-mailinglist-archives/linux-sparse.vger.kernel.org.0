Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE6710CF49
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfK1Ugc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:36:32 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53285 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Ugc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:36:32 -0500
Received: by mail-wm1-f67.google.com with SMTP id u18so12130889wmc.3
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MXx59ibO+dJINjN23mQSPgWaOHXjSJSKRL4hV4j33hc=;
        b=uVNAUEESiAPvF0XcQ8bK+sy3wACK5HYr26BbCFErNxcbXLbuRykSm+IWa1OTbjD3fl
         KJ9YfBIR7X7ZA/uuBUPgOyxAQlU/YQwPCOfUiL+LW7Ni7VAtztA7S7bP+EP/escpItf5
         AqDPMIEHRsV/eOe/kUJJ98x0bzyZ/ebwGH3QQagA38TGi5eisbteAh6bo0dsiEU1v2JQ
         jgRfbwe7c3VJq7Uyt7FZKAcAGP/iNwLxHVGpTdTcJmQ4hjwHE0PWT0lgo59N8aEcJuDa
         oQ5QYfO74EDFnnJ2g61VHJaiA+SOYGpjdXY+W+sYHz+YnqcgWDP8lqWW5L0tV67z2768
         j3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MXx59ibO+dJINjN23mQSPgWaOHXjSJSKRL4hV4j33hc=;
        b=qPzaMoQPs3XWx8X8nBHAvBymyK3xuqLd9CZSRMhWE6n8BRzAil4Xa7DdwtPnPa3O8E
         FWYGzArY70ihnbKimM+vmmQm67LifiD4Q295f8p6kyVPgh1sEIf8grOXcJ3cDt8tmP4X
         tE487Rl12ZO85gm0xWCPjMSS96xrPASjNW983xqERFsem5YOjB/NER32w2JeENLba278
         Ll/cTx4prUoP4o0bFB5xnAdH6YHE/FOl4GTMiwKJ2yuJzhTcMWz2Y2e7q9VkT9YXp8sK
         WX741e1gdbDdGiMeBjvZG7S9r4B6yZqJ6cwPDvcwF0H7LAl0/3K0Q6SH0LpiNnn2vj2q
         /fUw==
X-Gm-Message-State: APjAAAVTCjZiHYpzUft63kmlx7+8hHmvjTpFqq27iQ+LNeWa5AG90PMG
        g/sHqpI1RqLSdAHa6SeLw77Erj3q
X-Google-Smtp-Source: APXvYqxkYfPPpxZyDaF574je2HleSXhN3fSEy1po/fkG53gOGREOtupu6FeGxF1rk+US1uPk8OL00w==
X-Received: by 2002:a1c:6456:: with SMTP id y83mr11295550wmb.48.1574973390350;
        Thu, 28 Nov 2019 12:36:30 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id 16sm11605416wmf.0.2019.11.28.12.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:36:29 -0800 (PST)
Date:   Thu, 28 Nov 2019 21:36:28 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] cgcc: fix definition of 'linux' macro
Message-ID: <20191128203628.76zl6j6hgm2wqxwg@ltop.local>
References: <18e4644b-7616-5d74-e298-4506372680b3@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e4644b-7616-5d74-e298-4506372680b3@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Nov 28, 2019 at 03:17:59PM +0000, Ramsay Jones wrote:
> 
> During a call to add_specs('linux'), cgcc adds several macro definitions
> to the sparse command line. In particular, it provides the incorrect
> definition: '-Dlinux=linux'.
> 
> This bug was introduced in commit 807f74466b (<no title>, 2004-08-13), while
> moving some calls to add_pre_buffer() around in lib.c. This was then moved
> out of sparse, into cgcc, by commit cf2bde63a6 (<no title>, 2004-10-05),
> where the definition was copied verbatum.
> 
> Fix this macro definition to read '-Dlinux=1' instead.
> 
> Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>

Thanks! Applied and pushed.

-- Luc
