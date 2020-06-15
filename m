Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B051F9D9A
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 18:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgFOQjF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 12:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgFOQjE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 12:39:04 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B20BC061A0E
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 09:39:04 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id r11so9733063vsj.5
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KK8GeQWYPhrarpVp4wZck8HXUhuF3bCgcBRRAfWIHHk=;
        b=shf7U/5FgywTzxhXekpmtWjb6Qpeoc/q/pe+rcZNxCwyB9MrAiu3Mq9AXV4NuVNDcm
         f+u3H8XK1swULXCgLfop772ABfY2kY+HE67UyouM5r5DVOKYRIP4GrOwWAlQ6Nb0ocrX
         t3fk8CaB1BwQVgsuax55PioDUl4pcqiRUzN64vAIgzJG4G3LV8QQ6KcvcjcS8SoB/Ai+
         LLGba9PBbl+w2H2RITHu4vICRzcvCldoaQdU+jGe0oEuZHnnWIhd+lfiLTsShvEkBtGT
         IHf/5/Tt8skT+RNjrQGOx1BH007FrGu5LnoGytrCmoL8ZfCd669Rb0rcB92L+fG+H0ef
         ogFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KK8GeQWYPhrarpVp4wZck8HXUhuF3bCgcBRRAfWIHHk=;
        b=ERc0XR6VeOUpMWn5QA+cadUy+l23RffTO8ad2Nl7aqVX2zuFSTlM2l5k2B/eGcWXdG
         +gqKrxUHI9/x4DlfjPFwljXB7+lUAcMR6tFTdPtPLQIG+IeQ2AezTE6hXHx5F9oU2nB5
         UIoT24qxjaMGJGnak0peNAIEUx2oweo56ZAPaUYyyhJZZdxOfDIMHIYzUMF0uQxxS3E3
         jx0lIKzrjWv/BGOSs0DE+voyEN4LNM1WCymRt6/+uWLVuUHbNgy5bvk86KDJq0gHoGrr
         cvfJSMdRaiEuxCojui9hlhhswXqRMK6y5d648EIeM4zNqZGhI9ujCCDy6FQ7KVoxTSkF
         rB1A==
X-Gm-Message-State: AOAM5337Qh9JJiYva5h525hX4Fia03LBLG/9RDfY39K6uwTX0izvPfB6
        EDongcSrTf6jV2TSpb9npK2TgK097QSx0L/VcU86yQ==
X-Google-Smtp-Source: ABdhPJx+00sYwJH/THYWGibT4XG5Bm3UdagFuhLtlTNwEnzjIahWoJ07LU4edLMyHSc9nZx9VfnLm4kfm0Mvh6KCwWk=
X-Received: by 2002:a67:26c3:: with SMTP id m186mr7055027vsm.144.1592239143312;
 Mon, 15 Jun 2020 09:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200613020735.iqb2vd23jpomisbq@ltop.local> <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
 <20200614215445.rtfbx23ve57fhlbr@ltop.local> <d540f450-c72e-5c51-ffba-32d7eb800137@ramsayjones.plus.com>
In-Reply-To: <d540f450-c72e-5c51-ffba-32d7eb800137@ramsayjones.plus.com>
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date:   Mon, 15 Jun 2020 18:38:52 +0200
Message-ID: <CAExDi1RbuRvkQb0DAYZUdwj+XQvVn91D8rU_-_bkybfCqi10eg@mail.gmail.com>
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc1
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Jun 15, 2020 at 12:37:28AM +0100, Ramsay Jones wrote:
> I just installed python-sphinx (on LM 19.3 it is the python2
> version) to give it a try, and it failed:
>
>   $ make html
>   Running Sphinx v1.6.7

This is probably too old (running 3.0 here but IIRC 2.7 or
2.8 should be OK).

>   making output directory...
>
>   Extension error:
>   Could not import extension cdoc (exception: cannot import name switch_source_input)

Ah yes, I forgot about this one.
This is a very small python module I created to extract the
doc from the C files. It's the file Documentation/sphinx/cdoc.py.
There is another one (ir.py) to keep the IR doc bearable.
Both are specified on the top of the config file
(Documentation/conf.py) which should give the info needed
to load them.

After checking, IIUC, switch_source_input exists only since
Sphinx 1.7 (and it's used by this extension only recently because
AutoReporter was obsolete and was removed in recent versions).

> It's too late to try and fix it tonight ... (also LM 20 is currently
> in beta, so I will be trading up soon) :D

Yes, sure :)

-- Luc
