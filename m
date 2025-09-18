Return-Path: <linux-sparse+bounces-438-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60831B85046
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Sep 2025 16:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 300957C6E80
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Sep 2025 14:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF86A30CD9D;
	Thu, 18 Sep 2025 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJ4qRZvA"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509262BEFFE
	for <linux-sparse@vger.kernel.org>; Thu, 18 Sep 2025 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204349; cv=none; b=p/iKKkRYyX1833WLfN2HLCiZ7vMX46avcqm3PZjogFsLeMwILwfSqtx030QSdhw9WpeU1/FiufX0DtQWFfp+zRXse3SA27FQk/duXzhUCpWtLy6rfpA84ryOdLRPLmE0E2Q7G2VY8JCNa23+0Sb0DtstVU4A6mppTLxA4ArP07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204349; c=relaxed/simple;
	bh=GUCT3hVcQ4xcGERZZKRbfZAspfWfY7UoHqQT+IPHxCk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B6+lJjLJ8ygpdu98ss2LaqItqgRugcm7Wup34T7uMcxMWl7Lj/32e8+PkOFJq02bTb7GnLO0B0DzemYb2b/oBw0VtsLqAFLK7Pd4ZRY8XNQXI5V3b37MhP51lijlZp9Dc46BrbRCjdbBdgjJt7BrRFaJeWZRS5srOttT0KY7vmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJ4qRZvA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4612d068c47so6286055e9.3
        for <linux-sparse@vger.kernel.org>; Thu, 18 Sep 2025 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204346; x=1758809146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8a5df3Pjl9f6q04E+YVKjYiENmaUJ17VWF4NqYxrig=;
        b=kJ4qRZvAK20Ir6c19b7vpwwjgqpbl4AI8logzpssiKulQkG/7hU45YF9sjzqJKyFP/
         7JSpxY/fdB2Chd1pJbP5r0QPG4PgqiRA8w9MmRYNe6s0r5Eto36yZY4JMGmBXuwmjs3k
         TYkn7D1aC7+euyuJ9IbOywL8B3WLRso5J4asxKE5zs8oRgjsdoflpIzOaNg9Occ/SmGe
         scu9f+xExKujLW5m5V5TlyBHJF7DSt25PRd9yMB17ETFrSbjVeFn8s6Ck3vFWNw0ddVr
         nYAImgqyA+v8BJ0xIzXpMQi9l4geEydyt/OV4oWvuR0hTlGWlzNpB3qYukxiiHWSZSvl
         FJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204346; x=1758809146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8a5df3Pjl9f6q04E+YVKjYiENmaUJ17VWF4NqYxrig=;
        b=H4XX62K+dCJLZgGoT9AifN5tbhJMqv2EnhoS0fUOrifHK+FjIKUAySMEq4uHOvU95x
         0IKipkoh90yPNisdOQ/hJeg2QcJHFU89/RjxGnuD5FaN6zcP0hb7O3xlkwdO6L/IvwFP
         jFlDHilYdQb4FeDQvwQ57AkV+Fwx2JvKOmclTzO2uz95qlbAwMXr2WMjt8LgJ7JghHn6
         KoZy4CQq2xLf4oRRWrd/pzuNiOLyshYjY54ipiKHwmjKyYS7VJhap4ZP2fVevmZKoT2+
         lej2a4dP5YDCLsGaffvUlvGcxgXC34Je9cIE/1YG1VLeeBFjs+oUVpQGG2Zqu7nHmPzL
         Ykbg==
X-Forwarded-Encrypted: i=1; AJvYcCWISyeD64HfmoDUnu9NQwn7DtJDkeqcHCvPg0OVDjre0+vitGiikZdv+kHsAPhGUT+mkRKyRHYhlcqMDh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTaDA0NU58cyiH7A7H0yAraHFf2RnsX6DxOmtBTNhAbT8uJGRR
	lWzBEvmTBABIbbe7DPUs41qeg9nI6HfGzIuiNf/yQrui0x7usTA+u/1g3OwVdFEEYZZbxkBt0xQ
	6iw==
X-Google-Smtp-Source: AGHT+IFEiq4FEWWIzjiYKjnsdpYfxFd6yNadJ6YvqxXYjoCzs/skSdmVV05LRZuP59mbBWsmDTBBrQoRCA==
X-Received: from wmbdv20.prod.google.com ([2002:a05:600c:6214:b0:458:bdde:5c9b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:314e:b0:45d:f7e4:8969
 with SMTP id 5b1f17b1804b1-46202bf788fmr56586255e9.4.1758204345502; Thu, 18
 Sep 2025 07:05:45 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:18 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-8-elver@google.com>
Subject: [PATCH v3 07/35] lockdep: Annotate lockdep assertions for capability analysis
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

Clang's capability analysis can be made aware of functions that assert
that capabilities/locks are held.

Presence of these annotations causes the analysis to assume the
capability is held after calls to the annotated function, and avoid
false positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* __assert -> __assume rename
---
 include/linux/lockdep.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 67964dc4db95..11b3d22555ff 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
 #define lockdep_assert_held(l)		\
-	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+	do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_cap(l); } while (0)
 
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
 #define lockdep_assert_held_write(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 0))
+	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_cap(l); } while (0)
 
 #define lockdep_assert_held_read(l)	\
-	lockdep_assert(lockdep_is_held_type(l, 1))
+	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_cap(l); } while (0)
 
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
@@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
 
-#define lockdep_assert_held(l)			do { (void)(l); } while (0)
+#define lockdep_assert_held(l)			__assume_cap(l)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_write(l)		__assume_cap(l)
+#define lockdep_assert_held_read(l)		__assume_shared_cap(l)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
 
-- 
2.51.0.384.g4c02a37b29-goog


