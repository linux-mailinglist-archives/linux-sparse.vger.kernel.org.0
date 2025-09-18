Return-Path: <linux-sparse+bounces-468-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCCB8546E
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Sep 2025 16:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1003417021D
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Sep 2025 14:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F75D236435;
	Thu, 18 Sep 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XXTV8oTV"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B0260575
	for <linux-sparse@vger.kernel.org>; Thu, 18 Sep 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205896; cv=none; b=BxNu6M837GXX8U1rr74xOLSFKQdB4ANhopBuGd3tWv/h9gv8LUMQDtTUIeJpb8HUnXA+6/3FxHLPnKQTQjTq3pBialMd/nW54xIs4qxFxxKy3/JHbFyluPuPgPuu1l9ex+uInwbhIYGEUnfIb6zyqwHJ8VBPloY4hGx+pv7j50w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205896; c=relaxed/simple;
	bh=myP/sybN2zsJVXA5VSxoEq1YkiH03BHAZFTkykC2GiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8QRf/PIZ0zbuevjjtJEFjR95Ux6qr0rzAdWd8vRWYYTQgtqWN0IMsweJVJqurb/0tu8GkuE/N8K5KX+PiDj+BJtQKKsxS1Hscwyv/bYbypfcrVvfyufueRxR0EFRMXw3PlClGs6dkamF0LGQu2SZcmVuesxR76n0/xRdpw+uEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XXTV8oTV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-329b760080fso822719a91.1
        for <linux-sparse@vger.kernel.org>; Thu, 18 Sep 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758205893; x=1758810693; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x7wpgOqV2jwxbf7nUbBy2XlSiAc50BZhVeubzU1uvBU=;
        b=XXTV8oTVX6+S8cB3egbJOi+r52l5pS2nTdxLCu3XgCnMJElQ4K7ATWx1gTLCprfKUK
         nQgtAKfeTNowQfoDA+TJVUvxACXAU5g7SX5/YuHWRmZd4uYmfwWBNM+X1oPelM98XG13
         XDyNcDd8MYiEllydXIvpI+V4DL/nH6v+LS0ZeRsSRuS1fy0zk5Z58LJJ8tbrCvvqfhyH
         +/geSbKkYMYURYnyK3n7BJ3l6rnJ3C9Ct5wTV9KT7Eid1PubGWPxkh+2qVqQwpSwVuGd
         dPVlvuTmODDqH3aYI72ZNNRPOE64uPlp5llb0m10owIyJ6NTZVte2z7IXU1vhv4o/YBR
         VLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205893; x=1758810693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7wpgOqV2jwxbf7nUbBy2XlSiAc50BZhVeubzU1uvBU=;
        b=UNS6PdHIJ4VxqOD3CDzmgQtweElXsLVKpagA02YgNXO0thzbwohaIepLYPYL74MsZ6
         aUKh38x+jU26Gw+9M0zx9hp+I33I7Z7A2XITvmmNMDNqyqAZNrH4kPQPGdGrzOItyXvW
         7xpj8+mGGTVDj2UljziPz8J+BRn+24ASzcty0thpTgRlD+Rl/ETra5+h3Qyt28NqELS9
         pYOfoML1P6gY5Psz2v9G1fQJ9rjZu+wpvFBgkz3L5sZ5EA2vHLV05AhbGT1pNhSElbbt
         SFVAhgwx4fAtfWeHIGJ5cGTtkgqAwAbSp2Q5tH0u9jIQohEyZdYFFZB1r5Z7sAZuh6o5
         FH3A==
X-Forwarded-Encrypted: i=1; AJvYcCWHRuo8ycnYzj1gZey9FsyEzN//kCuJbV3M76216jySqWpEL3FXUKmvxUvemxiXBUh72nY/wzmEZyq+lE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybZKc2A4GKXsqKtZp8Rpj1SxuYQGNBU6RmZJNgaR6JFlcDcnLz
	mUlE7RHlxWCSjS3uVGXz6QVeTgfGb1oPDsM/2xioqyPzm1oOjjCc8lO94EXoOhT47toUz5aaTHj
	PPVF7r+SDkDv3TGrvYtBSYeYqQ112uLNShUZly/kX
X-Gm-Gg: ASbGncuoE63oIYVULY0q9hY5NAFf2FOgPzhxlNxSMC1rtphJ0Yozbej21Bl1XLSafoH
	NqheYvJpQA2MFR5x4XZuu8rQIOJnt5Y7hg78QNO14idUP2NJTwgofn8NiAtC6TAlWj2/+tN9qGA
	MzE8i+Cn6FdzaZaIhmvxUTeYW6I9Ze5LXuOn9DV5rSJ02sc1B77m8NG2cLZY6Qv4sqb9nfM3+BV
	WpjSq+oOMiPWnJtVJJAt/7DVN5pXtoMcpJn7BTmwC6ufj/v82z5LLIDOal1/Q==
X-Google-Smtp-Source: AGHT+IHYGUcixIR/dwWsgGEgFB1TOwlgrZ0O4FlqafV2iJGSlcEq1KnUzPyMPrhTBrvu1VqtuDJ2xHHxKwyBuVmjxY4=
X-Received: by 2002:a17:90a:e184:b0:32e:b2f8:8dc1 with SMTP id
 98e67ed59e1d1-32ee3ee55c5mr7425841a91.10.1758205892532; Thu, 18 Sep 2025
 07:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <20250918141511.GA30263@lst.de>
In-Reply-To: <20250918141511.GA30263@lst.de>
From: Marco Elver <elver@google.com>
Date: Thu, 18 Sep 2025 16:30:55 +0200
X-Gm-Features: AS18NWD0SUeFqGV9WlY2IdwTn_KEVlrUb6EWkUXQGUd586AZF2O57bI6Ojf1TCc
Message-ID: <CANpmjNN8Vx5p+0xZAjHA4s6HaGaEdMf_u1c1jiOf=ZKqYYz9Nw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Christoph Hellwig <hch@lst.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 16:15, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Sep 18, 2025 at 03:59:11PM +0200, Marco Elver wrote:
> > A Clang version that supports `-Wthread-safety-pointer` and the new
> > alias-analysis of capability pointers is required (from this version
> > onwards):
> >
> >       https://github.com/llvm/llvm-project/commit/b4c98fcbe1504841203e610c351a3227f36c92a4 [3]
>
> There's no chance to make say x86 pre-built binaries for that available?

Not officially, but I can try to build something to share if you prefer.
Or a script that automatically pulls and builds clang for you - I have
this old script I just updated to the above commit:
https://gist.github.com/melver/fe8a5fd9e43e21fab569ee24fc9c6072
Does that help?

