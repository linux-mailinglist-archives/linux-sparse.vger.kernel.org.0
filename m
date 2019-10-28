Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B081E7942
	for <lists+linux-sparse@lfdr.de>; Mon, 28 Oct 2019 20:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731091AbfJ1Tcp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 15:32:45 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:38123 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730988AbfJ1Tcp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 15:32:45 -0400
Received: by mail-wm1-f45.google.com with SMTP id 22so156651wms.3
        for <linux-sparse@vger.kernel.org>; Mon, 28 Oct 2019 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=9hHVMUPScWA9p0edtvl4OSplyE525X8If3YYHyAoBsg=;
        b=BnjEv6k2DPgHOtK6dzkEHZ/6VJHsUk3BhMIYI2Lka+NyUIB908bYXsnON6WQpPNrzM
         Sc7Vxzuy61aPvXRsAQbGSVl8/ERDZpGisMn+BPMwSQN2qGhJbJwEZjRtYiMG84PkKlBQ
         Pfb5AQnTWBqgpM9ZPn3uVI6cH0tpa6qr1Ikxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=9hHVMUPScWA9p0edtvl4OSplyE525X8If3YYHyAoBsg=;
        b=H389WTPTptPAsra3xvD6pxJaiw1iEPf4ThVjBbAhg06rorpovPFm7xVjrPmgRRPvQ5
         HIhWsVyv0XWr3o0wJ6OhvDaJ15pOx4oMbAKnIMWqDcnGgrbWGdsQuY+YaVMD9DYyNEww
         AUHAXNNhfGLXwWyjbNU8wpUr82koZ2CXeAu75MwXYepAqqp9mBi3SQLjroyUhc7VErBT
         Rd+dE65fcHGWTG7aCUCICi8oqu28/a44XhydMsPY3w6hluS7uwHeQ2V/P2V4k7Fblo+a
         BPVce8CqPxRyg4e7NbeCt99iMel0HMJJvFVqg4MykKotLeq31bKwigLFxWvnnrUPjehH
         hLKw==
X-Gm-Message-State: APjAAAVgL8DHJlwfK/uM5NgRu4ILP93vUk4gLBMSdXPs5aSomD5hUIbj
        nd9DiM3Y/tDaD4wMBd4ccOVsaw==
X-Google-Smtp-Source: APXvYqzP+GtzCEn3dB8WMT7Qr9gfXo/78jAWJKBJdK3mPsm5WP+yqF7Z0EnfRMO4aztOA49EusgzMg==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr799019wmd.104.1572291164041;
        Mon, 28 Oct 2019 12:32:44 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id e24sm634279wme.26.2019.10.28.12.32.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 12:32:43 -0700 (PDT)
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.co>
Cc:     linux-sparse@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: detecting misuse of of_get_property
Message-ID: <ec277c12-c608-6326-7723-be8cab4f524a@rasmusvillemoes.dk>
Date:   Mon, 28 Oct 2019 20:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi,

I just spent some time trying to convert some so far PPC-only drivers to
be more generic. One of the things I had to do was convert stuff like

  u32 *val = of_get_property(np, "bla", NULL);
  do_stuff_with(*val);

with

  of_property_read_u32(np, "bla", &val);
  do_stuff_with(val);

(error checking omitted for simplicity). The problem is that
of_get_property() just returns void*. When the property is just a
string, there's no problem interpreting that as a char*. But when the
property is a number of array of numbers, I'd like some way to flag
casting it to u32* as an error - if you cast it to a (pointer to integer
type wider than char), it must be to a __be32*. Is there some way
sparse/smatch could help find such cases?

Rasmus
