Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0852C2AF788
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Nov 2020 18:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgKKRrG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Nov 2020 12:47:06 -0500
Received: from avasout06.plus.net ([212.159.14.18]:34157 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKRrF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Nov 2020 12:47:05 -0500
Received: from [10.0.2.15] ([80.189.83.69])
        by smtp with ESMTPA
        id cuD0kA2uIhO4HcuD1klP4e; Wed, 11 Nov 2020 17:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1605116823; bh=5fSxWV6sTEQuc/LlpBIzy+bRZ+omqDHqWI738qLge/w=;
        h=To:Cc:From:Subject:Date;
        b=KQAUPnQmMKHwTwldlxVpj7L/FQY9zn62SWH26PUsAA+NQD7hDsUn+m90kpKnPnTQ6
         yHuVHhGoWlEyXPHtapCIyRgODcAMgWVBRdAhs4ITLLhg+z0Mmu0qsKQDYg5PS3TSi+
         D9W1gHVJVSlAvzP6VngX5SAA0uhTE8YruTGMiq8TZ6tMyErfDjARFBYv0hAD6Ejm0L
         MWeNPFx/xUd47HOTlXqq7FnAzS6ocng3z4okltzIU6HJ+FOpczo5ClMIaLdPWIdRNB
         QZabVXxw5AC7yX/k3eka2ug+dGaxRT195o6S7a+4qCaY9V+Wvm6u1hJ/MJpNydQmkP
         VqMFUL9PHV34w==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=SPPZqNnH c=1 sm=1 tr=0
 a=VKYMt3kHM3Z9lWmoeJedNA==:117 a=VKYMt3kHM3Z9lWmoeJedNA==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=bo61SGxT-T9vOp5IPNwA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] linearize: fix a couple of 'selfcheck' warnings
Message-ID: <76afc97f-e6c3-2164-e4e1-13e850493af1@ramsayjones.plus.com>
Date:   Wed, 11 Nov 2020 17:47:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCn9BdNlHBSdnX6WFGF2Rxd57oqiy2Yu9pazxKxZdbVQ8eUqoYM1fPCBt+RKPPCQvYssQKWhyTBqwSQKxJl4KRFevU1dgD4wmodvCpuYhy3evE3m+yPR
 e0Y2byOOFEidG1HV2VH/vLl119DZoN4HII1mF4HkeC+dkZ86d/ZOwrCr58L6sNPizDqtnAt/1Gt8Bw==
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---
 linearize.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linearize.h b/linearize.h
index 77ae7c9a..31c754e2 100644
--- a/linearize.h
+++ b/linearize.h
@@ -326,8 +326,10 @@ pseudo_t undef_pseudo(void);
 struct entrypoint *linearize_symbol(struct symbol *sym);
 int unssa(struct entrypoint *ep);
 void show_entry(struct entrypoint *ep);
+void show_insn_entry(struct instruction *insn);
 const char *show_pseudo(pseudo_t pseudo);
 void show_bb(struct basic_block *bb);
+void show_insn_bb(struct instruction *insn);
 const char *show_instruction(struct instruction *insn);
 const char *show_label(struct basic_block *bb);
 
-- 
2.29.0
