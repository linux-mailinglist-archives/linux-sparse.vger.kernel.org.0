Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6204610CFBD
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 23:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1W3u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 17:29:50 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52872 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK1W3t (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 17:29:49 -0500
Received: by mail-wm1-f68.google.com with SMTP id l1so12329632wme.2
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 14:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8EDgnQgn6RwQh4abtBpf5hMbwq3Rax9ewzIsbRfq5XU=;
        b=FKKj1+y1a1MJw8KpTyNOU8NrS9x3v8c5zDHjF/RG/Agzhe6PsBAVtALGBvOGc0aYk5
         E1O5xe/HQDJyLuacvchZulMd+NfgbALAmbVxipB5x/ckIuuFycl2OO8gODOhSWJWGMkc
         H9nFiEAk82e3ja/LbnBjZD+9bTAq3W3mwIpAGXj3gnKcy3FWOVJCE2//IAWqiDifVqCL
         bUQ+DpGPpBwSO1UXccY6bL2q8WDOtW1R9JWkJVc7FntvWHBYN2OgjpgyFkiEW1Az0VLc
         cODSnU8WSf9J8ARZYOgdEZEHLWC5AMre5Ar66U6MphUK0p9F7FjpeBfY3oGwOCA4cAK8
         j2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8EDgnQgn6RwQh4abtBpf5hMbwq3Rax9ewzIsbRfq5XU=;
        b=lkZASVMRQwV5KtE6fRsruayBiijgsC5A5RZaPaa6w9/1E2xGFzSEMorigH3WdQzGuz
         NfpWWsSSw8XrBQ3zD9ixG2mKiPXggjDaa0M2fCT9ZOJ1rIancmWDoYqo584oIub0aGC8
         TCsPTPmDJAfceKOB67h5YErT8yaUC72+5G4yOoFTV0u4Gq7BjTa2OrMI5+nMLS3WMgwf
         shWHDlTqS10VbNqL0jTSoknaJu26DIc99oypypGBmPm5PJbKO8CHzrODjBo8BI2RI1Bf
         mQHg1GbxaaFfxx51aC2nplnd5+SdJpZZb4twEjuzeQP8TMrTXFYNmz1baFG3kw2bfgH7
         hNAA==
X-Gm-Message-State: APjAAAXF1jI1SYeUr3cqlSOGSqGah9LS/MzDXKq/leSCgHBpbRsRqhua
        G4OSkh8nCG4qEru8tLtnFc/nOB/L
X-Google-Smtp-Source: APXvYqxqFAOWwAZUBgo6wCqRNm3ht8I6USyWVxxKKszfRp3+QiEGxClAYkbDt3H0wPAseIMlI23XDg==
X-Received: by 2002:a1c:9c82:: with SMTP id f124mr12219358wme.25.1574980187657;
        Thu, 28 Nov 2019 14:29:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:5533:3e30:d93d:fd1e])
        by smtp.gmail.com with ESMTPSA id d8sm3324863wre.13.2019.11.28.14.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 14:29:47 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] remove redundant degenerate() in compatible_assignment_types()
Date:   Thu, 28 Nov 2019 23:29:44 +0100
Message-Id: <20191128222944.8069-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In compatible_assignment_types(), the source expression is
first degenerated before calling check_assignment_types().

But this is not needed since check_assignment_types() must
anyway do the call to degenerate().

So, remove the redundant call to degenerate().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 19bdab920..34578be8a 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1501,9 +1501,9 @@ static int compatible_assignment_types(struct expression *expr, struct symbol *t
 	struct expression **rp, const char *where)
 {
 	const char *typediff;
-	struct symbol *source = degenerate(*rp);
 
 	if (!check_assignment_types(target, rp, &typediff)) {
+		struct symbol *source = *rp ? (*rp)->ctype : NULL;
 		warning(expr->pos, "incorrect type in %s (%s)", where, typediff);
 		info(expr->pos, "   expected %s", show_typename(target));
 		info(expr->pos, "   got %s", show_typename(source));
-- 
2.24.0

