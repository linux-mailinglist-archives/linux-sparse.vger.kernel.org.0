Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D963EC0F13
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 03:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfI1BLt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 21:11:49 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32848 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfI1BLs (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 21:11:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id y127so3219868lfc.0
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LlmPiAIpMI9GQbXEoYuM6M8KuwCqAyw2mX7xgCiH2cs=;
        b=LtpsC4qK1UPfDCQqyX/FmuWhgATiDb15wHV7AuH1/xQr/eMDAiVo7zlVdL+4ct1aa+
         UlaCHnNrBGuAcVW8Ihwv7HU3WhYK/mlgNTNkBIilLAFah37V11baMfBNkZN8zD54dhbR
         xu6mZzX1C5jT51KKAiPYzYf5jpuJ6M0H7PGf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlmPiAIpMI9GQbXEoYuM6M8KuwCqAyw2mX7xgCiH2cs=;
        b=W6FsEThkzwGq70L6l4UH08sS2aN6iE6ckYNFbrFcksJMzsfPPvZRW0UL2NOcCvLAHR
         PtSflsaVo65axyKKwL5CQNPcTbqCctKqzTd4yqaNlwaOF0RGqVAshNRAEUwE6K7XV0Ti
         FyfhSmqgYEJFmfulsfw9zRR1vavcgLnjRmf5wPEjQJyVFwE05fmIMHnu0LVHhu/Y80sy
         sAO8UVOKCvzXR5ZBLKvP1cEZftV8bXJ+f3pZNyE3Y2cphoQq2Yx7Nww6UGprAhqYArQB
         XA0AH1LrVBM8CXicWdFzm6kdIuuwLNmfnSrahzWMc3x8epG87wZCDXw1jVKLVD23dlu3
         q+0Q==
X-Gm-Message-State: APjAAAVGPG1wBYEK6iBTRko13W3PcXD1BPGdiBO0DcA7yMcWPimekXFs
        r+1TvmAYYqIzHD2IqG7DYGICGYVSPlI=
X-Google-Smtp-Source: APXvYqzQK3U6sUtsZvUXOG/yy5yEQx5FnWYTQwI+hFviKkWfbidnxrqQXphE030bf5QeIZrVyo2sLA==
X-Received: by 2002:a19:c80b:: with SMTP id y11mr4825575lff.184.1569633106277;
        Fri, 27 Sep 2019 18:11:46 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id p27sm871936lfo.95.2019.09.27.18.11.45
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2019 18:11:46 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id t8so3159432lfc.13
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 18:11:45 -0700 (PDT)
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr4680064lfp.134.1569633104609;
 Fri, 27 Sep 2019 18:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 27 Sep 2019 18:11:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgL1CMmu-oZedk578FTfmPbKZ_YptYqXkvV2EDN-2sOdw@mail.gmail.com>
Message-ID: <CAHk-=wgL1CMmu-oZedk578FTfmPbKZ_YptYqXkvV2EDN-2sOdw@mail.gmail.com>
Subject: Re: [PATCH 00/18] add missing expansion of ASM operands
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Sep 27, 2019 at 4:43 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Currently, ASM operand aren't expanded or even evaluated.
> This causes Sparse to emit warning about 'unknown expression'
> during the linearization of these operands if they contains,
> for example, calls to __builtin_compatible_types_p().
>
> This series contains a number of preparatory patches before
> adding the missing evaluation & expansion.

Looks like a solid improvement. Thanks,

               Linus
