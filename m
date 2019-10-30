Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB4D4E98E6
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbfJ3JKY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:10:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39539 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfJ3JKX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:10:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id g19so1235427wmh.4
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9c217BTTUuRZk76HtnyaWrNlYp1N2/l4X4f8CuFEna0=;
        b=uU4zqVtTwG2awxYKhFPo66S6cbiKCBOGJbbDdTj+gCIaDhdRq4SFbF+nZAucga0y1B
         NJb8TdWf+31HFaTrb0Y7Qk++F2hXXbFTQYK2lCnHmgkM4Q26LiKZfrZbE3slRlMXdZAB
         TGfy1sz/hGZtTHKwgDY+n7XiInl6gf/CyTFOwSAX760QGeCUJKFvIOClW4VOpx/9b5Vv
         vlfKidf4ZHDLLDsWKoRkV1tyUfLGO2pSUNDoX03pqJWrQGNGA95M9fEQikqrCuxBwC5k
         50RlknO3kLtHqC2NYQOTq/y6lgb84Wf8LrUpVSiJkpSaPheK9ZqHVX8wglk6Jw6zjqPd
         T0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9c217BTTUuRZk76HtnyaWrNlYp1N2/l4X4f8CuFEna0=;
        b=NfSOJSGux2jxEgchX3WEtRMn+2n/MjmMNDnpb6io4N+S0KnFvzx+YqyFoHwRGXXfko
         +DXqFjq3WNJWHx9jDIq13rxorr9y8SqXtOPibSo1rAL3K8PxveUAmsiNMfbMpERtJ6QG
         q1t64iWYGXbvrw3DIduQTxwWQbbvBYXq7sZPVsqTq2k205uiV9tkA6/0hji5/zRxevF/
         EmkDFVuQvi1kHDHSrFTRZpss2yb4Ugc6D6fG0VsllvSEZHRphIYdSzX8qfCbjPfJ2DsN
         P7prArmv2XYyFXSyxuu9JRaVGxeAYKLh+mliiSjdfeP2qRer0ILOXNbDVeo5Mvi1eJmf
         StVA==
X-Gm-Message-State: APjAAAUeppcBHTKOJ9GQ9oOhJoXWQFXJCYBjekxCxDDntNsyVH4pcwoB
        SyQAK6+pm28aF0FP+gyQn/V1duYP
X-Google-Smtp-Source: APXvYqxHbbguzKx3qEyVhMsj1bJGjq/aL9vS6zhBcdKEMSx6lVvZyCowf5nzQgbbOhwM2kOsXW0nCA==
X-Received: by 2002:a05:600c:20c7:: with SMTP id y7mr8451630wmm.34.1572426621628;
        Wed, 30 Oct 2019 02:10:21 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:5898:aeb7:8c5e:3aa1])
        by smtp.gmail.com with ESMTPSA id a5sm1750821wrm.78.2019.10.30.02.10.20
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 02:10:20 -0700 (PDT)
Date:   Wed, 30 Oct 2019 10:10:19 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 0/6] improve cross-compiling usage
Message-ID: <20191030091018.uosmzj2opao54ume@ltop.local>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Sorry, I've made a mess by also sending an older
version of this series, please ignore the patches
which are not marked as 'v2'.

-- Luc
