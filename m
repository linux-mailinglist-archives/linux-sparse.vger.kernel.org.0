Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00B4BE98BD
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfJ3JDr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35142 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfJ3JDr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id l10so1366212wrb.2
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4KFdH5SGsdSR3Oopq0QrICer9KOSyLTxuyHEgNmwE8o=;
        b=qK0u9NMMOiJgri4LkNgMctwrB8z9dLcCR/juP0UDo/0tXGIyCzHKMygCphwBW0Lcrr
         p1T9S+TauA4vSVeNp010tmawQdAGX5cBo/5wUM/+8WZ/lPH+bYAwZ60GnS65fpq5T9qD
         J1hdNx54Yl6U8ldCnCD4TDU6XM9ZvB1H0U/9wHnwSfYgpJpty9np6Cnr6BWAiKHkhvQU
         Ay6yho5J7z9hQqFQ3byy9OUgkT0Crlt0kC2Oq2jlOmKuz0XknCC8tNajY6cKVqfsXClP
         g4tQvabgXAjbKZs2pEehGlFJwhKaxgwiVMoTR+2o164JHNlivbS3yJemuxCC+0zQ+Ltb
         bmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4KFdH5SGsdSR3Oopq0QrICer9KOSyLTxuyHEgNmwE8o=;
        b=Xiap+ubeWn2pJA13n9wiSPzIP5FuLBYDjFj6Nu8U7FZXU2PS6xdAb8kvgJzt482aoj
         l39WpvkDSWhTEhm8mwSRTKfMNHcwuKn5OxzVETix9zJHdVXpqGVGDWdUgdypyttfv7UU
         YGb4vbfffm1F6HuCOMieo3BKRBSCyYscc9nsROO62/Hmc+nagAt/k/GRD93wJwab/WIF
         +97K0KnCjnxGH1durlFnG2dO5TFaV3gmjf7YVJsGn5PGsQHp+YyWIyOgdC7BBlB1zDSo
         oPWn2p/lRAdmZmfbqKR0bSg3jJCzWcmxlH7DACZGF0fBu92Qeugz27BiPaNtu1wB+59p
         i/Ag==
X-Gm-Message-State: APjAAAWzzh8a8eAo343dQIrdYjFSFTzBgtWIo2inFhIKwU9mE107iZ9Z
        DYQTE+S3M0UkUvNIxv1soR3nLbjd
X-Google-Smtp-Source: APXvYqwZ5972B58Zic9e7VnunaZ7LF+lBSh0yzy5sSt0KVLcYd/Oqo3SpOJ1xpn1i7tvT3KKL0uvjg==
X-Received: by 2002:adf:e50a:: with SMTP id j10mr22656593wrm.352.1572426223464;
        Wed, 30 Oct 2019 02:03:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:42 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/7] arch: add predefine for __mips__
Date:   Wed, 30 Oct 2019 10:03:21 +0100
Message-Id: <20191030090333.3412-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This define was missing for MIPS, add it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib.c b/lib.c
index 75a4f9870..2a517b447 100644
--- a/lib.c
+++ b/lib.c
@@ -1329,6 +1329,7 @@ static void predefined_macros(void)
 			predefine("__mips64", 1, "64");
 		/* fall-through */
 	case MACH_MIPS32:
+		predefine("__mips__", 1, "1");
 		predefine("__mips", 1, "%d", ptr_ctype.bit_size);
 		predefine("_MIPS_SZINT", 1, "%d", int_ctype.bit_size);
 		predefine("_MIPS_SZLONG", 1, "%d", long_ctype.bit_size);
-- 
2.23.0

