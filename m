Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C870159DF7
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 01:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgBLAbc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 19:31:32 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:37938 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728060AbgBLAbc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 19:31:32 -0500
Received: by mail-wr1-f45.google.com with SMTP id y17so63643wrh.5
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 16:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7BNe6Vh2E/4gL98wJSHoS3/o7hMENg/MmtiAwk2amx4=;
        b=OotGHvhHGMnQNgc+6IlmKEBhTDo0K4LHOqZNAf0RO5mI8DskSoISD7v/z6ps4J7/NR
         JT5VQy8XVp1VrpzO8EincWZmfz8GwITWQonTU/FuP75sLIgN0tis6m7juxG7HKpUh7lK
         n4ZeGT974Z7ST+/IqJWVhO8CPhyCk0CAnIz1B4NrRzdFw67KDDS9PutF/ApFms/ELxyx
         Ak/rlsIk35BOs3hw9WXD+u0+UidtIxM6hP+RNCPyDZ2k8Dg6pQK59sMhKjyNjS1rrHq0
         TpJel9TsoaqweLYXrgiCZv9yOSKQO7Y+LXgHeVtLJEf7af6kSdcQdrhvTFAk2NU7iqfh
         sUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7BNe6Vh2E/4gL98wJSHoS3/o7hMENg/MmtiAwk2amx4=;
        b=uWtDN8oSTfoBFJfd6om3M4xusuHAq3I0S4FYRhoTXTz7Sm1HoFgmAKYK9f+eXjBe73
         VZ5/gU1PlqZp2uQdf3uLXYoQxmU/kvLpXY+1lvkWRgtsGVBhhRCP9pjdu04XeCtpdAAL
         sISIiT0mYoFjRrY+jay3FALoA70jCQ0NcICjtFfhmw3ocgL/c41+PMHlp94p3ptBuYQz
         HEAwm1vE7PEOtqvuMRa7nGzblg2hmnzNON0y/28LCeVlj1LCwyQwPOD4ThOX+RbjuSf/
         HJL+zqgDuYWMoRYsTN129Le008pI0lJUnqGLZjqA9JGttNgdijvJj2o8m5cKg7dvMAdH
         p2XA==
X-Gm-Message-State: APjAAAXgFYIbwQPdNcwVs3Gf4/5YxTz/UAehmYbH3JWlmWTKftjEqLB3
        pEw1M++h6RHKeFkuk/bJTB0LuL6R4a4=
X-Google-Smtp-Source: APXvYqzDRuFvPW+WzrxsJcuu4TokMTlXfF4OR9CRgbzwRnmQQdl5JdntClh9rEIMEcPRWPNnabDKkw==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr10869464wru.233.1581467490287;
        Tue, 11 Feb 2020 16:31:30 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:5f6:4f42:5a99:8d6c])
        by smtp.gmail.com with ESMTPSA id x10sm7475931wrp.58.2020.02.11.16.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:31:29 -0800 (PST)
Date:   Wed, 12 Feb 2020 01:31:28 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Shannon Nelson <snelson@pensando.io>
Cc:     linux-sparse@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: smatch/sparse complaints on static assertion
Message-ID: <20200212003128.pieng2rlw7mykhvk@ltop.local>
References: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io>
 <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Feb 11, 2020 at 09:41:05AM -0800, Shannon Nelson wrote:
> Hi All,
> 
> I'm getting complaints from smatch on the ionic network driver's static
> assertions and am not sure why it was complaining.  Dan Carpenter suggested
> this might be an issue in sparse with how it is calculating the sizes of the
> unions.
> 
> I ran this at the top of a pretty recent net-next tree
> (v5.5-rc7-1839-g8192c36)
> $ ../smatch/smatch_scripts/kchecker drivers/net/ethernet/pensando/ionic/
> 
> And got several copies of this:
> 
> drivers/net/ethernet/pensando/ionic/ionic_dev.h:38:1: error: static
> assertion failed: "sizeof(union ionic_dev_regs) == 4096"

...
 
> These static assertion lines have been fine up until now and I'm pretty sure
> they are correct.
> 
> Has this issue been seen elsewhere?  Or is there something I can do in our
> code to get rid of the complaints?

This is caused by the packing of the structs. It's using
	#pragma pack(push, 1) / #pragma pack(pop)
which is not supported by Sparse. Packing via __attribute__((packed))
is incomplete but the pragmas are currently completly ignored.

-- Luc Van Oostenryck
