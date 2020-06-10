Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E9B1F5D97
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 23:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgFJVMh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 17:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgFJVMh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 17:12:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC20AC03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 14:12:35 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id o15so4160123ejm.12
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u6Ruz5U+2xNCTbTz3NlDCkf3QYqxzxebBDShs5EbuoA=;
        b=WPAb0oPnYRpTRQHRkl6qwrDjJgP2dC+NiF9eICJYC576HSh4FqmrD8KZrYlfjuBCM0
         FHH9xrILqmEBZzlOJVypuIHKXzcOBLxLK1Q59Zc/zqoRr9u/xrqmJnxKUZv+ctszRLVF
         BMtYubbx9u6+uUrFeHDKfxJU3TcwT+HVskjNoeBrnKXYa8XcZxx7brt1AT6Qpxfgkoyz
         3RG3eSjp8mOtVQj2c6uwdtcMgYLaz8R1E+wH+Qw6tMR2wzmbZ0lGPA2nd4BeOmUsTRFC
         psZRF7igfU450Tnf3znG6qrzqoDL2VneN0ka7/5IpmBY1j84mGpmTcCEd5e4HtXtVuHM
         s6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u6Ruz5U+2xNCTbTz3NlDCkf3QYqxzxebBDShs5EbuoA=;
        b=FrglmwSgXvuqY3vttBZJVwAnW0evaPAGFX9jGtnK0bMWYDufwZcaVNtFIjNJXWGbhP
         SVFJHWUAiuzl7kpLptll4l41CFAqTIiFTITNRxN+lKRxRJwwqgoo19/7rnhfTtR3emrX
         6k7Fds5wMpZ7V8/RF5xbrvwFi6RHrcHlnbY2dOmjj6mMK5/0UfN2//vTCA2NIkz+qFLH
         ldVnKI2YiXRhyP2JTYdf3IOzT4zrFmTrw+Ctw8QKWmDNwlo4naryyWCJyqKt6CBKeW2C
         ywD3fFBKCTqH8XQsdArNmq/9m3kKHlkwlZHVRqkJYDVtgHEehN5mZ/dOgoyJkBiQs2Fw
         5oPw==
X-Gm-Message-State: AOAM533seuE6uCBQj1O0Vvr1DWO7gWguZ97TobPNrPHmkoCYGxgO7lDL
        lYq7fVkfDb6kEByjcy4Hi8HvmL6/
X-Google-Smtp-Source: ABdhPJwpi/LG7YHpt1QiZThhkj/b6dOdriAvV+6mCeU+/WL5x5dHkvU7qY/1SYBUz1+bkeRcHnXVCA==
X-Received: by 2002:a17:906:9a02:: with SMTP id ai2mr5097887ejc.97.1591823553904;
        Wed, 10 Jun 2020 14:12:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id gj10sm632511ejb.61.2020.06.10.14.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 14:12:32 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: add some doc for the type system
Date:   Wed, 10 Jun 2020 23:12:29 +0200
Message-Id: <20200610211229.85663-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse's type system, or more exactly the way types are encoded
in Sparse's data structures, is not hard but is also not exactly
immediate to grok.

Here is a modest attempt to document this.

The corresponding generated documentation can be find at:
	https://sparse-doc.readthedocs.io/en/doc-type/types.html
like all internal documentation.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/index.rst |   1 +
 Documentation/types.md  | 139 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/types.md

diff --git a/Documentation/index.rst b/Documentation/index.rst
index f8ca0dcee23c..9f907c9f7aae 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -23,6 +23,7 @@ Developer documentation
    api
    IR
    doc-guide
+   types
 
 How to contribute
 -----------------
