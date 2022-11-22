Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B35E16332A0
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Nov 2022 03:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiKVCEE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 21 Nov 2022 21:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbiKVCEC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 21 Nov 2022 21:04:02 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496C8C7213;
        Mon, 21 Nov 2022 18:04:02 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3a3961f8659so39330517b3.2;
        Mon, 21 Nov 2022 18:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TzriTTjDN2sG1GFT5R1JUO/5Csi2e/XJJrWhOlsWXVg=;
        b=mrxfXGgSv373PWJgm80ATEzqSwwa0Q7tVbMNWfmqMxhy2yyBtscLwV12nXuvqOLNjj
         eFS8FyDDnBn7dlb3QehsEwEz6RaTgzVRJBsBGOvDEb46/IQKvhQSjV7vevgPwDXTSf06
         xj3IN47CNcalIgTWt8ti252jq6qnr+HoYnwAvba49WQOklUy9HUfCxX9Gyco0EgOYf2Z
         CJ0+WdVAI/AsxvW9PVeBR96tnXhc+zggHNYNRQ5YDTMmHvvJn+qdbMxeks8T/2hNeHal
         y5dDjbJGlZaurkrG0GdE3KVaH8LCbgtLfTa8gLI4vR+pLpLDjZIpYBJFuvsqM6LLeF0f
         em7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzriTTjDN2sG1GFT5R1JUO/5Csi2e/XJJrWhOlsWXVg=;
        b=TDa+RL82769JefbgpNsPDhsTBocBFCpL2CkkYy90KnVHvJF0gpZmojRaAhAHeilyB4
         SfaLp4prjimW6kcEi743F3/YkridAmU/DeEPMP2SIQT1jslsclffFEmYpaTSXmJYsEcL
         k2MTgnwchmds6feZhuWnhVdjMdcnOcbokZryC5x4LA93z0ez+gLPRHzdmx1LC5BiiHIC
         6joEesPfl+RCFnNtaDTwxwZefIV7XDz4elqG3GBzFbwwAeqh0XTWrsZP4enGFSZ3HMGX
         EOnga9FU4iDhIK3gcZM8ID0WiLJxWKGFGnfWXmuvpitkCz01rXUTJUXmmifQNQ4sC+bQ
         W1yA==
X-Gm-Message-State: ANoB5pknJgJY5vOEWmaoQ+lLvrph3or82XpzWZrtYivBiTjsTjzld/Ip
        GXXLKKw13GJqZo4NAvN9HSM8++FKeP1KxOFvNOzlZkkegu281EzU
X-Google-Smtp-Source: AA0mqf4BgxsC9aIrMaQRhD8pLDEayfmcykFiWo+TKaALiht0J4G6oCYhaXmgM0eaAh/ISr3UdUWBkYM8LZxNC+kTUT0=
X-Received: by 2002:a81:9194:0:b0:3a2:55fa:e3c2 with SMTP id
 i142-20020a819194000000b003a255fae3c2mr1806947ywg.320.1669082641424; Mon, 21
 Nov 2022 18:04:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:9f88:0:0:0:0:0 with HTTP; Mon, 21 Nov 2022 18:04:01
 -0800 (PST)
From:   Felipe Bedetti <felipebedetticosta@gmail.com>
Date:   Mon, 21 Nov 2022 23:04:01 -0300
Message-ID: <CAFO8uszP62oOSCuLaex_3xS3HAoJt5OQgi5rPPrknLOLz=GvMA@mail.gmail.com>
Subject: Norah Colly
To:     linux serial <linux-serial@vger.kernel.org>,
        linux sh <linux-sh@vger.kernel.org>,
        linux sparse <linux-sparse@vger.kernel.org>,
        linux tegra <linux-tegra@vger.kernel.org>,
        linux usb <linux-usb@vger.kernel.org>,
        linux uvc devel <linux-uvc-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,BODY_SINGLE_URI,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SHORT_SHORTNER,SPF_HELO_NONE,SPF_PASS,
        SUSPICIOUS_RECIPS,TVD_SPACE_RATIO autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1135 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.5 SUSPICIOUS_RECIPS Similar addresses in recipient list
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [felipebedetticosta[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 TVD_SPACE_RATIO No description available.
        *  1.6 SHORT_SHORTNER Short body with little more than a link to a
        *      shortener
        *  0.7 BODY_SINGLE_URI Message body is only a URI
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

https://bit.ly/3UV8qJp
