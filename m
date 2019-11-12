Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5BFF9B59
	for <lists+linux-sparse@lfdr.de>; Tue, 12 Nov 2019 21:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfKLU6q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 12 Nov 2019 15:58:46 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:40264 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbfKLU6p (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 12 Nov 2019 15:58:45 -0500
Received: by mail-wr1-f53.google.com with SMTP id i10so20098425wrs.7
        for <linux-sparse@vger.kernel.org>; Tue, 12 Nov 2019 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MBeHFdRqtr4lBtixebTp5fk2Y6sTiPcui/ehpVSKcRM=;
        b=iPRomle7SJ76nFuLZ8jyC8WnQwnNEhahzcEgQ9S1Q4bx9OiKCK+Yo6N11jNecFflND
         dgGZQLOVaOyQ+VDuFhMkmpuBjOuAG/8zO7kV5YR4US59wrwz0Q88sO/CMCE+hDsmu5JW
         tAEdUGkkBlCsVBKyj1eKIQjvkxtKn7E/eidwN9CCsi/9JQ02zTBjEs0KQl/0P6t+nlyv
         HRVRLEeDYbPlvh2eJgF14mYrb9XmYjr4eikc26uoL6ovZ2n7DYJGLdnqkjEePjzfupZ3
         GEpSCG7QYDZjefWdWRUhDdT07ww3MggDMrjKno8I+RGvwh77V7V7y7Baz7E7B5GDXApf
         Yf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MBeHFdRqtr4lBtixebTp5fk2Y6sTiPcui/ehpVSKcRM=;
        b=rPJBTHibxkQEOZEhYYy9bbEjp/729CeL+irESvdX4nc2+dnEtP5Xfg3zBtpO7aJ35i
         MxnQwExlknSV2Yz8kCjcDTPiiB+O/K0sNoXcg6EKoDlGNHsE/gzSGiqKmVRB+vr57sNY
         4lfUazdkTHCyr7vrcUVZSYwKEQbtDlKdr6xS+h97mYxKFZjjfa7cgZJ3t8POKGRP5Cbf
         teD9dFvlqUdNF1hb2lPPN4ZRH2qf9Qo8MpY+xAiQN+EFucn/VWV9nsetFQ59x5rLNbjp
         F51F6nYcOflaoVLbmIIeesbRgl6a+9PENYnakYQHUUKEBTvtyEP9CeQZDch6R/bH4LKT
         ehCg==
X-Gm-Message-State: APjAAAV/OgnCJjZIyHwtvqDzvoiFb35H4WhateuppJjTTeiKlVX90HdX
        u3LAgTg7cZJjSzETQEtJ2dkRYZSf
X-Google-Smtp-Source: APXvYqzz7RJ+3xlZ6wsgDS3bmPi1R0PGN9g0pK+MrZHYTpSw5W+cgRQ1uPynjElUH5y4wXMxeHD0gw==
X-Received: by 2002:adf:978c:: with SMTP id s12mr949wrb.47.1573592323797;
        Tue, 12 Nov 2019 12:58:43 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4058:bc00:f133:7aba:dc22:ad9a])
        by smtp.gmail.com with ESMTPSA id x8sm3895411wmi.10.2019.11.12.12.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:58:43 -0800 (PST)
Date:   Tue, 12 Nov 2019 21:58:42 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: Subject: [PATCH] lib.c: fix spelling of _BIG_ENDIAN
Message-ID: <20191112205842.pgkeqgwnce6gvwy4@ltop.local>
References: <eaf45a7f-6c3b-34bf-b65b-e23107cd37ae@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaf45a7f-6c3b-34bf-b65b-e23107cd37ae@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Nov 12, 2019 at 02:33:40AM +0000, Ramsay Jones wrote:
> 
> Commit 3c3881cf1c ("cgcc: let sparse define _BIG_ENDIAN", 2019-11-08)
> moved the definition of the _BIG_ENDIAN macro from cgcc to sparse (for
> the powerpc platforms). Unfortunately, the macro was inadvertently spelt
> incorrectly (as _BIG_DEBIAN). Correct the spelling.

Sigh ... I wonder what was in my mind when I wrote that ...
 
> 
> Hi Luc,
> 
> Sorry for not noticing this earlier - I still had this patch in my

Hi Ramsay,

Don't be sorry, really. I'm already very grateful that you noticed it!

Thank you.
-- Luc
