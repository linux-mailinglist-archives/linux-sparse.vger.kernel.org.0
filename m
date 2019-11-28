Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B001210CB97
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 16:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfK1PSF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 10:18:05 -0500
Received: from avasout04.plus.net ([212.159.14.19]:48694 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbfK1PSE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 10:18:04 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id aLYQi3YgU4Al0aLYRi3tU0; Thu, 28 Nov 2019 15:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574954283; bh=vgezfCmVCTmDjrECHHU1Kp3EuY8G0TNPUgB0Y8YM6cc=;
        h=To:Cc:From:Subject:Date;
        b=DPhBB5d1JqphaDl2iHFoCHOQJICq69D8xdGk8tfpQv+QTujwiFikfOxHrhpvET7Fy
         Y1caq7HZmHvHsS4XcN1wRtDSYHi7qafYEjx3nayStR7m1cIbPA8qfQNddq+aoLyjGp
         DC3uH2FKKMSuc4PWMrPiNRZLcHsdA3vu5lsx0v930eoT+g3K/nUI1SKWroSXTgYmBK
         ODwkWNk7uc5NlR4JF6NJ7d6/9fwBbJxpkV7rET9l+t9+M6cGcM5k5ojzJd6Bquur8a
         hTEaJrkKQDqqI730mEdjaU/55ecGj+eftW2bbQciSxDD+G6bWvPAhK1k2FFNVJLkeA
         sdUeZyQpI2zJA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=hCnBjOBslDAwLzcSLd4A:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] cgcc: fix definition of 'linux' macro
Message-ID: <18e4644b-7616-5d74-e298-4506372680b3@ramsayjones.plus.com>
Date:   Thu, 28 Nov 2019 15:17:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL2BBjfU14jF9GAdlng+TYSTQW/VTz8WDvuPQPM0sMvDfH0AgwPEAgOR7FPIDUippKe86PV2kaXZKr8x955H9zheX2msZcLuEhQHyhDQ28b5a5t3x7aX
 wvBHMdf2FmZqKVZ6+EFcpcgjfmTbCzvq81WRRr1GmFrSd6njhvXxJnPyFmrN3RlB3WU4AALESAaGOg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


During a call to add_specs('linux'), cgcc adds several macro definitions
to the sparse command line. In particular, it provides the incorrect
definition: '-Dlinux=linux'.

This bug was introduced in commit 807f74466b (<no title>, 2004-08-13), while
moving some calls to add_pre_buffer() around in lib.c. This was then moved
out of sparse, into cgcc, by commit cf2bde63a6 (<no title>, 2004-10-05),
where the definition was copied verbatum.

Fix this macro definition to read '-Dlinux=1' instead.

Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---
 cgcc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cgcc b/cgcc
index 87f4fc3e..e6541d36 100755
--- a/cgcc
+++ b/cgcc
@@ -230,7 +230,7 @@ sub add_specs {
 	    ' -DNULL="((void *)0)"';
     } elsif ($spec eq 'linux') {
 	return &add_specs ('unix') .
-	    ' -D__linux__=1 -D__linux=1 -Dlinux=linux';
+	    ' -D__linux__=1 -D__linux=1 -Dlinux=1';
     } elsif ($spec eq 'gnu/kfreebsd') {
 	return &add_specs ('unix') .
 	    ' -D__FreeBSD_kernel__=1';
-- 
2.24.0
