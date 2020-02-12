Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34FE159E7C
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 02:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgBLBFI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 20:05:08 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38435 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgBLBFI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 20:05:08 -0500
Received: by mail-pj1-f68.google.com with SMTP id j17so114156pjz.3
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 17:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=I9U01sDDkRumjEWInmnUkatOksPrPZbKHRM/UglzUfg=;
        b=WxEjGEs6C+mQLEXCPEuUGOYZ+XcMOllwjObDpKVMbZ8BZUqbx62QZSX1pHo+L5reC9
         Ti/LHzvJmy19sOnlzfFl+5u5yrSKoWYrYrcfGM7vya+/tvnlz7qucZTWy6u7xPO/4JvT
         fej1yc54F1na2VFPpaNxDysFeFfeIGqn7hCQQhwA8uup9cksZ46kffeqo0T6vVFD6jKW
         ri9VLcFtBl3pzuKL0PVPbUHVQScwkP/pBZyw0BhIKCbWdkh1sic1JG5vr3iarxawPkyz
         hbz2+Qwrl7sv4kzi7EBkxYvk3PgwhO8AIbvR+nE7CoGCvlGoMdBi1z5PqSzAnvwX6Mjd
         AEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=I9U01sDDkRumjEWInmnUkatOksPrPZbKHRM/UglzUfg=;
        b=EpaZJjNDgWIvX1UEKyAxVVe/j2HJNZ+aPnUX8cOedfr2dDUNEx07EjeZWjYrdqVXpN
         GrPrzN0ivS+H9zkEjrZ0ozsEL62v00XSkWbSB7Acz15PX5ssfMMWY34B1g0G79SuHfNe
         b3y0nRa/MCBcbBio1oBniWsXtfhUITANGJPzgKIBNEfHSkpV0uzZHAnfc4PNfioWCisN
         rI9mb81J2i8DqawNrDhzKPgDHSdNrR0uN80136ZB1hlknqXLbvfR0bpj8/Pg0aGTgNjY
         74poEzYyz3TDhJVuq/4mO9vIzbbwHN0ZFTEhm23ujS+MiVaWAskRPIBOAaAqPxt+y+yg
         gkWA==
X-Gm-Message-State: APjAAAWRrHtHmsiuMevclKPsrCBqwVqPW7JCJCfTxz/4dvUZhQKQ/VZn
        CqgqaHjlTGvU96UNi6fxFAdkwQ==
X-Google-Smtp-Source: APXvYqwvAfBY15AOJDD8zK32p3dDpjJyy0M9iL3XKjEUmo7xSYbKXwdfB5rb+ZbV9kuZJnBq8Xpw2A==
X-Received: by 2002:a17:90a:e2ce:: with SMTP id fr14mr6553418pjb.99.1581469507323;
        Tue, 11 Feb 2020 17:05:07 -0800 (PST)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id 3sm4747063pjg.27.2020.02.11.17.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 17:05:06 -0800 (PST)
Subject: Re: smatch/sparse complaints on static assertion
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io>
 <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
 <CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <78345bc2-5d81-24b8-89fe-45887c58c425@pensando.io>
Date:   Tue, 11 Feb 2020 17:05:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 2/11/20 4:36 PM, Linus Torvalds wrote:
> On Tue, Feb 11, 2020 at 9:41 AM Shannon Nelson <snelson@pensando.io> wrote:
>> drivers/net/ethernet/pensando/ionic/ionic_dev.h:56:1: error: static
>> assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"
> As Luc says, this is because those structures are mis-declared.
>
> See this, for example:
>
>    struct ionic_dev_getattr_comp {
>          u8     status;
>          u8     rsvd[3];
>          union {
>                  __le64  features;
>                  u8      rsvd2[11];
>          };
>          u8     color;
>    };
>
> and notice how "__le64  features" is a 64-bit entity but it's in a
> union with a "u8 rsvd2[11];".
>
> That makes the whole union align to the same as the __le64 (on x86-32,
> that's 32-bit, for bad legacy reasons, on everything else it's
> 64-bit).
>
> Mark the associated types properly packed individually, rather than
> use the disgusting "pragma pack()" that should never be used.
>
> This is not a recent sparse change, it must never have worked.
>
>              Linus

Thanks, I'll try to work that into this next net-next cycle.

sln

