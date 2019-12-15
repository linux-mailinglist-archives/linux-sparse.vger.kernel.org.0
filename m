Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA0C111FAF5
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 21:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfLOUE7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 15:04:59 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52760 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOUE7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 15:04:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so4441134wmc.2
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 12:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tJqdpzpA6fOIuxLRp7sWxmgydboUOa9/obkIK7CeeUA=;
        b=YsvRxDUQkI26gZewiQke+604vVcI67j0H52lJ8UPFH/UTMFC+NGvWpKFC9iwDGUENa
         5weM5FrE2uao5cVfmVhoheGA832eXEZc06jwDYHQ59AjHbHc1P1/cXRfeLDnRGJXDmYD
         7XQDB7jeSKgOdttrppL0roqzPPVWCMiyTkG7ioDHK3LaHejeTDJxoTgAwIvpxlDeaVkv
         IZpzX0H1xne6QMoNRnQbT2/35n3FXq7/OzeOYnE0a+aXUnE03Zyi5KZBZyfLt7dsUnfA
         ELq26wyNoL71ZK7fCpKdBsKIUDAXOD+p7KS2SN/GDsFHxdfZcKRBOS69Fyu76ZG0OOdD
         mChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tJqdpzpA6fOIuxLRp7sWxmgydboUOa9/obkIK7CeeUA=;
        b=b1rys+Tz/ZWVB/fesaq+Qs1926oWpv7ekkNsXRiKq7xa4M3j6ef5aEoZ+Sx8wZM9bN
         9E3iywlTJQitgzmnKnJz26v14NmJYe5vHEBxe+eGEieNHe0QvlrBWq3s76vDjvEpbJR7
         t6avQvnfh2QkMBANWtqI1JjXig/0fa1UjktuP36MPguk7KfK0SvXXcJKv0etGMutv0MK
         +QbbePLVU+UeT0Ri97ekN/SlOr3iarH1p157qLY7dX6jE9OJDnCDyY50a1GxYVlBlVZf
         l1kvOKLUNIdPltPIFhmhkz4roeP0UcKIWftDJyenwWDn3WE3JE4Qjk0wQOLLgagg3+KN
         rYnw==
X-Gm-Message-State: APjAAAXrd1WA9oznEx/99OQ/C/RiRm7rGfwSEHhPsDXvB/t/CCk7EehG
        JAtdtNY9bmDd+qoa0u6jNJAwwJhc
X-Google-Smtp-Source: APXvYqwXm88d/eVCTkxWPNgy4Qia5I4kr5GL4VlNP/XJVrKNyn27dGhE7H838u32+sdHprg092A4LQ==
X-Received: by 2002:a05:600c:305:: with SMTP id q5mr27016388wmd.167.1576440297270;
        Sun, 15 Dec 2019 12:04:57 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:4d3d:d98:1fc5:2616])
        by smtp.gmail.com with ESMTPSA id o4sm18429257wrx.25.2019.12.15.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 12:04:56 -0800 (PST)
Date:   Sun, 15 Dec 2019 21:04:55 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] improve diagnostic message about wrong redeclaration
Message-ID: <20191215200455.lwkwzkulwq7gpiz6@ltop.local>
References: <20191215162856.98943-1-luc.vanoostenryck@gmail.com>
 <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 15, 2019 at 07:29:32PM +0000, Ramsay Jones wrote:
> 
> 
> On 15/12/2019 16:28, Luc Van Oostenryck wrote:
> > The current message is very long (in most cases the position
> > of the previous declaration is past the 80th column) and,
> > while saying that the types differ, doesn't show these types.
> > 
> > Change this by splitting the message in 2 parts:
> > - first, on the current position, the main message
> >   and the type of the current declaration.
> > - then the type of the previous declaration on its
> >   own position.
> 
> Hmm, this loses information and, thus, is not necessarily an
> improvement. The first test, below, illustrates this ...

Absolutely. It wasn't intentional to drop the typediff.

Thank you very much to noticing this!
-- Luc 
