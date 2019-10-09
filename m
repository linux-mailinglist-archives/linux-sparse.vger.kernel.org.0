Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88810D1AF6
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 23:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732140AbfJIVa2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 9 Oct 2019 17:30:28 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33077 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729908AbfJIVa1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 9 Oct 2019 17:30:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id c4so3518420edl.0
        for <linux-sparse@vger.kernel.org>; Wed, 09 Oct 2019 14:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/1AsREliZzC2YOyCedq/FfC7C5LI00d3BvKBNM7QbKg=;
        b=WA7JD8oq6XO3Y5xy96g+Zha94UUu8kgMp+dUafpcZUeux2gKac5MXIcCS63P9x7v+/
         Dc44r17WNALqycoNw5IF6O0nVlkCMldifjMjwnG0U7+P97e5RuALtxochpoMYh58ljEv
         PCtgQc3EMh2cz6hypFdUQ4aV0UaR3PWCXiW0maX8ZEy0/Fxv9K2ssRi5G1lTh1NFg3E3
         bhuaFcziKJrYtFxzkzEynMXDovUHNL7ifQGcFi81ftrnkyXt7XFr6ncWMhI+I6d5Yo2u
         eS7w1+Lj0HqN0jPoawpV5XsZF9CiuVQRCiLDug9Iylpva776nzqIgepGZJuDkh03BvCS
         Hj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/1AsREliZzC2YOyCedq/FfC7C5LI00d3BvKBNM7QbKg=;
        b=XY+ybUihGOfiC+5185x5RKvZq3136uf88TOagrwCTg37YtBpPlnECHtXWWZFNZtmEA
         kXOmlRfFt04smYy+4WEN1u1RbvH8Y/If6W7zjMfVMHieE0LSg6E9N0kah4oWVmjZ9StY
         P1URS8db4DypLFBq861PKqBUXO4OlxFpwywjYX6Ku7QkEKVMAgkZExYIDLXBdE4zMgrw
         8uYZ04HAFp91s6tlCWXxY5fcEdqul5GeNE65TFOdjyosbywUqty5kxaJDsQLt8798h21
         C7naew+WqEBuNdr5QjMO7ULM0YcTai0jQ8sAItXIoJPHimXJi5L9mFkt4DSOFOHW4GMN
         vWQw==
X-Gm-Message-State: APjAAAVYvhW/cs6anf1kBcGkIO9X1hxTHWD39N1zdp1Noxja5f3yIL8E
        +dmHE2fBRL7z1kNPN1kFv45XMDZD
X-Google-Smtp-Source: APXvYqxh37ir4Kgzu1oFa/83Mk8awZycH5OVgUdVxQYKTNIPk+P4yZrvr6Djc4QRyiuFmQqiAHuymA==
X-Received: by 2002:aa7:cb5a:: with SMTP id w26mr5077526edt.188.1570656625697;
        Wed, 09 Oct 2019 14:30:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:3805:fa49:4ff6:d576])
        by smtp.gmail.com with ESMTPSA id m1sm541017edq.83.2019.10.09.14.30.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 14:30:24 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Vegard Nossum <vegard.nossum@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2] "graph" segfaults on top-level asm
Date:   Wed,  9 Oct 2019 23:30:13 +0200
Message-Id: <20191009213013.80431-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009191736.40421-1-luc.vanoostenryck@gmail.com>
References: <20191009191736.40421-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The "graph" binary segfaults on this input:
	asm("");
with gdb saying (edited for clarity):
	Program received signal SIGSEGV, Segmentation fault.
		in graph_ep (ep=0x7ffff7f62010) at graph.c:52
	(gdb) p ep->entry
	$1 = (struct instruction *) 0x0

Sadly, the commit that introduced this crash:
	15fa4d60e ("topasm: top-level asm is special")
was (part of a bigger series) meant to fix crashes because
of such toplevel asm statements.

Toplevel ASM statements are quite abnormal:
* they are toplevel but anonymous symbols
* they should be limited to basic ASM syntax but are not
* they are given the type SYM_FN but are not functions
* there is nothing to evaluate or expand about it.
These cause quite a few problems including crashes, even
before the above commit.

So, before handling them more correctly and instead of
adding a bunch of special cases here and there, temporarily
take the more radical approach of stopping to add them to
the list of toplevel symbols.

Fixes: 15fa4d60ebba3025495bb34f0718764336d3dfe0
Reported-by: Vegard Nossum <vegard.nossum@gmail.com>
Analyzed-by: Vegard Nossum <vegard.nossum@gmail.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                          | 2 +-
 validation/linear/asm-toplevel.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/parse.c b/parse.c
index ac795bd75..48a63f22f 100644
--- a/parse.c
+++ b/parse.c
@@ -2890,7 +2890,7 @@ static struct token *toplevel_asm_declaration(struct token *token, struct symbol
 
 	token = parse_asm_statement(token, stmt);
 
-	add_symbol(list, anon);
+	// FIXME: add_symbol(list, anon);
 	return token;
 }
 
diff --git a/validation/linear/asm-toplevel.c b/validation/linear/asm-toplevel.c
index 8bdd7fc12..bd3b58a6d 100644
--- a/validation/linear/asm-toplevel.c
+++ b/validation/linear/asm-toplevel.c
@@ -2,6 +2,7 @@ __asm__("/* nothing */");
 /*
  * check-name: asm-toplevel.c
  * check-command: test-linearize $file
+ * check-known-to-fail
  * check-output-ignore
  * check-output-contains: asm *".. nothing .."
  */
-- 
2.23.0

