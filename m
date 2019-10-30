Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B82BE98BC
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfJ3JDq (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56267 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfJ3JDq (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:46 -0400
Received: by mail-wm1-f68.google.com with SMTP id g24so1197383wmh.5
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wKW8iZ30J+9D0MFnnWRot60IdudahSYdVNTFwS5waTk=;
        b=KEeo9qU7kWyvgn91+SJQnp6gZPErINlQ0KHnl47Sr1Z7IAJQcQMSCirRGaaiDOMrG+
         zwpPAcqajEF4ODPn29xBTJzG0t8/43sCnGNlyNWznseBBoFYZGYbcEO07bCZUOejZlRS
         dEKnw/FhDTjdfmC9gUGbZslMkcd1Zyo/He+JnJMgiVc2WmEjITgfheayR6XP7B4FXgYc
         oeRLhkOeY3IKhJwxIQ8Ty1gCf8oq4bzS1y4j0zgHQafyWLNSaJG7Yrt4Kyq8GzgBqsjn
         qWc4n+QmzUZOb/MsPrdjjdPDp7j3MEE4NWOMXT0wZ2fobbR93LxZaMEdloOjC8yNcmJO
         xGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKW8iZ30J+9D0MFnnWRot60IdudahSYdVNTFwS5waTk=;
        b=exASD002wDqpc6qUCBXXBOgYQHY/k2S5slSxnXd/dLudpI5SG4HKU+h7SEmZt9W4Hv
         mpFaRB9saMZ6OWqfj0NXUzaqCpt80fzBvn4Cvj37wJ1M8b+gAnCFlui1G1I9HpzFYgA2
         bhPPXSAkzwXZYB9Yew/hHXzgg9rPYi7AHhE9EcOU7gKBl4sOMrCYmhbtPGzbUJUZ/nC0
         gTKopfmGqyivmB/TcqHzqAxhCZzczNiMdShl9Z17ST64nXUkM9vRL2y38z4GrU6PemEu
         kLgTLXyf4fYg95NwLyhNLS+qaag5jI3e442PaA0Voh9PCcLStAxcTqrQbAuGeA094oqr
         p3dA==
X-Gm-Message-State: APjAAAWHCyGl719ANBbWvRyPx0BkHml34H1xzwQ02FjKfOh5JiBxtaZk
        go1yJDkhBZdHhtK/eBaYQrTLlnTe
X-Google-Smtp-Source: APXvYqwSOU6ZKquNZ+ucL+HpEQCiAQ+R0hgDeMUCLW/3GiJqYqpqkTgNlb7drfpOFU77QoLTOkTj6A==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr7739154wmc.91.1572426224375;
        Wed, 30 Oct 2019 02:03:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:43 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 1/6] reorder MACH_XXX defines
Date:   Wed, 30 Oct 2019 10:03:22 +0100
Message-Id: <20191030090333.3412-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some architectures have a 32- and a 64-bit variant which can
be exchanged via the -m32/-m64 flags.

Make clear the correspondance between these variant when
defining the MACH_XXX.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 machine.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/machine.h b/machine.h
index b46383ac1..f7567efed 100644
--- a/machine.h
+++ b/machine.h
@@ -25,18 +25,12 @@ enum {
 
 
 enum machine {
-	MACH_ARM,
-	MACH_ARM64,
-	MACH_I386,
-	MACH_X86_64,
-	MACH_MIPS32,
-	MACH_MIPS64,
-	MACH_PPC32,
-	MACH_PPC64,
-	MACH_RISCV32,
-	MACH_RISCV64,
-	MACH_SPARC32,
-	MACH_SPARC64,
+	MACH_ARM,	MACH_ARM64,
+	MACH_I386,	MACH_X86_64,
+	MACH_MIPS32,	MACH_MIPS64,
+	MACH_PPC32,	MACH_PPC64,
+	MACH_RISCV32,	MACH_RISCV64,
+	MACH_SPARC32,	MACH_SPARC64,
 	MACH_M68K,
 	MACH_S390X,
 	MACH_UNKNOWN
-- 
2.23.0

