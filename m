Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798251F01B7
	for <lists+linux-sparse@lfdr.de>; Fri,  5 Jun 2020 23:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgFEV3a (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 5 Jun 2020 17:29:30 -0400
Received: from avasout02.plus.net ([212.159.14.17]:58133 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728247AbgFEV33 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 5 Jun 2020 17:29:29 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id hJu3jLAAiU8CkhJu4jskAf; Fri, 05 Jun 2020 22:29:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1591392568; bh=Bh8v3vl5r7bRGXFejZZyjq9X/QDPbmC+ddu7LFKIBoU=;
        h=To:Cc:From:Subject:Date;
        b=PSz3zD5SBzr9fdNuDzQLph7YcPLlFrVfupP7eKuIqEUKNTte3QvMYMICwZv6iFB/R
         kgDiIwhnsSVzfgdOnknJ41h0ux99AwMROML5G7ragZh7iyDGoClkO+rfZX7AHHDVBM
         v6jtavYAKS45IuSdS5nXEBhFoN1Ea08UGAiptujQ04zwQZuSCsBfWZlng8e7ieCIVy
         Y9zyCCH7NUnqACCyc0Pd3YFphCs2v27tTxF7cKJqnZ98v5UW5xy2GvSCyQOiEm79Pe
         5OzuYm20AddLKKPXYdMTKrLve2q605CFGzl57evTx8MVTVgbGARQty3VTvIW43cJmH
         Ta5lOzqwLC1dg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=hwmg5cgAUQ9dR8X308wA:9
 a=zlS0bKvIMV3p8Tn9:21 a=Virk85TY38tXI5Qz:21 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] pre-process: fix a compiler array subscript type warning
Message-ID: <fbb9ba2b-14fa-c6e1-a730-80d35547ea52@ramsayjones.plus.com>
Date:   Fri, 5 Jun 2020 22:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfH6wk71s3i4JiaK3jK7bjFiWXg2hHWYM8gls60bFJvT3/wCGNdzJHvsbTB90/7o+XsaSFNStCGSFlDV9+MJGAkOa3Z17mwaSR1HJ0iKQK/JbXTsLlD3W
 E0GAnSJ7Q2swu3pTjIfD4XAm+Ivw+ernm1fX6KwIHtjsSJlCwh553j7rtYRujj7WWSEWNjbKMn0G9A==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


On cygwin, the <ctype.h> header is written in such a way as to cause
a gcc compiler warning if a plain 'char' is passed to the character
classification macros (in this case isdigit). The result is defined
only if the parameter is representable as an unsigned char, or if it
is EOF.

When passing a 'char' type argument to isdigit(), the compiler warns
like so:

    CC      pre-process.o
  In file included from pre-process.c:33:
  pre-process.c: In function ‘predefine’:
  pre-process.c:1429:18: warning: array subscript has type ‘char’ [-Wchar-subscripts]
   1429 |   if (isdigit(buf[0])) {
        |               ~~~^~~

In order to suppress the warning, cast the argument of isdigit() to
an 'unsigned char' type.

Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---

Hi Luc,

Having not done so in a while, last night I updated my cygwin
installation. This resulted in updates to the versions of the
libc/headers/gcc, among other things. (eg. gcc is now v9.3.0).

This patch fixes the new compiler warning that results!

ATB,
Ramsay Jones

 pre-process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pre-process.c b/pre-process.c
index c8725dc8..d96035e2 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -1426,7 +1426,7 @@ void predefine(const char *name, int weak, const char *fmt, ...)
 		va_end(ap);
 
 		value = __alloc_token(0);
-		if (isdigit(buf[0])) {
+		if (isdigit((unsigned char)buf[0])) {
 			token_type(value) = TOKEN_NUMBER;
 			value->number = xstrdup(buf);
 		} else {
-- 
2.27.0
