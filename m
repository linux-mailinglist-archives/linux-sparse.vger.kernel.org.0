Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803621D8CA8
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgESA5l (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgESA5l (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:41 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE16FC05BD09
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:40 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id be9so6045023edb.2
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3bjtdcN+4gVLgsBNk0/SAJAT3H3IL9Dzz+TR/EyWyQ=;
        b=LBFdVsuPEoKjO6N2BwjJ0ZlywkKTcyPCZU1aOZIvA3aieY/tuYSuNyq7dKi6+5n8j+
         V6c0Vmg9VBTFTCjU91FfZEy8CPpfdhzGQGP8iKOi7v46eUFOQQm5FeBMnmgt34xdPpkv
         HFK4BqkjJsjqB/HLN6aFJTCMD9eXy8W1wHwfCJ7WEk+oG2YguvFZ8u+dBneZ2FerU3P9
         vMUf55w4bbYr/N4RWVtaYeKJOzwQ8nCgiOUZjcLrBXKNPNys6ixScCJ+vhXRQqf4y8FG
         gIHbYo3i9mpA0/ycznzVVwS55Weglxm91CDW2/W1AMqWgHsRGKOxkbb5pozlY196koQC
         05jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3bjtdcN+4gVLgsBNk0/SAJAT3H3IL9Dzz+TR/EyWyQ=;
        b=WE5P667s7dATZbLRAENokov1AEFzDTHllKeL8TeKTFifwxxg2jmuOXfnqb3HVaqDt5
         ba3JyHuduwAszB1W38bqTE6Q8LzH1rr97ayfekmMaUyoGPGhGt6XPGOXhgKIo4q8VtHQ
         /q6QVog6MhyMUbI8oQXLosQD9SV0cMILPl1sNXy5GtXihZUxlMfkuX7erqtLtRBO4fFZ
         2mkbTFGYw/hvYfKeItObYWxoYGuJwrC9DWvpobVVFOd3b1ak7LwwHNh8DsZSnvgqKXMA
         ZVPAe9YCTBJ3AIZfcz59drBWYrzuMH8E/qCeTpV86AbFL14RvvW/1o06RbjjuIjyS0vU
         aVVw==
X-Gm-Message-State: AOAM532cshVKznlIBwzq92Nm/B6A+4mqD6weJniAOG9SwMoxJi6gcAPH
        pfYgMclaTCm+jMY+Lpa/rk0rPudq
X-Google-Smtp-Source: ABdhPJzIZQBEuJNB+A5b0rmF3CO5nrH+1B0PrxaGHE5MPOVH4sg2tTn4r2duP9stclXRg7oGEOd4Sw==
X-Received: by 2002:a05:6402:3106:: with SMTP id dc6mr15731420edb.19.1589849859456;
        Mon, 18 May 2020 17:57:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:39 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 07/28] bad-goto: do not linearize if the IR will be invalid
Date:   Tue, 19 May 2020 02:57:07 +0200
Message-Id: <20200519005728.84594-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In some error cases, it's not possible to produce a valid &
correct IR for the concerned function. For exemple, if the
AST contains invalid gotos, the CFG will either be invalid
or won't correspond to the erroneous source code.

So, refuse to linearize such functions.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 2 +-
 symbol.h    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/linearize.c b/linearize.c
index b040d345d469..4927468183b0 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2480,7 +2480,7 @@ static struct entrypoint *linearize_fn(struct symbol *sym, struct symbol *base_t
 	pseudo_t result;
 	int i;
 
-	if (!stmt)
+	if (!stmt || sym->bogus_linear)
 		return NULL;
 
 	ep = alloc_entrypoint();
diff --git a/symbol.h b/symbol.h
index 7241f13df4e4..50dba78a654a 100644
--- a/symbol.h
+++ b/symbol.h
@@ -171,6 +171,7 @@ struct symbol {
 			unsigned long	offset;
 			int		bit_size;
 			unsigned int	bit_offset:8,
+					bogus_linear:1,
 					variadic:1,
 					initialized:1,
 					examined:1,
-- 
2.26.2

