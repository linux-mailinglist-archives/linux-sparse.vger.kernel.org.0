Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D2323DB6
	for <lists+linux-sparse@lfdr.de>; Mon, 20 May 2019 18:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388045AbfETQmY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 May 2019 12:42:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45314 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731488AbfETQmX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 May 2019 12:42:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id s11so7479553pfm.12
        for <linux-sparse@vger.kernel.org>; Mon, 20 May 2019 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=EyM1p9SMRJqgm5AK4cz8Zy6vCQOtwWiv08gkPBYWTbk=;
        b=rQEzvewPS1tOGvqtzDGpPVxSHK7IYMIJs2zz+BAB0A90DYIUDpHOf5+vk7uDggjruJ
         uoMmOMNxGs2dgsAbS1R7p+QZeXvPrSAB+BoatLrkndWlIcF5O/URli9a5f7d9l5u+7Jw
         lJXWiFxmQkIpIlbgfCvRYhCJgfW8jLMt/KQkambAh0ZonZOWD+IWE7P+HUNCjSjm2u+v
         hBEY157JlXjSJVNPMlJN00Slmjolt0NO4zzmfZ4PvppNuiCkqh71v7DTaalO+f00S9/a
         ZhuzfjUa0YzPsKr81msU1ANTxlCLI+Q0iVOoF9CupnpfZAnCm70lcdurO1qdVvl0wHVA
         BZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=EyM1p9SMRJqgm5AK4cz8Zy6vCQOtwWiv08gkPBYWTbk=;
        b=e0hQA4Bif3GpP5t9HBeKHBpiUUHsO7Ec9vg7PSihxOO9aUMe8Cfxh7a/JtGmCvtPwd
         U8lIiDwO3uO0qjz1WGqwJ1FsXWY5+yPWIA60RFtd0z3m+rQJcJQEgJHYguzNva2G1OdE
         70kWNXOi4P7y+3NCBzNK7BYYTSsHgmEJSBf873SAAkN97wVg0uwjdBqCCZsutYpOnJzr
         QGJwjTyrhgoW3OFd6SmcsePYrpU7suXWYeyqw8re0yGTNdEPJXIABSk3+EAkBrJXiF/D
         +fJqANAFhJQeF7AIJSDWePcowKznr4MRHJKlHzDcCBhCY0m/SLkoMpf+FZLAJ2jkgDaw
         EuDw==
X-Gm-Message-State: APjAAAVTVFIKWD2XxNTAIY1ugBNlYzTWVYVQIdU1Pd4l4tH5P/THDduX
        kiznT1FKHl6eykBlj4BPfLJf3cVQ
X-Google-Smtp-Source: APXvYqwEaBLemOoi+TJUdiyM5lSQL6+7eI0RXRz6NeWGXnwJ3H8PqI1JHbeUxZX42g4qalHgUU8ehA==
X-Received: by 2002:a62:2805:: with SMTP id o5mr81094479pfo.256.1558370541788;
        Mon, 20 May 2019 09:42:21 -0700 (PDT)
Received: from himanshu-Vostro-3559 ([103.83.145.27])
        by smtp.gmail.com with ESMTPSA id g19sm46673891pgj.75.2019.05.20.09.42.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 09:42:21 -0700 (PDT)
Date:   Mon, 20 May 2019 22:12:14 +0530
From:   Himanshu Jha <himanshujha199640@gmail.com>
To:     linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Sparse context checking Vs Clang Thread Safety analysis
Message-ID: <20190520164214.GA14656@himanshu-Vostro-3559>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hello all,


I'm an undergrad student working on Google Summer of Code'19 Project[1]
to apply clang thread safety analysis feature on linux kernel to find bugs
related to concurrency/race condtions with Lukas & clangbuiltlinux
community.

Since sparse has similar context checking feature, I started
investigating by looking the source and some other resources such as
LWN[2] about the internals.

`-Wcontext` is my prime focus for now and currently we have:

himanshu@himanshu-Vostro-3559:~/linux-next$ make C=2 CF="-Wcontext" 2>&1 >/dev/null | grep -w 'context' | wc -l
772

o Why do we have so many open warnings for context imbalance ? Or
  Why did we stop at some point annotating the codebase ?

I tried to play around with a simple C program:

-------------------------------------------------
himanshu@himanshu-Vostro-3559:~/sparse$ cat sparse_context_check.c
# define __acquires(x)  __attribute__((context(x,0,1)))
# define __releases(x)  __attribute__((context(x,1,0)))

# define __acquire(x)   __context__(x,1)
# define __release(x)   __context__(x,-1)

static int lock1, lock2;

static void lockfn (int i) __acquires(lock1) {
	__acquire(lock1);
	i++;
}

static void unlockfn (int i) __releases(lock1) {
	__release(lock1);
	i--;
}

static void unlockfn2 (int i) __releases(lock2) {
	__release(lock2);
	i--;
}

static void bad_difflocks (int j) {
	lockfn(j);
	unlockfn2(j);
}

static void bad_onlyunlock (void) {
	int check = 0;
	unlockfn(check);
}

static void bad_onlylock (void) {
	int check = 0;
	lockfn(check);
}
-------------------------------------------------

