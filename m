Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39A01D8BE5
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 01:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgERXyw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 19:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgERXyw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 19:54:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA46AC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:54:51 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so13787336wra.7
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TuIRW+Vk0SihoQNxyf8G6Sa+wKPF4FXn2+xeVZ7ulis=;
        b=YMktwx1SUJKvBWlMY9AydC4ZDbT3GD+t6141Jk+BeZrDp4P09gIE2kbabV4GXqmktf
         mQcdyqTu0j0UhTLkRLXHeX31ogp2oji2fUeOZeQQkIV6KHNFKh8wCeKkNqRFnQT50cxo
         cVEw7g3XUwG1SgEJ2ni3rVP+KMrTU2HWHKpsLpo9suKWFyVNu0/3/nCSWbsKtffu8Z38
         aa5kgUE+79jJ6flkq9V+0ZK5om21e0LBVbYdcI61FpVKaUYsIgPkePRZWHcYTteS1BqT
         xZafhYobsVTToUtAMeyDrUmQ0UYXj/9H5pDgPROc8SfnY70I/1jVdMVbPk5ot1h4Bhts
         6Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TuIRW+Vk0SihoQNxyf8G6Sa+wKPF4FXn2+xeVZ7ulis=;
        b=QsDe/GKyF8xhFgBQEKCdBjuG7VdMiTiMI0+QeJvC95XUUUmqvP1a6150hBwHECMl4I
         d3+qRf1601f/u+304nrknDNbQ0tjBzhgNWaBhl4Lhpboq2f54DUaBvU8y02MKTbOb7AM
         +WtZnpmiX+ITcX3lAMZvKaeavESlN7Xz++88y7/fSBOMazY/HNZM2elrjt06QAk1BKcP
         siFdca3FSntO/QkvCQp73Feakp3z1X9INET3ckRn7RHwszaV5bVI16Ifsa+iXpgK6+PZ
         0JHLFI8RtXiDWZ837jYfubTR/rPkuwv7rHhPNwfXGOXN4RqRRi+C/oDdlPUIH76f0kl3
         vWDQ==
X-Gm-Message-State: AOAM531EuzLbBHlyYcasHu6YL9uHbOBAp0y1Rvo/ekTbPeQ2Hdgg7z+p
        EyZvosC2FSLQb0O/tS0AEsA1l3VO
X-Google-Smtp-Source: ABdhPJwijzvXUhHB1cWNjbp+IyIdvfwJ/g3/B6wrtnXMMNBAx3InRW2HYclxM99kZ67192i60+eeUw==
X-Received: by 2002:adf:810a:: with SMTP id 10mr23225239wrm.101.1589846090258;
        Mon, 18 May 2020 16:54:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id w20sm1509728wmk.25.2020.05.18.16.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 16:54:49 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Junio C Hamano <gitster@pobox.com>,
        =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?= 
        <congdanhqx@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH] univ-init: conditionally accept { 0 } without warnings
Date:   Tue, 19 May 2020 01:54:46 +0200
Message-Id: <20200518235446.84256-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In standard C '{ 0 }' is valid to initialize any compound object.
OTOH, Sparse allows '{ }' for the same purpose but:
1) '{ }' is not standard
2) Sparse warns when using '0' to initialize pointers.

Some projects (git) legitimately like to be able to use the
standard '{ 0 }' without the null-pointer warnings

So, add a new warning flag (-Wno-universal-initializer) to
handle '{ 0 }' as '{ }', suppressing the warnings.

Reference: https://lore.kernel.org/git/1df91aa4-dda5-64da-6ae3-5d65e50a55c5@ramsayjones.plus.com/
Reference: https://lore.kernel.org/git/e6796c60-a870-e761-3b07-b680f934c537@ramsayjones.plus.com/
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---

Suggestions for a better name than this -W[no-]universal-initializer
are warmly welcome.

-- Luc


 lib.c                      |  2 ++
 lib.h                      |  1 +
 parse.c                    |  7 +++++++
 sparse.1                   |  8 ++++++++
 token.h                    |  7 +++++++
 validation/Wuniv-init-ko.c | 14 ++++++++++++++
 validation/Wuniv-init-ok.c | 11 +++++++++++
 7 files changed, 50 insertions(+)
 create mode 100644 validation/Wuniv-init-ko.c
 create mode 100644 validation/Wuniv-init-ok.c

