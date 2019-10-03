Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACF0C9570
	for <lists+linux-sparse@lfdr.de>; Thu,  3 Oct 2019 02:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbfJCAQE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 20:16:04 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36191 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfJCAQE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 20:16:04 -0400
Received: by mail-ed1-f66.google.com with SMTP id h2so804461edn.3
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 17:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HDrPbx/xxMKbqhu3WV37xLFgBjAScbeJiL6BkoJzpYY=;
        b=ExjTVCzeQFz1Xlz6boWbC3GZc/A9oH7KT1yHFNawY0z5l194/42YjKmpD4qiVh2655
         o4AHP6NlZxFIExCLg07JaIrL5oZ5ZFmLXa1e5d/IaCY0qWYAsO58SqNdtKiv5FNJSEGN
         Qxrz1hFR52r2jbIDlvlWpvkdFmuAPIBZvNUUbKtMoXn4W4pOwFADsglQ4Uwo7Gsjrhcw
         pWAxKdZ2z9blUdhVfUkG9V4duGixpz7K5AllIPavafHTW4Eb2PqxXRGt9YxIRmypeM6K
         XUjUZ7nxXZshLgYCmFJsjtlKelbD2M5tqiAgeWzN5eqKanRbmnCRVXVpnGQoAYS1Rqmg
         tVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HDrPbx/xxMKbqhu3WV37xLFgBjAScbeJiL6BkoJzpYY=;
        b=TCPNL7WgoBt+sxXY3/YBK+VsNwiEYMoXRb00fTFJDPjjWdjY/NmaY4BYQS8Zu9Ehzv
         GPOhBKHa48CzP7EMpLLkJcs2aURzX+j+p7aEHQ25S/KSUOm2RQx7dd8Ca8aEem3qZXQQ
         aC2SMvP3t8M5NQMrVSwd7lAsERextagEtnOUlnkhH2YoYrglN2fIsUuZKy0oCwXK7W5Y
         OqFpR3oJs/zwsZC6pARHZlVbHmNb59V5ZKvPGrTKVdBzmSFnTh22zZ4rH2gTBrQfdxia
         mcEFFfTU8YnaFlKSGenEB3dEhVNptYEEy/AbjwA4xyJJUY0t7kg0LYHpFJnzGUWOL5jp
         EV4Q==
X-Gm-Message-State: APjAAAWwGbWkX+iKpT+rayGV4jYDEWJXn9NGhUmnNbmKc+teH59rpxGi
        yKFwGbiOWRZZRUMhLHjrQgvziAsT
X-Google-Smtp-Source: APXvYqweXbDnDWXmPi+vTzlCnbW32sCkKIZ2OgCb/lQIWyLviXSdSNOFrtQ4kxedCWW6ipilRiv6bg==
X-Received: by 2002:a17:906:d0d2:: with SMTP id bq18mr5469119ejb.233.1570061762777;
        Wed, 02 Oct 2019 17:16:02 -0700 (PDT)
Received: from desk.local ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id t9sm65878eji.26.2019.10.02.17.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 17:16:02 -0700 (PDT)
Date:   Thu, 3 Oct 2019 02:16:01 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] void-cond: allow void in conditional expression
Message-ID: <20191003001601.ai7nhi3efutujlp7@desk.local>
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
 <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
 <99173481-dbb9-ee7d-2b03-31aac80980e5@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99173481-dbb9-ee7d-2b03-31aac80980e5@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Oct 03, 2019 at 12:11:12AM +0100, Ramsay Jones wrote:
> For a typo in the documentation, (see below)

Thanks for noticing that.
-- Luc 
