Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9E7CFC13
	for <lists+linux-sparse@lfdr.de>; Tue,  8 Oct 2019 16:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfJHOM4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 8 Oct 2019 10:12:56 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:38862 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJHOM4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 8 Oct 2019 10:12:56 -0400
Received: by mail-io1-f46.google.com with SMTP id u8so36784716iom.5
        for <linux-sparse@vger.kernel.org>; Tue, 08 Oct 2019 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lsnpQ0vZliRq2QFDfNcq518prWPmvxqhzW5Hx829/pM=;
        b=Lqwblt1XhmD5bXWaOrHCk2CXUQk7VO5uphUWwCoUdLDwZRHtPwE4zq772xpyr9zSZS
         woVSPIFg+YClG0yR/DvU22UuqCqf103ZuOf5hWQYgxLJLfcAJ4+E4DvIPs/dU287MxOa
         Nf7RMMeU5ycqbFCTG6GZznnW/nS1xyAm0Tz49tpof2cKvAxv0uBG9uFIyMZ8kkjSLAWQ
         YQJ46026j2tO/FVlpt59iWzw2k3GgXuyLBHV/E2w5UIXjoePmsOd3kx51pD0shSrMV5Y
         ua+zbnJmmU8iqX7A5DWy17qage13HOjsf3gSwvBmMVqe73E8q6gYrLPLCZ2bixyJ5QPt
         ogiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lsnpQ0vZliRq2QFDfNcq518prWPmvxqhzW5Hx829/pM=;
        b=TyocKPtFbI8xE+35txo8mYEaO3E0+zH8KmalOPwFSA+sM43uSobk4ZoqhWOcyvFQFk
         RWO06tD0ArtkZE6mBJY5bViSdvAG+Z/QKMdA3ZDr7tKEKJT2y9cLk9z7InXA7acLmf4j
         SJmoSOnES8vmpqgkknzLLP5BA/FrwJxSeTwggJPzgJtya32TV2hje9oyNQi3gDcW1mdk
         Zfv6wgS/nEnKTcgGmUYjfPf2o8zeqNQhXw727l9pBMgXZQsPWLwQxoBL+G2j50KPdSd0
         gBj3JBu1+/LCGAGlMMtt54q/221dD9D6dHBx9Q10sluoQn31BN3jhP2FG8WE4oPAN0Xc
         un5A==
X-Gm-Message-State: APjAAAVyyT9A5bNOBZ0Hdn7nhPBj9BKfvkTomHjLAd1NJW/erBjnXsxf
        NstfInAsHxBj5Yn7ewzQTueJHJT519zea96gOKHeTl8s
X-Google-Smtp-Source: APXvYqwXHl4rsSGGoCn8scbjyNA+wa7Xho6JZf+NGLRIQIiZifOHQcim5fOaXDCOnMdTW2A3TfwcwyviQKj7pZrUfhY=
X-Received: by 2002:a5d:80cc:: with SMTP id h12mr29204410ior.151.1570543975212;
 Tue, 08 Oct 2019 07:12:55 -0700 (PDT)
MIME-Version: 1.0
From:   Vegard Nossum <vegard.nossum@gmail.com>
Date:   Tue, 8 Oct 2019 16:12:28 +0200
Message-ID: <CAOMGZ=EeKcRczKWsM1DnZgHEGZYjuPJ2VPwkngY5ZY9w3WuhOw@mail.gmail.com>
Subject: "graph" (v0.6.1-rc2) segfaults on top-level asm
To:     luc.vanoostenryck@gmail.com, linux-sparse@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000bf99ce059466c3f7"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

--000000000000bf99ce059466c3f7
Content-Type: text/plain; charset="UTF-8"

Hi,

The "graph" binary segfaults on this input:

asm("");

This is what gdb says:

(gdb) run
Starting program: /home/vegard/git/sparse/graph asm.c
digraph call_graph {

Program received signal SIGSEGV, Segmentation fault.
0x0000000000401505 in graph_ep (ep=0x7ffff7f62010) at graph.c:52
52              sname = stream_name(ep->entry->bb->pos.stream);
(gdb) bt
#0  0x0000000000401505 in graph_ep (ep=0x7ffff7f62010) at graph.c:52
#1  main (argc=<optimized out>, argv=<optimized out>) at graph.c:191
(gdb) p ep->entry
$1 = (struct instruction *) 0x0

I've attached a tentative patch that fixes my segfault, but maybe this
is not the correct solution or maybe other binaries are impacted.

Bisected to:

commit 15fa4d60ebba3025495bb34f0718764336d3dfe0
Author: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Date:   Mon May 29 04:25:56 2017 +0200

    topasm: top-level asm is special

Thanks,


Vegard

--000000000000bf99ce059466c3f7
Content-Type: text/x-patch; charset="US-ASCII"; name="graph.patch"
Content-Disposition: attachment; filename="graph.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k1hx9e280>
X-Attachment-Id: f_k1hx9e280

ZGlmZiAtLWdpdCBhL2dyYXBoLmMgYi9ncmFwaC5jCmluZGV4IGJlNGNmMjgyLi42M2U2ZTA2MyAx
MDA2NDQKLS0tIGEvZ3JhcGguYworKysgYi9ncmFwaC5jCkBAIC0xODcsNyArMTg3LDcgQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQl9IEVORF9GT1JfRUFDSF9QVFIoc3ltKTsK
IAogCQlGT1JfRUFDSF9QVFIoZnN5bXMsIHN5bSkgewotCQkJaWYgKHN5bS0+ZXApIHsKKwkJCWlm
IChzeW0tPmVwICYmIHN5bS0+ZXAtPmVudHJ5KSB7CiAJCQkJZ3JhcGhfZXAoc3ltLT5lcCk7CiAJ
CQkJZ3JhcGhfY2FsbHMoc3ltLT5lcCwgMSk7CiAJCQl9CkBAIC0xOTcsNyArMTk3LDcgQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCiAJLyogR3JhcGggaW50ZXItZmlsZSBjYWxs
cyAqLwogCUZPUl9FQUNIX1BUUihhbGxfc3ltcywgc3ltKSB7Ci0JCWlmIChzeW0tPmVwKQorCQlp
ZiAoc3ltLT5lcCAmJiBzeW0tPmVwLT5lbnRyeSkKIAkJCWdyYXBoX2NhbGxzKHN5bS0+ZXAsIDAp
OwogCX0gRU5EX0ZPUl9FQUNIX1BUUihzeW0pOwogCg==
--000000000000bf99ce059466c3f7--
