Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A819D214C73
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 14:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGEMi7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 08:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgGEMi6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 08:38:58 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57789C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 05:38:58 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dm19so25904738edb.13
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeZ+vKcVoKQr9MlyQEA580tM9k7xjODa+YZP+gk56yc=;
        b=HP+U4uyTMWm/ZlXePR/LCZWvLNZkntpcU+UiS3Cp65aKnJZf4ZKtKf6VKwePb81uJN
         BsJ/dUJHA1emN00BLhUi1Nw44808K8PDLA415id3e7jdCnkzZa/mH26cD3zngjIhQFAw
         QSduEFufLCaNh1joauNGNRU3NLOJIL1T0gaWp2dgFqnHfWMduYt9G7cwNRY8ULfkJ+Wb
         Hipz7DcnBDslUJNjKiROIcK4N6fmNt7l2iaensEZs/kloqudYrYEvo8+Tow2tYl7qrtG
         L6GbMOBGOQnkm1Eusd6uw48x0wi8/bY/WNbFmHYPFshryn93ER2XATZHBiW74p00f8L7
         d0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeZ+vKcVoKQr9MlyQEA580tM9k7xjODa+YZP+gk56yc=;
        b=OZdDW5/THUoBsOAZEtFsDU8Mbl/miKo2uXoKuR9ZL8o2e6Ow7PttYlEbPIErPJ2t4g
         NLWe6Mn+hPMgpQJPVQTYZKGCSlZpANd8jBagmw7KHyj/IM1SOCrI/lTLIzzvI7FyA5zG
         +JSuPrD9fV2beaAMVluD58lq1XLAsPlXjG1R0zz+gO5IWjsb/57jb8rJ2BV5/mbczHqI
         r1lxwlQj6s4SvgAY1jrMEyNsMYGdIoFGGi1drWLrsL0DJH5Hpfu1ru0PBor7OQI9uEFP
         +4OfHL8mUv2yDkuksfYYMfNxvwERngEROQ9hMvzYrQkIIt4uFGFlH+0thPUHevRJdDyU
         3jOg==
X-Gm-Message-State: AOAM5316jsnJbCUsRBhqdfBKTK7Dp8BKTx6vwAkl245WsTRSiwirVNG7
        UBaHpNbF/G7c/TT8KidM+rqoiqIL
X-Google-Smtp-Source: ABdhPJxCeVPnsD7W4LH7baXAWZhcz01AOfNK/8tv+8nxw6nysrXpBabKQSbH3wTMMNcy4nJQHzh8QQ==
X-Received: by 2002:a50:a45d:: with SMTP id v29mr50017600edb.284.1593952736705;
        Sun, 05 Jul 2020 05:38:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id kt1sm13994135ejb.78.2020.07.05.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 05:38:56 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: add testcase for bogus linearization of >>= & /=
Date:   Sun,  5 Jul 2020 14:38:50 +0200
Message-Id: <20200705123850.25924-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When doing a shift operation, both arguments are subjected to
integer promotion and the type of the result is simply the type
of the promoted left operand. Easy.

But for a shift-assignment, things are slightly more complex:
  -) 'a >>= n' should be equivalent to 'a = a >> n'
  -) but the type of the result must be the type of the left
     operand *before* integer promotion.

Currently, the linearization code use the type of the right
operand to infer of the type of the operation. But simply changing
the code to use the type of the left operand will also be wrong
(for example for signed/unsigned divisions). Nasty.

For example, the following C code:
	int s = ...;
	s >>= 11U;
is linearized as a logical shift:
	lsr.32      %r2 <- %arg1, $11
while, of course it's an arithmetic shift that is expected:
	asr.32      %r2 <- %arg1, $11

So, add a testcase for these.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/linear/bug-assign-op0.c | 115 +++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 validation/linear/bug-assign-op0.c

diff --git a/validation/linear/bug-assign-op0.c b/validation/linear/bug-assign-op0.c
new file mode 100644
index 000000000000..0cabc6222b8a
--- /dev/null
+++ b/validation/linear/bug-assign-op0.c
@@ -0,0 +1,115 @@
+int asr(int s)
+{
+	s >>= 11U;
+	return s;
+}
+
+unsigned int lsr(unsigned int u)
+{
+	u >>= 11;
+	return u;
+}
+
+int divr(int s, unsigned long u)
+{
+	extern int use(int, unsigned);
+	int t = s;
+	s = s / u;
+	u = u / t;
+	return use(s, u);
+}
+
+int sdivul(int s, unsigned long u)
+{
+	s /= u;			// divu
+	return s;
+}
+
+unsigned int udivsl(unsigned int u, long s)
+{
+	u /= s;			// divs
+	return u;
+}
+
+int uldivs(int s, unsigned long u)
+{
+	u /= s;			// divu
+	return u;
+}
+
+unsigned int sldivu(unsigned int u, long s)
+{
+	s /= u;			// divs
+	return s;
+}
+
+/*
+ * check-name: bug-assign-op0
+ * check-command: test-linearize -Wno-decl $file
+ * check-known-to-fail
+ *
+ * check-output-start
+asr:
+.L0:
+	<entry-point>
+	asr.32      %r2 <- %arg1, $11
+	ret.32      %r2
+
+
+lsr:
+.L2:
+	<entry-point>
+	lsr.32      %r6 <- %arg1, $11
+	ret.32      %r6
+
+
+divr:
+.L4:
+	<entry-point>
+	sext.64     %r11 <- (32) %arg1
+	divu.64     %r13 <- %r11, %arg2
+	trunc.32    %r14 <- (64) %r13
+	divu.64     %r18 <- %arg2, %r11
+	trunc.32    %r21 <- (64) %r18
+	call.32     %r22 <- use, %r14, %r21
+	ret.32      %r22
+
+
+sdivul:
+.L6:
+	<entry-point>
+	sext.64     %r26 <- (32) %arg1
+	divu.64     %r27 <- %r26, %arg2
+	trunc.32    %r28 <- (64) %r27
+	ret.32      %r28
+
+
+udivsl:
+.L8:
+	<entry-point>
+	zext.64     %r33 <- (32) %arg1
+	divs.64     %r34 <- %r33, %arg2
+	trunc.32    %r35 <- (64) %r34
+	ret.32      %r35
+
+
+uldivs:
+.L10:
+	<entry-point>
+	sext.64     %r39 <- (32) %arg1
+	divu.64     %r41 <- %arg2, %r39
+	trunc.32    %r43 <- (64) %r41
+	ret.32      %r43
+
+
+sldivu:
+.L12:
+	<entry-point>
+	zext.64     %r46 <- (32) %arg1
+	divs.64     %r48 <- %arg2, %r46
+	trunc.32    %r50 <- (64) %r48
+	ret.32      %r50
+
+
+ * check-output-end
+ */
-- 
2.27.0

