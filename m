Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3370948E04E
	for <lists+linux-sparse@lfdr.de>; Thu, 13 Jan 2022 23:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237739AbiAMWeR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 13 Jan 2022 17:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237540AbiAMWeQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 13 Jan 2022 17:34:16 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B26C061574
        for <linux-sparse@vger.kernel.org>; Thu, 13 Jan 2022 14:34:16 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id rj2-20020a17090b3e8200b001b1944bad25so12391595pjb.5
        for <linux-sparse@vger.kernel.org>; Thu, 13 Jan 2022 14:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=PmI1q6hfnxTpvxktOArZiwOqnnyO33V8k9lk4Ab5uv/tXUMKhuD8j8DnVmdRviHBgQ
         Foc2Z7xpr0+dGrc0Uv+No6bmc1bXJ6iySDBpW0NAHvbBtPqnrOlUGfQo1kpsPy2M3ZFW
         KgAgk6tld3+pr0QWKcw/GEP/Taug5jXuIrWArSUWLjzq7fzHIjO6suVDXL4olTuQcVDc
         /fFYzdXXoLCmrN0z9qO9LILGwX6wVS411acRlSyS1xaxNoHeVcILxkxcBAlhNcOnYDeE
         uggA/kiFfwQN9TLWOZorzi/ZxPmGxx89HbiOJDPUON+39VTtdp/97BLxkI8e6lgMGfLb
         rtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=kG4xF0lGXpO5WdNhELSOIGD77pJqqU3RzsG07PWb+JzqNP3VoXf8c/Z2ryW+6RXbZ9
         ATQCJKwRTjHxNLUnKkW+zVw/FveZ/0ItBt7wj9iG1MTgSYx8CxfS1BYe0gQO4QwcfYlq
         Km02t1sepca8KqmzvEARkA2JN4XvgNdMma5r8xTKP9U5YNsR2OmlOOVIuXjNGP4glzSR
         bgroHWuynUFftQqFSBwoBCeoOvK27NN/fLM1D7k5HYg0B7DVOlVNQcEOcpY7ynvsfypg
         MQO8CTMhMP/tOHPuWkXzM4Xp8/IX8LbQliTH+xQu7tSgy6PrBGXYQbsvAoV2508+08CX
         mG0Q==
X-Gm-Message-State: AOAM531mQUcovUoOCLfSQISaQ/mNg6jrLap+sp0m1lhvfMioDhiW7PBn
        V/rGWPatXc1SMCvSqnUqZWr/UmLxnQN1N0OWBzg=
X-Google-Smtp-Source: ABdhPJxPH1SPs9VBzcbfXJ3d2utoM5GhhRKP5HiIE3oBL1f64+1h4Kzxk+wuxy1TV7gelIxtN/6shqF+sQXPWsvN6EY=
X-Received: by 2002:a17:902:c443:b0:14a:30f2:95e8 with SMTP id
 m3-20020a170902c44300b0014a30f295e8mr6460931plm.43.1642113255770; Thu, 13 Jan
 2022 14:34:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:34:15
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:34:15 +0100
Message-ID: <CANqBaXVDDVUk7AD8fcNLQEsEm=xAQJqUVJvKAZ0mRa9+uyUdSw@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
