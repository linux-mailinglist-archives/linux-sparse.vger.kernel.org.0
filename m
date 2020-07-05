Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C69E214C8D
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgGENCi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgGENCh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922CBC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id dg28so32196802edb.3
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+XseKbQnu7OoUmmVAPCmrn7d4GEgGn5BQUHGjqMQRps=;
        b=pf/L01Cw0mqTxrkfN7cHZl1foQo0tMXhAX3dsAdCigEqGZLnzof1mrjNvnFmPfbBee
         NZAbpA062rLZ43inak5S9BQyWkKkLhgYL5DkOYntn8w/LG/YA1h1ZscTALswKaRfSr3K
         l9/WWJ9yqRiD8gaf161JiVbkUZYYrfkTGsFHzLveetQKJWiK9YY1gU84ANB9JtiPZggl
         7CZQyIrcRFKpg5qAkXTanp1AiSIdnBKsH0UCrdymqzqDdR9fwaMCNlGSs5etA5ZAIrN0
         HcX68at2e/aU83d/vU66MVSgXXiNxJIhk+/pmteDTpLZ0vNahHQut5mTi139slARTW+O
         6EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+XseKbQnu7OoUmmVAPCmrn7d4GEgGn5BQUHGjqMQRps=;
        b=RrPtJHTdZ3zaWyY+fq+pIyQN49taxBLB80zmLoxlqlOdLWCvGjrVbdjfCLOxI9OdD5
         c44GAVIe3rDL+/bpGbKGqcmzhCyWvAem6tUcg/wulQPbscbNUkY508gYKwy59wpi8+g/
         aqvS8pvbKa43Wv2/r86AEBfrfD653xZgPl6lP2wjyl3hw1xugMaQq4pyElJZ6zmPV3P3
         MWOKA1G80Vu0qVxeB8FBsKXSuRNkO2G2OH+TugbQKxEgfHdNyTS7Ysq9fIlIgp/ssxZq
         zk4roY6mXyWD/E/ABaBb9p9dTKRXmLjNTshpvqEk6ep6TpRbz13Uz7ZPCC1hFrXZZPKN
         taPQ==
X-Gm-Message-State: AOAM533I95+QtVKG4rSuCRQzRPhMm+hwEOsvFIOAZ1GMfABuJoX6/y+s
        CqBRP/RdGcqoA/3Bs3gBjcqpJ86G
X-Google-Smtp-Source: ABdhPJwtb9CoI3aNwIpNs8yqJ5KdF6kExLmPfEweLDLDvO3t7F78sFyTblnU7g/H+F6zOVBiYmVKdg==
X-Received: by 2002:a05:6402:b99:: with SMTP id cf25mr49011129edb.291.1593954156051;
        Sun, 05 Jul 2020 06:02:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:35 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 09/15] options: move declaration of tabstop out of "token.h"
Date:   Sun,  5 Jul 2020 15:02:14 +0200
Message-Id: <20200705130220.26230-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

'tabstop' is unusual in the sense that it's one the few (the only?)
variable defined via an option flag which is not declared in "lib.h"
but in "token.h". This for to have to include "token.h" in the code
doing the parsing of the options ...

Move this declaration to "lib.h".

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.h   | 1 +
 token.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib.h b/lib.h
index 4f67958efdb9..e938f18dfc92 100644
--- a/lib.h
+++ b/lib.h
@@ -48,6 +48,7 @@ extern int die_if_error;
 extern int repeat_phase;
 extern int do_output;
 extern int gcc_major, gcc_minor, gcc_patchlevel;
+extern unsigned int tabstop;
 
 extern const char *base_filename;
 
diff --git a/token.h b/token.h
index 33a6eda1cc53..c5fdf3d0c879 100644
--- a/token.h
+++ b/token.h
@@ -64,7 +64,6 @@ struct stream {
 
 extern int input_stream_nr;
 extern struct stream *input_streams;
-extern unsigned int tabstop;
 extern int *hash_stream(const char *name);
 
 struct ident {
-- 
2.27.0

