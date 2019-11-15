Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51063FD245
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfKOBOF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:05 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36623 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbfKOBOE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:04 -0500
Received: by mail-wr1-f67.google.com with SMTP id r10so9134511wrx.3
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/n/ZTGiSL9N9IC4C9QtqL2Ayd2vcAT6LxmnHYfV00M=;
        b=h7WnyWhnYyjfRN+JVsLDRFyISsYeGq1+samSzP8yAuPcSg6LuPKmHQGYvma0v8PXLK
         tzBdFeYkHEGYsoEHFh4nMYHl0sz19F646+ZAvnJ+wUy4Y1M1Bjxwia5Vf8gyxJT8TpsR
         zW4TJxX2QIqa65JBYB0o/Y1pfgdIUqTHdDB+GnVWGZjOcYRiqNuNlHlQytJ1FITd3Mi0
         VClc3FI0CtrdlWGREdV+ngOiFXrKSxXhB80Ie7UpIfMLUA5W4hnSTo2pfw9h0Jak4bVr
         WvAHwb4swiMAx4YjotZDTPMXqVvKUhPzXI0q+SoYcjmIlWLB3Yjpwi+s5dQY8EQuk+Xl
         VA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/n/ZTGiSL9N9IC4C9QtqL2Ayd2vcAT6LxmnHYfV00M=;
        b=oqKNPdwViNQ50AbX12tSvmA2ewjUE1KcFFrluGJvb3PLJQei4LrMYBV3pWvVLYUW0I
         IQSPyRl2bBvafaO5cf1SvV2L0t1Lws1UkdqExza+EWQsQDglGYvMUpj+wLOnegbgWWlT
         EnbFjQX0nkHs0HQnI2aMbjoXJD/Iqf6/Q3caV5oiOjZghSem6b8yWpGhrMdk0VkDoPii
         kEDF7QAznq56J9T4hwU5+Bf/+iQGdnGoO/X5SN8kINjfcDyh6oNp1XrrnU2P3IfPmf9O
         kvHMeS6Ck/jTM7X+q5yjIbdt8wQ3LZJgWWLlZm7gIL4cpYYSVDpOHQvIKz3qdnSm5u6i
         b+fQ==
X-Gm-Message-State: APjAAAUs731kjgGKo91fmOqFvRDZrn6mbWoMAYBhslqdiKc40IfKy/Vg
        Yd3Hm6ZcB1bJAKvo40qhCO7XHDfL
X-Google-Smtp-Source: APXvYqwDFPjEvS5YymaNIInPGg66nuaGnNVErr1W3R+eM/kUmlyFTeKtMmdnJ+QOUzaWz4SLN6Gm4A==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr12836985wrk.184.1573780441226;
        Thu, 14 Nov 2019 17:14:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:00 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/8] arch: simplify i386/x86-64 specifics
Date:   Fri, 15 Nov 2019 02:13:49 +0100
Message-Id: <20191115011355.53495-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The current test for setting wchar on i386 uses a
conditional break and a fallthrough on the x86-64 case.

This is not needed and can be simplified by reversing the
order of the i386 & x86-64 cases.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target.c b/target.c
index 497ecdc5e..acafbd929 100644
--- a/target.c
+++ b/target.c
@@ -79,11 +79,11 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
-	case MACH_X86_64:
-		if (arch_m64 == ARCH_LP64)
-			break;
-		/* fall through */
 	case MACH_I386:
+		wchar_ctype = &long_ctype;
+		/* fall through */
+	case MACH_X86_64:
+		break;
 	case MACH_M68K:
 	case MACH_SPARC32:
 	case MACH_PPC32:
-- 
2.24.0

