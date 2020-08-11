Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C16241534
	for <lists+linux-sparse@lfdr.de>; Tue, 11 Aug 2020 05:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgHKDW5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 10 Aug 2020 23:22:57 -0400
Received: from avasout03.plus.net ([84.93.230.244]:37414 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgHKDW5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 10 Aug 2020 23:22:57 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Aug 2020 23:22:56 EDT
Received: from [10.0.2.15] ([195.213.6.112])
        by smtp with ESMTPA
        id 5Kl2knxcsNXR95Kl3k7Art; Tue, 11 Aug 2020 04:15:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1597115725; bh=hS8n4vnXqMvxvNMMSM0QU/YBWJ1sPtmEV0dt0RZsQKM=;
        h=To:Cc:From:Subject:Date;
        b=SUVhvvrNPwBUQRClxwXCrM9QrYg1xf/Sbj1p77TSVZ4BG10uaMs/HsZSXKR7zw5zg
         wsLh7v7v7Kprq8gHp/RWoA6Ywatp2QVt1aRXzhZNBBG8XdvWEG3BuRY2PKwzGfK7hL
         ghjso5kSyuz7+C4CWhGMQrvGQjEPmTeQhbN1dtUXUY/3KRQ9/wKmO/zMgHoAq1g5fL
         PDAItkG7sIb5Q3KGTEgFH7AwsYvnxrQhx+c4gx3/MhZ2xvjBhhZMp9kJ2MfDYCvPow
         pSUmsG2I7yQFRrWLsaUBPDO6OeBywHu22G8ENUNnOlsFBVGDqhY/qyBFXtfApyGj5f
         CxZJxA9Pv5+Pg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ZemGyvdA c=1 sm=1 tr=0
 a=/rD2idLCdDHnmLflUbi9CQ==:117 a=/rD2idLCdDHnmLflUbi9CQ==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=d7FcE3svFJHG4hMjyUIA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] bug-assign-op0.c: fix test on 32-bit builds
Message-ID: <69f6f834-b350-5553-8227-1c7b4c6532c2@ramsayjones.plus.com>
Date:   Tue, 11 Aug 2020 04:15:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBxsZ38G414aCd0OPcjwax4wEa6pJZrXkX+X0u1HizDrAhJFfqqucHT7XaGmWSM7tYryuOitxByDSLdVpz2vDXMhBv+L6Jddroa5Gr6HC1ztkiHVrJut
 hNloRMR7oj4uq6HMZa2cYx51soIFrcL81RbARvkIVFXzOfIOb5rXc7Ba+kVWBHM3HZ2EB3LWiKwbGA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---

Hi Luc,

Tonight my 32-bit build/test run on 32-bit Linux failed this test.

The first version of this patch was a simple one-liner to add an
'-m64' argument to the test-linearize 'check-command'. This seems
to be the usual fix for this, but I thought I would try something
different. ;-)

If you prefer the one-liner, then go with that (I tested it on 32-bit
Linux, but not on 64-bit Linux - I can't imagine that it would fail!).

ATB,
Ramsay Jones

 validation/linear/bug-assign-op0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/validation/linear/bug-assign-op0.c b/validation/linear/bug-assign-op0.c
index b351bb51..3a2bef3c 100644
--- a/validation/linear/bug-assign-op0.c
+++ b/validation/linear/bug-assign-op0.c
@@ -10,7 +10,7 @@ unsigned int lsr(unsigned int u)
 	return u;
 }
 
-int divr(int s, unsigned long u)
+int divr(int s, unsigned long long u)
 {
 	extern int use(int, unsigned);
 	int t = s;
@@ -19,25 +19,25 @@ int divr(int s, unsigned long u)
 	return use(s, u);
 }
 
-int sdivul(int s, unsigned long u)
+int sdivul(int s, unsigned long long u)
 {
 	s /= u;			// divu
 	return s;
 }
 
-unsigned int udivsl(unsigned int u, long s)
+unsigned int udivsl(unsigned int u, long long s)
 {
 	u /= s;			// divs
 	return u;
 }
 
-int uldivs(int s, unsigned long u)
+int uldivs(int s, unsigned long long u)
 {
 	u /= s;			// divu
 	return u;
 }
 
-unsigned int sldivu(unsigned int u, long s)
+unsigned int sldivu(unsigned int u, long long s)
 {
 	s /= u;			// divs
 	return s;
-- 
2.28.0
