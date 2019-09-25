Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6212BE807
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfIYWDv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:03:51 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40194 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbfIYWDu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:03:50 -0400
Received: by mail-ed1-f66.google.com with SMTP id v38so133855edm.7
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNY4ZrdlptZTjopabg6wJejWXgUYNEFq9Po6y8fAchg=;
        b=WRfPV98wphnc7ZU0nJWdHeKfK9gBj3YcDpVM48iECNHCRzL6m8vGuhiQKdPBSQnvzY
         Pjgbq5TgTdhcouGpwN992ADyH+Nv1+sx9pZcbJfaunqUdZLN/8CpFv5zio1fCXBlQzRt
         R+/Px0gi7WkK0Q6pUF/EvRe321tQMgMi+b0mzsJFDNF+FrI/O1kKjQJ3O2RjioJlqTsG
         ACYH/hQyRD0/ID0+TUCve8lyMNNtOIKXpIkA6abTPRg7iN6A5W5zY8p9joKUWA2K9BKv
         PcE3OXOImntnp8MRZ0wWpFoBAObtjUi+87F+KtnprxIZNnU3XrHzS7YJhNeuc3N5TAFy
         VYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNY4ZrdlptZTjopabg6wJejWXgUYNEFq9Po6y8fAchg=;
        b=Njdzelt4HqocFuGJV0xRbL9J07xYFxnbAMXnx1/ObjMIwmeeKtkcxqxJ+qjiR4v3x8
         JuHV3iJBA3JBq1NEKxm7ji0IPz5vAYTaT4STulo99ke5jhu6alTU89MLkxGmG8X0Pn+f
         KsAGyow3iN248b9rDFsVvJcrUvV6emGFGdh1QVosKyEn9Vqu8Lk4g4G3Ozzt8qBgW91K
         ehnnSEBkjXWttT1nWblkiryvXoYV/D0KKXNaIlzngL2+MFrfPlxneFrsZTKKCM+z1Fdd
         Xni6w3rFbhKkhE7J7U/8e4HxaNthsb2A/r+TrK/JO/wiPDr1ErGZbmJ5zbYMcBcqGBxo
         PocQ==
X-Gm-Message-State: APjAAAVhuajoqLaVbVTIDGTejA8B6eL0pk2LsqHqzXP/2k5E/LKmhTGk
        5zbI5ZUeHtb3dtTnW7LaWc+XKEfi
X-Google-Smtp-Source: APXvYqzwRZU43KkKsBmUbVCOU/gviuvT0K1WK4aWmFL057cikf5stXdtaxChY/BxvHoVTUYS/eOdtg==
X-Received: by 2002:a05:6402:1e4:: with SMTP id i4mr215603edy.31.1569449027785;
        Wed, 25 Sep 2019 15:03:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:553b:deac:4ba3:2b98])
        by smtp.gmail.com with ESMTPSA id f8sm56810eds.71.2019.09.25.15.03.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:03:46 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] remove useless optimization in cast_enum_list()
Date:   Thu, 26 Sep 2019 00:03:39 +0200
Message-Id: <20190925220340.5128-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925220340.5128-1-luc.vanoostenryck@gmail.com>
References: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
 <20190925220340.5128-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The function cast_enum_list() is used to give the same type to
all elements of an enum declaration. The base case for doing this
is to call cast_value() on the element, but this call is not done
is the size of the element already match the size of the common type.

This special case is an optimization but not an interesting one since
cast_value() is not a costly function. OTOH, it somehow complicates
the flow inside cast_enum_list().

So, remove the optimisation by letting cast_value() to handle
all cases.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/parse.c b/parse.c
index f291e2474..005eb1608 100644
--- a/parse.c
+++ b/parse.c
@@ -898,8 +898,6 @@ static void cast_enum_list(struct symbol_list *list, struct symbol *base_type)
 			continue;
 		}
 		expr->ctype = base_type;
-		if (ctype->bit_size == base_type->bit_size)
-			continue;
 		cast_value(expr, base_type, expr, ctype);
 	} END_FOR_EACH_PTR(sym);
 }
-- 
2.23.0

