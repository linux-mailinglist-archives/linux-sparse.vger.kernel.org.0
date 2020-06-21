Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B168202C5A
	for <lists+linux-sparse@lfdr.de>; Sun, 21 Jun 2020 21:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730220AbgFUTef (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 21 Jun 2020 15:34:35 -0400
Received: from avasout06.plus.net ([212.159.14.18]:51755 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbgFUTee (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 21 Jun 2020 15:34:34 -0400
Received: from [10.0.2.15] ([80.189.83.36])
        by smtp with ESMTPA
        id n5jcjR13Okvt5n5jdja1X5; Sun, 21 Jun 2020 20:34:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592768073; bh=BaoqZoxiPzWTJOa8zd9Vy773uaE7JkIHlQY6YlGhTFI=;
        h=To:Cc:From:Subject:Date;
        b=iHw1NsOsGfZARN8BmouIfxORWQNWqs2RTiohM4q7j4plzbRjqnW8Lz6qjsnO5IyRm
         MHqxP+yEeEK+I3/rA/pRDE3Y0zGwe+94qZYBslNJD3AJEAX4XdfNYgh/x+5g3Lt/ho
         GJIexf6VNVTxuckVk2eEYRXLfWh0/Cd3/eA7axpF95rw7PEr3LFeYCgprcLZ+4b4PC
         bcQQblVGUoF7ftYa9dXmNSIHmBaSvcnPw4G6Xea56lk3+nJaHKD6p5EnsjO1zrxuft
         h0/lgamm86OIigziLWRp7kNVB5nesmVVpomTwdOM3r/tocRi0ymucdhk6O78ec7dC4
         1dWeSKIf5IpZA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=wkuGFLPET1X3QCvBVkIa5g==:117 a=wkuGFLPET1X3QCvBVkIa5g==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=WrYS1wEQFdv4xteN-50A:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=QEXdDO2ut3YA:10 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] evaluate.c: fix a gcc 'may be used uninitialized' warning
Message-ID: <b3ff0d78-ceea-768e-339c-22466b84b81d@ramsayjones.plus.com>
Date:   Sun, 21 Jun 2020 20:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKfukU9qp2H75L2PGxiObS4hjaAhxJmxWjPBXPdRGtqDpTbeuzLGD8wjXSqZZPIyVWNk+ZjLXXnnchQyqVEXB1gUZ47HJzLQrzVS7Cimf075fNPAeKvO
 4Uq5kCJ/LpWBRRZsdyqtCh5fUUiXJVlPoXZhvx/MC1ltSD23Yi19LZpWIbFwQiU4jy6yfjJ12SrH9w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---

Hi Luc,

Thanks for v0.6.2! :-D

However, I am seeing a gcc compiler warning:

    CC      evaluate.o
  evaluate.c: In function ‘evaluate_generic_selection’:
  evaluate.c:3310:38: warning: ‘base’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     if (base->type == SYM_ARRAY && base->array_size) {
                                    ~~~~^~~~~~~~~~~~

This patch is just an FYI/quick-fix for this warning. The patch
I wanted to send, moved the declaration of the base symbol into
a new block at the 'if (stype->type == SYM_NODE)' conditional,
which would now include the (indented) SYM_ARRAY conditional
block. This, of course, meant that the SYM_ARRAY conditional was
indented too far to the right ... ;-)

[perhaps this argues for that code to be refactored into a function]

Thanks!

ATB,
Ramsay Jones


 evaluate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index aa0f2080..19a15ca3 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3299,7 +3299,7 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 	source.ctype.modifiers &= ~(MOD_QUALIFIER|MOD_ATOMIC);
 	for (map = expr->map; map; map = map->next) {
 		struct symbol *stype = map->type;
-		struct symbol *base;
+		struct symbol *base = NULL;
 
 		if (!evaluate_symbol(stype))
 			continue;
@@ -3307,7 +3307,7 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 		if (stype->type == SYM_NODE)
 			base = stype->ctype.base_type;
 
-		if (base->type == SYM_ARRAY && base->array_size) {
+		if (base && base->type == SYM_ARRAY && base->array_size) {
 			get_expression_value_silent(base->array_size);
 			if (base->array_size->type == EXPR_VALUE)
 				continue;
-- 
2.27.0
