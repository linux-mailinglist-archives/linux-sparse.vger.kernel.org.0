Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E54CE028A
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 13:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731898AbfJVLLV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 07:11:21 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:52894 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbfJVLLV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 07:11:21 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMs4N-00006E-NG; Tue, 22 Oct 2019 12:11:19 +0100
Subject: Re: [PATCH 5/5] tests: add varargs printf format tests
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-6-ben.dooks@codethink.co.uk>
 <20191020155301.eqtjwm5a3dnfjhe4@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <ee0fa900-4fed-a36d-a76b-b9d36a3f0bf7@codethink.co.uk>
Date:   Tue, 22 Oct 2019 12:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020155301.eqtjwm5a3dnfjhe4@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 16:53, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:15AM +0100, Ben Dooks wrote:
>> Add some tests for the new printf format checking code.
>> Note, these do not all pass yet.
> 
> All of them pass here. I'm missing something?
> If you have more tests, I prefer you already add them and mark
> them with 'check-known-to-fail' so that we know what is not yet working.

I think this a remenant of an older series. I will remove

> I would also prefer to have this patch moved to the beginning of the series.

Ok.

Somewhere along the line we're now missing %d being passed an unsigned long.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
