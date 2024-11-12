Return-Path: <linux-sparse+bounces-208-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D89C6119
	for <lists+linux-sparse@lfdr.de>; Tue, 12 Nov 2024 20:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19713283D28
	for <lists+linux-sparse@lfdr.de>; Tue, 12 Nov 2024 19:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0235A218316;
	Tue, 12 Nov 2024 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GV9G/+qR"
X-Original-To: linux-sparse@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B54209F51;
	Tue, 12 Nov 2024 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731438887; cv=none; b=gP7jOBk3kkzr0Y4SbY9lLf7TjCZxlA/FQHkGZo/Pp9Cp+zZEu4YAhIklzJ8q7sA8opHdzinUPjMDMNLkO9O6mVF7lwXfRcSfT9TCNOsWezpTANLb4LNNr/mhYlPFBPvHy+0EUbgaKYapb+Sm5w1+blyAp7LclR9/e7Rd1sAWE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731438887; c=relaxed/simple;
	bh=R7tK11HFFz92+5HgqOqjKz3m+zMzZ9lbCfyu9MqKoPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ram/hPHufwf47LnzLSmlyFZT56E2LObvG1Q9k0TwkUurnOL6sDwuWW7zkWPWneXJCnXxO+5gXre7KypA5PKPG8JaMkG2f0DtE7kERuNbWMAu+OiLYBt6kII1I2GTszC7OfT6NlSajlE5kt5TfFI7JpcG9eUQHfNmFVAZ+DkhqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GV9G/+qR; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.20.10.7] ([106.146.16.70])
	by smtp.orange.fr with ESMTPA
	id AwLVtikJ0OOAtAwLXt2Ra3; Tue, 12 Nov 2024 20:14:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731438884;
	bh=BmonsybAbjh00IDKXp8k0GsOn+QsdbOPhsMJajM8bjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=GV9G/+qRhEpcKfTTesqylr+yxC/irA8TQG5U2sCSemwlX4W2dHAZ6vwotqRbOnu1X
	 qkfMTQ3Ss4E7UdChL9Xzlfqr/s757fClyKWBbT7Abpvuwfj1mZVgcG9K/0fN+bJ3QE
	 pzxEbk1H9ecHL7HDw4hyf8LACpSKCdXCcrhK1hY858u6HGw6oPpDWp7duKAzyV3SUc
	 62kSMnvlRVcNHpwi28YNx5idPaBxKWbhYum2DQwb37zZvnqkHY9xW4nOCik/GPCPSO
	 JzPa5qjRVf1WoNy6FGSXlxRNnejbK3PE1sCBFChZN0iwjDftO445Vo7E1VilY16AF3
	 JNCeKiM2DnF4Q==
X-ME-Helo: [172.20.10.7]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 12 Nov 2024 20:14:44 +0100
X-ME-IP: 106.146.16.70
Message-ID: <ac2bbf41-7801-4788-b842-69d9b6291907@wanadoo.fr>
Date: Wed, 13 Nov 2024 04:14:20 +0900
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] add _statically_true() to simplify
 GENMASK_INPUT_CHECK()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
References: <20241112140454.518823-4-mailhol.vincent@wanadoo.fr>
 <CAADWXX88Uv+r1JtpnN2gDv6S2wDTqxsn5x8+-U_xWfeNxmT9NA@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
In-Reply-To: <CAADWXX88Uv+r1JtpnN2gDv6S2wDTqxsn5x8+-U_xWfeNxmT9NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/2024 at 02:52, Linus Torvalds wrote:
> On Tue, Nov 12, 2024 at 6:05 AM Vincent Mailhol
> <mailhol.vincent@wanadoo.fr> wrote:
>> v2 -> v3:
>>
>>     - split the single patch into a series of two patches.
> I haven't actually gotten to the patches yet, because all your emails
> end up in my spam box.
>
> The reason is because your git-send-email setup is broken, resulting in:
>
>    dmarc=fail (p=QUARANTINE sp=NONE dis=QUARANTINE) header.from=wanadoo.fr
>
> because you claim to use a wanadoo.fr address in your "From:" line:
>
>      From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>
> but you actually used gmail to send it, and the DKIM hash was
> generated by gmail:
>
>      DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
>          d=1e100.net;
>
> And then DMARC complains because the From: and the DKIM doesn't match.
>
> So to actually get the right DKIM hashes, you need to either
>
>   (a) send email using the wanadoo.fr smtp gateway
>
> or
>
>   (b) make the sender be that gmail address that you actually use for sending.
>
> Pls fix.

D'oh. Sorry for that and thanks for the notice. I just resent the full 
v3 with the correct smtp gateway (note that you may see it coming from 
smtp.orange.fr, this is the same as smtp.wanadoo.fr).

Yours sincerely,
Vincent Mailhol


