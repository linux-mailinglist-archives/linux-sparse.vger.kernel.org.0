Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFDF64D701E
	for <lists+linux-sparse@lfdr.de>; Sat, 12 Mar 2022 18:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiCLR0b (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 12 Mar 2022 12:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCLR0a (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 12 Mar 2022 12:26:30 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C845580CE
        for <linux-sparse@vger.kernel.org>; Sat, 12 Mar 2022 09:25:24 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id f20-20020a05600c155400b00389d73ceb43so2822815wmg.4
        for <linux-sparse@vger.kernel.org>; Sat, 12 Mar 2022 09:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=p4GORicRfKYMmuTaUvzvYC0X6pcYWYL8sK1k4bp9fMA=;
        b=HX2A6XwN0G+VTadl77Fi6mzT0ZVP9hGhGhfZXNS2YC2M5nuKIVzxBE3VFHERlp9lgY
         /fOsfXGtp6P+EqFiX4Xdq/OW747ebOZMdyUTE8XX4q8MXagsRyPQFyWKtBzlik7Ht188
         OKUHo5rsLVB80j9U7e8qH74BVeZB6XGZJNlLkvNsB+f3xATynT5pOk9jdjiqtXk8Rblv
         Mg+cDr3MV8+FSa3fOlO2TpaoOo+RQb931Hb0vVmOCdceTzPSdE6Yd6yHOnuk8DdBR+xs
         Zbut0ssY+i7TNKfh3S2jK1R+6WDbPptygkdLj3w425YLhFzSnU/YFof7vPyR7m7mLVHF
         a2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=p4GORicRfKYMmuTaUvzvYC0X6pcYWYL8sK1k4bp9fMA=;
        b=cI4p+9LiLD/m2EvesA/ru+l7LQlmAIGgOz+CzzyQkRnn5l4FrFWIRGwp9GiYOaQYs+
         evoy4EHTJRn8g46748QzjfgbKaS0NU1mqkSNL9OsPY30UH2GzfpgHvY62WoKyLhtcuUE
         xKEUTgTEZGOB2ZZlT+ORFn2w22HTaF34Uls71iR8un5GApK5P9ZdtTBPnswVnhZGt4zJ
         +LwtdUkueyeNunjxZgMaTvvxnuhgmoEzHzpKL9lvXobqS7rLhRb+eg2dQqsnWndFqt2/
         JdcGI8DplFYp3OBlwgjBt3cDZfX+WJ6SiQOOQi52gfojubi6Qyp89szBQfuy8+84D0Dg
         GOrA==
X-Gm-Message-State: AOAM532n+CUKAJ5uRquWok815UZve2Kl8ahDB6lFG4ogq7pAqDMokoea
        G9xsTTmGvW8cj8ufIu8erEQ=
X-Google-Smtp-Source: ABdhPJyrn7ZvwWL/RTbK5Zr9Bns2+gWfwv3Bjb87/+wrfQrnhPiNSRqIZQxq1L39RGE50uNPVk4ZCA==
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id y2-20020a7bcd82000000b0038977ef66d7mr11352006wmj.171.1647105922618;
        Sat, 12 Mar 2022 09:25:22 -0800 (PST)
Received: from DESKTOP-26CLNVD.localdomain ([102.91.4.176])
        by smtp.gmail.com with ESMTPSA id bi9-20020a05600c3d8900b00389a623c80esm9194550wmb.1.2022.03.12.09.25.17
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Mar 2022 09:25:22 -0800 (PST)
Message-ID: <622cd782.1c69fb81.768ff.5877@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <khadijatabdullahigaya@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler  <info@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <info@gmail.com>
Date:   Sat, 12 Mar 2022 09:25:11 -0800
Reply-To: mariaelisabethschaeffler88@gmail.com
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschieden, 1.500.=
000,00 Euro an Sie zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich f=FCr weitere Informationen.

Unter folgendem Link k=F6nnen Sie auch mehr =FCber mich lesen

https://www.forbes.com/profile/maria-elisabeth-schaeffler-thumann/#443b4a6e=
19c7

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email:mariaelisabethschaeffler88@gmail.com

