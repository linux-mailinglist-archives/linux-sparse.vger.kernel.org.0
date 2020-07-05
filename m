Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEFB214C9A
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgGENLx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgGENLx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:11:53 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3105BC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:11:53 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so32179407edq.8
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VbZ26HEZgOnBUJucdmxFvUCajeUp+6catDDjCc2lL0=;
        b=eV5mlJupYEmLxb8u1wbh7pStV+2b3607ptM8HXZwoesghiGSwWF81BZQVB5mF8gt++
         LykxmRNk5Sd70fQ4rdlAePixV/kT4otT55I4JJDjU6RRnwHiwkxFmEkEbrcQqgLXgfRW
         t/BJxb5Z0OnLTl85d+ysLwue+EZNYbmpRq0vaEuB6MMSWhSYi8B+iPpuUWFBllytNHvv
         R/uOF48DxAOuKXoKJV9lciQore7CS0OsV59ZA4QchQN/cp01TYBDKCyFv/bu2SsEqJfC
         TjCZJj/ibyStiAq6fTCDxj4+tGc7vkmTQTIzms7m3eW/PnHFChVh1IC4eaXNsNCO/Vfe
         J3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VbZ26HEZgOnBUJucdmxFvUCajeUp+6catDDjCc2lL0=;
        b=MpURBg7rapn/yAqP1COcG+3RLzoKyWbvAlAguW3QCIg/LJN7O2EkUJEE/CHvgJjbza
         E/e0Edq6mrF1OD8c4+wPBPldmJxMizniJF151J/ktLlzvhW39AyHyHwYGGQ3ncPA/wy2
         Y321GN5TFASk+07YTKy+mkG4/f0n2eZXNozKxkJptBprduWd0j2I53uydrLn7KsEP8pW
         2Y4pbJYYgDGkOYp4OfFl4qIIzzFXmuDJRY7NXu7k2dbEpcfg5fQGfNMHhZ0hpuV+BPMY
         9D62PwV6BP0XYz8zASOnk7mdiSLzBtcGEST+c2PMCeL7C0Wo+uS6fLcaQBF2Yl4T+ETd
         rypA==
X-Gm-Message-State: AOAM531N+SJVT9Bc3h5f/Wo43o0pOXtVQJQ5klLoOKkRIAllGvjobuGq
        EWgmU2t9i4RhwM6ERCTYMr9niqvB
X-Google-Smtp-Source: ABdhPJxr1rinHSZWyNl+2KEpUY922Ai75sRr0oJaLjVFU5X+d6E05tZgFn20a7qlUlXPTdTzu0Fm7Q==
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr48643730edx.289.1593954711753;
        Sun, 05 Jul 2020 06:11:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id b4sm19245250edx.96.2020.07.05.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:11:51 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/2] predefine: fix multi-token predefine
Date:   Sun,  5 Jul 2020 15:11:46 +0200
Message-Id: <20200705131146.26439-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705131146.26439-1-luc.vanoostenryck@gmail.com>
References: <20200705131146.26439-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The function predefine() and its variants are only valid
if they define a single-token value.

However, when a type is signed, predefine_min() will produce
a multi-token value.

Fix this by using add_pre_buffer() instead of predefine().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 predefine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/predefine.c b/predefine.c
index ff457b389480..d05b1018fdce 100644
--- a/predefine.c
+++ b/predefine.c
@@ -52,7 +52,7 @@ static void predefined_min(const char *name, struct symbol *type)
 	snprintf(buf, sizeof(buf), "__%s_MIN__", name);
 
 	if (is_signed_type(type))
-		predefine(buf, 1, "(-__%s_MAX__ - 1)", name);
+		add_pre_buffer("#weak_define %s (-__%s_MAX__ - 1)\n", buf, name);
 	else
 		predefine(buf, 1, "0%s", suffix);
 }
-- 
2.27.0

