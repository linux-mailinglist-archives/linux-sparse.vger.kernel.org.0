Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60785F754B
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfKKNr4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:47:56 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42084 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKNr4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:56 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so14679420wrf.9
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k0qZxuOZuL7wqPkIPj+ERG9EButLGA2j8eOYs2tEmrI=;
        b=jAROp6cIjOLbcsDMaS1OgkORQk9fKH2tqmsxm7aX9TeRlwqonp+uhEYbQChnVOOqLS
         mhZ/+Msx1UwugTEJnkq5NbmILItunEw+7gcVFbvehjFf9mNCkWSRHtFAGDW79Me7to1F
         XxXGDkxE/c7eZKhs8B0wfp4tXmBu4OCjOZanBYggxy4jzVJz7K8hMLo86QM9IvI76tkX
         uxc0quYE3ZUCtQjfvuTmcmJU5s9soJEplcSsHapjStP7O4YwYDL2FdgQGXB/qN8GzSLW
         Qq8oYMR3ski+CbTF2FNAlJi5/KBKPPcwxlnUlYBMkE/yBuYqTo3amh/6t9Eru4mvbwkB
         ZiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0qZxuOZuL7wqPkIPj+ERG9EButLGA2j8eOYs2tEmrI=;
        b=n89MomFmW8gTllDPqyHKj7ouPRCbpIGNUGdcOS1JvAF0bFGdwAtnyWXePo8suvh8aw
         0RRNFWZaGy0J5zv20Z6TziB8tI3wYG1pCyVfJlUmcg814Z1Y20NuexconGxMtmC1obhY
         w9pytKMbxG1c6l0Wl9fjcoH8w2IOYLCh4u8jXSrauHFYYobt5P0xPRBORjkaSFvr6SrX
         I4pyh4YDpQ3qn1DIsTkArg+YTB4f6zXz54vDTXnJNZFOpugWk5Q14Z9Mo6xKcuSiBLiA
         3F0wMXKvNSnEjzfuC2yUI87NgPKRd7c/w7JFYyikBCuq/jqJisvLFmhVqrNcebQz0d96
         UkgA==
X-Gm-Message-State: APjAAAUXWN0au2D/XUiXISQhyYntr7e6myD0JA9QZQP2K3+0HBB/HuKZ
        eCCXz+94n68hq394Eya5MhLkUqHF
X-Google-Smtp-Source: APXvYqwzaDaPP1zWliPgnoNslsf0Vi63/BxaMI0fFsXEkha7lXfMVwllTBiZikMEi4C/Uwe95HAPyQ==
X-Received: by 2002:adf:b7c2:: with SMTP id t2mr18314874wre.47.1573480073778;
        Mon, 11 Nov 2019 05:47:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:53 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/9] spec: types[] is indexed by the specifier class
Date:   Mon, 11 Nov 2019 14:47:40 +0100
Message-Id: <20191111134747.79516-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The array types[] is initialized without using 'designators'
but the entries are in fact indexed by the 'class'.

Make this clear by using the 'class' constant (CInt, CUInt, CSInt
& CReal) as designator in the table initializer.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/parse.c b/parse.c
index 66e177561..d544ba51e 100644
--- a/parse.c
+++ b/parse.c
@@ -1564,8 +1564,10 @@ static struct symbol * const unsigned_types[] =
 static struct symbol * const real_types[] =
 	{&float_ctype, &double_ctype, &ldouble_ctype};
 static struct symbol * const * const types[] = {
-	int_types + 2, signed_types + 2, unsigned_types + 2,
-	real_types + 1,
+	[CInt]  = int_types + 2,
+	[CSInt] = signed_types + 2,
+	[CUInt] = unsigned_types + 2,
+	[CReal] = real_types + 1,
 };
 
 struct symbol *ctype_integer(int size, int want_unsigned)
-- 
2.24.0

