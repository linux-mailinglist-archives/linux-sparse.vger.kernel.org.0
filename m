Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290518AA0D
	for <lists+linux-sparse@lfdr.de>; Mon, 12 Aug 2019 23:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfHLVxN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 12 Aug 2019 17:53:13 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:54145 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbfHLVxH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 12 Aug 2019 17:53:07 -0400
Received: by mail-pf1-f202.google.com with SMTP id 191so67074580pfy.20
        for <linux-sparse@vger.kernel.org>; Mon, 12 Aug 2019 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=mebfbjlkEdZmmfTa81qyikO5W5onC7JtmBJnlT+apBs=;
        b=F7+jqw49SQZDkzeeWOAGmc6Lc1h+SEKaJh0xlc/LAxLKe2v+de+46qMQvwT+4BkWvs
         f8AKwNOC2CnnRVjmawfvPbXbdhxoRH91LyrcooNmXAxHmZ/SSIiRp7NP7qehBJkD9Olp
         Ggic8vteYilEaiqd7MDETwi5wJ0mukkru6pKC350sgRkfmYpmA1Uf6c4JGCBq+4KCoFj
         Zcd1QsAZD6fs0YID/HD9qvUSEmxUnQVeQOHFtt9VRuQrg3TjVMVYz9ZZaP6BYPbc4TbJ
         UrL5f27WPHBtcOEV1KHCFIthMyxdDU2shC6ubPAwjtByDHIVqz1vzmt1fTLro53yIjGq
         fxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mebfbjlkEdZmmfTa81qyikO5W5onC7JtmBJnlT+apBs=;
        b=Gs+5cja5ke9xMwQHw6j2LUjGjpDDmRNtxCj3Zkt7J00pj7sKpr1eAkT0O40leMryAc
         bZkCbv6jOlyyM2zaVa2bbJxJXWydf/AwBAc07FwY0KXYYgjkarHOKGfwG7wHqUULF6m/
         g0CoFqAn5Zk7hRe6cE0vAOqBrCDgoilRrrKNVBrtRstvHnd5SQIL1Otpjlf9s+/Vg3B8
         rVkqgUoRIlCOpLQtGt+p8uUVzPBYEuTGjhutyVP9Z937Ya38afS86m3MPpE0QXoalAcj
         PW3vz7poWfmmTzyWaLr5RFaPy4SXVeMxEgKCuQJPSXN93AJhJeJACgjN9S4cqO7xtR2T
         NyIA==
X-Gm-Message-State: APjAAAV70YwsJJFbtLkZViWCT1ir9oPHE505awAw3G37zZ8VK9hYJeGc
        j3Io7W3TcQURBR30EaYrUjTbWrAs682VRlzIqD8=
X-Google-Smtp-Source: APXvYqzq0U1hjY8eWG6GSRKegcIlvhtHVnc6vSGEgTKw2aQOoeh9n5S0ZRoCoSIobu8VYEPAe+LSTHysytF0nT5E2UM=
X-Received: by 2002:a63:4461:: with SMTP id t33mr31217445pgk.124.1565646786608;
 Mon, 12 Aug 2019 14:53:06 -0700 (PDT)
Date:   Mon, 12 Aug 2019 14:50:48 -0700
In-Reply-To: <20190812215052.71840-1-ndesaulniers@google.com>
Message-Id: <20190812215052.71840-15-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190812215052.71840-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH 15/16] include/linux/compiler.h: remove unused KENTRY macro
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     akpm@linux-foundation.org
Cc:     sedat.dilek@gmail.com, jpoimboe@redhat.com, yhs@fb.com,
        miguel.ojeda.sandonis@gmail.com,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, linux-sparse@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This macro is not used throughout the kernel. Delete it rather than
update the __section to be a fully spelled out
__attribute__((__section__())) to avoid
https://bugs.llvm.org/show_bug.cgi?id=42950.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/compiler.h | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 5e88e7e33abe..f01c1e527f85 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -136,29 +136,6 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 } while (0)
 #endif
 
-/*
- * KENTRY - kernel entry point
- * This can be used to annotate symbols (functions or data) that are used
- * without their linker symbol being referenced explicitly. For example,
- * interrupt vector handlers, or functions in the kernel image that are found
- * programatically.
- *
- * Not required for symbols exported with EXPORT_SYMBOL, or initcalls. Those
- * are handled in their own way (with KEEP() in linker scripts).
- *
- * KENTRY can be avoided if the symbols in question are marked as KEEP() in the
- * linker script. For example an architecture could KEEP() its entire
- * boot/exception vector code rather than annotate each function and data.
- */
-#ifndef KENTRY
-# define KENTRY(sym)						\
-	extern typeof(sym) sym;					\
-	static const unsigned long __kentry_##sym		\
-	__used							\
-	__section("___kentry" "+" #sym )			\
-	= (unsigned long)&sym;
-#endif
-
 #ifndef RELOC_HIDE
 # define RELOC_HIDE(ptr, off)					\
   ({ unsigned long __ptr;					\
-- 
2.23.0.rc1.153.gdeed80330f-goog

