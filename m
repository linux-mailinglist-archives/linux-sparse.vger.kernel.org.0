Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA6CCE9AB1
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 12:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfJ3LWd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 07:22:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35264 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJ3LWd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 07:22:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id x5so1731019wmi.0
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrUjM85W0jeYjhCDGBC00zMoasMygQ3B59kDd+sFfFU=;
        b=sPLriy5b2l0DPf67b98FHiXS62npMSPICzow64Jm2Z9cKWXwRii/pZCdFEY4Tog6+u
         GjOlAV4X0nxN5aTjSbZ0Vea778CIu3PHHb5SoXZQ4sxrrsQGoUC0pLvl9qtEs8XcLADK
         p5NGTV6mQ7A9q0PBCNcEDam5qaxYTABR473r1P85OPQi/eTPaKpCDGhGk1A/zVyeQhm8
         irg2sw7v8UFtZtdV1caHfRAsuWSY6IIW94NmbpEactzHR00M05SjMFsvvgYjJ/JwBnSU
         5IYWGyCG+4WqFyebCBK12lyfAGccJi2fApNJKSb5Wy4FQJxDBfkqlCkiHcXIcV39/Thq
         UU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrUjM85W0jeYjhCDGBC00zMoasMygQ3B59kDd+sFfFU=;
        b=HwT+e76Qkr8A6DKstLWtwuA6V6tcwg5zYALLViDzepuE7i5iqMblYrGR9hVfXCzR1l
         p0EI/+/jnR0vPXSGAhganBB935Yd2Q+f0cPSGRXxm8NwWk820v0t5TVcO8jF2K2OwCQ+
         S8wE0egumYJMPWnx0PY3Ml0I0s0q6iID3vyy1JfBr+9+S+3zlk5TQOYp8s+rkzEYho6y
         jmJmqGnaP7lwVXJbdg+F5ASBOz7wGKZQQlXc2BDCs7SD1VBNOd2vSfEVNUVSlB1kXX4L
         /n8Qsj34rDwbl5bn8xykMnhAJIYilQrPwDcwNTFOPcbmyBOvDCR/FRklcyrm9AEosGA2
         CGXg==
X-Gm-Message-State: APjAAAVG7s0R7nH6G3caSQWXPS8g7cXSw2kAOt5dD20bshwVzt8//AT3
        8PIyaGy1daWU3210IawpMV0ocUj8
X-Google-Smtp-Source: APXvYqw8Gxhk36Q//Q5mVStHhVjJtsVOyhPbegRDgE3SXzFXpQ/jFGa3djo4Z/q9mDG/LGNLBkxW6Q==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr8143334wmc.32.1572434550242;
        Wed, 30 Oct 2019 04:22:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id a2sm2212759wrv.39.2019.10.30.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 04:22:29 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: clarify testsuite report
Date:   Wed, 30 Oct 2019 12:22:20 +0100
Message-Id: <20191030112220.5396-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The known-to-fail report of the summary 'line' is
displayed on a second line.

This is somehow annoying, so reformat slightly the summary
to hold in a single line and hopely be clearer too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/test-suite | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/validation/test-suite b/validation/test-suite
index 64a3e08fb..d8ec577d4 100755
--- a/validation/test-suite
+++ b/validation/test-suite
@@ -438,10 +438,7 @@ do_test_suite()
 
 	# prints some numbers
 	tests_nr=$(($ok_tests + $ko_tests))
-	echo "$OK: out of $tests_nr tests, $ok_tests passed, $ko_tests failed"
-	if [ "$known_ko_tests" -ne 0 ]; then
-		echo "	$known_ko_tests of them are known to fail"
-	fi
+	echo "$OK: passed tests: $ok_tests/$tests_nr, failed: $ko_tests/$known_ko_tests"
 	if [ "$unhandled_tests" -ne "0" ]; then
 		echo "	$unhandled_tests tests could not be handled by $prog_name"
 	fi
-- 
2.23.0

