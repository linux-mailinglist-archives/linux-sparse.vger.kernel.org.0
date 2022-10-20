Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C45360664A
	for <lists+linux-sparse@lfdr.de>; Thu, 20 Oct 2022 18:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiJTQx2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 20 Oct 2022 12:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJTQx1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 20 Oct 2022 12:53:27 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889091CD31B
        for <linux-sparse@vger.kernel.org>; Thu, 20 Oct 2022 09:53:24 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id y191so125518pfb.2
        for <linux-sparse@vger.kernel.org>; Thu, 20 Oct 2022 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=dx1zQD5/px1LopmBwYU7anBI0/otjqtFvB/kSUvyoSfFprorvYsRb2VN71xxQJn1HE
         JEqMN2ixV5VwthU166uogN5tJWHdJfLOqvJP36lpmo0Qsy2ckBiUmZmGwdSfkcg6PRbR
         7x0cmfUxiOLoE6k39y0dC6gngoWEks9/YSyGWKDkF5YTmJYrB3iP/aerJA2Y3OC38zcc
         8u9WH99S1LPgfj1t7v3+oo6dYAXstP1aqqAjXo1qBz3YLPbb/IVu9GlsdtDAG9kRAdcO
         Cd6xm0cfBT7KXm/yX+mcVdUC4pj7kTwa9oQdZOmmv4GpIiwvXYj15/vqyGxGcQGmR0kz
         dIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=64plXp0/xGG7neTyZtPV92vISeX3AOl1c7UveWnBppbxtSL8Mdjc6MXRrblYUad69Q
         wO2hXH31zD7iz+U88KDnnPWRFsL+2EBT7NUaULClMtKPSL801+HgaJ0+VXcsunpkyDx9
         xexyaI4H2oppli4AfOorYcLltG5snFm4Ysjb++M7ZryAXmUVGbgQqyvDKk+vOYROZ3M3
         5VWcAvHfTLDBh4Xwkyh6a/FRfcU/WpB1C+qbztghNM+WYs31nPdtBKZV9wb6IGeB8x2w
         upQyZXm2X3P+BxTwRYOM2yrlJY3OqV0TSaF7C5/lUQrUXDcwXBqIbKeQYcA8+bkVQF2X
         kOmg==
X-Gm-Message-State: ACrzQf2khPbrCcz64PqLgyLwGYO9qSTk5VaH49za56xvcpHcVWaNKPw6
        QXpOBrQGFd2ohb4bRFnd6I3WETsBXlbnJ5JVJH4=
X-Google-Smtp-Source: AMsMyM6jXC0c+2NFh6l8xZCsb/jhF8XxubCgSrmKsx8iZVgz0qc6rFYmQ/sqg09aInfDLq3ijQtYCchFqN8gOI1GkQY=
X-Received: by 2002:a65:5886:0:b0:439:8dd3:18d4 with SMTP id
 d6-20020a655886000000b004398dd318d4mr12472218pgu.430.1666284804005; Thu, 20
 Oct 2022 09:53:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a06:13f0:b0:57d:879e:4a67 with HTTP; Thu, 20 Oct 2022
 09:53:23 -0700 (PDT)
From:   mike williams <petyetgeta@gmail.com>
Date:   Thu, 20 Oct 2022 16:53:23 +0000
Message-ID: <CAK8YFDf7o39i84JYjzmNGifaigtJVspXOOZVtGs7+bRGKkzySg@mail.gmail.com>
Subject: Hi ?????????????????????????????????
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


