Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18FED7192
	for <lists+linux-sparse@lfdr.de>; Tue, 15 Oct 2019 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfJOIun (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 15 Oct 2019 04:50:43 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:37023 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfJOIun (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 15 Oct 2019 04:50:43 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iKIXQ-0002wT-Vp
        for <linux-sparse@vger.kernel.org>; Tue, 15 Oct 2019 09:50:41 +0100
To:     linux-sparse@vger.kernel.org
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Subject: sparse issue buulding kernel/signal.c
Organization: Codethink Limited.
Message-ID: <c8a65f9c-4b5e-b2b5-324d-e0381701e481@codethink.co.uk>
Date:   Tue, 15 Oct 2019 09:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The following errors are coming when checking a kernel built for
ARM.

kernel/signal.c:1245:9: error: no member 'ip' in struct pt_regs
kernel/signal.c:1251:29: error: no member 'ip' in struct pt_regs
kernel/signal.c:1251:29: error: cast from unknown type
kernel/signal.c:1251:29: error: no member 'ip' in struct pt_regs
kernel/signal.c:1251:29: error: cast from unknown type
kernel/signal.c:1251:29: error: cannot dereference this type
kernel/signal.c:1251:29: error: cannot size expression
kernel/signal.c:1251:29: error: no member 'ip' in struct pt_regs
kernel/signal.c:1251:29: error: cast from unknown type
kernel/signal.c:1251:29: error: cannot dereference this type

The code is as follows

#if defined(__i386__) && !defined(__arch_um__)
	pr_info("code at %08lx: ", regs->ip);
	{
		int i;
		for (i = 0; i < 16; i++) {
			unsigned char insn;

			if (get_user(insn, (unsigned char *)(regs->ip + i)))
				break;
			pr_cont("%02x ", insn);
		}
	}
	pr_cont("\n");
#endif

so shouldn't really being built?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
