Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE93410CE10
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 18:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfK1RpK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 12:45:10 -0500
Received: from avasout04.plus.net ([212.159.14.19]:58690 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1RpJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 12:45:09 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id aNqli3mX14Al0aNqmi3yqa; Thu, 28 Nov 2019 17:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574963108; bh=iV6ra7mchAy6aikDInrq3G2mhcm1xqbriXN64vxNs+Y=;
        h=To:Cc:From:Subject:Date;
        b=Ba/fVIhiBziODUMx2JPcIRVOdettwV0Kpa6gQAEh9JCqzXj0XxrP330hDgZIz1+rv
         kF8coxdwJi9sF1msZKEtbU8eDZCPMahJyv4X2Y1jWrw69j6LiGdiE2yiAkn5oCcE40
         ork6gtxx2yaru1kCgsa63a5kPysZiYgsVbZCCOvckr0UyoM4u7NauT8chU9PAgnNOK
         xvzbHO51ujKTvfvumzHzbfs3FTTi0+OP3fnUxbfDtg+o24x4DG+ZCNNvoaMdh6sjGj
         /nVwsZi8/dwoml3pOBBmFD/U0q4hFB5yDPpGAtJ5aMopieBymqBamdKFoHC0J//PkF
         Mk5ItRhKxoWbA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=y24yejiid5-4W80LlbkA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [RFC PATCH] cgcc: only define __CYGWIN32__ for -m32 builds
Message-ID: <b342ed82-2949-7a44-3cf7-23ae3d266cbf@ramsayjones.plus.com>
Date:   Thu, 28 Nov 2019 17:45:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNqp9r2Q/crrLz5Bam0cMH39hwUAHDrzbVPbG7C6gBGG/wbHxpqN61kJAnCneqOR43NlF47zYLRd5W5Lu/dA4NAEYfFK/onWtbQm3+al+PyuKmkbl3U0
 DzM5omycdH20YDLKmgeOYG0LIUOL7H6SV0MbKeFObF1V0WKlpzHAGJS4763A8QZCbby9kyFHF7WQQw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---

Hi Luc,

This is marked RFC because it only improves the situation on 64-bit cygwin.
Without access to a (up-to-date) 32-bit cygwin, I can't experiment to find
a means to determine what platform I am on. I don't recall what the output
of 'uname' is on 32-bit cygwin, but I have a hunch that you can't tell which
is which from it's output. On 64-bit cygwin:

  $ uname -a
  CYGWIN_NT-10.0 satellite 3.0.7(0.338/5/3) 2019-04-30 18:08 x86_64 Cygwin
  $ uname -s
  CYGWIN_NT-10.0
  $ uname -o
  Cygwin
  $ 

[ie. I don't think 'uname -o' returns Cygwin32 or similar. :( ]

So, I don't know.

ATB,
Ramsay Jones

 cgcc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cgcc b/cgcc
index 87f4fc3e..2223c97d 100755
--- a/cgcc
+++ b/cgcc
@@ -254,7 +254,8 @@ sub add_specs {
     } elsif ( $spec =~ /^cygwin/) {
 	return &add_specs ('unix') .
 	    ' -fshort-wchar' .
-	    ' -D__CYGWIN__=1 -D__CYGWIN32__=1' .
+	    ' -D__CYGWIN__=1' .
+	    ($m32 ? ' -D__CYGWIN32__=1' : '') .
 	    " -D'_cdecl=__attribute__((__cdecl__))'" .
 	    " -D'__cdecl=__attribute__((__cdecl__))'" .
 	    " -D'_stdcall=__attribute__((__stdcall__))'" .
-- 
2.24.0
