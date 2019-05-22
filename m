Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB0526096
	for <lists+linux-sparse@lfdr.de>; Wed, 22 May 2019 11:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfEVJfp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 May 2019 05:35:45 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:37446 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfEVJfo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 May 2019 05:35:44 -0400
Received: by mail-wm1-f52.google.com with SMTP id 7so1446282wmo.2
        for <linux-sparse@vger.kernel.org>; Wed, 22 May 2019 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SCejpHJs8RduwML7qk4a9+2u81x+Z8Sy5d8ibgj1lRc=;
        b=2D38KxyIfXr8F0xY+NxZy4hiXw9Y5uDAz2xuJdBRgA/hjJgcyKrXJd49xD5vz8/MoQ
         ijmXB1MoEixLG1JzCKuDOx7pREvlsB1LC7pcTtrWO7PcNwt+bEXep4dDI6LttmLN1saw
         0G31xPgruXC6xTqmsSUx/AKg2B9tyOZIap/pqc6qfBoCLyK+G/5DTDIyJ6+iekaPhBOb
         mil0kFdw83CTlS61inyBSDaUThWvfByKvxhAxp4BOuzoexX9CMUqs94lucCD8lVKtvYs
         NqwmS6IyqciCcexTgBO9hkOFpw6I4mavQ1M6b30+9vUyMKTFzVYsf/3y+ji/n9EaRRGP
         LHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SCejpHJs8RduwML7qk4a9+2u81x+Z8Sy5d8ibgj1lRc=;
        b=TAlgLdLv/F0XtkSXk+xoU4PGCht7YTp0Lg9n+Uhjza7zqnH84BuO505tzSgLRvswb+
         omxWEA+ih4fUgVVBsKQ8iY8/CeWl05IjdiNiYyqxlz4zEr2LPjEOrba9w0rA5YPJtC9U
         ORm1G4Z6OXiLK1oP213j7S9rMz5YXL5klft0TjeMl3CtoL8KWdnybxEC/lV1+7s35PEe
         zHcVg/Vxk63u24NpnTbR6AKzEegDcR66rRWdPlvH1MlDjJkxmXTrpJiw2QUPXqczMPvs
         3O2fOL3qg1m6CuA0nFXh825ku5PBjXisCQ3Mo7HBt0kGDPeCkENM0Km/cikYEcIO2GcT
         wZFw==
X-Gm-Message-State: APjAAAUzcbBCp0rO7l9UCdlJoKy7kObKcXfXDLlCkWheCX/oE1mYMvd+
        1k1XogBw4r3nTVGN08QbxWmzjQ==
X-Google-Smtp-Source: APXvYqysNq5BT6mR4ih/LH+vnrwFyMzPikf8O5w3D1cuekPYADiMeYv+X4wTi8TfXr0Gh0NakMt9NA==
X-Received: by 2002:a1c:9e97:: with SMTP id h145mr6325568wme.154.1558517742571;
        Wed, 22 May 2019 02:35:42 -0700 (PDT)
Received: from phil-xps.localnet ([95.215.121.72])
        by smtp.gmail.com with ESMTPSA id 88sm57524889wrc.33.2019.05.22.02.35.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 02:35:41 -0700 (PDT)
From:   Philipp Reisner <philipp.reisner@linbit.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Himanshu Jha <himanshujha199640@gmail.com>,
        linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
Date:   Wed, 22 May 2019 11:35:40 +0200
Message-ID: <2109871.T3yqqpU3n3@phil-xps>
In-Reply-To: <20190522091642.GQ31203@kadam>
References: <20190520164214.GA14656@himanshu-Vostro-3559> <20190522091642.GQ31203@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi,

[...]

I love the whole idea, but gave up working on such a things myself.

> > 
> > Because clang analysis wants it to be global!
> 
> A __protected_by() annotation sounds like a good idea.  I don't really
> care about the format too much.  If the information were in a comment
> and we could parse with a perl script that would be fine.  Or we could
> do:
> 
> 	struct foo {
> 		struct mutex lock;
> 		__start_protected(lock);
> 		int a, b, c;
> 		__end_protected(lock);
> 	};

Regarding the syntax I vote for a __protected_by(lock) instead of  
__start_protected(lock) / __end_protected(lock).

cheers,
 Phil


