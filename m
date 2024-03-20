Return-Path: <linux-sparse+bounces-89-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5898B8814D1
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Mar 2024 16:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E7D1F21620
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Mar 2024 15:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688852F72;
	Wed, 20 Mar 2024 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOh6Ee3r"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7B482C8;
	Wed, 20 Mar 2024 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710949584; cv=none; b=mcVJLFXMHV/LycDiZg0lEzLRbBcPo+NXhKLIqF7GmJcbJKlMwvU3F++LCB9NEbnxnquvXkAZXDdrWJ0UIsvHKOVR4uvPJ0r7waQ7OSjfOWq4CcgrNNeydJiKyzmNE7MBbEJo7ljwuiJil+GQmp/hXZVCayvRLL6p72liOCr+RPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710949584; c=relaxed/simple;
	bh=JyKk2aKlq2Wa6PBdkr0+beXzqlAlT5n0oaF2X44UbzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+UuyVdZEn/1HGtijTVvi4lvadwjE+hMItZSxqtTwBv+BeYABddrqDDxL/drpESW0bYPCFoUgeYX6LRULANLWAiwfUa0nr5hAXODawKtnt6kCqIeR67Rh58ZKuA2X1yApEqErRnnI9Vtuati30SqESTePGOy2hrV078ylYia9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOh6Ee3r; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e8f51d0bf0so27355b3a.3;
        Wed, 20 Mar 2024 08:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710949583; x=1711554383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Qdd3G+WjpR0qw+bhZnjo4tO5XvBBXppiRTTt8ZtUFME=;
        b=lOh6Ee3rYiJhO85rVA3KDnlwuJwNyhTZ/igBOf9iSmRRFpoV6H9skt8GCf5eUP99Fr
         z7YtS9s5/PxPq5JeGN+xARTTPlWQS9Cyo3esJ9bIoSqt9DAodWw9MY9YqcMOCTqIh1py
         hXl+8nYQY0IuJc93qmhqiYFF+PtAXVr5a7yqZpEajYU4Y6XF0pN6YwbvtfpVTxFgkkmS
         9PE+WjaEQyvICiWEu2QZaKHkliD5tNzGeX+c1w7jnmVJCu1qZHjQYqd5MythxRimq3Qf
         uAfd0e0590FUzhCxfkf86N9qXmJS7fzkL4Yvru7i3Nuu5c7HJtUa+3b0L/8gcdoz37pW
         e/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949583; x=1711554383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qdd3G+WjpR0qw+bhZnjo4tO5XvBBXppiRTTt8ZtUFME=;
        b=nyRk5F1U6eZQLe1KdNNua4CDGJbwETs0wvtbeAtjz/kFxuNbJmdlSrTxmoc4mEO4iK
         vH2vUWXBbnzEcuEHahVKZN1alPYjKjpR0CYbCzM0rNA30YRrAEwwV4H0pv48ctrgWAlj
         y8JmNjrqzsahwCaIE/IG2vfMG7A6kzj6pdnQ9ExX81Jp2S+oqQjvcJhbqYIvk1OpLvJo
         sSAYMZK/SN0FfDZH3gZdyA3wVEsBqN9eYbnUDYmaLNOkUGex9GhfEC7TPqcsybEZITHO
         q6Su+/boW6AOvJc5lAgPjDmmvhPDkwKmxHUmZQb1ywwwtsE3Z+OTU8ljpR54EA+mTq9d
         E0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaWZpR882F7djXVq3WihemY1oKPFjvSSY5vMIJ2vs9ti+UGKSHCMrdhx/ohMSpCnCdtX2yOpSYBsHEolR51VltEVy8iDEvVMs7dewS
X-Gm-Message-State: AOJu0YzUNUZgmzvaJQnnl5zmy5+93jJ7d0JUxwc5t3NOwgMqrv/8Hkw6
	eHYQY07TBrBgjLMHXp9s2YrJhPpci4RfIEl48YuTc+WtbL+rKPf5
X-Google-Smtp-Source: AGHT+IFR6WfRcdbTjLr4pgxNSZmP0CaEd9VwVke+KLYxv35xj7n2wR+JQyp4b7dGg14Oko9CAHcT0Q==
X-Received: by 2002:a05:6a20:430b:b0:1a3:63fa:d0e6 with SMTP id h11-20020a056a20430b00b001a363fad0e6mr9702545pzk.57.1710949582596;
        Wed, 20 Mar 2024 08:46:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d1-20020aa78141000000b006e6c0080466sm12090946pfn.176.2024.03.20.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:46:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d51ec9a1-5221-4005-9980-8258df8b5102@roeck-us.net>
Date: Wed, 20 Mar 2024 08:46:20 -0700
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 5/9] x86: Cure per CPU madness on UP
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Uros Bizjak <ubizjak@gmail.com>, linux-sparse@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <20240303235029.555787150@linutronix.de>
 <20240304005104.622511517@linutronix.de>
 <e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net> <87bk79i8km.ffs@tglx>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <87bk79i8km.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/24 01:58, Thomas Gleixner wrote:
> On Fri, Mar 15 2024 at 09:17, Guenter Roeck wrote:
>> I don't know the code well enough to determine what is wrong.
>> Please let me know what I can do to help debugging the problem.
> 
> Could you provide me the config and the qemu command line?
> 

defconfig-CONFIG_SMP and

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -cpu Haswell \
      --append "console=ttyS0" -nographic -monitor none

The cpu doesn't really matter as long as it is an Intel CPU.
A root file system isn't needed since the boot doesn't get that far.

Guenter


