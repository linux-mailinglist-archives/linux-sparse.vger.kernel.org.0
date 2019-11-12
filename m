Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7FBF86EB
	for <lists+linux-sparse@lfdr.de>; Tue, 12 Nov 2019 03:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfKLCdo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 21:33:44 -0500
Received: from avasout03.plus.net ([84.93.230.244]:40479 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfKLCdo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 21:33:44 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id ULzxi0XsLKleZULzyiciNR; Tue, 12 Nov 2019 02:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1573526022; bh=iS3CHkYNHMUtOLEwf3kd42/r62IwiIGL6W1wrnAeIZ8=;
        h=To:Cc:From:Subject:Date;
        b=NZBGxKbyNwlNe+B+lwrXYrC29dm5FmJlnt38G5WKiYsQ5QnNQRT6d88YAp5Ug8xRE
         VelHEZY1QTbBfcTWGkL0IwjmaBM40dQvR0OyGcpWRAFHdWcRasEuRG+aPyfyMzxPXS
         9KYc1+/YKdpFZmbN4vP74AJY6gPEnMLqUQnjdIrxH8nxTxuPDjqyzJ9cOlFCMakhU5
         /w9aR+Pwo6lL3H3rQvoS+XyezGWhs967jF1HQAkZ8pbDINR2/sicfnp6BY8u0G5WIO
         0ioZMiFwzsqckvzw35Wdej1raFVG0W6l/TSMGZqzo9YA7siSj3bgwfbIQFH7cLXqcL
         nBOcx4irXsFPw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=y24-pwRSgz9izg8GrRkA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: Subject: [PATCH] lib.c: fix spelling of _BIG_ENDIAN
Message-ID: <eaf45a7f-6c3b-34bf-b65b-e23107cd37ae@ramsayjones.plus.com>
Date:   Tue, 12 Nov 2019 02:33:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfID+UgIA5bbBh0FF8bSm1iWW9BhBMLXqEedii9Q/Owk18ZXb00XngLQiy3PG0W4++cjWGEECQ4VQ8xdDYNSymckiqHiS5lhM/OXYHBSrJSavc58O4d2S
 Wgu2P9btqObeu27AmGUohCIvj8eH2n9ereznvkvBMZmLcJ6lpkF1WAOGkdIQxio2c7uZb9M993jS9w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Commit 3c3881cf1c ("cgcc: let sparse define _BIG_ENDIAN", 2019-11-08)
moved the definition of the _BIG_ENDIAN macro from cgcc to sparse (for
the powerpc platforms). Unfortunately, the macro was inadvertently spelt
incorrectly (as _BIG_DEBIAN). Correct the spelling.

Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---

Hi Luc,

Sorry for not noticing this earlier - I still had this patch in my
mail client, because I had intended to note the 'beeneeded' typo in
the commit message! I didn't notice this typo in the email but, for
some reason, I noticed it while reviewing the new commits fetched
this afternoon. Ah well, sorry about that.

I just did a quick check, before this patch:
 
  $ ./sparse --version
  v0.6.1-29-g781bc5d
  $ ./sparse --arch=ppc -dM -E -c - </dev/null | grep _BIG_
  #define __ORDER_BIG_ENDIAN__ 4321
  #define __BIG_ENDIAN__ 1
  #define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
  #define _BIG_DEBIAN 1
  $ 

... after this patch:
  
  $ ./sparse --version
  v0.6.1-30-gded7347
  $ ./sparse --arch=ppc -dM -E -c - </dev/null | grep _BIG_
  #define __ORDER_BIG_ENDIAN__ 4321
  #define __BIG_ENDIAN__ 1
  #define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
  #define _BIG_ENDIAN 1
  $ 

ATB,
Ramsay Jones
  

 lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index fd45da5..52ad0fd 100644
--- a/lib.c
+++ b/lib.c
@@ -1515,7 +1515,7 @@ static void predefined_macros(void)
 		predefine("__ppc__", 1, "1");
 		predefine("__PPC__", 1, "1");
 		if (arch_big_endian)
-			predefine("_BIG_DEBIAN", 1, "1");
+			predefine("_BIG_ENDIAN", 1, "1");
 		break;
 	case MACH_RISCV64:
 	case MACH_RISCV32:
-- 
2.24.0
