Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB131D17F3
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 21:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbfJITFm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 9 Oct 2019 15:05:42 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38055 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJITFl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 9 Oct 2019 15:05:41 -0400
Received: by mail-ed1-f68.google.com with SMTP id l21so3093823edr.5
        for <linux-sparse@vger.kernel.org>; Wed, 09 Oct 2019 12:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Bqtp6ojA0G6R/rRRoNWw9q2ijwXczXGi6XQucqjRguI=;
        b=nJd+1Wi+evgX887PG3Ay6y5WHhG7ywlDvqBVIMtSDfXS3xP+U8zORUxEz78fL48riq
         TnWbrGXVpA2BZOpNXLiOaat6k45AxvoO4aNG5wAjCW5b81lj9yRDhM+ifK4tTPD0zDy/
         n0bjSXE/8iVJrOfz5lcYkeBgnfnEm0Ph/SEW7aRN/R9Ol2UrnWBQqF+jtxCblhxeCuSe
         DD2b/I4JNU51fUbZtCM77a7lcOW6lW4E2eHO/RCpJRpvlvWpCtY6h6RrRPS4wJjSJcEo
         /viTCfaGmGEqzGRMN+LvcbGRjltv4Sg8urz5adqpxehh+PCsXuz4lrNeGAYqLqRtUh0P
         75gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bqtp6ojA0G6R/rRRoNWw9q2ijwXczXGi6XQucqjRguI=;
        b=emDkAUbn7+X6RBCAJ/x9mNKMMMPZdZFEIsLfSS/WdQhUA0RZKfBEccWJCCGyAqDFeC
         cQEOEExG+HCSk0ktXFEaEd6iEwLuOIWdRXQb8MWHhV1VcygjY5UE1ePpdXd/Ft2JotXf
         JBcDFxBQqXMLj/UKWzTMIkvoGC+7N7RhUKdAMQBIw9lT3uf6Xh6iUxjOWCyO4frRmn4U
         /D9Uk+zC5sqCmTrWIUgKREIcw36JGeiptudglPtembJjoQ3VMN9/J/HTWvGYoGBp+CRm
         UM5InUaECZgUkFHkRvKLrXMMdUljMur//Xz77jlISrtrrj+O4KdrhlG0FAcfjaZUI0yB
         9Tsg==
X-Gm-Message-State: APjAAAU49MQjVepfaVhh9TEYR8dogIWvmi/5CSH+lpcX17WAW6YJYGzx
        iYFF0WkVoZtYJCAS5ALhv9qpv5SL
X-Google-Smtp-Source: APXvYqxnxnF+hwECr7jJnk0yLkV32J5Sa5Ewtd86rS9+OdGYBNsQwJuXoRxFU2JhuHIAJNKEf0YJ9g==
X-Received: by 2002:a17:906:6dd3:: with SMTP id j19mr4242872ejt.144.1570647938550;
        Wed, 09 Oct 2019 12:05:38 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:e57a:fd21:8a5f:3932])
        by smtp.gmail.com with ESMTPSA id x4sm488315eds.87.2019.10.09.12.05.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 12:05:37 -0700 (PDT)
Date:   Wed, 9 Oct 2019 21:05:35 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Sparse v0.6.1-rc2 is now out.
Message-ID: <20191009190533.yk7ilfktslf5o2cx@ltop.local>
References: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
 <e07a51e8-dc18-5074-3832-8a1f33ec7085@ramsayjones.plus.com>
 <4f29a2d7-de83-5b6b-ce14-1ed880b6fe12@ramsayjones.plus.com>
 <20191009112226.f6vgymntddcz7mgq@ltop.local>
 <64c4ca41-79f9-4182-1e07-1efe68063d07@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64c4ca41-79f9-4182-1e07-1efe68063d07@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 09, 2019 at 05:56:18PM +0100, Ramsay Jones wrote:
> On 09/10/2019 12:22, Luc Van Oostenryck wrote:
> > Before the release, I would like to add the patch for the problem
> > you had with Cygwin. Would you be fine with the:
> > 	LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=$(llvm-config --host-target)"
> > we had discussed before, with a note saying it's needed for recent
> > cygwin64 but may be inadequate for cygwin32?
> 
> Ha, yes, I should have mentioned that, on cygwin, I actually
> tested:
> 
>  $ sparse --version
>  v0.6.1-rc2-dirty
>  $ 
> 
> ... where the 'dirty' was:
> 
>  $ git diff
>  diff --git a/sparsec b/sparsec
>  index bafe2da..8a056e7 100755
>  --- a/sparsec
>  +++ b/sparsec
>  @@ -39,6 +39,7 @@ case "$(uname -s)" in
>   *CYGWIN*)
>          # cygwin uses the sjlj (setjmp-longjmp) exception model
>          LLC_ARCH_OPTS="-exception-model=sjlj"
>  +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=x86_64-unknown-windows-cygnus"
>          ;;
>   *)
>          ;;
>  $ 
> 
> Given that:
> 
>  $ llvm-config --host-target
>  x86_64-unknown-windows-cygnus
>  $ 
> 
> ... the above should be just fine. (Do you want me to send
> a tested patch?).

No, thank you, it's not needed, I consider it as tested :)
I'll send the patch later.
 
> Note that I have been messing around with 'sparsec' and, in
> particular the invocation of llc, which can also output the
> object file directly. ie there is no need to generate assembler
> output and then assemble with the platform assembler. (which
> allows us to sidestep the incorrect assembler directives used
> for the wineh exception model!).
> 
> However, 'sparsec' seems to have several problems (not just
> on cygwin). For example, on Linux, we see:
> 
>  $ ./sparsec -o hello hello.c
>  /usr/bin/ld: /tmp/tmp.F57wOC: relocation R_X86_64_32 against `.rodata' can not be used when making a PIE object; recompile with -fPIC
>  /usr/bin/ld: final link failed: Nonrepresentable section on output
>  collect2: error: ld returned 1 exit status
>  $ 

Yes, I'm aware of this. As far as I understand it, this is because
sparse-llvm.c doesn't yet correctly handle literal strings (and, in
general, top-level objects). If you try instead something like:
	#include <stdio.h>
	int main(int argc, char *argv[])
	{
		puts(argv[1]);
		return 0;
	}

then sparsec produces a functioning executable. It should also work
if you use simple global variables.

> whereas, on cygwin:
> 
>  $ ./sparsec -o hello hello.c
>  $ ./hello.exe 
>  hello world
>  $ 
> 
> ... which was somewhat surprising! ;-)

That is indeed very surprising.

> Note that the testsuite is happy if 'sparcec' produces an
> object file without error - it never tests the creation of
> an executable (let alone that it actually runs and produces
> correct output).
> 
> So, I don't know if we want to bust a gut to fix this up.

Yes ... Saying that sparse-llvm is not much used would not be
an overstatement. Having a good, multi-arch support for it
would need more time that I can afford and willing to spend on.
OTOH, it's not very far from being functional.

Cheers,
-- Luc
