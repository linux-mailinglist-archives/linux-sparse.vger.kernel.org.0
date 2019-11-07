Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 837C8F2303
	for <lists+linux-sparse@lfdr.de>; Thu,  7 Nov 2019 01:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfKGAIs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 6 Nov 2019 19:08:48 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:38269 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfKGAIr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 6 Nov 2019 19:08:47 -0500
Received: by mail-wr1-f44.google.com with SMTP id j15so822767wrw.5
        for <linux-sparse@vger.kernel.org>; Wed, 06 Nov 2019 16:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s6BVgqN50PlOy1zVKlH6v/cU7Bmtc1Iks296VUQFzqM=;
        b=lwq0cZB9mSXlNcnayGIozXfmFyiH98yqlMgGiUsWfHm4T1gQb9V91A3b5KuyeO62zg
         NagtN9wkx4OpZzka1dD316noViODMu1uoA9EFzNHWGOGQWAbAqE7jEjJhoVNsAjzxV6x
         nUeAMD7eaRh+zdyGJTLtPTzZodyORghFWEabjOKrMx5WSKmk1BubzQwJoSY0j30/+tDn
         sIDgLWx4QIz3Wshph6wCFOZFZhkULxS8fpxjzJnFNE8sJidv4qy9CoiPdjEYCtzIw7yX
         rL51zjgBkgJqnuk0Qw40FyZJo7UcgeMUGyORhzTzJDc+xnDYdLxPmZUpD750Uv2mPS8J
         fkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s6BVgqN50PlOy1zVKlH6v/cU7Bmtc1Iks296VUQFzqM=;
        b=t0Tgk84rHpwIIj27+1ufyDyB+ayMYfCEsjkBR3rv7ZmIEYEWm1pFV/1i6N26DL+lwx
         FVmFfWntYhtnMpGOxpt8sFZCwx/2v0Ti/1L/DpwlD/oGErmHbFScoOVQRX5qf9tzfXll
         vsdcDE2aLhaUnXWOHPDIzkuUWgbyrXekWq8H1CDJYy5FCQJ5ufqf2riphNHV9XBkj0So
         tkN2dksF56S+EFbT7/fg0wfgBG3gwYyjZl/FEh0ry+DNMCdwD3S7j4QuYISs5BReiHF4
         8kP1EqB6UwXD2cStvLaH9XRvF+iG9w2AgjLLO0hAmoTzq6SLorqCX/vuRzAPzbIaIX9/
         89Ng==
X-Gm-Message-State: APjAAAWh1HTDe7yUgu9CslmiRAGevP1bdezIYyx441wPI41TxktCgts1
        cxxgarreQpiPYlZpUO9YUj7lTASe
X-Google-Smtp-Source: APXvYqwHaQH3Djx5vz+ahZmX7jVJ4WxeQzorvnt2Bv/JYNQ3BCaaMRX1uM3he1LfXTSF3d7UN54mQg==
X-Received: by 2002:adf:e890:: with SMTP id d16mr211751wrm.105.1573085325694;
        Wed, 06 Nov 2019 16:08:45 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:f977:7428:775c:3ad2])
        by smtp.gmail.com with ESMTPSA id 205sm4479610wmb.3.2019.11.06.16.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:08:44 -0800 (PST)
Date:   Thu, 7 Nov 2019 01:08:43 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191107000843.466fv6uihnzmum6t@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
 <20191104222703.d75txlb7pq2dp6kd@ltop.local>
 <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
 <a91fe185-9b23-f0f4-097c-e9bd57d40243@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a91fe185-9b23-f0f4-097c-e9bd57d40243@codethink.co.uk>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 06, 2019 at 05:58:06PM +0000, Ben Dooks wrote:
> 
> Ok, I've split this out now, I agree it is probably better suited to
> being seperate as it may well grow as we add formats and anything
> else that might be required.
> 
> I'll try and finish looking at the tests tomorrow, ande about the
> use of check_assignment_types(), whether we could extend it with
> some sort of flags field, such as (IGNORE_ADDRESS_SPACE).
> 
> I've started putting up:
> 	https://github.com/bjdooks-ct/sparse bjdooks/printf22

Yes, that's fine. There is just that, as I said, you surely want to
move the code around a little at the start of verify_format_attribute()
so that the warning "not a format string?" can be showed again
(the check I made to the expr just do a silent early return
if the string is not a literal string).

Best regards,
-- Luc