diff --git a/Documentation/types.md b/Documentation/types.md
new file mode 100644
index 000000000000..044b0463ee78
--- /dev/null
+++ b/Documentation/types.md
@@ -0,0 +1,139 @@
+Sparse's Type System
+====================
+
+struct symbol is used to represent symbols & types but
+most parts pertaining to the type are in the field 'ctype':
+   ```
+	struct ctype {
+		unsigned long modifiers; // only 32-bit on 32-bit machine!
+		unsigned long alignement;
+		struct context_list *contexts;
+		struct indent *as;
+		struct symbol *base_type;
+	};
+   ```
+
+Some bits, also related to the type, are in struct symbol itself:
+* type
+* size_bits
+* rank
+* variadic
+* string
+* designated_init
+* forced_arg
+* accessed
+* transparent_union
+
+
+SYM_BASETYPE
+------------
+Used by integer, floating-point, void, 'type', 'incomplete' & bad types.
+
+For integer types:
+* .ctype.base_type points to &int_ctype, the generic/abstract integer type
+* .ctype.modifiers has MOD_CHAR/LONG/SIGNED/... set accordingly
+
+For floating-point types:
+* .ctype.base_type points to &fp_ctype, the generic/abstract float type
+* .ctype.modifiers has MOD_LONG/LONGLONG set accordingly (but
+  MOD_LONG is for double & MOD_LONGLONG is for long double).
+
+For the other base types:
+* .ctype.base_type is NULL
+* .ctype.modifiers is zero.
+
+SYM_NODE
+--------
+It's used to make variants of existing types. For example,
+it's used as a top node for all declarations which can then
+have their own modifiers, address_space, contexts or alignment
+as well as the declaration's identifier.
+* .ctype.base_type points to the unmodified type (wich must not
+  be a SYM_NODE itself).
+* .ctype.modifiers, .as, .alignment, .contexts will contains
+  the 'variation' (MOD_CONST, the attributes, ...).
+
+SYM_PTR
+-------
+For pointers.
+* .ctype.base_type points to the pointee type
+* .ctype.modifiers & .as are about the pointee too!
+
+SYM_FN
+------
+For functions.
+* .ctype.base_type points to the return type.
+* .ctype.modifiers & .as should be about the function itself
+  but some return type's modifiers creep here (for example, in
+  int foo(void), MOD_SIGNED will be set for the function).
+
+SYM_ARRAY
+---------
+* .ctype.base_type points to the underlying type
+* .ctype.modifiers & .as are a copy of the parent type (and unused)?
+* for literal strings, the modifier also contains MOD_STATIC.
+* sym->array_size is *expression* for the array size.
+
+SYM_STRUCT
+----------
+* .ctype.base_type is NULL.
+* .ctype.modifiers & .as are not used?
+* .ident is the name tag.
+
+SYM_UNION
+---------
+* .ctype.base_type is NULL.
+* .ctype.modifiers & .as are not used?
+* .ident is the name tag.
+
+SYM_ENUM
+--------
+* .ctype.base_type points to the underlying type (integer)
+* .ctype.modifiers contains the enum signedness.
+* .ident is the name tag.
+
+SYM_BITFIELD
+------------
+* .ctype.base_type points to the underlying type (integer)
+* .ctype.modifiers & .as are a copy of the parent type (and unused)?
+* .bit_size is the size of the bitfield.
+
+SYM_RESTRICT
+------------
+Used for bitwise types (aka 'restricted' types).
+* .ctype.base_type points to the underlying type (integer)
+* .ctype.modifiers & .as are like for SYM_NODE and the modifiers
+  are inherited from the base type with MOD_SPECIFIER removed.
+* .ident is the typedef name (if any)	// FIXME
+
+SYM_FOULED
+----------
+Used for bitwise types when the negation op (~) is
+used and the bit_size is smaller than an int.
+There is a 1-to-1 mapping between a fouled type and
+its parent bitwise type.
+* .ctype.base_type points to the parent type.
+* .ctype.modifiers & .as are the same as for the parent type.
+* .bit_size is bits_in_int.
+
+SYM_TYPEOF
+----------
+Should not be present after evaluation.
+* .initializer points to the expression representing the type
+* .ctype is not used.
+
+SYM_LABEL
+---------
+Used for labels only.
+
+SYM_KEYWORD
+-----------
+Used for parsing only.
+
+SYM_BAD
+-------
+Should not be used.
+
+SYM_UNINTIALIZED
+----------------
+Should not be used.
-- 
2.27.0

