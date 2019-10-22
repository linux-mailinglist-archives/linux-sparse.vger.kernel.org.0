Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9EF6E0D90
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 23:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731679AbfJVVBG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 17:01:06 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52831 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfJVVBG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 17:01:06 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so18861117wmh.2
        for <linux-sparse@vger.kernel.org>; Tue, 22 Oct 2019 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oyTMlw8DnSpr7Y6XTJP22kioW4V19n7agYAeZFe/h5g=;
        b=VA8Cv7KwtQDkGqpdXREYJY1+OZneXdS560eY3GUQw2iWDYcEXd6cQm61iUhPoozZT+
         GY9KFTtjGjqnVrtwEa0DM2O1v5cVoYTvTe5Q/+d/WSlupaQ888zAxg82UPFH0vUMzoVw
         cN/yHWz68FC0beDt+jMFpLivJJKBJ+SCFBuDYtSUr6we2ZYNLKvhmStwDP8bRIKwzFxO
         zP09BqIFT8tAM3bWQE2j2rsIOdGrll8JbEKntiEkLt9EiXvuQUHjvTjUhYM7gqeauwhf
         4hVVe8F7o2PawZ7CoojZtrRlKmv45whQYDTxCsr2mCnPxIzfgfyXjZm8zdFG0Na0lDLv
         Eikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oyTMlw8DnSpr7Y6XTJP22kioW4V19n7agYAeZFe/h5g=;
        b=R0m9K7IjYqc17VQLWkUrwjyXtkYW/GrCH6NBUiHn03rB55mp69+pvJIw/DkFSxGBa7
         vw1gvi02/vn2bj/ogX3FNzvlJuStXD/5LQZMVFfVdKVvsplyKx3T6TedZr68APpuIAF5
         nIKGs97vx6sQFgzu0d36UV/RjbiiBhszL6eTsZ4HJxzWMo21fDRTP8qKC/tp/Fjpd4cw
         16vr8r5m0YvueYWfJhM/JGNNyQnw9WbSbbyG+/2gPHmb6doQCU/zl59batrKDS878i/Q
         VYAbw1GoSgh27WaeuNv39BihtYnEFl1pXkfG1AcDX798amAXFFlgtFPRvXG4sdAvM8k5
         aSYg==
X-Gm-Message-State: APjAAAX+x5U9z2Mu5tAVXv+Ddxh92Bte6vgSQcXlBJqLsiOaS+Wwbfhu
        J5LIJIqtZxyY1xeTRn7ieAdPZhuz
X-Google-Smtp-Source: APXvYqwRUUXbf5maEciB6TLfAH55O8UiGG4PDRhath4rphxVI7BOdIgonlkxzf+GT1L/zTVdYI0nAg==
X-Received: by 2002:a1c:234c:: with SMTP id j73mr4978430wmj.51.1571778063598;
        Tue, 22 Oct 2019 14:01:03 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:9ddf:7b8d:bfc3:e4be])
        by smtp.gmail.com with ESMTPSA id 143sm32258338wmb.33.2019.10.22.14.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 14:01:02 -0700 (PDT)
Date:   Tue, 22 Oct 2019 23:01:00 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191022210100.dqwjikdlry6k5yfs@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020165512.glldp4pyxbjnk5ne@desk.local>
 <cb7ba4b7-751d-d4e1-ae9f-08837796247f@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb7ba4b7-751d-d4e1-ae9f-08837796247f@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 22, 2019 at 11:31:27AM +0100, Ben Dooks wrote:
> 
> I might spend some time fixing those up... there's plenty of warning
> fixes to go through.
> 
> I've not yet run my test on a current kernel, but printf type seems
> to be one place where people have been a bit sloppy.

With the changes I sent you and using check_assignment_types() for
printf_fmt_numtype() I get only 3 warnings in the same drivers,
all for trying to print a bitwise type (which should probably be
acceptable for the %x format).

But yes, checking the signedness will most probably gives a lot of
warnings. I think this shouldn't be done without support for the
flag '-Wformat-signedness'.

-- Luc
