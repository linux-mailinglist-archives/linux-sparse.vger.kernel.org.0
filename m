Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBDE214C8E
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgGENCj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgGENCj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:39 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E4FC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:38 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so39552924ejn.10
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eElLZDK+73Sru8uMZkWstDbXOPX/1Q4jpihY7SIwDg=;
        b=NUjN+fbtOw3Vzwvvb5b8v7U/z/U0gvZpQZyeuNSI1p5YCwktTjG8CliMt0f8knhP2H
         MEgNaIoar6zpeTV12zDLKqG18fwrQwULlGsrWrSMrRcHxeyA6fTwZeWygbdR5mRjsAAK
         9Nb1ECeyd+T40+BuoSyoMpC0jQCgMXDMATeC+dVt6aplUkGAszBmmbDvr207cYnbqztY
         /Fn+hxoL6I2SVQ/vCqRIpYw1/sPcv2feJnW6cOyboqkd/KEjuypDOy9JOWOjgYI2Kub0
         9wAZ1/rMvRf02wu7ofhsgWwFFWxV/esBs7RBvdiCNzO3tZ02QNUancBHDxXUTd52vbov
         lPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eElLZDK+73Sru8uMZkWstDbXOPX/1Q4jpihY7SIwDg=;
        b=EQJRWsRLAGDAp4r/IQxclTT0luS+Dub8yui0vjL1fgPfumT12tE8GPaoImAAU/INM5
         D71aCj1LEC70tv3HDC4okfOwYiPbg/IWX5LWOh9Nq981P951vG0WOQxseBqqqSiqBd4T
         nuYj64gxS6/dW4fZmQec0zkXbBElVzxeX8z8rQvS3a5hTUYXvVe3AFoC9hcYzzshhZWZ
         GhcwpsrjEz1dGVEnzrx5f2+eneYuTtGbpzQGzNl/xSbBqtI2YbvFrYaGrVzMkaEqJJCK
         eHjkhkKWhHgXJVBCU79EZIQ0xVf0yO8O5ie09aTemDpwhs/5aQ+M8XleKnBufMLFiDil
         3FVQ==
X-Gm-Message-State: AOAM5327XuF0qe+SDAvyV/4r7C8tdur9GFJwOoybe9kxlL9xYxWiCYzj
        44qKWREydkXBBkiaiU59MzhJt9K8
X-Google-Smtp-Source: ABdhPJz9OqBfdb2+PD1nVqqEamio0OMu/2CUKowOQGCzmKYJ4eivPovqglLQLuWp20NcE1aTOj1ZHg==
X-Received: by 2002:a17:906:ecb3:: with SMTP id qh19mr28236569ejb.273.1593954157006;
        Sun, 05 Jul 2020 06:02:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:36 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 10/15] options: add a small helper: handle_switch_finalize()
Date:   Sun,  5 Jul 2020 15:02:15 +0200
Message-Id: <20200705130220.26230-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is just to isolate the details about which switch need an
extra 'finalization' in a separate function in preparation
to moving all the parsing code in a separate file.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib.c b/lib.c
index b3bacb180cac..a56efcaa64fd 100644
--- a/lib.c
+++ b/lib.c
@@ -1220,6 +1220,12 @@ static char **handle_switch(char *arg, char **next)
 	return next;
 }
 
+static void handle_switch_finalize(void)
+{
+	handle_switch_v_finalize();
+	handle_switch_W_finalize();
+}
+
 ////////////////////////////////////////////////////////////////////////////////
 // Predefines
 
@@ -1576,8 +1582,7 @@ struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list
 		}
 		add_ptr_list(filelist, arg);
 	}
-	handle_switch_W_finalize();
-	handle_switch_v_finalize();
+	handle_switch_finalize();
 
 	// Redirect stdout if needed
 	if (dump_macro_defs || preprocess_only)
-- 
2.27.0

