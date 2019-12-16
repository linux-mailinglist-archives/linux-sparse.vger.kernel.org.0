Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8B6121E5E
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLPWiE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:04 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39745 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfLPWiE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id b72so990088wme.4
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLFVyVBAo+GppIYCM6S67IuRzK5tnx9KslTPhUnJFlc=;
        b=S1InoPUpwLDzLcUoPJ5lt6+ALeq6rluKjqIgXkHvQlw63K0zL5r7lMbvWS8TdaD45N
         phM38mqoSfDnHMg/1PQflG4ugjmq/ZQv+i/JyljHspLsJ0hYrWrn4FcCtdJCrYjaCJEG
         ev/489fRRDq+I11zybTj5fXE5HXnzMjFXUpHj+8XhVp1I6DcPG4eTsNAHvCDNG+kGNHt
         dPQDw/b9l0jxSwkrr5nF9lCbrkm82asPe5iJBJTXGRcUM/8qA8OgJ/oZW2Iuv6Rbk5JD
         eNgGFU9cd68WVopBXq2L9iF1FJ9deXS5igOpej12UsSm/QnJj+l66jLFgJ9onugO8Wyt
         yUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLFVyVBAo+GppIYCM6S67IuRzK5tnx9KslTPhUnJFlc=;
        b=Rd95tng8HqT/Ww7mAI9lyvaXTNh5hdJza/EPSX2JNjmlfeWs93ppA6IwWe9TWcyzjx
         NtxNqMUpR0OaKOXOz+68wZ5+uLDhCfg/MUcQwi3Wb3FMvr17Q0BveuHxW5P3SMyNs/B9
         LrzDx++G7XFseCjtrqUJRMCAdd30A03lvj310tjepsAfcbGL3jA2/Sb5gGM4Y4owDxI0
         aGaYqPjsEbRH807Y8vELNtukN5md3WFoKvsoxNONc02bizlb6qjYB5f9E9ttLCEW9JyL
         mJhHkvCaqeYGZAaMwxF6PDJ+ItziIILAtUzyWrqPQgXmy4CwIja2uMwzzmQORrOt1+9C
         2RSg==
X-Gm-Message-State: APjAAAVVZ8ae5dRfFjlrFdlj8iZrnBB0NTkk6AmLr1l6It4IwbWLFaAc
        dH4yJHEDCm/cd9gqpFEfiqn73Fkv
X-Google-Smtp-Source: APXvYqw4kkIip5BZThTHo7LJO/oMnb9KHVSsvK/xuxV0QwmMYRuudq9rQKzFOlr8lT/+LDHnLKtDvQ==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr1491771wme.125.1576535882013;
        Mon, 16 Dec 2019 14:38:02 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:01 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 02/10] cgcc: rename 'ppc64+{be,le}' to 'ppc64{be,le}'
Date:   Mon, 16 Dec 2019 23:37:48 +0100
Message-Id: <20191216223756.2428-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The spec names 'ppc64+{be,le}' had the '+' to force them
to be internal names but are also useful as external names
(it helps to make systematic testing of the arch-specific code).

So rename them to 'ppc64{be,le}'.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/cgcc b/cgcc
index fc6f50f103eb..9c6ad88367c1 100755
--- a/cgcc
+++ b/cgcc
@@ -286,9 +286,9 @@ sub add_specs {
 	return (
 		' --arch=ppc64' .
 		&float_types (1, 1, 21, [24,8], [53,11], [113,15]));
-    } elsif ($spec eq 'ppc64+be') {
+    } elsif ($spec eq 'ppc64be') {
 	return &add_specs ('ppc64') . ' -mbig-endian -D_CALL_ELF=1';
-    } elsif ($spec eq 'ppc64+le') {
+    } elsif ($spec eq 'ppc64le') {
 	return &add_specs ('ppc64') . ' -mlittle-endian -D_CALL_ELF=2';
     } elsif ($spec eq 's390x') {
 	return (' -D_BIG_ENDIAN' .
@@ -328,7 +328,7 @@ sub add_specs {
 	} elsif ($gccmachine =~ '^i[23456]86-') {
 	    return &add_specs ('i386');
 	} elsif ($gccmachine =~ '^(powerpc|ppc)64le-') {
-	    return &add_specs ('ppc64+le');
+	    return &add_specs ('ppc64le');
 	} elsif ($gccmachine =~ '^s390x-') {
 	    return &add_specs ('s390x');
 	} elsif ($gccmachine eq 'x86_64-linux-gnux32') {
@@ -353,9 +353,9 @@ sub add_specs {
 	} elsif ($arch =~ /^(ppc)$/i) {
 	    return &add_specs ('ppc');
 	} elsif ($arch =~ /^(ppc64)$/i) {
-	    return &add_specs ('ppc64+be');
+	    return &add_specs ('ppc64be');
 	} elsif ($arch =~ /^(ppc64le)$/i) {
-	    return &add_specs ('ppc64+le');
+	    return &add_specs ('ppc64le');
 	} elsif ($arch =~ /^(s390x)$/i) {
 	    return &add_specs ('s390x');
 	} elsif ($arch =~ /^(sparc64)$/i) {
-- 
2.24.0

