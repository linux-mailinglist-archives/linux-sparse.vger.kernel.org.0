Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7906C200E04
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 17:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391101AbgFSPEH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 11:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390621AbgFSPEG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 11:04:06 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49C2C0613EE
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:05 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id y13so10552741eju.2
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lV6OqpCcdFW1iNc4Mmd1dUSVfQ/k1JX9QKPvgvI0AAo=;
        b=rK90Oo36aE2/zMwrVszzlDVjv/S2FqrFg2kG/TQGfTb6XBj9O19QomD9W6Pls3CcfW
         VyIbX8YlEVIxeTeL69BGttvIv/rFp01m2G1kbXWu0BWu/g+QwnyZM0MpXpoYVV4qRztf
         F009pSA9eqqQI6mDClfGVsaC+uidRpr8IDto2dAPi6DrKC97l+wQSMrxEtJ8CY06d7ix
         arO0EZSH9kp3tUdXvqEbCTbikh4TCxmhIJQpMPEEsWxM3ZePKO0Kwi/A7EIUrgkjcAs0
         DHsIbYzqT7ptF22lR3QmXNSsToxQt0gQOEXlMmkJh08nrF8A+6xO2+JeO8rRfe6eqAKu
         zdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lV6OqpCcdFW1iNc4Mmd1dUSVfQ/k1JX9QKPvgvI0AAo=;
        b=U3DyMekLmcLh8kTCJ39eKRJyTLAY0yIs5G7iLOB35vqEMQmk74ic7+XS5a/ykW7Kd/
         wLFcHzIwUkziDLI3XWmebktcWVs+Df0Er1JCHXEYns1c6XoFDLHurjhYKWj0/SOxJqk6
         PJ0Z9z61/p4hs1oB+j4BMkVgKE9raDc36kT/DJ4bjcyuduFG/4VWiG4fJjATENM2l0oL
         7tBKx8RLTTQAcQoxW0rIcn/pyudsxv8mbol9ZVV8Mnbdpxg2pqk2Z4KUm/eiGmwd/1ih
         ntxIt/PmTQPXFM59Ofjo5PxXfAwyJPrhKubAQ3Bd1goR2gudWcHFJ+d3LInFI//eiz/+
         fziQ==
X-Gm-Message-State: AOAM530ZzM+/PIHImSbqew6SLPxImatHxbV1rHwvvw+xNfy2tQqaeUPi
        25DNAxrjWhJBpPosPv/ypXgF+FdO
X-Google-Smtp-Source: ABdhPJyv7QXEiksCjyYNxjxrrqSQhHg0k5ZpdKiN63yhCz5EK1++pDB/0wf3D5wKaqjCwg/ub8J1UA==
X-Received: by 2002:a17:906:f74a:: with SMTP id jp10mr4049752ejb.43.1592579044018;
        Fri, 19 Jun 2020 08:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5db0:70:8732:dad2])
        by smtp.gmail.com with ESMTPSA id k22sm4852307edr.93.2020.06.19.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:04:03 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/5] gensel: add testcases from DR481
Date:   Fri, 19 Jun 2020 17:02:56 +0200
Message-Id: <20200619150300.63695-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
References: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Following the resolution of DR481, the controlling expression
is subject to a few different rules.

Add the testcases from this defect report.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/generic-dr481.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 validation/generic-dr481.c

diff --git a/validation/generic-dr481.c b/validation/generic-dr481.c
new file mode 100644
index 000000000000..2ed15c9bc6d3
--- /dev/null
+++ b/validation/generic-dr481.c
@@ -0,0 +1,17 @@
+static char const* a = _Generic("bla", char*: "blu");
+static char const* b = _Generic("bla", char[4]: "blu");
+static char const* c = _Generic((int const){ 0 }, int: "blu");
+static char const* d = _Generic((int const){ 0 }, int const: "blu");
+static char const* e = _Generic(+(int const){ 0 }, int: "blu");
+static char const* f = _Generic(+(int const){ 0 }, int const: "blu");
+
+/*
+ * check-name: generic-dr481
+ * check-known-to-fail
+ *
+ * check-error-start
+generic-dr481.c:2:32: error: no generic selection for 'char *'
+generic-dr481.c:4:32: error: no generic selection for 'int const [toplevel]'
+generic-dr481.c:6:32: error: no generic selection for 'int'
+ * check-error-end
+ */
-- 
2.27.0

