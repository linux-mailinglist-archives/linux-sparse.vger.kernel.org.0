Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB0D15C99C
	for <lists+linux-sparse@lfdr.de>; Thu, 13 Feb 2020 18:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgBMRle (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 13 Feb 2020 12:41:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45398 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgBMRle (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 13 Feb 2020 12:41:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id g3so7732607wrs.12
        for <linux-sparse@vger.kernel.org>; Thu, 13 Feb 2020 09:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xO55YNCdTcph0RnkKdgshB5XUWimKk0fsSmV+kP957A=;
        b=PROnHN5pZwfBDbT2dno8eWXMsTcIBpsf+RDLVNkqXVncT5BrQEKpddinZigoE73aVy
         La8cperjohsCTf2OyWQIXmOnXNFuvc+9cROBmXfr3Sazvb23ly8gEs2xxu/p6Hp5cJDS
         io6ocqwONecuCVgWbtWGy25yZ6A+A//E9Vtk9wvVHhFoiLG9p+Dso5B2nhrF39hegDmT
         uhIHlaTFVq7aLdMQGEAgPviyzd/Jx69A4EAj7UFzbvN4WBcrvgv/93YIti0RuYsJ3hkF
         tMhkHGHuvGs8yoy537ylAyAb3sUZxVnOmcXPZ0xNxsIM+ayyFMZiHmwavLMMsdZJc8c2
         0Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xO55YNCdTcph0RnkKdgshB5XUWimKk0fsSmV+kP957A=;
        b=kPLg2994NzjPVYpIt46x6XueJ9D+Zkz85hQZt83ExEEYsc/WR5WK3HxzR60tdf9EaA
         iiBBeGoEXgU/ydtvTKJabdmPyKCZjjhH7hY7jAt7evBuzmqNTlxYUYWcY3TTDgLC/XJf
         a+QrFC0JziByvM60+odwDYpY9XEKF3YpiOfdHlznkw5Yps3mcXq7fSVyj1VLinLiBqGw
         M0mRarW1cyP4mY5E/0RhPfIhf1nDIdi6Qf+yXZff7e49EBIzRmVa6vjYxgk2/jaRDOyP
         +RgT4jKocZ5qYR2O7Cg+nojvDDcUT3EInyNhBcVKPAQ6m2jYC3JYrzlDpXUv5HmyuMq4
         5IXg==
X-Gm-Message-State: APjAAAUZ+TYdLZlL0lKdRXqjDlx4rRUVrXHEi1ikdwPUKRcpavOytQDW
        3UFAYt1+uKyodh5uv4H5sjE=
X-Google-Smtp-Source: APXvYqzTePH+hwylqvQqvThgVEoHfXjnlXIl5MChXkAjl4ecuW0TVJ/r9TCuEgYqWfjTSvy3+sloFw==
X-Received: by 2002:a5d:488c:: with SMTP id g12mr23266559wrq.67.1581615692255;
        Thu, 13 Feb 2020 09:41:32 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40bd:500:dd61:1fcd:79f7:26a5])
        by smtp.gmail.com with ESMTPSA id o9sm792663wrw.20.2020.02.13.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 09:41:31 -0800 (PST)
Date:   Thu, 13 Feb 2020 18:41:30 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: introduce sym_is_local() for reporter
Message-ID: <20200213174130.vzc3tj3l3dj3xrpc@ltop.local>
References: <20200211160136.GA14027@redhat.com>
 <20200212004135.cyzcqtwwcuewa4gj@ltop.local>
 <20200212090626.GA19406@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212090626.GA19406@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Feb 12, 2020 at 10:06:27AM +0100, Oleg Nesterov wrote:
> On 02/12, Luc Van Oostenryck wrote:
> > It depends on what exactly you want for 'local'.
> 
> Yes, it should only return T if the symbol was defined inside some function.
> If we have
> 
> 	static int I;
> 
> in file scope, sym_is_local() should return false and so it does, test-dissect
> outputs
> 
> 	1:12                   def   v I                                int

OK, then everything is fine.
 
> Thanks for looking!

You're welcome!
This and the other pending ones are now pushed to main.

-- Luc
