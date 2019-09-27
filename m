Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C27BCC0EA4
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbfI0Xn3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:29 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43213 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbfI0Xn3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:29 -0400
Received: by mail-ed1-f65.google.com with SMTP id r9so3709942edl.10
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmuuzwMyC9n9gTmj1mNjr2ZvhnC4ro6o+drJuhVwVUc=;
        b=dcMH3aW4e6Cg42wuuQNesVDFXMO3pxFnqpmxrcMne0RkASLHF+3vBIC5pM1ew+Bu1+
         la9c+3tR8OXkiQQnWf/Ktvnueihsc/S/yLopHCX4F/gPGId0AUlK6Wb2fudCW+uzHxHa
         qjXOJ6gh3nSJ6z3Cbi4VfuCb+uWwjt+GTcFuD+63vY/ZQqyrpEVqaqy+IuiYDxXQ4KKO
         qABrKilcDfNjJutx1LQCvomEzHoLpwl75L4wprHytS5kHO8KTWtzHfoLIGvO9NDTe7xf
         IQ49fTPGiRxN9k6yLJ8YSgFZSl+ilmThBrO2tS5qAKw1qLLNJ7su12mMNux+uiHXNGjm
         hGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmuuzwMyC9n9gTmj1mNjr2ZvhnC4ro6o+drJuhVwVUc=;
        b=JgM9+0kkGP45CAnZKaT1uadAsgPt4jY4Z2Xeh4e+q1wqdjC0XEu1ulrq7csIpPpbfk
         zpF2JYSKk3DDd9WMPkX8XORdaH2HkktxV/IR6XmBcArXoHlr9+ZQvkXdsF9vompLUwE9
         0swj/gXTcjci5ldwXr9+Lc5qg6qJ0Ezm4EPAWeBahM/W4j8pJ/DYorylaFmgWr9kTlrG
         wvxzvmMMRvhGQPLKk0NB6NlHvQNnwV9ucEtkoqTsx3eK8rX4/d4OUXu7U86RUY4gbQ08
         EQGPwBmlwGCyl04CwpDZvdVF/Z2dw66HdXD20LQnZnoLYF6MvQMxiJ1iP1if4usAFdhS
         y+FQ==
X-Gm-Message-State: APjAAAXm5lVwfqgci9I5SEtsxKa3Tkn9eOBvttAKIzgTLKAhyBduUTax
        T0rhS7ffYNmyeAYMPirfQ7Uj3MX/
X-Google-Smtp-Source: APXvYqypjcEOFHgnhxYex/Cg1vOeqIqg1lMJfbKZVXNhCOM9iRfnS8tSryJu8+Bvk8yDz4pIr/9G6A==
X-Received: by 2002:a17:906:6d1:: with SMTP id v17mr9787659ejb.74.1569627806299;
        Fri, 27 Sep 2019 16:43:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/2] do not linearize invalid expression
Date:   Sat, 28 Sep 2019 01:43:05 +0200
Message-Id: <20190927234322.5157-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Code like:
	int *r;
	r = ({ __builtin_types_compatible_p(long, long); });

triggers the following diagnostics:
	warning: incorrect type in assignment (different base types)
	   expected int *r
	   got long
	warning: unknown expression (4 0)
	warning: unknown expression (4 0)

The first warning is expected but the other two are bogus.

The origin of the problem could be considered as being how
type incompabilities are handled in assignment:
   If an incompatibility is found by compatible_assignment_types()
   - a warning is issued (not an error),
   - the source expression is casted to the destination type,
   - the returned value indicates a problem was detected.
   In the other uses of this function the returned value is simply
   ignored and normal processing continue. This seems logical since
   only a warning is issued and so (thanks to the cast) the
   resulting expression is at least type-coherent.
   However, in evaluate_assignment() the returned value is not
   ignored and the calling function directly returns. This leaves
   the resulting expression without a valid type, as if an error
   occured, unable to be correctly processed further.

However, the real problem is that an expression without a valid
type should never be linearized.

So, in linearize_expression(), refuse to linearize an expression
without a valid type.

Note: if one is interested in doing a maximum of processing,
      including expansion and linearization, check_assignment_types()
      should be modified to distinguish between recoverable and
      non-recoverable type error (those for which the forced
      cast make sense and those for which it doesn't) and
      compatible_assignment_types() modified accordingly (maybe
      issuing a warning in the first case and an error otherwise).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c                   | 2 +-
 validation/eval-bad-assign1.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/linearize.c b/linearize.c
index 415bf7e50..d705ffd59 100644
--- a/linearize.c
+++ b/linearize.c
@@ -1864,7 +1864,7 @@ static void linearize_argument(struct entrypoint *ep, struct symbol *arg, int nr
 
 static pseudo_t linearize_expression(struct entrypoint *ep, struct expression *expr)
 {
-	if (!expr)
+	if (!expr || !valid_type(expr->ctype))
 		return VOID;
 
 	current_pos = expr->pos;
diff --git a/validation/eval-bad-assign1.c b/validation/eval-bad-assign1.c
index bce4d3d38..57138c7af 100644
--- a/validation/eval-bad-assign1.c
+++ b/validation/eval-bad-assign1.c
@@ -5,7 +5,6 @@ static void kos(int *r, int a)
 
 /*
  * check-name: eval-bad-assign1
- * check-known-to-fail
  *
  * check-error-start
 eval-bad-assign1.c:3:11: warning: incorrect type in assignment (different base types)
-- 
2.23.0

