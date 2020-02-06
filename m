Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B28154E38
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 22:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgBFVn7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 16:43:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36689 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbgBFVn7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 16:43:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so223143wru.3
        for <linux-sparse@vger.kernel.org>; Thu, 06 Feb 2020 13:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fq3KVehDPG/QwhdUq5zBTNtQIDoQV7dLqjLi7N9aj1w=;
        b=Z+yVABzzsCHe4FilJOQOOr0+x/pkYMVmsX2fPeOfEUstVFRWBjiKpYzQv6zVJDr3Mb
         UAc5qy/uu2VL+vJkCCNaDdIJMj7x6MrLx+2G/kVxqumdQpzj7YGuJv2jmuFISV7wC9tB
         dhCvHEmdN3EAuUrriXNe23RDeWtb9CPgtVnYBzXhKKAjB5tHbP/lnN1ytTi4OqhCVXWJ
         5jZxKi5mCaOudSuefl4VOFVT6qw9Yz8MdXKxJoPIvRLJSKHU8mmwqtXvZ1DDegb46XqD
         YgfSRi7l5Wu6OKQ1iFu7wBurzs2hgQzwYboytnU6p2Osj/EguLyp4fTt2288867QQWnu
         57xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fq3KVehDPG/QwhdUq5zBTNtQIDoQV7dLqjLi7N9aj1w=;
        b=PomygRSUKOYkm6DgnCXd0296MVDzN3v950+Pyq3esUffojDeFZPTcgxroqEIoSaexd
         XTxlVhU9dNbwXvb2x/rzYKGHF1fuHImAJlS1oTZp9uyifWS85iL922edzdNOxhhWpDAL
         aRh5o0BNFm8HspExfbNJrtGAX4PPUgkBW4DpW7u8s3hZGxAPZNbwVxB9iUZt9RBOsFAb
         l5A/G6uw1DFqug11H6tmwMmmN1aCOTla544dvR45KC0HIP0xU3B7gi4v+bXapmqMici7
         jRnQn5PHm0gC40ZGi/YvwJae3BexGoZJVqEoOvSz6MaS8BtebSNvSas1w/D7tPaeZXTK
         Wyxg==
X-Gm-Message-State: APjAAAXiyzPpl908+GcD66Wqc2ImWTZP5H7EsykuLbl3mM12hH1cW7zd
        p9+vfQW0Bte8jGP1vx0VZzqnHWcn/AY=
X-Google-Smtp-Source: APXvYqyaYmg5dPl+a9YwTIT+jmQ5g/6WE8zHISitcinbbsPq15VsBLmuFmAxxoHk5YOb3HFSNmZFQQ==
X-Received: by 2002:adf:9b87:: with SMTP id d7mr62373wrc.64.1581025436199;
        Thu, 06 Feb 2020 13:43:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4017:df00:7c4c:6743:ca73:a9e5])
        by smtp.gmail.com with ESMTPSA id 18sm860647wmf.1.2020.02.06.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 13:43:55 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] fix type compatibility of _Atomic
Date:   Thu,  6 Feb 2020 22:43:51 +0100
Message-Id: <20200206214351.20197-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When _atomic was introduced, for most purposes it was treated
like the other qualifiers.

However, it's best to consider _Atomic as an qualifier only for
syntaxic reasons. In particular, an _Atomic type may have different
size and alignment that its corresponding unqualified type.
Also, an _Atomic type is never compatible with its corresponding
unqualified type, and thus, for type checking, this qualifier must
never be ignored.

Fix this by removing MOD_ATOMIC from MOD_QUALIFIER. Essentially, this
has the effect to stop to ignore MOD_ATOMIC when comparing types.

Fixes: ffe9f9fef003d29b65d29b8da5416aff72baff5a
Repoted-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.h                 |  6 ++---
 validation/c11-atomic.c  | 58 +++++++++++++++++++++++++---------------
 validation/typeof-mods.c |  2 +-
 3 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/symbol.h b/symbol.h
