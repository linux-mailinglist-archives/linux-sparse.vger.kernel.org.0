Return-Path: <linux-sparse+bounces-456-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6559B85200
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Sep 2025 16:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A643178A24
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Sep 2025 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AE431815D;
	Thu, 18 Sep 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rA0CgK/n"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B0C3176E6
	for <linux-sparse@vger.kernel.org>; Thu, 18 Sep 2025 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204399; cv=none; b=BsE1WCH2T/E1kLcuRUMJGr55c6kctWwqCESRT0BP7pU5xX2r1g3X2cvemBPpoG0xxdPsOftSEM/K20G1lwcEnuuu81iqU5fFgM6aXRIwoDt9L8pyATsTvdtvuqi4npqoJ5+hvlQnlBg5YUuxw21DwiUSj1r27TH7hdq0wwQAcew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204399; c=relaxed/simple;
	bh=zoLiY2UcfrfuFf9/eJmfFwA3ddXeQm8aQATv6UNlqMA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ab8y16GQTPtJYJ5cfOwJJf/d0xTEhXOCnCYzCF9N0rCdhA+LmpiB84nKAvVVlZIEKQQV2ivfaHIm1i/XFq73CcBXgSE0Or/NCkXSrM+5pcBpzaCO7OfZqYC25y61sbXlXfSV5AIMaOJXfMCeEubeYw/EWKci3P5/xMl98Iqe7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rA0CgK/n; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ee10a24246so556923f8f.3
        for <linux-sparse@vger.kernel.org>; Thu, 18 Sep 2025 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204395; x=1758809195; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgYM57a4+YilIGK6iKKshTwAf6EJSKpu76VpXrklnPU=;
        b=rA0CgK/nBD9BDdq9rID1XB8wPBhqUxDoK8e6TleJp4eoRuC+t26XqkM+Lphzpje/SH
         nHsQFK48n9rmW1qb6dk9H0c2U0HDfz+6QXln6nUoWy4w35IMk8bs3wfwB/Gb2DMF2RDW
         zi7hLDQ8KcTkzJKAnOQ9NPMCbJquIOwHucCkX6JH6bG/MVJFC7jY1ZepnH7jTlTbsohM
         Fd4kGBHkUnfjEdHzHrNszPPjCPy5Q0MT5JkVAEVv+ZOdUZ+qH97XECiIc15WNvBBd6Z0
         0KzzD+bly1UZxwZPL7MlxGoIX62G+9iXWmVoZYE2+x9hafmtUct6nkVV5p9FRfoevbTS
         0PZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204395; x=1758809195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgYM57a4+YilIGK6iKKshTwAf6EJSKpu76VpXrklnPU=;
        b=XQbbDevasF2lVUrSJa93S+HaAmEfeima4UPO4aad4Z3KxftqDfUn8d740eLhRW8i8w
         szrMtbeGeoouM5nRsWorI8eNlJq15GmpIrxLZfI8tQIzQhlzrNF3VWDRjYRUujn7dAgq
         wJW2ebeLjTHn1X02CNNIKuQJH7fOSbcJ3myrQi1yXsso/Y0qy8WQSM7lUgZjHLkcVCiR
         axhb80bu1fMfsY71FI+uekivqpmr7BiHQAVKTkSl20t/1BliD0yuZxgPMsv+JOOw7a/I
         OS9jfW7Zb3OOZ7Bz82LWQ6HvVuzEgdlM9tjolxXPIDHG5tXak1h4OQ0HEMyKyVjHP5E0
         zK7g==
X-Forwarded-Encrypted: i=1; AJvYcCX3eKYJ+kluuZynwjdPVJA/SvEey3fG51h5cF3cOtUgaztYsgQIlCUjtch+WDW9JbulhnF4dJdTW7MxA2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvecHCdd6gUlFATJYVqVQe6UzaUuu8Qnoa0nZ6gCfEmBCwjTA8
	g4iGUkYgKCswDCBh2C5Pz3p1FZwSUgUkRM/MMrRunB7WRtrmfvqaAvIct73eZdUhP7yBIkeFjvc
	6Mw==
X-Google-Smtp-Source: AGHT+IGyq2ix4kSVUhNc102rzu/+pi5sWigmai5zeC1C+WvM8GfTqI/Oxr6AI/FM5MqgBjTC/NiJq7z9XA==
X-Received: from wrbbs6.prod.google.com ([2002:a05:6000:706:b0:3ed:665b:ec9d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:adf:ce0c:0:b0:3ee:10b1:17bb
 with SMTP id ffacd0b85a97d-3ee10b11893mr1782304f8f.61.1758204394951; Thu, 18
 Sep 2025 07:06:34 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:36 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-26-elver@google.com>
Subject: [PATCH v3 25/35] compiler: Let data_race() imply disabled capability analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
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
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Many patterns that involve data-racy accesses often deliberately ignore
normal synchronization rules to avoid taking a lock.

If we have a lock-guarded variable on which we do a lock-less data-racy
access, rather than having to write capability_unsafe(data_race(..)),
simply make the data_race(..) macro imply capability-unsafety. The
data_race() macro already denotes the intent that something subtly
unsafe is about to happen, so it should be clear enough as-is.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* New patch.
---
 include/linux/compiler.h       | 2 ++
 lib/test_capability-analysis.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 64ff73c533e5..eee60adb3645 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -186,7 +186,9 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define data_race(expr)							\
 ({									\
 	__kcsan_disable_current();					\
+	disable_capability_analysis();					\
 	__auto_type __v = (expr);					\
+	enable_capability_analysis();					\
 	__kcsan_enable_current();					\
 	__v;								\
 })
diff --git a/lib/test_capability-analysis.c b/lib/test_capability-analysis.c
index 12fd9716f0a4..513ad28ed06c 100644
--- a/lib/test_capability-analysis.c
+++ b/lib/test_capability-analysis.c
@@ -92,6 +92,8 @@ static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data
 {
 	unsigned long flags;
 
+	data_race(d->counter++); /* no warning */
+
 	if (raw_spin_trylock_irq(&d->lock)) {
 		d->counter++;
 		raw_spin_unlock_irq(&d->lock);
-- 
2.51.0.384.g4c02a37b29-goog


