Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342B8213051
	for <lists+linux-sparse@lfdr.de>; Fri,  3 Jul 2020 02:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGCAFA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 2 Jul 2020 20:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGCAFA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 2 Jul 2020 20:05:00 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B5AC08C5C1
        for <linux-sparse@vger.kernel.org>; Thu,  2 Jul 2020 17:04:59 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id rk21so31941321ejb.2
        for <linux-sparse@vger.kernel.org>; Thu, 02 Jul 2020 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3w6lF6g4MNq4UthlaIbr6AzuLPWYLgruefBYsnX8qTo=;
        b=kHJjM2Ct+4tmCLOi6rpzidbMAscOlx3wkkOMn6WIimOGIXUfHNFtqCsY0fw5LkinMZ
         QPdGOuFyYEswmKet+ByV5sMIAU+73xu+Hi0klffSRubKRh9/CMWwG6plwusBscDRdmXX
         Pt3RSfxPqvDQK78B7ZkgVZmcHOo9gBUHKZ1h/LXgXOa6OgnWynh5e0ZNcTgaywoYNeg1
         7AlS+iVc//DzUnB7fq3MZVV8ci3OJoSF7HGMPbNuqBnx/kAxnnagPit/OMNoaf4OCWoc
         doAIfznPUVdA+val7A9TldIzpTbNWTL6GuBuI90VdHmiXDHY+nwpfXk6z0dSsR4Q39oi
         0PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3w6lF6g4MNq4UthlaIbr6AzuLPWYLgruefBYsnX8qTo=;
        b=UWhv8518qPrjmJUPTJggGCKp9HR+dk3fgmPJTydK2jJA+eKIcOQtpLpwpKKIbOTQfb
         iNCdzP04V0eyv6A9w7/bQ+Y6OevKrhOKio6k5QWtvp9jfysH2BgBzNc57yQfyTeY5AxU
         k5wX9Ok0lahRW64+GoDWIQgbNDim+o/iyRNaeK9LoQ0TQMEwXO08dyOlk+6kjgKpbLW6
         ibKmfMx7ddnK8uORFklt1NVxuMlpfGN78ZflqtyVyanatL4liGBNJd0RAny8PeePKkxM
         ehDQ2f69sdsE0VcaZXchkJC3XLh0bivxnC5jR3ebadmzmohFp6xtjYXpZHb6GbB2Zel/
         xvEw==
X-Gm-Message-State: AOAM532TsGfahT/22oKT3p7QhXQfHqsv1xYFq8KQbGZxwjh1OWXOgN5P
        Wvr/gyK0zrXFONA9l9rrpPU06wzm
X-Google-Smtp-Source: ABdhPJwjhndCAQa+c4mO2M+ua4pb7beF2mG9U8WX+Qbd19K5Zs/NEHnFicNCATlIcPAmm+x5TYIHyw==
X-Received: by 2002:a17:906:1998:: with SMTP id g24mr25887196ejd.11.1593734698362;
        Thu, 02 Jul 2020 17:04:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:bd38:c82d:5283:9f1])
        by smtp.gmail.com with ESMTPSA id d13sm7786592ejj.95.2020.07.02.17.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 17:04:57 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] manpage: annotations
Date:   Fri,  3 Jul 2020 02:04:54 +0200
Message-Id: <20200703000454.55816-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

---
 sparse.1 | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sparse.1 b/sparse.1
index d916ad9ee54e..068764799e00 100644
--- a/sparse.1
+++ b/sparse.1
@@ -18,6 +18,65 @@ option \fB\-Wsomething\fR.  Sparse issues some warnings by default; to turn
 off those warnings, pass the negation of the associated warning option,
 \fB\-Wno\-something\fR.
 .
+.SH ANNOTATIONS
+Sparse extends C's type system with a number of extra type qualifiers
+adding restrictions on what you can do on objects annotated with them.
+These qualifiers are specified with GCC's \fB__attribute__\fR syntax:
+.IP - 2
+bitwise
+.RS 2
+This attribute is to be used to define new, unique integer types that
+cannot be mixed with other types.
+In particular, you can't mix a "bitwise" integer with a normal integer
+expression, and in fact you can't even mix it with another bitwise
+expression of a different type.
+The integer 0 is special, though, and can be mixed with any bitwise type
+since it's safe for all bitwise operations.
+
+Since this qualifier defines new types, it only makes sense to use
+it in typedefs, which effectively makes each of these typedefs
+a single "bitwise class", incompatible with any other types.
+.RE
+.IP - 2
+force
+.RS 2
+This attribute is to be used in casts to suppress warnings that
+would be otherwise caused by this cast because of the presence of
+one of these qualifiers.
+.RE
+.IP - 2
+noderef
+.RS 2
+This attribute is to be used on a r-value to specify it cannot be
+dereferenced. A pointer so annotated is in all other aspects exactly
+like a pointer in all other respects, but trying to actually access
+anything through it will cause a warning.
+.RE
+.IP - 2
+address_space(\fIname\fR)
+.RS 2
+.RE
+.IP - 2
+context(\fIcontext\fR, \fIin\fR, \fIout\fR)
+.RS 2
+.RE
+.IP - 2
+nocast
+.RS 2
+This attribute is similar to \fBbitwise\fR but in a much weaker form.
+It is also 
+__nocast warns about explicit or implicit casting to different types
+however, the __nocast attribute disables many of the implicit type conversions
+
+.RE
+.IP - 2
+safe
+.RS 2
+This attribute specifies that the object, which should be a pointer,
+is defined to never be NULL or nontrapping.
+It causes a warning if the object is tested in a conditional.
+.RE
+
 .SH WARNING OPTIONS
 .TP
 .B \-fmax-warnings=COUNT
-- 
2.27.0