index 9ef5a886172f..2b8aa2d831dd 100644
--- a/symbol.h
+++ b/symbol.h
@@ -248,10 +248,10 @@ struct symbol {
 #define MOD_SIGNEDNESS	(MOD_SIGNED | MOD_UNSIGNED | MOD_EXPLICITLY_SIGNED)
 #define MOD_SPECIFIER	MOD_SIGNEDNESS
 #define MOD_IGNORE	(MOD_STORAGE | MOD_ACCESS | MOD_USERTYPE | MOD_EXPLICITLY_SIGNED | MOD_EXT_VISIBLE)
-#define	MOD_QUALIFIER	(MOD_CONST | MOD_VOLATILE | MOD_RESTRICT | MOD_ATOMIC)
-#define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)
+#define MOD_QUALIFIER	(MOD_CONST | MOD_VOLATILE | MOD_RESTRICT)
+#define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_ATOMIC | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)
 /* modifiers preserved by typeof() operator */
-#define MOD_TYPEOF	(MOD_QUALIFIER | MOD_NOCAST | MOD_SPECIFIER)
+#define MOD_TYPEOF	(MOD_QUALIFIER | MOD_ATOMIC | MOD_NOCAST | MOD_SPECIFIER)
 /* modifiers for function attributes */
 #define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
 /* like cvr-qualifiers but 'reversed' (OK: source <= target) */
diff --git a/validation/c11-atomic.c b/validation/c11-atomic.c
index 17720861ffb7..85461f64d1d3 100644
--- a/validation/c11-atomic.c
+++ b/validation/c11-atomic.c
@@ -6,7 +6,7 @@ void f03(int _Atomic *dst);
 int _Atomic qo;
 int         uo;
 
-void f00(int dst)	  { }	/* check-should-pass */
+void f00(int dst)	  { }	/* check-should-fail */
 void f01(typeof(&qo) dst) { }	/* check-should-pass */
 void f02(int *dst)	  { }	/* check-should-fail */
 void f03(typeof(&uo) dst) { }	/* check-should-fail */
@@ -21,12 +21,12 @@ void ref(void)
 {
 	const int qo;
 	int uo;
-	extern const int *pqo;
-	extern       int *puo;
+	const int *pqo;
+	      int *puo;
 
 	pqo = &qo;		/* check-should-pass */
 	pqo = &uo;		/* check-should-pass */
-	pqo = puo;
+	pqo = puo;		/* check-should-pass */
 
 	puo = &uo;		/* check-should-pass */
 
@@ -36,12 +36,12 @@ void ref(void)
 
 void bar(void)
 {
-	extern int _Atomic *pqo;
-	extern int         *puo;
+	int _Atomic *pqo;
+	int         *puo;
 
 	pqo = &qo;		/* check-should-pass */
-	pqo = &uo;		/* check-should-pass */
-	pqo = puo;
+	pqo = &uo;		/* check-should-fail */
+	pqo = puo;		/* check-should-fail */
 
 	puo = &uo;		/* check-should-pass */
 
@@ -51,12 +51,12 @@ void bar(void)
 
 void baz(void)
 {
-	extern typeof(&qo) pqo;
-	extern typeof(&uo) puo;
+	typeof(&qo) pqo;
+	typeof(&uo) puo;
 
 	pqo = &qo;		/* check-should-pass */
-	pqo = &uo;		/* check-should-pass */
-	pqo = puo;
+	pqo = &uo;		/* check-should-fail*/
+	pqo = puo;		/* check-should-fail */
 
 	puo = &uo;		/* check-should-pass */
 
@@ -69,6 +69,10 @@ void baz(void)
  * check-command: sparse -Wno-decl $file
  *
  * check-error-start
+c11-atomic.c:9:6: error: symbol 'f00' redeclared with different type (incompatible argument 1 (different modifiers)):
+c11-atomic.c:9:6:    void extern [addressable] [toplevel] f00( ... )
+c11-atomic.c:1:6: note: previously declared as:
+c11-atomic.c:1:6:    void extern [addressable] [toplevel] f00( ... )
 c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type (incompatible argument 1 (different modifiers)):
 c11-atomic.c:11:6:    void extern [addressable] [toplevel] f02( ... )
 c11-atomic.c:3:6: note: previously declared as:
@@ -78,22 +82,34 @@ c11-atomic.c:12:6:    void extern [addressable] [toplevel] f03( ... )
 c11-atomic.c:4:6: note: previously declared as:
 c11-atomic.c:4:6:    void extern [addressable] [toplevel] f03( ... )
 c11-atomic.c:33:13: warning: incorrect type in assignment (different modifiers)
-c11-atomic.c:33:13:    expected int *extern [assigned] puo
+c11-atomic.c:33:13:    expected int *[assigned] puo
 c11-atomic.c:33:13:    got int const *
 c11-atomic.c:34:13: warning: incorrect type in assignment (different modifiers)
-c11-atomic.c:34:13:    expected int *extern [assigned] puo
-c11-atomic.c:34:13:    got int const *extern [assigned] pqo
+c11-atomic.c:34:13:    expected int *[assigned] puo
+c11-atomic.c:34:13:    got int const *[assigned] pqo
+c11-atomic.c:43:13: warning: incorrect type in assignment (different modifiers)
+c11-atomic.c:43:13:    expected int [atomic] *[assigned] pqo
+c11-atomic.c:43:13:    got int *
+c11-atomic.c:44:13: warning: incorrect type in assignment (different modifiers)
+c11-atomic.c:44:13:    expected int [atomic] *[assigned] pqo
+c11-atomic.c:44:13:    got int *puo
 c11-atomic.c:48:13: warning: incorrect type in assignment (different modifiers)
-c11-atomic.c:48:13:    expected int *extern [assigned] puo
+c11-atomic.c:48:13:    expected int *[assigned] puo
 c11-atomic.c:48:13:    got int [atomic] *
 c11-atomic.c:49:13: warning: incorrect type in assignment (different modifiers)
-c11-atomic.c:49:13:    expected int *extern [assigned] puo
-c11-atomic.c:49:13:    got int [atomic] *extern [assigned] pqo
+c11-atomic.c:49:13:    expected int *[assigned] puo
+c11-atomic.c:49:13:    got int [atomic] *[assigned] pqo
+c11-atomic.c:58:13: warning: incorrect type in assignment (different modifiers)
+c11-atomic.c:58:13:    expected int [atomic] *[assigned] pqo
+c11-atomic.c:58:13:    got int *
+c11-atomic.c:59:13: warning: incorrect type in assignment (different modifiers)
+c11-atomic.c:59:13:    expected int [atomic] *[assigned] pqo
+c11-atomic.c:59:13:    got int *puo
 c11-atomic.c:63:13: warning: incorrect type in assignment (different modifiers)
-c11-atomic.c:63:13:    expected int *extern [assigned] puo
+c11-atomic.c:63:13:    expected int *[assigned] puo
 c11-atomic.c:63:13:    got int [atomic] *
 c11-atomic.c:64:13: warning: incorrect type in assignment (different modifiers)
-c11-atomic.c:64:13:    expected int *extern [assigned] puo
-c11-atomic.c:64:13:    got int [atomic] *extern [assigned] pqo
+c11-atomic.c:64:13:    expected int *[assigned] puo
+c11-atomic.c:64:13:    got int [atomic] *[assigned] pqo
  * check-error-end
  */
diff --git a/validation/typeof-mods.c b/validation/typeof-mods.c
index aa880f373088..117269c027ed 100644
--- a/validation/typeof-mods.c
+++ b/validation/typeof-mods.c
@@ -102,7 +102,7 @@ static void test_static(void)
 
 static void test_tls(void)
 {
-	__thread int obj, *ptr;
+	static __thread int obj, *ptr;
 	typeof(obj) var = obj;
 	typeof(ptr) ptr2 = ptr;
 	typeof(*ptr) var2 = obj;

base-commit: 100509c0789f1176fc5881da45917e9af77597ca
-- 
2.25.0

