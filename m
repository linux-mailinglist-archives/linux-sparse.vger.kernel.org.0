Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7144F183B2C
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Mar 2020 22:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgCLVQh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Mar 2020 17:16:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32979 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgCLVQh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Mar 2020 17:16:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so9426125wrd.0
        for <linux-sparse@vger.kernel.org>; Thu, 12 Mar 2020 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qz+QJWp7xKZbWNNXaFxmtLHB6mfV0vhckKCu2AVZzU4=;
        b=jct4Af9105/e2KkGrusj5lXe6btv7TXHqL/NucpVG+e5sGwe5kjCMsetbCPAafEMlj
         MqUpGP+ORByg+U+UeVvqfKxfuoMd6g5KD9o9pxJKvD4VO/INoIQ2JvA7ssKTRN9iexI/
         SKq3dP4xXVr26i5GLLr+JsLr3APSLJBTv+zXsljkRKQCm2TPKyf6p+Ar1tfeCVctFQ2o
         uXYV6rUPIWuhHe16kSPhV5EjR7QFlE8ZYrJK95lA2nl7JCWxdiC5O452InbZdJQTtNAJ
         AG1XFtwvyLtGgZSespD1bs3rD+SFVa3Dd5D+DAPCnG7xvdfTfSWYTHjLP2sKEUe1iU6Y
         Y0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qz+QJWp7xKZbWNNXaFxmtLHB6mfV0vhckKCu2AVZzU4=;
        b=TqZJyu78j1BDqVIE9iKasG9OgBlQxdAbrxb4hRv8NN8thli3MVpyKPBbRvIXjEtY/R
         fWl8hBJkcmHvqlT4gRxOIWSPsSGMxr5mHKUO9bTWqzkzFyfff2fLkX8i/6HESrGMsfXj
         kPiRkeOm7GPfcnRVlJSQdOUNgNk81PuN+NK0QZTwRzFhrU3u5AuJZGUEGpDDT9qAl/w9
         Go0Oo/WZbJhljLdrmC0hrXzFCxieMEip/4aqDWx+bKVGJx6PMuJTPsNM49zHZ4R/NRcL
         RZy73CjZP5pAI1OUNuX/oRChDgKv/YzJdl8hnjCDp2vcr9OphPaUheTzOZIxg0gWy9P1
         wdZg==
X-Gm-Message-State: ANhLgQ0dVkGUZYEmYaaekmpLFeSkW1IOQqZthAR4Is3ajCXFmm+wn06f
        Sm0Z8X2DQ3ynGW1YbSHFkobL3HI0
X-Google-Smtp-Source: ADFU+vtDjzjOLYuWSnkpXXX/26v1dkLxzPKMF8h9upMN/RyK1jTyJE/uddPf+LI8AH/1d5Wvfjl4mw==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr13545975wrv.419.1584047795371;
        Thu, 12 Mar 2020 14:16:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4075:2100:dce0:d823:c691:d081])
        by smtp.gmail.com with ESMTPSA id s28sm877039wrb.42.2020.03.12.14.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 14:16:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] cpp: silently allow conditional directives within macro
Date:   Thu, 12 Mar 2020 22:16:30 +0100
Message-Id: <20200312211630.53710-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
References: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The presence of preprocessor directives within the arguments
of a macro invocation is Undefined Behaviour [6.10.3p11].
However, conditional directives are harmless here and are
useful (and commonly used in the kernel).

So, relax the warning by restricting it to non-conditional
directives.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 pre-process.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/pre-process.c b/pre-process.c
index 6670fb0cd557..4b2cd054f897 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -48,6 +48,7 @@ static struct ident_list *macros;	// only needed for -dD
 static int false_nesting = 0;
 static int counter_macro = 0;		// __COUNTER__ expansion
 static int include_level = 0;
+static int expanding = 0;
 
 #define INCLUDEPATHS 300
 const char *includepath[INCLUDEPATHS+1] = {
@@ -232,8 +233,13 @@ static int expand_one_symbol(struct token **list)
 		sym->expander(token);
 		return 1;
 	} else {
+		int rc;
+
 		sym->used_in = file_scope;
-		return expand(list, sym);
+		expanding = 1;
+		rc = expand(list, sym);
+		expanding = 0;
+		return rc;
 	}
 }
 
@@ -271,9 +277,6 @@ static struct token *collect_arg(struct token *prev, int vararg, struct position
 	while (!eof_token(next = scan_next(p))) {
 		if (next->pos.newline && match_op(next, '#')) {
 			if (!next->pos.noexpand) {
-				if (Wdirective_within_macro)
-					warning(next->pos,
-						"directive in macro's argument list");
 				preprocessor_line(stream, p);
 				__free_token(next);	/* Free the '#' token */
 				continue;
@@ -2075,6 +2078,7 @@ static void handle_preprocessor_line(struct stream *stream, struct token **line,
 	int (*handler)(struct stream *, struct token **, struct token *);
 	struct token *token = start->next;
 	int is_normal = 1;
+	int is_cond = 0;	// is one of {is,ifdef,ifndef,elif,else,endif}
 
 	if (eof_token(token))
 		return;
@@ -2084,6 +2088,7 @@ static void handle_preprocessor_line(struct stream *stream, struct token **line,
 		if (sym) {
 			handler = sym->handler;
 			is_normal = sym->normal;
+			is_cond = !sym->normal;
 		} else {
 			handler = handle_nondirective;
 		}
@@ -2098,6 +2103,12 @@ static void handle_preprocessor_line(struct stream *stream, struct token **line,
 		if (false_nesting)
 			goto out;
 	}
+
+	if (expanding) {
+		if (Wdirective_within_macro && !is_cond)
+			warning(start->pos, "directive in macro's argument list");
+		expanding = 0;		// warn only once
+	}
 	if (!handler(stream, line, token))	/* all set */
 		return;
 
-- 
2.25.1

