Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E5F1F264A
	for <lists+linux-sparse@lfdr.de>; Tue,  9 Jun 2020 01:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgFHXgF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 8 Jun 2020 19:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732490AbgFHXcp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 8 Jun 2020 19:32:45 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F36C08C5C2
        for <linux-sparse@vger.kernel.org>; Mon,  8 Jun 2020 16:32:44 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id m21so14828670eds.13
        for <linux-sparse@vger.kernel.org>; Mon, 08 Jun 2020 16:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+75z5x8YoLleigi8U2cSFDr+p/mIlWi65sAE3gpY1A=;
        b=eMNheKwR0Dtr1FEaI+KhO84C1TDbRB9u4u9sOCFQXbwUci2HCEjn2ExHWN7O+OVnFB
         79RfER5NsBin487QFu4Qer8vtAlVpM4QMHUtYNdP+QExCeX+9aFlvOjStsGmokWGQfD8
         QfT0kHU68JcJaRrO1ue2H7wXwAOAwHdxArYJFX4eeWU0r9WkjGEVDIeFKmkUnoba+JK2
         2EIhu1K2sUO1hjDJ0KFd7LZA9Er05pQs7xsxRc2o15xODiNEfhxgEwGJoMXx+tqS25lD
         eBSFJt/YRDbUFJvl6oUmX2EhZfCXxXW6Erg6MlucdsE9qGxNJVpum4qhMRKVtAZjlQin
         XURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+75z5x8YoLleigi8U2cSFDr+p/mIlWi65sAE3gpY1A=;
        b=gBR6C/yrO5P0bwlIL31gV/Ipa7TEIuoC2BkRzrhTnObPRzDz1qXNZbZrlDgBifynmW
         9C92bY8NxSjFcmtqS+Q4/y0jW0G1v07hMTdxcVj0KJWcnEuFs35NDyJ2fFeViSxGYxJo
         9gMxolIaEhvTcOrXzmjN0uaLsJxTfQOIWzYwVZ9r/Z25LHE4bDvYX9N7KiVk+zBtyQxp
         ECqorRtxUEH++iWJ06bFZp3kkuiyFnZW7/jOW+HJJ9ima1y/iFekeZhpIq8DPh+w8Kbt
         B1E47i6xN0cH1R1uVdR1RN5d2xVpDTsWmp6IyoyA/r13o8XOIiCg/69v7jbOLYqqMChI
         fgug==
X-Gm-Message-State: AOAM531EEVG6PwjNi4lO4V3cog43oYEzugNVd46ZoXy1jgC1PZtBX67k
        zrrVrQHRRVWwMPK+7lKArsQ/pnYA
X-Google-Smtp-Source: ABdhPJzMZQg5j1eeGtLaIbAmkNOCcmDtM5h0bixUXfObD1QNTMXne1XexougCYQs+Op+oXSOu87hFg==
X-Received: by 2002:a05:6402:1812:: with SMTP id g18mr23791672edy.96.1591659162469;
        Mon, 08 Jun 2020 16:32:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:e5c2:dcb5:e6a2:428e])
        by smtp.gmail.com with ESMTPSA id f1sm13734738edn.66.2020.06.08.16.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 16:32:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] generic: fix crash when nothing match
Date:   Tue,  9 Jun 2020 01:32:38 +0200
Message-Id: <20200608233238.66101-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The code for the generic selection doesn't take in account
the fact that the default entry could be absent.

Catch the case where nothing matches and issue an error.

Fixes: c100a7ab2504f9e6fe6b6d3f9a010a8ea5ed30a3
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                |  8 ++++++--
 validation/generic-bad0.c | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 validation/generic-bad0.c

diff --git a/evaluate.c b/evaluate.c
index bc69a1fa57ee..95aef4dc0758 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3299,11 +3299,15 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 			continue;
 
 		res = map->expr;
-		goto end;
+		goto found;
 	}
 	res = expr->def;
+	if (!res) {
+		sparse_error(expr->pos, "no generic selection for '%s'", show_typename(ctrl));
+		return NULL;
+	}
 
-end:
+found:
 	*expr = *res;
 	return evaluate_expression(expr);
 }
diff --git a/validation/generic-bad0.c b/validation/generic-bad0.c
new file mode 100644
index 000000000000..acc3d5e78b53
--- /dev/null
+++ b/validation/generic-bad0.c
@@ -0,0 +1,23 @@
+struct s;
+
+void foo(int n)
+{
+	_Generic(n, default: 1, default: 2);
+	_Generic(n, int[n]:0, default:1);
+	_Generic(n, struct s:0, default:1);
+	_Generic(n, void:0, default:1);
+	_Generic(n, void (void):0, default:1);
+	_Generic(&n, int:5, signed int:7, default:23);
+	_Generic(n, void *:5);
+}
+
+/*
+ * check-name: generic-bad0
+ *
+ * check-error-start
+generic-bad0.c:5:33: warning: multiple default in generic expression
+generic-bad0.c:5:30: note: previous was here
+generic-bad0.c:6:25: warning: Variable length array is used.
+generic-bad0.c:11:17: error: no generic selection for 'int [addressable] n'
+ * check-error-end
+ */
-- 
2.27.0

