Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB1D70964C
	for <lists+linux-sparse@lfdr.de>; Fri, 19 May 2023 13:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjESLSo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 May 2023 07:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbjESLS3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 May 2023 07:18:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED60198B
        for <linux-sparse@vger.kernel.org>; Fri, 19 May 2023 04:18:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5112cae8d82so774135a12.2
        for <linux-sparse@vger.kernel.org>; Fri, 19 May 2023 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684495103; x=1687087103;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=YrB/oM/9+DfdWsBYK5tE+VKexgOscQSdsQfyNuKsAEzaTYQrmV8QTOqw+n6ncFEG7/
         NrzWtVQUP7+OiIp81BAxWp4/UA25FSfMBP8v31Vr27/6mv+gpWeEjdQtXcTyd5QbQRXQ
         jQsq3ZZiseoC7dbmEKV/v7W5pMditEv8MtmfbU+xJe27P/r6UpIIOa1tC9UGmpl2zp50
         MzUJDLpg49H8SzwE6tQuOsZmLJqfmdmj+F1UdmogGeAKG+63if08XOvkcQ3hE8tURB/u
         e+KtIjmw1bhP1l1fiAyUwAswvZk0EPc4O8/eM+CpYABwaPGP/JS50wZnv1wX2QAcz1gX
         wwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684495103; x=1687087103;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=DflEfXzD99bG6SXT+t4FyTmgvnMAxYIu550xUVh6zF73Ii0stwZHch6Tq/LVeZwkhL
         Lz2mCxwx70RcDsj6JKHm5q1mQ1rbkbzKwyokDMpQUVf/dhEb5BWr+8CJLwOee4vSrH1H
         /yH2fB+BDqqbW6wKZZmC7tkxqAZgoK1fM9txDERK6O1f7tFXnWpkeoSz/iQGOSBNE5nq
         KPRL+OZyphR4BaOQaQx4TPcZcytDDIP0YikG93YQtACze9sfOK+iN0Z3ko/Rb+68YM+e
         UIzFx8d4dEKGV2/pb4iRUT3YiHHiRpfYIyhmQj3MIUQuY2f10oAoxKjr6yFpDgHXybsc
         V6/w==
X-Gm-Message-State: AC+VfDyXdsADWMk56/NacRXJt1ar0py5RQmjpwxVXplx7bVx9qYMiih9
        abYkXpup/7KxXvdqHcFeojqDFt/uHRLJmX7UFCta27YlMebmhQ==
X-Google-Smtp-Source: ACHHUZ4u0RD9o3Kl8FtNeecPkKIUUkqQP5EKCQy8Odb3BCVRQ/plvct7PNXp53hldLkfZ7jyXh0W2roGP4wdAWIFYf4=
X-Received: by 2002:a17:906:af64:b0:966:5730:c3fe with SMTP id
 os4-20020a170906af6400b009665730c3femr1223003ejb.52.1684495082502; Fri, 19
 May 2023 04:18:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7dab:b0:94f:7d03:8e8b with HTTP; Fri, 19 May 2023
 04:18:02 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly199@gmail.com>
Date:   Fri, 19 May 2023 04:18:02 -0700
Message-ID: <CAM7Z2JAs+q6RsD5Hw352ZDFruUVR5ngjAamir+4ZCakNdZyceg@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibal
