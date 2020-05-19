Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24E11D8CA2
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgESA5f (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgESA5e (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:34 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D32FC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:34 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id k19so10173590edv.9
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1Q47XVPvaJmdxhAnXLV3TDObJIiy+X0uI1Xw3tp+nk=;
        b=OZ7LIR81BpOHVbn5g54Pt9ivVCabPqc3z/rN0h/9TZD5HrZA+mhzQPSraS1IuFm/6L
         YjR0hVCDMPANobyMHofwAZtuAXL9mWAkIqwlcU3jhNrXrsDO73NM6YZBtlC7xPo2it/9
         0lbt0aDIzG60QslbeICwG5fVMJNiM1gJlzfJgGVswaC7mbZbAnUaJOsm0GfwtQDXbhsT
         OFwZcOW4N4V1IkKhMJg5EwsZqXilHggMHiEa4KslXUSiwINRCg11A/s4fowED4QqVaEk
         2T7rgtfacV23+m0ildCtxJja5Q+g/69s6R4WDDgnWYG04MyumFETxJL+RdZAULZMj0lE
         iYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1Q47XVPvaJmdxhAnXLV3TDObJIiy+X0uI1Xw3tp+nk=;
        b=bANdSBoAEqe0bWMK+NXkplyLEpVDMtTmshuUnlIMOy/Fi5ggi8CgsN53RnsvdGSDQU
         RT7SsiU8wr+FafVa6b2PFdH4zThPx8R6VC30AtxoZdvCK5JxcHVRbJZsaLK02ASASAVu
         Rgt5bzbrtJ2XPtlFTVNe+MkanOwB/q2ZTfCG449cV2jTK1E91PwM5SWLgBRRWN0oRgyj
         GI46h8vZjvm3IApM6DnIuivczLIZxLetf3LRIXHB+JX18uv994xJdfj4r+DOOQ+Fzm3I
         bJiQiELDLkz2bY2KlN55zwYKZxP4BjhBNCvVueXi9w478pHxQcK9QDZxAJmknlE3wszk
         1zIg==
X-Gm-Message-State: AOAM5303QmDos4tHE2LevVY+F8cUMLEMYMCNpGZXe0jqawxRijPB5UXP
        gjdcOC4czwKYx/MeyToNiM15B39g
X-Google-Smtp-Source: ABdhPJxL2f0j8+icRDmf9x9TbhusAbAJnZlgQMU7lteUdEDFfIOn8sC6f96O2W0hhTJBzmCB09r/xw==
X-Received: by 2002:a50:ed06:: with SMTP id j6mr3073455eds.209.1589849852953;
        Mon, 18 May 2020 17:57:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:32 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 01/28] misc: fix testcase typeof-safe
Date:   Tue, 19 May 2020 02:57:01 +0200
Message-Id: <20200519005728.84594-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This testcase was marked as known-to-fail but it was
simply the expected error messages that were missing.

So, slightly reorganize the test a little bit, add the
expected messages and remove the 'known-to-fail' tag.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/typeof-safe.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/validation/typeof-safe.c b/validation/typeof-safe.c
index 614863fba381..508bd39204c5 100644
--- a/validation/typeof-safe.c
+++ b/validation/typeof-safe.c
@@ -2,16 +2,24 @@
 
 static void test_safe(void)
 {
-	int __safe obj, *ptr;
-	typeof(obj) var = obj;
-	typeof(ptr) ptr2 = ptr;
+	int obj;
+	int __safe *ptr;
+
+	int __safe *ptr2 = ptr;
+	typeof(ptr) ptr3 = ptr;
 	typeof(*ptr) var2 = obj;
-	typeof(*ptr) *ptr3 = ptr;
-	typeof(obj) *ptr4 = ptr;
+	int __safe  var3 = obj;
+	int *ptr4 = &obj;
+	int *ptr4 = ptr;		// KO
+
+	typeof(*ptr) sobj;
+	typeof(&sobj) ptr5 = &obj;
+	typeof(&sobj) ptr6 = ptr;	// KO
+
 	obj = obj;
 	ptr = ptr;
-	ptr = &obj;
 	obj = *ptr;
+	ptr = (int __safe *) &obj;
 }
 
 /*
@@ -19,5 +27,11 @@ static void test_safe(void)
  * check-known-to-fail
  *
  * check-error-start
+typeof-safe.c:13:21: warning: incorrect type in initializer (different modifiers)
+typeof-safe.c:13:21:    expected int *ptr4
+typeof-safe.c:13:21:    got int [safe] *ptr
+typeof-safe.c:17:30: warning: incorrect type in initializer (different modifiers)
+typeof-safe.c:17:30:    expected int *ptr6
+typeof-safe.c:17:30:    got int [safe] *ptr
  * check-error-end
  */
-- 
2.26.2

