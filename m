Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F7AD58D3
	for <lists+linux-sparse@lfdr.de>; Mon, 14 Oct 2019 01:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbfJMXqf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 13 Oct 2019 19:46:35 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:36960 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbfJMXqf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 13 Oct 2019 19:46:35 -0400
Received: by mail-ed1-f53.google.com with SMTP id r4so13258203edy.4
        for <linux-sparse@vger.kernel.org>; Sun, 13 Oct 2019 16:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=nzxwXhKRQY3PCqE+MIgaVdmS/OuS5EzE/61fIE+zUxM=;
        b=vV7QmSoo4dNPl0bWe+P+MGKwj9TbEIWW66ZpNk6K31qF46nQPUWDjK3Bli1fltPS8V
         VLzw6kvwvFE18nS1B9r1ymwuGAygKvinvSabsc3ILRxto4zPAxDpoOYp2tCz72kTQN2T
         VOnxHuGrw5xUCU9A0A2oizUfYiwBwQu2ourGMaIUZRWWQNvWUFen9cdRjyFgCHSyfV9d
         K7JuI4SyI5QA/ZwT4vuSeAjl5raISwzq7r8fmZ+Y82nPZDxKrRK4bFmZxwRdbErWaNoy
         PIc/quxFSy5nbJBeXVLoerSnE8TJVbFkn0ZGbbSY650xzvJrHcsE8KkuB2N7HK0OrHdK
         0nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=nzxwXhKRQY3PCqE+MIgaVdmS/OuS5EzE/61fIE+zUxM=;
        b=dd/shGs6vconL4cpCPCu5pX0aR6WeQj16QaVvIkiDu6ObqC6KDxRSjz5YS2CUCS1wA
         1vW7h8jIRRbHPCm1sHqhqQskgy7jdaR5tECxCABZ+N+nFTObmYKWYANFb3aV4mU3TvDl
         p/I27sxUk7Puk9S0V2Z9J5BNWBA7cew1iiyKnAzJIeV1rhiclTeG9Xd4wN6eHytwyxUl
         JwsSNrFgdvna+w9BjW1C57hkPcG5TcpsFw0xsUo6S3w7oT+bq8KJYM5Pgdy6v05G4Vxh
         LQj7Tj4TKsNSJ5GSHe+osv4UvVL0Mvvw9AcThWy7DxpEJ1SWH2jtltqipBWT9V1TmBE8
         UDVQ==
X-Gm-Message-State: APjAAAUoSVw6EqIf4PgzArv7MWUUAvdy+y6lUQs9HdkW9J7ffgbWXgsg
        Ck/opURDCxvfwCm9IcB6J9ZBDUR8
X-Google-Smtp-Source: APXvYqwITx5W+Lb3/dgX6+VkyEycjDf36t1xc8Z6VcrkLy9g9CStF5ZKl9ZIDm66fn71ZLeSzWxeTw==
X-Received: by 2002:aa7:c652:: with SMTP id z18mr25276400edr.150.1571010393323;
        Sun, 13 Oct 2019 16:46:33 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:1c51:cebf:6b53:e827])
        by smtp.gmail.com with ESMTPSA id jo12sm2121744ejb.7.2019.10.13.16.46.32
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 16:46:32 -0700 (PDT)
Date:   Mon, 14 Oct 2019 01:46:31 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Subject: Sparse v0.6.1
Message-ID: <20191013234630.7uuszc5auri46h4y@desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse v0.6.1 is now out.

It's a small, 74 patches, release containing mainly small
fixes and improvements:
* improve build & test support for distros, mainly Debian
* stop warning on externally_visible functions without a prototype
* accept casts of __user/__iomem/... pointers to/from uintptr_t
* fix the underlying type of some enumeration values
* fix a build problem for sparse-llvm by using 'llvm-config --cppflags'
* conditionals (?:) may now be considered as constants if the condition is
* some error messages are now clearer or more coherent
* add missing expansion of compound literals
* improve parsing & checking of asm operands
* add missing expansion of asm operands
* expand some more builtins with constant operands (ffs, clz, ...)
* fix sparsec with recent version of cygwin
* fix crashes with some tools on toplevel asm.

Many thanks to people who have contributed to this release:
Uwe Kleine-König, Ramsay Jones, Randy Dunlap, Thomas Weißschuh,
Dan Carpenter, Jann Horn, Ben Dooks, Vegard Nossum, Aurelien Aptel,
Oliver Hartkopp, Linus Torvalds and Ilya Maximets.

The source code can be found at its usual repository:
    git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1

The tarballs are found at:
    https://www.kernel.org/pub/software/devel/sparse/dist/

-- Luc Van Oostenryck
