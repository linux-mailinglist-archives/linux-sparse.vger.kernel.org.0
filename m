Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8AB24000A
	for <lists+linux-sparse@lfdr.de>; Sun,  9 Aug 2020 22:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgHIUxm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 9 Aug 2020 16:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgHIUxl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 9 Aug 2020 16:53:41 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A45C061786
        for <linux-sparse@vger.kernel.org>; Sun,  9 Aug 2020 13:53:41 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id di22so4954668edb.12
        for <linux-sparse@vger.kernel.org>; Sun, 09 Aug 2020 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//blSx4yRB9EBfXeMZdgw+lbrRFVsV1PhyTXcgff7gw=;
        b=vRC/TLX8Visgu2ifj7GPpApVzpU6yV0YtFNDi8fVUd0De3iLoZkzTXvi/cSNjg1nJI
         9aMNuUWMhzr6gZTLL4pCRbK558avhqkwhXI0dCP/ETAZyXfgUayYTnbitBr9EAPBW2yb
         wXL3ggNaWGsvlKRgq2l+VrH1Y8u03LqYMfRuhc8X8Y2koLI0I1eysIIi4d6E322VBOdZ
         uX0QiqM0yACEE+IoKh7g3yIdpCOVMMZMfaSiGS8zGZZvKxAwBYriGTC+5n7cPJ//GGNN
         0FScaODGVncXB2LVLwWTD0Y/qcKB3ivMTH8y9AERozNtmfqbIYkQ2RUVaAj2HDOrz+bv
         nvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//blSx4yRB9EBfXeMZdgw+lbrRFVsV1PhyTXcgff7gw=;
        b=UtRab7Anusr1PFNdcdbIvUVKxVe64cW4mrc2dNlG3kAzmKDYU22FxAfiIpvp1bq27T
         x91IQzEV1e2vklUl6DMh0tP0LuFRceRD26NbZJoXoFtdrNdHUxu3Nd3eEG1BB7aY1pU+
         wyCp+HPdgTiIi3WzlxcPOhC6vC1stA9lUJkLNlocszMgXFse5iCkEfh0U2Jii8y9rixv
         rNhP1NRy015dfPoFK1pzZdiEnx2vQ01AIjMXpw+T9sMzSKt43WqJXW9Y0VbrL5FuDoZZ
         kd1mpWChFl0HZ9Sr9A5amjK4qUkivFdi+ba0Zrvbclu9UKFQJnlZSK5oth1hkrqxjAnV
         OMoQ==
X-Gm-Message-State: AOAM532UfnQvlbFYVMnPGhgapqLrzSV16GRcud8ZtbUEWz8V1bYhH+zU
        cjcJj+HZld8fY8VB9V/Q+5f8MTTl
X-Google-Smtp-Source: ABdhPJz/kbOduanw4Uj20e7fAEtbhkw3CfUCL7SwsRq1te+gr9kR9osr6A/l99BmxXSENaHTepct0Q==
X-Received: by 2002:aa7:c259:: with SMTP id y25mr17239035edo.130.1597006419882;
        Sun, 09 Aug 2020 13:53:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:a7fb:e200:b5f4:fb07:8fe3:ee8e])
        by smtp.gmail.com with ESMTPSA id m20sm11258203ejk.90.2020.08.09.13.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 13:53:39 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 07/10] attribute: no need to lookup '__attribute__' in NS_KEYWORD
Date:   Sun,  9 Aug 2020 22:53:26 +0200
Message-Id: <20200809205329.42811-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809205329.42811-1-luc.vanoostenryck@gmail.com>
References: <20200809205329.42811-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Since '__attribute__' is in NS_TYPEDEF, it's not useful to
look it up also in NS_KEYWORD.

So, remove NS_KEYWORD from the mask while looking up '__attribute__'.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parse.c b/parse.c
index 681d98e49641..f2fdbc9b5a7b 100644
--- a/parse.c
+++ b/parse.c
@@ -1769,7 +1769,7 @@ static bool match_attribute(struct token *token)
 
 	if (token_type(token) != TOKEN_IDENT)
 		return false;
-	sym = lookup_keyword(token->ident, NS_KEYWORD | NS_TYPEDEF);
+	sym = lookup_keyword(token->ident, NS_TYPEDEF);
 	if (!sym || sym->type != SYM_KEYWORD)
 		return false;
 	return sym->op->type & KW_ATTRIBUTE;
-- 
2.28.0

