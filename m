Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403E9282A7A
	for <lists+linux-sparse@lfdr.de>; Sun,  4 Oct 2020 13:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgJDLn5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 4 Oct 2020 07:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgJDLnz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 4 Oct 2020 07:43:55 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75903C0613CF
        for <linux-sparse@vger.kernel.org>; Sun,  4 Oct 2020 04:43:55 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id n15so745083wrq.2
        for <linux-sparse@vger.kernel.org>; Sun, 04 Oct 2020 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7W92ghzttWRReSna6gtAQN6Di0jQj6URH+63EazcdvI=;
        b=K58YjPf75eUzUFGpJK2++TZVTPWcvGHTBkp6BAXC+Y9oILhqaRD5YbNyqNcNqRxDaq
         J5OzCM2g4MFOtdgsbIr9n3qELUKybsLXgaORokHfT3k9cG1ql43LNTKrN5AoKqMecyk0
         mP/Z5qhmOu4A+s3CyJ+cPd/Rq6NmieV7vNPXEcZCZmuj+RuVx27yCIOplBFg4PcotQ0o
         +8CqTQXo3p7Q2rcjhfU9S/T+/3vQj4rsnQIoG/IvAshpptztuV7FVeXzWm1PvZrieb0C
         dixHNA1Ep4x3qlDn59z+OmjdILoHuLS04m79zQgHVsI1H5soBvaTPDCaRsD5UwT1UE3V
         iSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7W92ghzttWRReSna6gtAQN6Di0jQj6URH+63EazcdvI=;
        b=sGd3kb0r5yQsjvZWjfk66xjGpsdoQ8DbCSnZ4mVyn7OqqcCwXV31UUmuYnbB93+i12
         pGTLSy3OEFpZYBQgtERQ2GzkdCrrN6T1CllPHq5ICS7Iyp7EuL4gvj6ihHB3A7sO+R0e
         5g/d6OucbUIgmm/kc0XQGPruq17yF54vLhnz9ivsu1dKyfoMlPrOWUF8WkqB8hb5wX16
         lf7RK2CQnykY2edBcIO6KqymdsEB4qVz+QAP48wORXIfo6nQezlb51Y/gEA3jV7cgV2c
         mwStd/CfESlQgpbTnoqO6ZDz12PCbxwxsgDDThNm+y+FJIw34SDg9bdGXgnwLLSSu4Om
         cwWw==
X-Gm-Message-State: AOAM530ZYcep52V1AiciJyyXXsljeGu/BClHB8LibS2XWnkDgQej9Kr1
        Wa4EgF7AUZA2bNznwtdAnkHkrMmsnUM=
X-Google-Smtp-Source: ABdhPJwejYx7zxT8eEenkQNw/B053COR+Vb2XH+FPmDgao2rbNeFK0QZPL6n4yEjMkMjNjKVxcu+zQ==
X-Received: by 2002:adf:a31a:: with SMTP id c26mr2448759wrb.378.1601811833881;
        Sun, 04 Oct 2020 04:43:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:f14e:9b66:59e7:4769])
        by smtp.gmail.com with ESMTPSA id l19sm8244801wmi.8.2020.10.04.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 04:43:53 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] add builtin types for signed char* and short *
Date:   Sun,  4 Oct 2020 13:43:48 +0200
Message-Id: <20201004114349.81440-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201004114349.81440-1-luc.vanoostenryck@gmail.com>
References: <20201004114349.81440-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is needed for printf format checking of "%hhn" & "%hn".

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 3 +++
 symbol.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/symbol.c b/symbol.c
index 9065bd527d60..a29e0b140d16 100644
--- a/symbol.c
+++ b/symbol.c
@@ -782,6 +782,7 @@ struct symbol	bool_ctype, void_ctype, type_ctype,
 		incomplete_ctype, label_ctype, bad_ctype,
 		null_ctype;
 struct symbol	autotype_ctype;
+struct symbol	schar_ptr_ctype, short_ptr_ctype;
 struct symbol	int_ptr_ctype, uint_ptr_ctype;
 struct symbol	long_ptr_ctype, ulong_ptr_ctype;
 struct symbol	llong_ptr_ctype, ullong_ptr_ctype;
@@ -877,6 +878,8 @@ static const struct ctype_declare {
 	{ &null_ctype,         T_PTR(&void_ctype) },
 	{ &label_ctype,        T_PTR(&void_ctype) },
 	{ &lazy_ptr_ctype,     T_PTR(&void_ctype) },
+	{ &schar_ptr_ctype,    T_PTR(&schar_ctype) },
+	{ &short_ptr_ctype,    T_PTR(&short_ctype) },
 	{ &int_ptr_ctype,      T_PTR(&int_ctype) },
 	{ &uint_ptr_ctype,     T_PTR(&uint_ctype) },
 	{ &long_ptr_ctype,     T_PTR(&long_ctype) },
diff --git a/symbol.h b/symbol.h
index f82484f5c978..d39048cb478d 100644
--- a/symbol.h
+++ b/symbol.h
@@ -298,6 +298,7 @@ extern struct symbol	bool_ctype, void_ctype, type_ctype,
 			incomplete_ctype, label_ctype, bad_ctype,
 			null_ctype;
 extern struct symbol	autotype_ctype;
+extern struct symbol	schar_ptr_ctype, short_ptr_ctype;
 extern struct symbol	int_ptr_ctype, uint_ptr_ctype;
 extern struct symbol	long_ptr_ctype, ulong_ptr_ctype;
 extern struct symbol	llong_ptr_ctype, ullong_ptr_ctype;
-- 
2.28.0

