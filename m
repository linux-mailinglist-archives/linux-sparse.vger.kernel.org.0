Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73931FC09B
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 23:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgFPVEH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 17:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgFPVEG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 17:04:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55657C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:04:06 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id f7so23248951ejq.6
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ShqK0kXwLSs3mRJMr/1xz9iaVhTajXMDP7qlD5C2Oz0=;
        b=jz8zZw45gQDDJzgEJxsC7tTOnGJ2WlaD1Ss6m+VCQK2yXNt1ni6ZEed+TL19s3sTrA
         jEF1Wb9Dy7+PX+SeSNaIDRQTdiKJZCa5iTmR+RbbGuBWz2dmFcRhMrbPM//2Ks7aR2lj
         S/Gc2Zn0s5mGMkYDlgtNmnHObiPggUtml4ODdi2C9cR04YHfFV9qAUZ5Ij+mDTAsI+MH
         NTkm806RESKxc+0hhKG2zlrce66vhvUtRTbn31aiWV4Q6428YqMABcXgQoRn6BNAB0q5
         Huh+WAbvGHku26wcv6gOCcR3JDmE28Nkt2LoZBTqAgPGwndbbADUER+kE6LtPpiZTRAu
         Gs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ShqK0kXwLSs3mRJMr/1xz9iaVhTajXMDP7qlD5C2Oz0=;
        b=QOt47+hD4HiT1XOKBcjTBSwBg1otH8SZAdB4MIZXAKZZRp6Yb8biKJQIOqqsdLKtEb
         q1m1zekI9CckGK0G+QsC2i66kQojK5TbLtiLMIXMeB0JnORIROxPzWf4ffUAnQOz3aky
         WPbREam+mSe1rkMB0PYzIR8eaWnH5SnEyTuifRZGrj82dwoiHYqJ0JlssEm2C6+l4aHc
         MLiBXNiUiNrt1+fNS3Hb8pPw29kRzKIhMQuHBcZciee8PTMWVCjnqN/zFAW3DGIpD+r7
         Nqalp0VMdaZksCJnpkgvcT4F0ddvtYU5qQWscWpFrhgzYGdDhnruDxI1QfbKw4efKB32
         mCxw==
X-Gm-Message-State: AOAM532tKvDeUKIRuvO8iiNepDKFwrlDu0zlZMPAtI9voiLZm8VZCrCZ
        CF3TZvkb+utpO321vau9BPkR5lcb
X-Google-Smtp-Source: ABdhPJwN7SfqwX2f42dfpO3ZuZYNyfeAY2zno3kyjHUa1PdDORD1f4YxgpO1OG8mTP32QqWe3KlGHg==
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr4792575ejj.359.1592341444657;
        Tue, 16 Jun 2020 14:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id dn17sm10773601edb.26.2020.06.16.14.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 14:04:04 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: fix markup in types.rst (s/```/``/)
Date:   Tue, 16 Jun 2020 23:04:01 +0200
Message-Id: <20200616210401.77835-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Literal text was marked with ``` but that's a bit excessive.

Fix that by replacing these with ``.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/types.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/types.rst b/Documentation/types.rst
index 5c10725fa71a..272f32a0f4ed 100644
--- a/Documentation/types.rst
+++ b/Documentation/types.rst
@@ -30,16 +30,16 @@ Some bits, also related to the type, are in struct symbol itself:
   * accessed
   * transparent_union
 
-* ```base_type``` is used for the associated base type.
-* ```modifiers``` is a bit mask for type specifiers (MOD_UNSIGNED, ...),
+* ``base_type`` is used for the associated base type.
+* ``modifiers`` is a bit mask for type specifiers (MOD_UNSIGNED, ...),
   type qualifiers (MOD_CONST, MOD_VOLATILE),
   storage classes (MOD_STATIC, MOD_EXTERN, ...), as well for various
   attributes. It's also used internally to keep track of some states
   (MOD_ACCESS or MOD_ADDRESSABLE).
-* ```alignment``` is used for the alignment, in bytes.
-* ```contexts``` is used to store the informations associated with the
-  attribute ```context()```.
-* ```as``` is used to hold the identifier of the attribute ```address_space()```.
+* ``alignment`` is used for the alignment, in bytes.
+* ``contexts`` is used to store the informations associated with the
+  attribute ``context()``.
+* ``as`` is used to hold the identifier of the attribute ``address_space()``.
 
 Kind of types
 =============
@@ -49,11 +49,11 @@ SYM_BASETYPE
 Used by integer, floating-point, void, 'type', 'incomplete' & bad types.
 
 For integer types:
-  * .ctype.base_type points to ```int_ctype```, the generic/abstract integer type
+  * .ctype.base_type points to ``int_ctype``, the generic/abstract integer type
   * .ctype.modifiers has MOD_UNSIGNED/SIGNED/EXPLICITLY_SIGNED set accordingly.
 
 For floating-point types:
-  * .ctype.base_type points to ```fp_ctype```, the generic/abstract float type
+  * .ctype.base_type points to ``fp_ctype``, the generic/abstract float type
   * .ctype.modifiers is zero.
 
 For the other base types:
@@ -131,7 +131,7 @@ Used for bitwise types (aka 'restricted' types):
 SYM_FOULED
 ----------
 Used for bitwise types when the negation op (~) is
-used and the bit_size is smaller than an ```int```.
+used and the bit_size is smaller than an ``int``.
 There is a 1-to-1 mapping between a fouled type and
 its parent bitwise type.
 
-- 
2.27.0

