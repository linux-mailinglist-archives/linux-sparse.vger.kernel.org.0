Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E837510A8B6
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfK0CYA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:24:00 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44762 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfK0CYA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:24:00 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so24779822wrn.11
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRodcyKrTvEpEaDtk59x/DKdniM8NVA7LHZ3rFx0c6Q=;
        b=twsiWyZIN9Uc3tpFKrUtbkAytXSEXbCt9sR112CyGq8wCQUQ9A097pAV934Tyy+JlT
         VZjhULlVQ9eyy0BFnfw5MmJSzNU3hUB1/MIHLCQu0gmOV0SQPpuDj0LqDI/LjW/+Nf8q
         4kf/tiQSo2dP+6bd4y6sQBuB+PWjbGmzWm+UikW/p2a6ctLWyhtZk0RGHqtfG2GfL388
         OkE/KUTK+U0HcJ3dJx1Nba46vdNNdQwewYZkcy7OIQIOf6qO92Dil7tqwOmbTknT301A
         wmgdh4Lih+wL+H6tDdxFEEcs4u6xJi1aAnhse14S47/Z1j1JYL42UGN3xmKBEdviRh23
         N8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRodcyKrTvEpEaDtk59x/DKdniM8NVA7LHZ3rFx0c6Q=;
        b=TRDXE9Vg18tMg6jNIp3/ihiBlxrBlhTJYgS9tb8OsMpGIkonFbN32h5qkc5oh9yTU3
         DuXVthaeYRhsPEyArq4R1PoHdqDvwxNbsJwt2ibjANkXw73j5Uvj70kOELlC44hMWfDJ
         SSxbryvT3vA0TWnFbH/Qzhii0inIjf1ySBnzmkxttBfPQzZGIuPHWd7Lk+9DS6kEBrkY
         fbpaPRYrhGxLHuvClpkvon7wQVkJjgmh/bGA4GZBtZeW0XRIxjCHWw5YIhbxo2CljFxG
         kU+o9SM5EsRgvJ+UDpJzk/lnDq1XflPw1Ips4Irr/xQxQXfw7ygE7GKP3pXeFjlcVoQ7
         as2g==
X-Gm-Message-State: APjAAAUX1fPkjEEZkiZrjMjRtzw6hG71IFVeRVgOo2lx8XxkLzqryosh
        ydo/hNCEATHlZBHy8y6PRz0om+Lv
X-Google-Smtp-Source: APXvYqy/cXq85m3COogIKqIU4In3aekBIDMIiCjmkYl7zSHZmT3ad9CgXQLcgq5k5cYUua43levkwA==
X-Received: by 2002:adf:e78b:: with SMTP id n11mr23541356wrm.10.1574821438216;
        Tue, 26 Nov 2019 18:23:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id c1sm16690920wrs.24.2019.11.26.18.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:23:57 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/4] arch: fix wchar_t & wint_t for openbsd
Date:   Wed, 27 Nov 2019 03:23:50 +0100
Message-Id: <20191127022351.68902-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These are only for native build and I don't know
if anyone is using sparse on openbsd, but for completeness
and ease of testing let's get them right for sparse too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target.c b/target.c
index e3ea4caf8..76cbb954a 100644
--- a/target.c
+++ b/target.c
@@ -95,6 +95,10 @@ void init_target(void)
 		case OS_FREEBSD:
 			wint_ctype = &int_ctype;
 			break;
+		case OS_OPENBSD:
+			wchar_ctype = &int_ctype;
+			wint_ctype = &int_ctype;
+			break;
 		}
 		break;
 	case MACH_M68K:
-- 
2.24.0

