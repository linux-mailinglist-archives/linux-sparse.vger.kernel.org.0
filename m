Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02C82AA8CB
	for <lists+linux-sparse@lfdr.de>; Sun,  8 Nov 2020 02:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgKHBVh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 7 Nov 2020 20:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbgKHBVh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 7 Nov 2020 20:21:37 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF89CC0613D2
        for <linux-sparse@vger.kernel.org>; Sat,  7 Nov 2020 17:21:35 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o23so7242902ejn.11
        for <linux-sparse@vger.kernel.org>; Sat, 07 Nov 2020 17:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OYcfxfP7JfsJsqCV46fPWP5tjHEZ/zqMS2OWu7QVLyU=;
        b=PT5DYhxWXQcVpJPfv9sZoGzRvf7ZAB8B6V5S/C6yGC/Z53+evnDpskskf7n1FT1qxE
         +cPD3zM00wqo2MLZUBlAZhEe7cESYF8aiAHeYAA6lpUDgHW3RS3RWp1r1TExfGEdfYaE
         MdJQhXgMn2yDhFIUqZ6zrC6ki9LDbhEJoTUt444QBXBbjDkWHfUTZtq+RbQ5pzuYVPVh
         DMdtKt/rhyO9oxmucQyEZZAyDOSehurbjJz3kq7Ge7QQygzzTAaDnlopqpJWOzP2nUg8
         BxO5q40ZAd5dOt5AvzMbqsL7HqIUF38h8PBiy3o3DMLNWx6hHPsNVFYkWPalhpMwa/Qd
         sOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OYcfxfP7JfsJsqCV46fPWP5tjHEZ/zqMS2OWu7QVLyU=;
        b=NL5kLauV0uhov540Y4olDbRLv6GjhkMr26OBumlDaxO+hTZ0iutlHzkImPfhgdp8sP
         pTYftM5zNVbkfgk0e1RQ+esmfb+Jskxwu1vk/zCSDSj+78vMVuPYS5YCdASHCSgSCIII
         MoCF7uRQRIupUwlOhcP7hss7HN6GJgKX2oNHqLHfOSsB8oC7KOIDUbR70krfnoNeudgo
         Tfa5HsPx1tQAW6mBTCgzyEi9D820EdkgBbcWJSaXzSuojlP+Pf+VNBj8BEaQ32GVzX0C
         E4ji3urdB/K8gZeQHUdD4phWHEHimBHPb6B733/cs9wsX89l+pnzCf68ySif8+xBEGlQ
         qciw==
X-Gm-Message-State: AOAM530Hwj+KKC8ESgq1R094by0LXzHKXB8QUjdFQKi4lBNbQYA8D+mt
        DEfYJHbyfxm8tZz6TLRabtbV8MZUd8k=
X-Google-Smtp-Source: ABdhPJyNo1O/aeLJ4hABtgFSnW6QjC4xzVZF1lkINUHgEwejAftMa88rjrRLcPjNXCkhZsZiAzpkeA==
X-Received: by 2002:a17:906:3fc1:: with SMTP id k1mr8555550ejj.287.1604798494484;
        Sat, 07 Nov 2020 17:21:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:fce6:5cb0:27db:5e8c])
        by smtp.gmail.com with ESMTPSA id u25sm4511426eje.99.2020.11.07.17.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 17:21:33 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 15/16] cmp: simplify zext(x) cmpu C
Date:   Sun,  8 Nov 2020 02:21:25 +0100
Message-Id: <20201108012126.94339-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201108012126.94339-1-luc.vanoostenryck@gmail.com>
References: <20201108011939.94252-1-luc.vanoostenryck@gmail.com>
 <20201108012126.94339-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

An unsigned compare of a zero-extended value against a
constant outside of the original range is statically known.

Simplify to the corresponding 0/1.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 simplify.c                        | 4 ++++
 validation/optim/cmp-zext-uimm2.c | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/simplify.c b/simplify.c
index 83ae763eac72..7538c9393b41 100644
--- a/simplify.c
+++ b/simplify.c
@@ -1198,6 +1198,10 @@ static int simplify_compare_constant(struct instruction *insn, long long value)
 			else
 				return replace_with_value(insn, 1);
 			break;
+		case OP_SET_B: case OP_SET_BE:
+			return replace_with_value(insn, 1);
+		case OP_SET_AE: case OP_SET_A:
+			return replace_with_value(insn, 0);
 		}
 		break;
 	}
diff --git a/validation/optim/cmp-zext-uimm2.c b/validation/optim/cmp-zext-uimm2.c
index 64f30b9a3df5..214bd96fb4ce 100644
--- a/validation/optim/cmp-zext-uimm2.c
+++ b/validation/optim/cmp-zext-uimm2.c
@@ -23,7 +23,6 @@ int zext_gtu_m(unsigned x) { return (zext(x) >  0x0fffffffeUL) == (x >  0xffffff
 /*
  * check-name: cmp-zext-uimm2
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-returns: 1
-- 
2.29.2

