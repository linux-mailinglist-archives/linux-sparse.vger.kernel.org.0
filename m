Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD81CBE79
	for <lists+linux-sparse@lfdr.de>; Fri,  4 Oct 2019 17:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389210AbfJDPEi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 4 Oct 2019 11:04:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40492 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388802AbfJDPEh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 4 Oct 2019 11:04:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id l3so7625139wru.7
        for <linux-sparse@vger.kernel.org>; Fri, 04 Oct 2019 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=xOBln9xUwh8cFa7kvlBorqZsvs1xaKb8M0NOfbfetq8=;
        b=F4iVK/lJpNk28PnFd8MFXAqYzQSGPwyVKDiq83/VmH7OmJ+V6pr99Yk2f0ZUZbb3VK
         emWZavRC74ht+F+yE0vIlA16nGJkEo8DSsPC4Dj6bYGSvJlS7T+yPXbzdFzZ/t90MaiK
         UHKG+6Dvxbg8a/HgVVuznBd+w8NY9NCbGqF7WG4+kd1Jjge3WzIV3pVOjrSWB8+taPGn
         YntaNIp7xUofq/y3Jid6VFGlGDHIe/j5U+fz42OJWwaHE8u3Oyal1oz4ZL0xquqJQNYQ
         vMMSLRNtcBG48YbdmGThtIWrRkFZwofOO1otGgM4SLxAw3o1KGRwd7gnb5U/lj5zxjyt
         1dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xOBln9xUwh8cFa7kvlBorqZsvs1xaKb8M0NOfbfetq8=;
        b=aJstkexC7eYVBajoHJFp7lTIu/ng812Ae4LxQfiFk/OtfT+5VaSDsbSA0fQ1SunZ5z
         JMD4k8vpCG7LBg/kUCAPnvKuVuM+RyYFlJcHDHAMzjrJSL4uujsg6mp0bA/pCqZBCqq5
         hzhmlIZQ7Rlfzyqr8fyl7HEzdYyOPwDMrJOFnVYvekPolnvgNbammOve+RGmGFnzDOWG
         936I2lyzuKJlYOuaBivVDtqPumYXHnGDoPl0H6PwcIILAFZtRg1RTCkMqvdTINR9bTuA
         wb1oNqOcn9LkQD0CILoXd/yIr36n3vjErM1BEEyFXNjLzVEKqj+tyoV9wRnpNIWiin/a
         PxKQ==
X-Gm-Message-State: APjAAAUKbZyYrRXpv4JdYFQwXjyrO1HRt7c8+io+sDh28lKuCShmGUlj
        BpOCBJKCpjK3vnHxTWe5Gup0K7P9JfU=
X-Google-Smtp-Source: APXvYqz1p19pWf6G8WN/2N7kihLDcbBpacOgAWULHh36jmJxeFYinkBBkZQLekmAW9xoB08HPKva/A==
X-Received: by 2002:adf:e341:: with SMTP id n1mr7610763wrj.133.1570201475775;
        Fri, 04 Oct 2019 08:04:35 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id a18sm12179626wrs.27.2019.10.04.08.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 08:04:35 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org, dan.carpenter@oracle.com
Cc:     linux-sparse@vger.kernel.org
Subject: [PATCH 1/1] Makefile: Add back rule to make (touch) check_list_local.h
Date:   Fri,  4 Oct 2019 16:04:34 +0100
Message-Id: <20191004150434.2299-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Fixes compile error:
  make: *** No rule to make target 'check_list_local.h', needed by 'smatch.o'. Stop.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 7fc69162..dc37ae2f 100644
--- a/Makefile
+++ b/Makefile
@@ -257,6 +257,9 @@ SMATCH_LDFLAGS := -lsqlite3  -lssl -lcrypto
 smatch: smatch.o $(SMATCH_FILES) $(SMATCH_CHECKS) $(LIBS)
 	$(QUIET_LINK)$(LD) -o $@ $< $(SMATCH_FILES) $(SMATCH_CHECKS) $(LIBS) $(SMATCH_LDFLAGS)
 
+check_list_local.h:
+	touch check_list_local.h
+
 smatch.o: smatch.c $(LIB_H) smatch.h check_list.h check_list_local.h
 	$(CC) $(CFLAGS) -c smatch.c -DSMATCHDATADIR='"$(SMATCHDATADIR)"'
 
-- 
2.17.1

