Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59FF3BE805
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfIYWDu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:03:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33686 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfIYWDt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:03:49 -0400
Received: by mail-ed1-f68.google.com with SMTP id c4so169094edl.0
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snflyn5hwQaYtlGuw4wPYDbCkg50MpuCQQ9by9qWpKA=;
        b=EJUJpCge/RXyuscm/5nxMLRR8RrZbQ0I03/gcj81sBVgBgacFL8Pcz++myeIz6I4iV
         gm5xYaN9UR/YbF64Z5Z1/y4Uj2m0QQuy6bXPRVk+ioUmdTjihO9RmsMeO09jy7qs9VyN
         xctBT2pRp4fFmYjuIVHV2KUj8GBrmgW9VMGzNXfClQtYt/ynObSCAako9wFSzboLxytN
         /tccT+uEWXUkUwvFhaAsHFZ4UqFKU7KvCxf4OORloG9hYyy4r39sDmHP+2He3VSeG6BB
         X72Mbi+abUTCFFr5eAp0ywGT0isoiiTJB+Oom5WWXOgqvvt4sAg3SR4e5FvhhFj+s3tF
         jWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snflyn5hwQaYtlGuw4wPYDbCkg50MpuCQQ9by9qWpKA=;
        b=BkGkCnxn827ruFbl/XgsYgte40StcLJMDwTBGXRS7ceDhEO2+ffEoG88FMT+NACmmY
         Oi28RYbv/jP/zAIqBTIFLtErsRnruPYX0NF/Tf2nhG873Hjjdo2eyiIhuF8uQcVXAqPe
         xUpnaeScHAHKESEgiTclMocqam4oj4M52IP6ogZ3UNlmDzQ7p1y/woLlpIzGGwZqDUGr
         bf2S/MZitEcGl0ibDbb8RBYxHS1ehklv/mtDA4HVhFfl65DVlOa32+QcgTfGASs73vUg
         EcJJsmy4Klw7TmlKeiNulxA5NfDh/6NK8j+G4Cke/nDF+rBjdA1HTIjdCEmFHshT9FZy
         Apmg==
X-Gm-Message-State: APjAAAVGi9oqjEBq3n8N8e8iADCQPSXi7bT3kC0TW3Q4XGjvs+GErgok
        CKgEoej6fRk5VX4kJyscpnvuulOy
X-Google-Smtp-Source: APXvYqyZp1OnKeYFoG1tWWgueQqzw5dFstxs9b4DjmzdDvgt8ZJxyfSrMpYSnRPWZ7gj4Lv4UHQobQ==
X-Received: by 2002:a17:906:3746:: with SMTP id e6mr349108ejc.238.1569449026579;
        Wed, 25 Sep 2019 15:03:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:553b:deac:4ba3:2b98])
        by smtp.gmail.com with ESMTPSA id f8sm56810eds.71.2019.09.25.15.03.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:03:46 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/3] add test for enum sign extension
Date:   Thu, 26 Sep 2019 00:03:38 +0200
Message-Id: <20190925220340.5128-2-luc.vanoostenryck@gmail.com>
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

In a declaration like:
	enum {
	        a = 0x80000000,
	        b = -1,
	}
the underlying type should be long and b's value should be
0xffffffffffffffff (on a 64-bit machine) but is 0xffffffff.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/enum-sign-extend.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 validation/enum-sign-extend.c

diff --git a/validation/enum-sign-extend.c b/validation/enum-sign-extend.c
new file mode 100644
index 000000000..7f17debac
--- /dev/null
+++ b/validation/enum-sign-extend.c
@@ -0,0 +1,12 @@
+enum num {
+	a = 0x80000000,
+	b = -1,
+};
+
+_Static_assert([typeof(b)] == [long], "type");
+_Static_assert(b == -1L,              "value");
+
+/*
+ * check-name: enum-sign-extend
+ * check-known-to-fail
+ */
-- 
2.23.0

