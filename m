Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7118D1E92F1
	for <lists+linux-sparse@lfdr.de>; Sat, 30 May 2020 19:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgE3Rvl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 30 May 2020 13:51:41 -0400
Received: from avasout06.plus.net ([212.159.14.18]:34876 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgE3Rvl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 30 May 2020 13:51:41 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id f5dyjsK9jkvt5f5dzjMYD1; Sat, 30 May 2020 18:51:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1590861099; bh=sfTN8x5+cZtVMo5PaWrw/FBtsbshScwGJJVxbk28c6o=;
        h=To:Cc:From:Subject:Date;
        b=GSUUzwafqx8/Gq8Y5CNlaouChKd/CpGmAi7TqtjC0cXwYPMsGRXZY8zMBR5dyhgdL
         rQTw42ooneHNWw0w7fzUznzrzivi0jIaIyCkOKeO7jo3p33JF77f3jUP89ny4hcmEb
         0tZ2UnCD5o5ytn0wUZzggWOMpCc6en5CdzauXjzdkt3+CyeP/x1SFHW7NMdTDvMihh
         7oIFkkzESSS2KjvG5C2FFKt2CLVnhS/24iO5PPxaRkysMkA/+UPO7ydiFx9uArt1RU
         /KEGLxsTYUcAs+daIhu68ZqkKfRrMGFxJ/t+jJJHVX0PjT2mRZnEmdwIOzRIFV1FGe
         On4PXh18dArxw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=xx88a3B_w9vGXJkaf-YA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=QEXdDO2ut3YA:10 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] evaluate: mark evaluate_generic_selection() as static
Message-ID: <37ef319f-ed1e-071d-ff4b-cb3a997fbf65@ramsayjones.plus.com>
Date:   Sat, 30 May 2020 18:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFS12czxvzOKIbyoSwuhKjhvD1dpl5Up5tptRYLjs6HQa2m2PXhPJFegIMBWeFyu2+EJuGwQf0Zoq8G7ykpGBrd7Pj9t6JVj5kQAhBv0qZM6lj/bsy3l
 pi3zSYQr6yGb4T1ekF42w15ahRuOr4G6/MLoVAdqVWL2/VmWqOcYgLsDmRU/jz04ZjLfcfP7GI5+NA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Commit c100a7ab (add support for _Generic, 2020-05-28) added the
function evaluate_generic_selection() as an external symbol, without
providing an external declaration in a header file. This causes
sparse to issue a warning as part of the 'selfcheck' target.

Since this function does not (currently) need to be an external symbol,
mark it as static.

Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---
 evaluate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 5f2b7d6f..8d2e6869 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3280,7 +3280,7 @@ static int type_selection(struct symbol *ctrl, struct symbol *type)
 	return !type_difference(&c, &t, 0, 0);
 }
 
-struct symbol *evaluate_generic_selection(struct expression *expr)
+static struct symbol *evaluate_generic_selection(struct expression *expr)
 {
 	struct type_expression *map;
 	struct expression *res;
-- 
2.26.2
