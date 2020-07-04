Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1AF214937
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 01:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgGDXzA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 19:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgGDXzA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 19:55:00 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3D1C061794
        for <linux-sparse@vger.kernel.org>; Sat,  4 Jul 2020 16:55:00 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d16so24736349edz.12
        for <linux-sparse@vger.kernel.org>; Sat, 04 Jul 2020 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nc4meUusHrr+uLCjH9a8Bf6WOncpoROjVm5AM7mvVdI=;
        b=tBeP+YpSl3C7ytlsjChm6cJg+KkW0iAkKLoP4/KkTt9SN4n+nhu15P+PJ20TdAKgIq
         RZE8MSMxVEM9G4ome9n4GALcDCYL+4b+YwLhvqg7cwG57fAijtdmsUZEol/OpMa5wLmG
         d68rgDNWpOr6rGoi6cLBJ0JcI1hkMQKtQiL1HB7edLjYLnSfvbFvxqBhLJttVYPk+4Wx
         82qr0DFF2lozM2WTJiAO69sZGwb+3GLGhszSuE84N8bzu60xVQoucGQ5m9D+12V4EWvF
         5/p5znyTv1tYFyRGudWEbwPuyCD5Vv2odba9G7nOCKgyqsa+SzRXuWFEcQFhBNukRfuC
         CaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nc4meUusHrr+uLCjH9a8Bf6WOncpoROjVm5AM7mvVdI=;
        b=mVHPXkMO7oimX/gxs7JpvTNnhQmJIemUDWk/N2l5I0yuKB+xo1hUqn53wxKcKzQ+Sk
         2xHo/qAL3i9Wj6Ctg3suJH+u/AdIwWnAtKi5VAw7jEv+t5dLiR56zVY4gt5gOebECeZI
         NFPLzWoVAIb43s1zUdSPizyIVte8brfJhL1ghHycBPuW4ukZ+8SERirl5svQZOk6CizQ
         06nWUyTyTJ2uuaT0uIg10XIA6rZ+L33QVK/FDs1TCEn3Mal0lYnOs+n0TOxFnBCR8PK5
         bJZN9xXULfLh0JBS4e4BLFvrli5d62UJI3MTgWtiQ0ZHdInA5AaQ4S/QNN/qirjQdx1h
         WzMg==
X-Gm-Message-State: AOAM530k9REIZ2PBtWnL7XPJHkH8CuBE73SxGtC3p0DxnJaO9SCoLM6M
        9tINhSsXgdeRBeg0j8CosFo=
X-Google-Smtp-Source: ABdhPJzd3G1O9eg1JdbK5Jf52Nv+n9OLuKmqGtBrgLiMxBcBm9r9d7+7VqlzZgPY/nD6/sCvIQx21Q==
X-Received: by 2002:aa7:d049:: with SMTP id n9mr41756899edo.39.1593906898887;
        Sat, 04 Jul 2020 16:54:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:e95d:bd6e:1167:9510])
        by smtp.gmail.com with ESMTPSA id i10sm17202261edx.42.2020.07.04.16.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 16:54:58 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Alexey Gladkov <gladkov.alexey@gmail.com>
Cc:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] sindex: avoid a warning with 'case -1:'
Date:   Sun,  5 Jul 2020 01:54:53 +0200
Message-Id: <20200704235453.7756-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When parsing the format, there is a 'case -1:' which:
* seems to be there only for the following label (but mixing
  labels with cases, like here, is OK).
* on architectures where chars are unsigned, the compiler complains:
	warning: case label value is less than minimum value for type

So, remove the unneeded 'case -1:' and use an explicit 'default:'
to catch invalid formats. Also, align the label with the cases,
it looks nicer so.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 sindex.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sindex.c b/sindex.c
index ea092a4a434b..22836a957213 100644
--- a/sindex.c
+++ b/sindex.c
@@ -970,8 +970,8 @@ static int search_query_callback(void *data, int argc, char **argv, char **colna
 					print_file_line(argv[0], atoi(argv[1]));
 					fmt++;
 					break;
-				case -1:
-print_string:
+
+				print_string:
 					if (n) {
 						printf("%.*s", n, buf);
 						n = 0;
@@ -979,6 +979,9 @@ print_string:
 					printf("%s", argv[colnum]);
 					fmt++;
 					break;
+				default:
+					break;
+
 			}
 
 			if (pos == fmt)
-- 
2.27.0

