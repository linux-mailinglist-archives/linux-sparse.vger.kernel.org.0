Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894C72B15FC
	for <lists+linux-sparse@lfdr.de>; Fri, 13 Nov 2020 07:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgKMG5C (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 13 Nov 2020 01:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgKMG5C (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 13 Nov 2020 01:57:02 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12787C0613D1
        for <linux-sparse@vger.kernel.org>; Thu, 12 Nov 2020 22:57:02 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id i19so11762819ejx.9
        for <linux-sparse@vger.kernel.org>; Thu, 12 Nov 2020 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LhBa6CAsK60r3r24/ZpjQOMel9iZ1LQu98+mYp/yrFA=;
        b=QykKEE8czbQwBt8gbAsUjn027QetjNgeK2ukG7AQzsYeKVukgJJR+DNoz0ebrvZ5U1
         jWm/etxdJLg1gfVq0EsWNweqKa16fQbmjHqPr0qw6f21ZFlVqhh3dR5Y4H6XbiVf/A1/
         eh7g8A1J0mjl7ELISLLjawORVmWAYYt1WYBNLmKCh1QuwXzDBCK+oN1XwSMX+JxR2/Re
         bfq8Z/F7vCplxrsTdn6tCoIib6tTE1l1rSVQ+Voetr/j6ZZOXl3RN70xVAqTF/Sf6cr5
         zPB47fZKItkLSbBKkU1vFsRRu1RYxczxLwZCiPsciVJupat7XUhOSLWZsOrdiYUn+6kS
         H9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LhBa6CAsK60r3r24/ZpjQOMel9iZ1LQu98+mYp/yrFA=;
        b=EuU01uay32Zicjt3XPK9Jvf090iWwDMlmzxGTeFgVG0AhS2MJR5kum3nP/8cMYPA1k
         barOmb6M5j7/SXj3uI0TQKU+rAFLg5+aTT3extN6D5WZsO8S60ttklf5UEjil5NIL3u3
         PI2OE0mfEL98GlkePWCW7p2V7OguuVkwq4tSkuwlxxmQH0CyW9ZD2REZrsVM+pshQtpJ
         OkeZ2bFUHfNWMSNl95FDAbf2qqIIcessS9mCrstOn8Mijm8NVZ3sMCvzoIYVOpX/HQ4Z
         xC+V+KlTh9N1AR4hRQ6Esy0d+9hzIwfrc8iL48lfd2KUK/2UEii681vpsYWr6eR0VJ7i
         E4yA==
X-Gm-Message-State: AOAM532I+m7AE4c+3O2iuN0kOK2r8tym5VTFm26oJd6lMNempbgZGdOm
        DX5OMQantwTkCjCNcXcy9CLkx5rETtA=
X-Google-Smtp-Source: ABdhPJzrjmLawwDN+Avn7PeySeZwx494fg5+NOavnYTKSppLXY3wq6nQOiIwSua6HkQlGRVptIxFwg==
X-Received: by 2002:a17:906:2818:: with SMTP id r24mr678405ejc.100.1605250620569;
        Thu, 12 Nov 2020 22:57:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:b8ad:4918:8d1f:1912])
        by smtp.gmail.com with ESMTPSA id hp27sm2914173ejc.2.2020.11.12.22.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 22:57:00 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: Sphinx's option ':noindex:' have been rename into ':noindexentry:'
Date:   Fri, 13 Nov 2020 07:56:56 +0100
Message-Id: <20201113065656.28815-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

and instead of keeping the old name for compatibility, no it's rejected.
But well, purity of language is surely much more important than compatibility.
*long deep sigh*

So, use the new name (but it will for sure create problems when using
an older version of Sphinx).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/doc-guide.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/doc-guide.rst b/Documentation/doc-guide.rst
index 29f39aab360a..fb4cb32293a8 100644
--- a/Documentation/doc-guide.rst
+++ b/Documentation/doc-guide.rst
@@ -138,7 +138,7 @@ For example, a doc-block like::
 will be displayed like this:
 
 .. c:function:: int inc(int val)
-	:noindex:
+	:noindexentry:
 
 	:param val: the value to increment
 	:return: the incremented value
-- 
2.29.2

