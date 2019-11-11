Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFBBFF754C
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfKKNrz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:47:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39631 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbfKKNrz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:55 -0500
Received: by mail-wm1-f68.google.com with SMTP id t26so13270389wmi.4
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cf5lx7sIDNj0JW07prjcK3ck6kRBbHvHMdBZaYZdeWY=;
        b=uB9Z3VR3DrHxohpewMtEOawgZo9Xa3Ux7XRx1y9RAcy8K9BF+WDVjTGDfmRsELvgYX
         7ZTRD8VuFrddaeZSci/hnqRd0BlZ4IexBdzsD30wJ+fZo9kNvu490HnPgK78BBMbIHeI
         ZuraEOUhm32agda+EDi1nmECpMtU34Z9HA7d5ZS8GhBehT7ZkRhejkc3BCT4FDi5eGDx
         qmUhrSO/5e6vEPgy16SUowsKKFC8HWfvx2b0a5mQP4LzoDay5p/gMFHhz5h/SB+xO7dq
         O+2NlubIO/BEQGPPgSrZvuVI0KAJM0PNPkPNWbJEEyEeC1QQMrDhwXLWbdBhrEcUFEw1
         Jesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cf5lx7sIDNj0JW07prjcK3ck6kRBbHvHMdBZaYZdeWY=;
        b=Xb72XfGiivd6KHN/gWCv2tUdz8Vs1jWJKvwcK/Vp4L0aT2ab3DJNV5NohYmvPI+cUy
         /0pyGooj7InYEMeAXhGSZvDMwSoPJEd3eCjpE25y9lOIp4QOtLb84BH8eoe9teT1NM6F
         L6hUxQVWRzELri/l9fRdfD29amRHDdBlD+U/3dwCQk9Gosndd+6mGEts1qWOTmncY3sw
         OGp4ZovX/yNXozcqMHfkSAXNSav4IQQ993RAaxlr7xi4PKDc/jHhn0DBf7wCf7Zw1nyV
         /OEw925DuYSJVkVi4UG2vqgrz7EGBOvIBxCDGwbtXYpdoUlsMCIyxG5V2SgwxCfggXtd
         GCYg==
X-Gm-Message-State: APjAAAV4y6VBcWmrI2k+ysqudfT5IqCcCUI2d1hsNpBeEk7O6qjejnXQ
        aPdosSGSQ5rS8H50P1VgrVflVZAs
X-Google-Smtp-Source: APXvYqw1VAgavg1/EMLink1fGywO+ydAsoj1ll7u7kGZrwyUT296nzICvWT5HBZKMDWH6KOR8fqaWw==
X-Received: by 2002:a1c:6405:: with SMTP id y5mr22164489wmb.175.1573480072828;
        Mon, 11 Nov 2019 05:47:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:52 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/9] spec: process chars like other integer types
Date:   Mon, 11 Nov 2019 14:47:39 +0100
Message-Id: <20191111134747.79516-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When parsing specifiers, Sparse process chars independently
of other integers. But this is not necessary (as long as the
proper see/test/set flags are correct).

Change this by processing chars the same as other integers
but 'below' shorts.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/parse.c b/parse.c
index 4b0a1566c..66e177561 100644
--- a/parse.c
+++ b/parse.c
@@ -112,7 +112,7 @@ enum {
 };
 
 enum {
-	CInt = 0, CSInt, CUInt, CReal, CChar, CSChar, CUChar,
+	CInt = 0, CSInt, CUInt, CReal,
 };
 
 enum {
@@ -248,7 +248,7 @@ static struct symbol_op char_op = {
 	.type = KW_SPECIFIER,
 	.test = Set_T|Set_Long|Set_Short,
 	.set = Set_T|Set_Char,
-	.class = CChar,
+	.class = CInt,
 };
 
 static struct symbol_op int_op = {
@@ -1554,20 +1554,18 @@ Catch_all:
 }
 
 static struct symbol * const int_types[] =
-	{&short_ctype, &int_ctype, &long_ctype, &llong_ctype, &lllong_ctype};
+	{&char_ctype, &short_ctype, &int_ctype, &long_ctype, &llong_ctype, &lllong_ctype};
 static struct symbol * const signed_types[] =
-	{&sshort_ctype, &sint_ctype, &slong_ctype, &sllong_ctype,
+	{&schar_ctype, &sshort_ctype, &sint_ctype, &slong_ctype, &sllong_ctype,
 	 &slllong_ctype};
 static struct symbol * const unsigned_types[] =
-	{&ushort_ctype, &uint_ctype, &ulong_ctype, &ullong_ctype,
+	{&uchar_ctype, &ushort_ctype, &uint_ctype, &ulong_ctype, &ullong_ctype,
 	 &ulllong_ctype};
 static struct symbol * const real_types[] =
 	{&float_ctype, &double_ctype, &ldouble_ctype};
-static struct symbol * const char_types[] =
-	{&char_ctype, &schar_ctype, &uchar_ctype};
 static struct symbol * const * const types[] = {
-	int_types + 1, signed_types + 1, unsigned_types + 1,
-	real_types + 1, char_types, char_types + 1, char_types + 2
+	int_types + 2, signed_types + 2, unsigned_types + 2,
+	real_types + 1,
 };
 
 struct symbol *ctype_integer(int size, int want_unsigned)
@@ -1625,6 +1623,8 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 				size = 2;
 			if (s->op->type & KW_SHORT) {
 				size = -1;
+			} else if (s->op->set & Set_Char) {
+				size = -2;
 			} else if (s->op->type & KW_LONG && size++) {
 				if (class == CReal) {
 					specifier_conflict(token->pos,
-- 
2.24.0

