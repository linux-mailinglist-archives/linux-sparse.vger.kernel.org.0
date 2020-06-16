Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033551FC0AD
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 23:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgFPVLL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 17:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFPVLK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 17:11:10 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A238FC061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:11:10 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so23292545ejd.0
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5mImBfhjupddSIyOzvHlv0zH9yYSYGlSzBTALSy5MI=;
        b=siB8XyewO2DBfFvgDQ666TGmlOqTRwN0T0lSYCOAzboL6StBiWXpOU6PfHUX49Wy6E
         PcR8kl2rFnEiM5a84CRgdwoSI5oyJYi02pClDYnYPZkcH+SfsQHVfE64Bq5WcHmqBVsJ
         VV6bqv+2lcrdzMz9Bn8+wAGQ13ymxizdFs/B5RJwGBy334O+oVA21Yp8BoqX0kHHlMts
         164DADalH/GAv6+vNMcn+pweFO74ePuBiADxjaKgzLeM/kHXI4B/l3foQlBDpjPpwYvV
         FwuzrOBTGob5CK2wUN/jvNNmc55Nj+7jPyl4MT1+J9UVUcTkf6IeG1BBjZAiAI7267fa
         o56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5mImBfhjupddSIyOzvHlv0zH9yYSYGlSzBTALSy5MI=;
        b=RnhUdo7gZUVq1C1DS3rkRyVMe9HlxA2ulDivVFOjhpdNPJTJCHbJ9EUZ41iCgLQ7k/
         7pjKRKnyVRYVPNYVL4eQPb+jpmX95UuTLcU5G0pPxlPwpIzoJh3vOe/j/zU+lL0inizK
         EcKlt9wGegoPMF0tnGu+FRIvsvertINAY7Y3UwJbKit/xOThBTokSI820Ip+dZ1atTH5
         AGZjVuGTKCG8acL+gsMFMAtp0FMOXWu2yRUApKTWMLliM7fvkr/r+amcaq21+zaW+WVN
         YeE5mrGbCJS2QyyeJNdbswHwWV6a/pb4W+VtfcR2fORT/2NFBb2kff0hTw8Ktu1ZjIF9
         iHRg==
X-Gm-Message-State: AOAM530J1Hg//HK89ahKUQuY9DVA8RdpKRIPUhtDMB0+VdZUJzpkhMlC
        C3QQGwL6NgpLP1TkNzYyFaAlB9qf
X-Google-Smtp-Source: ABdhPJwCeztkZPm+6eLAiC8BL4/Nju56R1dnNZNN/ocYISNgvOLAf64fLHfPv+hici7xvuHiPz9usQ==
X-Received: by 2002:a17:907:42d2:: with SMTP id ng2mr4417214ejb.301.1592341869203;
        Tue, 16 Jun 2020 14:11:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id j5sm10735287edk.53.2020.06.16.14.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 14:11:08 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: be less paranoid with timeout
Date:   Tue, 16 Jun 2020 23:11:06 +0200
Message-Id: <20200616211106.78251-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

For some testcases, the testsuite use the command 'timeout'
to ensure that the test finish after a reasonable amount of
time. This is mainly used for some testcases which, in the past,
were stuck in an infinite loop. This the command 'timeout' is
used with an extra option (-k 1s) to issue a second kill signal
in case the first one would have been ignored.

However, this extra option is not supported on all implementations
(Alpine) and its use seems a bit paranoid for sparse.

So, remove this extra option.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/test-suite | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/validation/test-suite b/validation/test-suite
index 64a3e08fb4dd..a22f70135fb3 100755
--- a/validation/test-suite
+++ b/validation/test-suite
@@ -338,7 +338,7 @@ do_test()
 	# do we want a timeout?
 	pre_cmd=""
 	if [ $check_timeout -ne 0 ]; then
-		pre_cmd="timeout -k 1s $check_timeout"
+		pre_cmd="timeout $check_timeout"
 	fi
 
 	shift
-- 
2.27.0