diff --git a/lib.c b/lib.c
index f9ec285e8fea..9ee8d3cf6b21 100644
--- a/lib.c
+++ b/lib.c
@@ -295,6 +295,7 @@ int Wtransparent_union = 0;
 int Wtypesign = 0;
 int Wundef = 0;
 int Wuninitialized = 1;
+int Wuniversal_initializer = 1;
 int Wunknown_attribute = 0;
 int Wvla = 1;
 
@@ -782,6 +783,7 @@ static const struct flag warnings[] = {
 	{ "typesign", &Wtypesign },
 	{ "undef", &Wundef },
 	{ "uninitialized", &Wuninitialized },
+	{ "universal-initializer", &Wuniversal_initializer },
 	{ "unknown-attribute", &Wunknown_attribute },
 	{ "vla", &Wvla },
 };
diff --git a/lib.h b/lib.h
index b18295a889cb..5e6db111170a 100644
--- a/lib.h
+++ b/lib.h
@@ -184,6 +184,7 @@ extern int Wtransparent_union;
 extern int Wtypesign;
 extern int Wundef;
 extern int Wuninitialized;
+extern int Wuniversal_initializer;
 extern int Wunknown_attribute;
 extern int Wvla;
 
diff --git a/parse.c b/parse.c
index a29c67c8cf41..48494afc6f2c 100644
--- a/parse.c
+++ b/parse.c
@@ -2750,6 +2750,13 @@ static struct token *initializer_list(struct expression_list **list, struct toke
 {
 	struct expression *expr;
 
+	// '{ 0 }' is equivalent to '{ }' unless wanting all possible
+	// warnings about using '0' to initialize a null-pointer.
+	if (!Wuniversal_initializer) {
+		if (match_token_zero(token) && match_op(token->next, '}'))
+			token = token->next;
+	}
+
 	for (;;) {
 		token = single_initializer(&expr, token);
 		if (!expr)
diff --git a/sparse.1 b/sparse.1
index 574caef3acbb..50e928392573 100644
--- a/sparse.1
+++ b/sparse.1
@@ -428,6 +428,14 @@ However, this behavior can lead to subtle errors.
 
 Sparse does not issue these warnings by default.
 .
+.TP
+.B \-Wuniversal\-initializer
+Do not suppress warnings about 0 used to initialize a null-pointer
+when using '{ 0 }' as initializer.
+
+Sparse issues these warnings by default.  To turn them off, use
+\fB\-Wno\-universal\-initializer\fR.
+.
 .SH MISC OPTIONS
 .TP
 .B \-\-arch=\fIARCH\fR
diff --git a/token.h b/token.h
index 292db167e4a8..33a6eda1cc53 100644
--- a/token.h
+++ b/token.h
@@ -241,4 +241,11 @@ static inline int match_ident(struct token *token, struct ident *id)
 	return token->pos.type == TOKEN_IDENT && token->ident == id;
 }
 
+static inline int match_token_zero(struct token *token)
+{
+	if (token_type(token) != TOKEN_NUMBER)
+		return false;
+	return token->number[0] == '0' && !token->number[1];
+}
+
 #endif
diff --git a/validation/Wuniv-init-ko.c b/validation/Wuniv-init-ko.c
new file mode 100644
index 000000000000..315c211a5db6
--- /dev/null
+++ b/validation/Wuniv-init-ko.c
@@ -0,0 +1,14 @@
+struct s {
+	void *ptr;
+};
+
+
+static struct s s = { 0 };
+
+/*
+ * check-name: univ-init-ko
+ *
+ * check-error-start
+Wuniv-init-ko.c:6:23: warning: Using plain integer as NULL pointer
+ * check-error-end
+ */
diff --git a/validation/Wuniv-init-ok.c b/validation/Wuniv-init-ok.c
new file mode 100644
index 000000000000..c39647517323
--- /dev/null
+++ b/validation/Wuniv-init-ok.c
@@ -0,0 +1,11 @@
+struct s {
+	void *ptr;
+};
+
+
+static struct s s = { 0 };
+
+/*
+ * check-name: univ-init-ok
+ * check-command: sparse -Wno-universal-initializer $file
+ */
-- 
2.26.2

