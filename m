Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF81610CF55
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfK1Umi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56272 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Umi (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:38 -0500
Received: by mail-wm1-f67.google.com with SMTP id a131so7814671wme.5
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQ8Fu3iWJi2Ax/jy7XJrpTKOVFjjhw9C+WozsZhT3AY=;
        b=D/yP734bTZmaWoDIF5I3zJ69KsBaBbRRiJIX1Vaj+RMFU0S/1SqnjXu61UAk+klfMk
         J/GPE/XsEvcBz+JLAXvwBbdALk9TgehYTtex1EFzXBtxTzLyYb0Afpic7t+Kth94Rxh6
         uHXIEGyiDUxZPXk3LXCuPEifQlw7h1mb5/vhu0EH1NSBwpngvqQPmjDsgkVNfkbVqOAu
         MU7DLVqclBzkKkB9XFlEpUWxtr0gFEkhNj8L0Gy7LJM7fHgk9z2/jWdyFp44QLJ+Nnap
         6ekieRUufgs0h75HO9vmMYnz3kYeeQeMYDdW8B0HoREyYNlRtMxTA0D2J2S4kZfPVqYy
         /zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQ8Fu3iWJi2Ax/jy7XJrpTKOVFjjhw9C+WozsZhT3AY=;
        b=RDF7AhEZ+8j5DCK5ePCovTdMllG6HpjjLCywgEi92L9VgDBiLjnHC+L8B5QUb7GyoL
         E0dB1e57Bi/xy6WAyTzyL6yiOZS26c76d3QWhxtSaxNq0d8hQs5kEvchBpI0tSY35XDW
         pVbrjHqwYS7s/yuzTmTG4MtDb8fWTe92ekwRA2YHv14AwmVp7goipNaAxmCKACNisxZD
         JPwTSZH9U7TzJFCyQGQRuv5GLgPunUH6l/K6N8qenSWNF/OCHE+9giB2QEhagggxi6WJ
         TnyAfJkTuhFLwPh2BbYPah0RkXPZSSA/WcjCcaUwM6Q8lo3l1wdO0MlXBnozNCsfjw4B
         vvWA==
X-Gm-Message-State: APjAAAXqKL23g4evn5RfvAiXnty31zitOfWWrxomyadO+2kXQ5IGk8/u
        FZjUdVFdi+wt53AEkN9DfeC7lhR2
X-Google-Smtp-Source: APXvYqwjMpxZcNLmo+1mUdRxo0ayN1SEcYT1Ju7Z6NDpbemdBaKPqH+YvRdGKXyNteq+qztXZq+ImA==
X-Received: by 2002:a1c:984f:: with SMTP id a76mr11836032wme.64.1574973755965;
        Thu, 28 Nov 2019 12:42:35 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:35 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 6/7] separate definition of __STDC_NO_ATOMICS__ and friends from C11
Date:   Thu, 28 Nov 2019 21:42:24 +0100
Message-Id: <20191128204225.7002-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The definition of __STDC_NO_ATOMICS__ and friends will also
be needed for C17.

Move these definitions outside of the switch statement.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib.c b/lib.c
index d232b8cee..7f7ca846b 100644
--- a/lib.c
+++ b/lib.c
@@ -1419,14 +1419,16 @@ static void predefined_macros(void)
 
 	case STANDARD_C11:
 	case STANDARD_GNU11:
-		predefine("__STDC_NO_ATOMICS__", 1, "1");
-		predefine("__STDC_NO_COMPLEX__", 1, "1");
-		predefine("__STDC_NO_THREADS__", 1, "1");
 		predefine("__STDC_VERSION__", 1, "201112L");
 		break;
 	}
 	if (!(standard & STANDARD_GNU) & (standard != STANDARD_NONE))
 		predefine("__STRICT_ANSI__", 1, "1");
+	if (standard >= STANDARD_C11) {
+		predefine("__STDC_NO_ATOMICS__", 1, "1");
+		predefine("__STDC_NO_COMPLEX__", 1, "1");
+		predefine("__STDC_NO_THREADS__", 1, "1");
+	}
 
 	predefine("__CHAR_BIT__", 1, "%d", bits_in_char);
 	if (funsigned_char)
-- 
2.24.0

