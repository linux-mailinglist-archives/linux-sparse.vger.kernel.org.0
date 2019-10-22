Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D42FDE0396
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 14:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388955AbfJVMGc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 08:06:32 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:54375 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388954AbfJVMGc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 08:06:32 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMsvm-0001MQ-Kz; Tue, 22 Oct 2019 13:06:30 +0100
Subject: Re: follow-up on printf formatting
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <6c2d55be-82b6-c226-a978-a005908cfc23@codethink.co.uk>
Date:   Tue, 22 Oct 2019 13:06:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 25/09/2019 11:00, Ben Dooks wrote:
> This is a re-send of the printf formatting parsing to see if there is
> anything else that needs doing before getting it added to the next
> release.

I've put a new copy of this up at:

https://github.com/bjdooks-ct/sparse bjdooks/printf19

we're back to having some tests fail as it looks like the current 
evaluation does not care about int vs long.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
