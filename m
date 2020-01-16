Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEEA013F974
	for <lists+linux-sparse@lfdr.de>; Thu, 16 Jan 2020 20:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbgAPT0i (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 16 Jan 2020 14:26:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45920 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbgAPT0i (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 16 Jan 2020 14:26:38 -0500
Received: by mail-wr1-f66.google.com with SMTP id j42so20324268wrj.12
        for <linux-sparse@vger.kernel.org>; Thu, 16 Jan 2020 11:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oHA/bUiimk2IBtTBfCiyAm62uTtV8JQAKYOv2eFpzrE=;
        b=thhEQX2Or8PAgEI0XCYTMJ4ZMQnhjSTdlD5RJXdSHzWYlTbvB7+m3RCLOpxHFJc/4T
         7vInoMzhvn1TonjWHOOJSzyLZVqPU6JmnN7YR8PwlNXids9Ah+ATtBON8ONYmutVt/rL
         mhnYnfivErh/dkh5HsuaqWb9dORz4iqlnI6/76SWOT6mn6aTaW4vuTncMM0gCutwcLs2
         9X3GT2N8AmoRGXHiHw5l6SHOocHm4QQhwqy6QulwhwbPIfaQ2kiGp0VywQhc3NT5l9Fv
         WakmZwYFudpnboZSAp7f6rIzXPR1uuQNWdn+YSsL3wZFJGtTdeTRuzqRrlSsFW9RyUQv
         1Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oHA/bUiimk2IBtTBfCiyAm62uTtV8JQAKYOv2eFpzrE=;
        b=aUgSS3QGwelQIeMM3/RuLx4PnanNcOglBqipRv7Sak7qrbMmKpwNxhO60kxEyJBrpa
         yobWo/zonnePlHoVMib20bE/eK0RXPyl12vh7vg7BBrzxwlDdkLaYuO0s1mUKsbqhwcf
         rosHVqxhYUjYD6OmHlYFO83Jbqor8SxEIEVQUzJvYkPf3QP9TizTGe7KJuVYx3mUd/4E
         QhlXTVMovsu8yXnn1mvTX9quCbvZYiz/b8QCkLuDEB8jUWslJj6F8IdWKoaKktywgs+I
         mSGPDsmFkgfu4cym6HBcbBKSiRNV3v9dmxoNy9WdwnwooDhzT6ZzTSh94r1YxPk3e3mm
         p/aw==
X-Gm-Message-State: APjAAAVxFuE2h1e3ufqdsUO+e8TX4WEXtKdq8tWjqdmnPY/mC+MZXEWg
        IBa7zFP4vVZlzPA4njVM89QhJUhD
X-Google-Smtp-Source: APXvYqwTlGL8bTnJaBXQ0oT8CuFM2U8nisdi4OnvMdLd/Tmp48w42Fq0iIvZxGHJy5IJWhJZBMxO7Q==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr4969776wrq.123.1579202796372;
        Thu, 16 Jan 2020 11:26:36 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40c7:f800:8092:a697:f51f:4090])
        by smtp.gmail.com with ESMTPSA id x10sm30387740wrp.58.2020.01.16.11.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 11:26:34 -0800 (PST)
Date:   Thu, 16 Jan 2020 20:26:32 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] show_parse: avoid null pointer dereference in
 do_show_type()
Message-ID: <20200116192632.niymcq4xv2wgnix4@ltop.local>
References: <20200116174838.GA32100@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116174838.GA32100@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Jan 16, 2020 at 06:48:38PM +0100, Oleg Nesterov wrote:
> do_show_type() checks sym->type inside the "if (!sym || ...)" block.
> 
> While at it, remove the trailing whitespaces.

Thank you! Applied and pushed. 

-- Luc
