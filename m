Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A752B2CB1
	for <lists+linux-sparse@lfdr.de>; Sat, 14 Nov 2020 11:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgKNKYH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 14 Nov 2020 05:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgKNKYG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 14 Nov 2020 05:24:06 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198C1C0613D2
        for <linux-sparse@vger.kernel.org>; Sat, 14 Nov 2020 02:24:06 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id me8so17464720ejb.10
        for <linux-sparse@vger.kernel.org>; Sat, 14 Nov 2020 02:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A3O5CGIyCcpntQkS/rsqSkD1kwG/brAXPlkeN83bRY4=;
        b=V8nf22RnjivmSS6OaXEg+s+8Uq7j6aUJMLIfWbyGq0UA8lu/zWAjOXWCWqvfOxywmg
         P0WiO9nQFjgUHAeOmgIoUzPsNRKWOOU3Ib1Jm3YG2qm7Bu8cRxvweNnOSOI/5urQOWU5
         4kgs1uWPGV+hocy7qnrqfyXZU8z7ma/5FZ/onESCOPeBvnbnQ9Cbapig3fRiNODa+yj6
         wMcrCB/AMDmdReznRZx7+PKk/9e25LCtfc2wmKaqQY/IMJITS5V99BcZQ2bg1Z2gHzCN
         sb0z9sv5uXguTAaaFiC55QOkwByzPmjlA2T5ABNlrOWPIxNk7k5EPMy2Yo2cN5MG+4OZ
         B4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3O5CGIyCcpntQkS/rsqSkD1kwG/brAXPlkeN83bRY4=;
        b=Tq66215ganWtRdAuM3Khg+RgkQSaZEPpSabpKa1I1LsVmCNr8kZ+GciBMf2yohS5it
         F9xwWhd1lmpXSLG0UcOJwiEIG5dD2lqNT6Yz2x12wyGkyM3d8aXy7sksHlOp93MzgogC
         fQLiBfmDI5ub/+nJkzZPxSdB7hdW98VPIX0+TLfJXrIA/UBALq5xeFaEPVkx0NoBrtmz
         89jMpDaQToMhVfIhnrgvcwnoDGYYioW0LPqz7LthlxKr01K0lUGYZRwYbNdCSNddGDIj
         l0syziMnALjEIGU2bNCiETcjZTD9G4MyCO8tnnv6RQW3NoCDtyCP/UK5JT5NzEqiMhrt
         SomQ==
X-Gm-Message-State: AOAM531Uy7E5VKtypOQzoKX9Hlf0q1OUkZGOIBVRK+sMssqXkhZeI8H6
        WoSm7KS7MptYsfU5r8Skgndq3Hc4al4=
X-Google-Smtp-Source: ABdhPJwu2UYc2yzMJoZB4i3l+PYZNM0ds2d57d2F0YMal0ktkfIyCWwDIgT97nqagb1vIEsUU8I1Ow==
X-Received: by 2002:a17:906:1317:: with SMTP id w23mr5927779ejb.120.1605349441948;
        Sat, 14 Nov 2020 02:24:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:e8ee:663e:d7a3:b425])
        by smtp.gmail.com with ESMTPSA id f19sm6479758edy.13.2020.11.14.02.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 02:24:01 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/4] doc: fix extracted autodoc when short description ends with a ?
Date:   Sat, 14 Nov 2020 11:23:53 +0100
Message-Id: <20201114102356.61234-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114102356.61234-1-luc.vanoostenryck@gmail.com>
References: <20201114102356.61234-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/sphinx/cdoc.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/cdoc.py b/Documentation/sphinx/cdoc.py
index 73c128cb7b35..cca5ad2822de 100755
--- a/Documentation/sphinx/cdoc.py
+++ b/Documentation/sphinx/cdoc.py
@@ -228,8 +228,9 @@ def convert_to_rst(info):
 		if 'short' in info:
 			(n, l) = info['short']
 			l = l[0].capitalize() + l[1:].strip('.')
-			l = '\t' + l + '.'
-			lst.append((n, l + '\n'))
+			if l[-1] != '?':
+				l = l + '.'
+			lst.append((n, '\t' + l + '\n'))
 		if 'tags' in info:
 			for (n, name, l) in info.get('tags', []):
 				if name != 'return':
-- 
2.29.2