Results:
-------------------------------------------------
himanshu@himanshu-Vostro-3559:~/sparse$ sparse sparse_context_check.c 
sparse_context_check.c:29:13: warning: context imbalance in 'bad_onlyunlock' - unexpected unlock
sparse_context_check.c:34:13: warning: context imbalance in 'bad_onlylock' - wrong count at exit

o Does sparse stores some sort of context counter since we didn't get
any warnings for `bad_difflocks` which locks 'lock1' and unlocks 'lock2'
?

+1 for any lock, -1 for any lock => fails to distinguish two different
locks.

himanshu@himanshu-Vostro-3559:~/sparse$ ./test-linearize sparse_context_check.c

<snip>

bad_difflocks:
.L6:
	<entry-point>
	call        lockfn, %arg1
	context     1
	call        unlockfn2, %arg1
	context     -1
	ret

</snip>

In case anyone is interested in clang's ast-dump:
https://gist.github.com/himanshujha199640/ed8359b78b9e6e0ca00ef871e0d77a0c

o What exactly the usage of `__acquire/__release` ?
I have used it to shut up the warning for lockfn & unlockfn above.

o How exactly is `context` defined in sparse codebase which is
understood by the compiler when using __attribute__((context(lock1,1,0)))
on functions ?

According to man sparse:

-Wcontext
  Warn about potential errors in synchronization or other delimited contexts.

 Sparse  supports several means of designating functions or statements that delimit contexts, such as synchronization.
 Functions with the extended attribute __attribute__((context(expression,in_context,out_context)) require the  context
 expression  (for  instance,  a  lock)  to have the value in_context (a constant nonnegative integer) when called, and
 return with the value out_context (a constant nonnegative integer).  For APIs defined via macros, use  the  statement
 form __context__(expression,in_value,out_value) in the body of the macro.

 With  -Wcontext  Sparse  will  warn when it sees a function change the context without indicating this with a context
 attribute, either by decreasing a context below zero (such as by releasing a lock without acquiring it), or returning
 with  a  changed  context  (such as by acquiring a lock without releasing it).  Sparse will also warn about blocks of
 code which may potentially execute with different contexts.

 Sparse issues these warnings by default.  To turn them off, use -Wno-context.
---------

My understanding is that lock1 in `bad_onlyunlock()` should have a 
total zero lock counter sum at the end of codeblock.

So, as when `unlockfn(check);` is called we have:
 * lock1 with 0 initial value(from previous `bad_difflocks()`)
 * returns with 1 final value.

Proceeding to next function `bad_onlylock()` and reaching
`lockfn(check)` we have:

 * according to semantics of `acquires` we should have a intial 0 
 value for lock1 but we have 1 value from above `bad_onlyunlock()`

leading to context imbalance and thus the warning.

Please let me know if I'm wrong somewhere.

So, clang thread safety analysis[3] follows a different mechanism
to overcome what we have observed above.

I did small analysis on a C program[4] and a device driver[5].

Clang analysis has many annotations available to suitable annotate the
codebase which can be found in the documentation[3].

Quite surprisingly, Philipp proposed[6] `__protected_by` feature which is
very similar to `guarded_by`[7] feature implemented in Clang.

Similarly, Johannes proposed[8] the same with a different implementation.

Questions from both you:

o Why was it not deployed in sparse ?

o Does the lock protecting the data should be a global variable ?

ie.,

struct foo {
	struct mutex lock;
	int balance __protected_by(lock);
}

Can this be done ? Or lock should be global ?

Because clang analysis wants it to be global!

There are other attribute restrictions as well for clang analysis:
https://github.com/llvm-mirror/clang/blob/master/test/Sema/attr-capabilities.c


*Most Important*
Could you please point me some critical data examples that you know in
the kernel source which should be protected. This would help us a lot!

I'm familiar with IIO subsystem but couldn't find any solid example to
try other than the tmp007.c driver I tried[5]. Annotating device driver
is not the best example and we require other high priority critical
data. We discussed about this before and conclusion is same as
"annotating if branches with likely()/unlikely() in a device driver"

We are reporting here:
https://github.com/ClangBuiltLinux/thread-safety-analysis

and for now analysing the tools available for detecting concurrency
problems.

Currently there are ~300 warnings with clang thread safety analysis
in defconfig.

There is no visible C codebase that has implemneted this feature where
we could refer, therefore it is more of an expermenta.

Lastly, this project is under the umbrella of recently announced project
by Linux Foundation called "Enabling Linux In Safety
Applications(ELISA)".


Any feedback is highly appreciated!

[1] https://summerofcode.withgoogle.com/projects/#5358212549705728
[2] https://lwn.net/Articles/689907/
[3] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
[4] https://gist.github.com/himanshujha199640/efac981a31b0a2317f8c0c61a9803447
[5] https://gist.github.com/himanshujha199640/1154f65b2762a943fdcd7b375a7d0954
[6] https://marc.info/?l=linux-sparse&m=120696665813430&w=2
[7] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#guarded-by-c-and-pt-guarded-by-c
[8] https://marc.info/?l=linux-sparse&m=120895542318572&w=2

Thanks!
-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology
