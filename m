Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD1C204484
	for <lists+linux-sparse@lfdr.de>; Tue, 23 Jun 2020 01:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730766AbgFVXfA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 22 Jun 2020 19:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730296AbgFVXe6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 22 Jun 2020 19:34:58 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3B6C061573
        for <linux-sparse@vger.kernel.org>; Mon, 22 Jun 2020 16:34:57 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id k8so14990068edq.4
        for <linux-sparse@vger.kernel.org>; Mon, 22 Jun 2020 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bOzEYv46G7SSKXPlg4AksB81kmKfxj/zxJ/ATdEnNE=;
        b=urAEyY4daOIjoChuYuXtCQuo0G2aQC+d8KkRF7I3X1vj8uScdvqX7HoUYWCZgHC9EN
         mXZmGA1s0ykh0sGyd0nnrdlOkbKid/vE6fI+0fr+iqtZWC7GgbZ40EWyXBC9fFZdzUF+
         342il4dqf4sw67J+E5i6Stnd+WghG1cNjQb3SkZvRNJwHqkb7+XMZrO4JcoBF8xq+qIV
         ySLv4ZLsysXez5PaOSdkssMjpw2w2eKcllmY/19sWVri9MKvUwFnJZAV3W5TRPBDE3bt
         N4YF0dFD3f37WmW76aMhQAbSKiDb8WsWYvGDccfht1mOxLEluz3QuuoxFMpXPeJzT+5M
         ki3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1bOzEYv46G7SSKXPlg4AksB81kmKfxj/zxJ/ATdEnNE=;
        b=czA6mzTOwN+AOa9AKUHWTdqPh+fhxNAT8rSNfwVCZ6JO4vs1AUY4RfwYZ35Scy+Nyw
         Cc3zx9Mw7RkeKvI8c/0v42Kwtr0Ac17k8oy3KnZrZdthVmfZdFS9YD/vzCF6MpF3NPnu
         /gPOLiQKK6yedy5fYMLy/StPuXmeA7rGXB7fHq9Ek5yfhtW+y6+gE9yuHUt6d17LW2tq
         IsHo0m5UhUfg8kgRC7e/LBdukwhSrVATOP/UiB7bC6bTh/Dytja+D+kt2VtUnnsbGGe8
         fJPNVa0jKjOkzYyEMDfJRDKi0esdWsdpQcOhAszetUyzfCez83f0eW2NiTnFFXg3K3+p
         61Hg==
X-Gm-Message-State: AOAM5307s7DT3GVy/64DSdAlQMwg05iu2k165Rk03Y7Lx/orkaAuX/B9
        1zKl52pI3pHwrV0hHzPNU2NtLC9P
X-Google-Smtp-Source: ABdhPJxzzJt7t2u11NCkdGU4WyGvMYVSbqkPiuMUbEJXOJ+pCOfA1EUTTd+wriWjpyegGkeUO6qR3Q==
X-Received: by 2002:a05:6402:2212:: with SMTP id cq18mr14214662edb.173.1592868896154;
        Mon, 22 Jun 2020 16:34:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:1000:aea:1de2:ed50])
        by smtp.gmail.com with ESMTPSA id cd17sm12561478ejb.115.2020.06.22.16.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 16:34:55 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: fix 'format help' / validate number of arguments
Date:   Tue, 23 Jun 2020 01:34:52 +0200
Message-Id: <20200622233452.89993-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The subcommand 'format help' is broken because the of the way
arguments are parsed without validating the number of arguments.

Fix this by parsing all arguments (even if there is only one)
and validate the number of arguments at the end of the loop.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/test-suite | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/validation/test-suite b/validation/test-suite
index a22f70135fb3..d351ebf3c428 100755
--- a/validation/test-suite
+++ b/validation/test-suite
@@ -474,7 +474,7 @@ do_format()
 	linear=0
 	fail=0
 
-	while [ $# -gt 1 ] ; do
+	while [ $# -gt 0 ] ; do
 		case "$1" in
 		-a)
 			append=1 ;;
@@ -493,6 +493,11 @@ do_format()
 		continue
 	done
 
+	if [ $# -lt 1 -o $# -gt 3 ]; then
+		do_format_help
+		return 0
+	fi
+
 	arg_file "$1" || return 1
 
 	file="$1"
-- 
2.27.0

