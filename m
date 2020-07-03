Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16867213055
	for <lists+linux-sparse@lfdr.de>; Fri,  3 Jul 2020 02:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGCAHA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 2 Jul 2020 20:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgGCAHA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 2 Jul 2020 20:07:00 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2846C08C5C1
        for <linux-sparse@vger.kernel.org>; Thu,  2 Jul 2020 17:06:59 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id lx13so13260558ejb.4
        for <linux-sparse@vger.kernel.org>; Thu, 02 Jul 2020 17:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XNqOuyS2SSVizWbbVfENAG37e8e6fv0yRn51lqXxdcI=;
        b=COSSiIxLH9ioAwKAnHl8PBdrYVLtcTN6Ux5hYtygAwNtKWu4v9/H6xACW6Pj+bipKp
         VSzRRDTQvuEV9Iks7Uf51IxdUjJ/BPEHCTvO5UUrzZT6R/ZqaP4MjRiNz5hTlpS1XXkw
         9OlN/u1+gVNm71f5Zp9LDaBsO5aqFovTIhtF1kEuqZBIIz21v3YGbJXsaavyO4ro0wup
         P/uhFvwN4N3w2kFTKkMvvgZvEr1TSjULZI8XqvgGowmRrvMVt1BF6o2ylx0uoLMUd9Yg
         H55IkKVDzUXWP7V9M83sfkPYNjnVUE4NXcdf428KQH8TzfTEU6MqO17QaocE9US/6TZ9
         HM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XNqOuyS2SSVizWbbVfENAG37e8e6fv0yRn51lqXxdcI=;
        b=IT9VROFqjeTkEYBoORoEqzv+IAPrigh4eot1C9RnK8ojdtJYWPVYM0ogdT9odgD9Bo
         oV4TLCl2QG2vJEBs6YjlETrSDSuXPkWykAN2QvO+WDv9616IXTU8RvvwAC8btUSvZGiJ
         QvtcOo97sh5AvbniiKVkGACpNLpMhbJU6LF4xGvADT+NSBKUjetPM1bkp4YxTtLt2qAc
         Os3om8dFWQTubvu3A4yVu+6E3Hloht9GDS+rQ70VJg8HBjlRAwSH6gF4BU40z4MyQAiN
         DtQeFnf/JjRC8vJGg5c0OamDns4GYjgbcA9T7APb5Uqpol0hfAkXo4d8NN7gkS/1SybC
         gDzg==
X-Gm-Message-State: AOAM530to1lwJSK7yzpCSSpDfyvlwkp1YkdQJ9o9LRszf4vBrUF1SuLx
        C7DRmzYqe87awB9gwgNItSCwvRu/
X-Google-Smtp-Source: ABdhPJxPjhoOeGekUqvRNaYSWs7Fum6E2UZKqky2JgmGy+5NdVkK8pq3PDBOZOrAc3UQd/ZvUBt9fA==
X-Received: by 2002:a17:906:3446:: with SMTP id d6mr24818521ejb.323.1593734818437;
        Thu, 02 Jul 2020 17:06:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:bd38:c82d:5283:9f1])
        by smtp.gmail.com with ESMTPSA id c4sm8009530ejb.17.2020.07.02.17.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 17:06:58 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: add new flag '-p' to subcommand 'format'
Date:   Fri,  3 Jul 2020 02:06:55 +0200
Message-Id: <20200703000655.55894-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This flag facilitate the creation of testcases for preprocessing.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/test-suite | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/validation/test-suite b/validation/test-suite
index d351ebf3c428..f7d992dc7c8c 100755
--- a/validation/test-suite
+++ b/validation/test-suite
@@ -458,6 +458,7 @@ echo "options:"
 echo "    -a                         append the created test to the input file"
 echo "    -f                         write a test known to fail"
 echo "    -l                         write a test for linearized code"
+echo "    -p                         write a test for pre-processing"
 echo
 echo "argument(s):"
 echo "    file                       file containing the test case(s)"
@@ -483,6 +484,9 @@ do_format()
 		-l)
 			def_cmd='test-linearize -Wno-decl $file'
 			linear=1 ;;
+		-p)
+			def_cmd='sparse -E $file' ;;
+
 		help|-*)
 			do_format_help
 			return 0
-- 
2.27.0

