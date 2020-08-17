Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFB6245A49
	for <lists+linux-sparse@lfdr.de>; Mon, 17 Aug 2020 02:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgHQAVc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 16 Aug 2020 20:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgHQAVb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 16 Aug 2020 20:21:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A5FC061786;
        Sun, 16 Aug 2020 17:21:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id qc22so15733472ejb.4;
        Sun, 16 Aug 2020 17:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=m+nhAbTtfR18R0SFMS4ZL3d+7MtnIOLtCCf8UYQ8UHs=;
        b=ZgnjVvX2BG3m8xRMflWOqzW115fr6rcP4mDNcq8X52D+BT0C9yIAvgc5w8D8zLHwls
         JqKADMSC/9QsaxiEwSv68GVVxxUler65Su1f0kt03ZsBq35mfnBiYPVmulwCK22hUCjP
         2Agkw/Fcpmh6qrUkJPZqwIJwDP7xaBDBGRf6WIW4O6NvPVzUsYYoy3a7oJQACCvDr+LH
         RJF8VX7P6IqnafK51ZFSe/kN+jUwR/G940kNP7FQG1DJUuJiHhB6FU7zCs4y5d9rydOS
         8CSMKLW3ofLQ7tWFiZIg2lv53KaUCv9IcvkLRMTXMwApuRjAW2l6wjDSyMBLqC7pPhRA
         twRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=m+nhAbTtfR18R0SFMS4ZL3d+7MtnIOLtCCf8UYQ8UHs=;
        b=E8+MBOOfcnUunTurjQBuYygyZexXtJdcVogQlsyNrKEdyi6RURPiNUuvwsTrBthG0z
         GTR8S9GFpWG558DCmMknRjN2O3ptnihpZxqdNh0V3zUL/YDYRSFH+OrbACfGL8/97sZ9
         hmJv4NVojtJKATvyQSNkQ0DWPukXtI/s+R/FHYA7n2YnJVg3F+TttNrF8I0uqMOCTq35
         /aon0teTw02/HQl9G9nGNg5IC7UBy44i368W0ERNE1Ej0eOre3KLfdwjM1QgKxpLy6Yh
         BZJmPV3YYhRi+4rYK/u1uME53+7Qa/eLshK2gb99KJ/lKKBuyGvLIcv1ZbjIat5FMt17
         182w==
X-Gm-Message-State: AOAM531EqeljzXhLI+rAaCMHdKZGmGSBzF6swF5zXSpVBDz07uZEjzZP
        pV/S9rbiEb/OZ9/KtZr7Hp0LMYlgd4E=
X-Google-Smtp-Source: ABdhPJzzwCXZgmaNm+Qd8nNeV9Y0yB1KJMW6hORLfLke+7RabsE2UhE4+CuDWMtpBBgiOvd3uE+wOA==
X-Received: by 2002:a17:906:528d:: with SMTP id c13mr13055774ejm.61.1597623688401;
        Sun, 16 Aug 2020 17:21:28 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:9c9f:b37c:49dd:cd66])
        by smtp.gmail.com with ESMTPSA id h10sm12276662eds.0.2020.08.16.17.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 17:21:27 -0700 (PDT)
Date:   Mon, 17 Aug 2020 02:21:26 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jules Irenge <jbi.octave@gmail.com>
Subject: Sparse improvements & regressions for Linux v5.8-rc1 -> v5.9-rc1
Message-ID: <20200817002126.i2lb4yhja4u77exs@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi,

Here is a comparison of Sparse's unique warnings between v5.8-rc1 &
v5.9-rc1 on x86-64 (defconfig + allyesconfig).

Note that the differences are be caused by changes in the kernel
and in Sparse.

The raw logs as well as the result of the processing giving the
'unique warnings' are available at:
	git://github.com/lucvoo/sparse-logs.git


- 19249 18621 Total
+   161   191 Initializer entry defined twice
+    98   105 Using plain integer as NULL pointer
    394   394 advancing past deep designator
      4     4 arithmetics on pointers to functions
-    16    12 bad assignment to restricted type
      4     4 cast between address spaces (__percpu -> __rcu)
-    38     0 cast from non-scalar
-   276   261 cast from restricted type
+   142   473 cast removes address space '__iomem' of expression
      1     1 cast removes address space '__percpu' of expression
     15    15 cast removes address space '__rcu' of expression
+    41    43 cast removes address space '__user' of expression
-    51    13 cast to non-scalar
+  4512  4550 cast to restricted type
    609   609 cast truncates bits from constant value
-   349   332 context imbalance - different lock contexts for basic block
+   453   467 context imbalance - unexpected unlock
    189   189 context imbalance - wrong count at exit
-   118   109 dereference of noderef expression
+    13    16 dubious: !x & y
      1     1 dubious: !x | !y
      6     6 dubious: !x | y
-    57    56 dubious: x & !y
-    21    20 dubious: x | !y
+     0     1 duplicate [noderef]
     21    21 function with external linkage has definition
      2     2 implicit cast from nocast type
-   500   490 incompatible types in comparison expression (different address spaces)
      3     3 incompatible types in comparison expression (different base types)
      1     1 incompatible types in comparison expression (different type sizes)
+     6     7 incompatible types in conditional expression (different base types)
-  1225  1087 incorrect type in argument (different address spaces)
-   515   494 incorrect type in argument (different base types)
-     5     0 incorrect type in argument (different modifiers)
-    10     0 incorrect type in argument (different type sizes)
      1     1 incorrect type in argument (incompatible argument (different address spaces))
-     1     0 incorrect type in argument (incompatible argument (different base types))
-   388   382 incorrect type in assignment (different address spaces)
-  4945  4762 incorrect type in assignment (different base types)
      1     1 incorrect type in assignment (different modifiers)
-   141   120 incorrect type in initializer (different address spaces)
-   132   131 incorrect type in initializer (different base types)
      7     7 incorrect type in initializer (incompatible argument (different address spaces))
-    26    25 incorrect type in return expression (different address spaces)
+    26    30 incorrect type in return expression (different base types)
-   451   285 invalid assignment
     37    37 invalid bitfield specifier for type restricted type.
-    13     7 invalid initializer
      1     1 marked inline, but without a definition
      1     1 memcpy with byte count of ...
      5     5 memset with byte count of ...
      7     7 mixed bitwiseness
-    10     8 mixing different enum types:
+     1     2 multiple address spaces given
+     0    12 multiple definitions for ...
-     1     0 no newline at end of file
-     1     0 non-scalar type in conditional:
-   959   918 restricted type degrades to integer
-    43     0 return expression in void function
-     3     0 shift count is (-1)
-     5     0 shift too big for type
     12    12 static assertion failed
      5     5 subtraction of different types can't work (different address spaces)
-    24    23 subtraction of functions? Share your drugs
      1     1 switch with no cases
      5     5 symbol redeclared with different type (incompatible argument (different address spaces))
-  2135  1852 symbol was not declared. Should it be static?
      1     1 too long token expansion
      3     3 trying to concatenate long character string (8191 bytes max)


-- Luc
