Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782ED18A193
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Mar 2020 18:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgCRRb3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Mar 2020 13:31:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33485 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgCRRb3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Mar 2020 13:31:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so31485683wrd.0
        for <linux-sparse@vger.kernel.org>; Wed, 18 Mar 2020 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UVos/ITNK5RE65ZiF+NaGoSf1oDCOfxjq6lurXGVahg=;
        b=L4zPhi3OsVXRqwVnseQkuhYKVp6CzWwVrU8S8eCPoavIi7pgmoWpgeOEm0JBwza+Jm
         J7cbYtq2oOGdLCv2g+P/GTW0x96mX9z9I/ESnxJNhQEvCSJWxcME2c5UtPlG6xka2s8N
         /WMagTplgPxFiNANxd0AZjl9GPw5wWAgbvjlOO4YCqYMuMCuTGmijVanIJvSQWPCAxz4
         3FAJbUAFxiTvoXK/It7oNhFRYK2vGNXtfeJVNAINKOm4oFCqefTSSMy4koQkZRYNhHw6
         E0gTS12oCjEdMbkRHDRtoFFWTU+p05RcJ6OTQmAD8w7zQmCPT+9kPEyTVm7VjP44y9oZ
         5wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UVos/ITNK5RE65ZiF+NaGoSf1oDCOfxjq6lurXGVahg=;
        b=SeUuZMOmJKPYyRQWHnFubqQMxYp6eX0BpWV6+fOX9BbplTvGTydarqrI8g6PMw8twN
         vBIU6ZzeYWqj0c7ug9MvbNoEGMli2koMUm+QargBXqdIZIX1YGuwFk/gKcuhPfOwwBNP
         auFvY7nTJKdxmy4GBLu+mHQdL/fC7vjkrutF+g4t41PhTZ5zFtie1/VFfa8n5G05fPqm
         dZeZQuPG9DgZNNBoBZwL8furT2FRD4MZLDF6abes4KWv1hzXSA0gCenB5AZgoIoQS0e5
         sS86TKV85O+so5WSE3xmYs2IzaHapwgzJoP9+eeQ+hEA5RAyK2X3nqzHTX27cvAdm6Ip
         adLg==
X-Gm-Message-State: ANhLgQ2LJoxnsfA9fThjMI6i2fXPNCOeRvCjM43dNYL/NmfMgNwRoF7A
        5c3OZiHTcJJnlfWEy/XoKjmdsrld
X-Google-Smtp-Source: ADFU+vuDtSKMx6wACAxWdka91NYxdw+Yi0OJRm+H/O7bXX3mS7mEW/tFl4mos0KyBFl4ULsYrg0Rsw==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr6846600wrv.104.1584552686533;
        Wed, 18 Mar 2020 10:31:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:81ce:3038:2a0a:bf02])
        by smtp.gmail.com with ESMTPSA id u17sm10268051wrm.43.2020.03.18.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:31:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] add an implicit __builtin_unreachable() for __noreturn
Date:   Wed, 18 Mar 2020 18:31:18 +0100
Message-Id: <20200318173120.63939-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
References: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The semantic of a __noreturn function is that ... it doesn't return.

So, insert an instruction OP_UNREACH after calls to such functions.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c                               | 10 ++++++++++
 validation/linear/noreturn-unreachable0.c |  1 -
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/linearize.c b/linearize.c
index f1e538e23ae1..19c284c4a456 100644
--- a/linearize.c
+++ b/linearize.c
@@ -657,6 +657,13 @@ static void add_one_insn(struct entrypoint *ep, struct instruction *insn)
 	}
 }
 
+static void add_unreachable(struct entrypoint *ep)
+{
+	struct instruction *insn = alloc_instruction(OP_UNREACH, 0);
+	add_one_insn(ep, insn);
+	ep->active = NULL;
+}
+
 static void set_activeblock(struct entrypoint *ep, struct basic_block *bb)
 {
 	if (!bb_terminated(ep->active))
@@ -1551,6 +1558,9 @@ static pseudo_t linearize_call_expression(struct entrypoint *ep, struct expressi
 				add_one_insn(ep, insn);
 			}
 		} END_FOR_EACH_PTR(context);
+
+		if (ctype->modifiers & MOD_NORETURN)
+			add_unreachable(ep);
 	}
 
 	return retval;
diff --git a/validation/linear/noreturn-unreachable0.c b/validation/linear/noreturn-unreachable0.c
index b76319458e96..13fddc8cfd40 100644
--- a/validation/linear/noreturn-unreachable0.c
+++ b/validation/linear/noreturn-unreachable0.c
@@ -9,7 +9,6 @@ int foo(void)
 /*
  * check-name: noreturn-unreachable0
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-start
 foo:
-- 
2.25.1

