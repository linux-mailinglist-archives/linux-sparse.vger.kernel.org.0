Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEAD161CEF
	for <lists+linux-sparse@lfdr.de>; Mon, 17 Feb 2020 22:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgBQVqP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 17 Feb 2020 16:46:15 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39286 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728935AbgBQVqP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 17 Feb 2020 16:46:15 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so21492745wrt.6
        for <linux-sparse@vger.kernel.org>; Mon, 17 Feb 2020 13:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AlGyb1ZOoCFIB/ma0N7VmO/Sb46ZeHEfsJR8kylUCes=;
        b=uDbcEMlW+ZQ5lY3wU57sclsrWh3/O9rUSvqrsJaZDgADQHF/HF0rfxNn4C55mhMozT
         R6iXz/qDPPw4k3PlcnLw0BAVKz5UiI9nV4eCv+BaMsaqleNvH7hQ85qX1CAx30Ztk+YF
         MHrZQM4vL+NRuPalXD6fgwV4w243nfkzbPEETZesAXbVhcadTg6icigV3op0honPtU4/
         p6nGp8QmSieZiWn0PWejRM21uT5ulQLKa9I6qFADGMhNpgldJ1h6a8tTD9bq1wUKNmNX
         Y/8u0rAgAMQ2J6/Q91C3x4lkQbxNZJy8Gi6YKp129Nr5FSbaDL8ksQ8iMDyEqUJx4sRG
         g8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AlGyb1ZOoCFIB/ma0N7VmO/Sb46ZeHEfsJR8kylUCes=;
        b=LJx01GI0CMOU7/tXGszpmFVxs7bWpzhjTzKplllthe9vhCRGTtC3aStCglVa1noJ39
         2fEffHMg0UL6bU2d0AaWZzpmpDJPLFKaJOSVIEymNenHas+JPocaNtwTYCf/SdgAEa1w
         ppY56mF25wBfSWfI1uJ9MnFgCp6uQkFttBRlfqpDkrhp5TJeR7H/ECQAk5qA7j2Rfdrg
         ozNp2RRKBUKjKX0Snr9yqsKwRzLAiERDVDRe1wXMt+vPb/Igx7RtNpSK5uC7AmLcaw2z
         WyB8sgsWuPe7fDuWxAOamR2X1M9sez0ioq9h0MuSUYxEsmmBqp8WFtw1RxZJgmeD1SXl
         ERdw==
X-Gm-Message-State: APjAAAUH5GlZuyfZ/JYsKAl9YcNeGZS3B26wIBdnVWsl9RQcAO3PZ0ye
        wNv07UdbJPYIdLMI/1W/1YI=
X-Google-Smtp-Source: APXvYqwVsjjXAkgelWOEz7MclDSdeeC2nX+6yFNmjQj8OB/0fgxeCRtxgs1bYs3n7Zp8D8XgsnYJPg==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr24060727wrn.245.1581975972263;
        Mon, 17 Feb 2020 13:46:12 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40bd:500:ac5a:d546:8892:2289])
        by smtp.gmail.com with ESMTPSA id c141sm777585wme.41.2020.02.17.13.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 13:46:11 -0800 (PST)
Date:   Mon, 17 Feb 2020 22:46:10 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/3] struct_union_enum_specifier: set MOD_TOPLEVEL if
 toplevel(sym->scope)
Message-ID: <20200217214610.uxbnfh5zooqve4yc@ltop.local>
References: <20200214113320.GA31578@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214113320.GA31578@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Feb 14, 2020 at 12:33:20PM +0100, Oleg Nesterov wrote:
> With this change dissect can know the scope of SYM_STRUCT/UNION/ENUM,
> see the next patch.
> 
> Note that MOD_TOPLEVEL can be set even if struct/union/enum type is
> private and bind_symbol() is not called.

I don't like that very much. For example: why this is needed for
struct/union/enum and not other types?
Should it be possible to use the function toplevel() or add and
helper for it in scope.c?

> IIUC nobody else looks at SYM_STRUCT->ctype.modifiers, "make check"
> doesn't show any difference.

Yes, it's true and it shouldn't make any difference but still I
would prefer to not mix symbols and types more than they already are.
 
-- Luc
