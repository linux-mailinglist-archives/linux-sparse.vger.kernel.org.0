Return-Path: <linux-sparse+bounces-27-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48B817188
	for <lists+linux-sparse@lfdr.de>; Mon, 18 Dec 2023 14:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9A51F250EE
	for <lists+linux-sparse@lfdr.de>; Mon, 18 Dec 2023 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E40E1D12B;
	Mon, 18 Dec 2023 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyUhBqx8"
X-Original-To: linux-sparse@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343961D127
	for <linux-sparse@vger.kernel.org>; Mon, 18 Dec 2023 13:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B5EC433C8;
	Mon, 18 Dec 2023 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702907921;
	bh=UltX4QpTPchDus6vb+rtk6Q35vMuHP3B2y8ClZRlZxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyUhBqx8wTRsDINOxnGO+pMnsjb1BU5+PtKdduPJnxsq+cqVMyn7A9ct3QB25fhDj
	 xqIYD2B9yh87bCSh+0lmoDgROULP9xZIdsF5Qz6BKVekNA0hEMSgb0cDqudZ64knAb
	 nHqVmgpqI8ZPL0wzfg3azVVgah6UsdrWM789jRM854GRHQYOksX9lopCy9tPPnyqTV
	 Uk+1kvkDrPMouDrFhzfvhM1ZW7cynjUxyfsF9ZBwXLV2CNqJJzK+jknW94RiGCaqO6
	 nUgEDR6/mXnut4/HyOiCvRr6aAHa1nIQWiHl651s1ATrN+G3caZ3sNtCxXOFG2SX+4
	 DghccWgthLebQ==
Date: Mon, 18 Dec 2023 14:58:32 +0100
From: Luc Van Oostenryck <lucvoo@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: luc.vanoostenryck@gmail.com, linux-sparse@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Add support for the zicbom extension
Message-ID: <33kzvc5b3lo5uk7pkx5n57janjfkvyjimzgym2dbhw5y3rg7fn@quhub5jeh63i>
References: <20220811033138.20676-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811033138.20676-1-palmer@rivosinc.com>

On Wed, Aug 10, 2022 at 08:31:38PM -0700, Palmer Dabbelt wrote:
> This was recently added to binutils and with any luck will soon be in
> Linux, without it sparse will fail when trying to build new kernels on
> systems with new toolchains.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Pushed to mainline now. Sorry for this very long delay.
-- Luc

