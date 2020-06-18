Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A41FFDC5
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 00:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgFRWPp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 18:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgFRWPo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 18:15:44 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71418C06174E
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 15:15:44 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id d15so6039541edm.10
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 15:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=PEHYN8YGUdl8377eatNoCmh7xylKV7c1/hbMKlMS6Dc=;
        b=Fab4ZTOom0k8jjcMGULy4KsnjFbhWspKzCPsZ+1/+yAFGPhCGX7NaCepI2QFd905f4
         0NJm1HpQJOM4wyFDtLCPW+Muibp5WL7ScPCOdZT9v+QZ0SoMmMWG3QzO8jeSltAmHh+K
         Mpg+RQF8yDl2/4qZUGy7sI0CEAWewsAFgv1/+w6UQqV/VeZf/qzxWVeoV4hnea3WoTny
         rmqkbzEQgWngYODmyL/yyQ/XCLHr4Nty5+I2Z6pY4o7ybeDP5D8DfWCxEcGJ0SN0tQf4
         AsuTbGfSht+SgmFzg7EV6IwaKlYkQxW3j7OkqVRtVBzpeMsBJRl9kdnGsQAVp1mlx4jK
         pRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=PEHYN8YGUdl8377eatNoCmh7xylKV7c1/hbMKlMS6Dc=;
        b=Yp8VXUJvX1Wpiz/lbaE80P8bmEQMVPGbNRoEnmfAw176SZJSHKGGxOcArnt87SJOFz
         SKJIh0GnA67OReqd1byiaCNCEQ5/detP4nBZDzdyJNICiXUuzemg6jIdBuilbZRy+okg
         bABIQA7U/cirWXdg1zaawhsSutp5Vg+imzvPcfLDADTQNGJX36KEdpQTVTuijJacQ8Uu
         ObGHpBudImq+51RbexqFa40SvYHc44TYjdmmJ5XuCgsffBFK8jYqDgN2/MCyNmlftVIA
         A2CWo/PHt8/UD+vBcLhbqdEgD4ydD7NXsTqIx+bQrBKvhI9GckFX1Yz4Mq9uZGwnEcSr
         6CCA==
X-Gm-Message-State: AOAM533MROm1QCaajS4M9hm9x7vtMCcYNIxkjsF0SsMGinvOM+eGGGz2
        0QHNtvNmnZaP76y1d4tJJbw9kRbC
X-Google-Smtp-Source: ABdhPJxkirLHhLv2XxIFxWqIx+DJsnjd+gd4Thyxf6G4ouE6NUqvez++g2LRsBwHOoff0OlC86g22A==
X-Received: by 2002:aa7:d388:: with SMTP id x8mr373427edq.380.1592518542567;
        Thu, 18 Jun 2020 15:15:42 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id bd19sm3093212edb.2.2020.06.18.15.15.41
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 15:15:41 -0700 (PDT)
Date:   Fri, 19 Jun 2020 00:15:40 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Subject: [ANNOUNCE] Sparse v0.6.2-rc2
Message-ID: <20200618221540.gvibhjj5fxiu4g4h@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse v0.6.2-rc2 is now out.

The source code can be found at its usual repository:
  git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1-rc2

The tarballs can be found at:
    https://www.kernel.org/pub/software/devel/sparse/dist/
with the following sha256sum:
    37347a72ed5c5465008d3f3f473f7c2fee68ad608887018f889dd65f97174b20  sparse-0.6.2-rc2.tar.gz
    685dfe9d7342b499e8137585bcf50bf4e42d548448b46a0ab578f3be5d212f2a  sparse-0.6.2-rc2.tar.xz


The changes since the -rc1 pre-release are:
* a bunch of spelling corrections in the documentation
* enum attributes are now parsed (and ignored)
* some build fixes for old versions of gcc or sqlite
* 'make CXX=...' can now be used to specify the C++ compiler
* the testsuite don't use anymore the option '-k' of 'timeout'
* remove commented-out code in optimize.c

-- Luc
