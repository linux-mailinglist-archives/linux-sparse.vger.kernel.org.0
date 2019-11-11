Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7441F754F
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfKKNr6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:47:58 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41326 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfKKNr6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:58 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so14694776wrm.8
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97YJSEq7BX10NRVZhpJwMOnDFdAFQk1/HswUyq8kVZc=;
        b=hKAcR5J5w+mDNr5Zd23vPoe3SOcAQVWH3wZkzY54F+GSrHoqcfUMsmms0XDrdzw5ql
         GB4awopbsBkK/MnXFoYINe2EVNhS4t98W87vTjLp0L/DhIYFlNG0K+F+Svgb6/O49Grc
         obcc2v9lCh4nYqPAAgiRO2gSYrBMGs5kvkAEJE4oMS3Na+KM6WywkrNFXknuSrE58qKM
         GEEZMe+O/nhTEtV1A/EViXUVp6W0BeeTXQtSxgJwig+spZBAAhCxQMkb2pSjc3ZxmNCW
         SyCu3pgRJVhGT/Pd1ZsopVro3tnjI9D/2lWIJ3RjL/CfrE/E8q+UA2HmieN0QOETHAm1
         gycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97YJSEq7BX10NRVZhpJwMOnDFdAFQk1/HswUyq8kVZc=;
        b=Rph+bSjHOkOurMGygRSm2daJbf9Y1IUReVnaql5mxHWt1x5pUjvICqGqRQIFqyJTX3
         PfuPtqBB5gh4wW5dC1vysZFtIeOla27kuRK9MrZcsJsKSwLenEYzQ+vj/m7KrbpPSbIm
         O7WQTHYXvphDcK74SePROHJKaQrLradX6V8a7xiTAlLzbgYcurhRX3MqR7juE8upIyCy
         VRzSjnlsZpJ/7HZPavqn9Bo9UVgzw1JdAtKZF9l08yz7bsjuPmhTMK8sfQBWtH8x5Mhg
         CxU/ec5RdIYaiCCFVTkr02r9/b8ZNXyFIOAD+oplAf/BQYaQQmnTq2SDaYNwH3K/ZIT1
         OqjA==
X-Gm-Message-State: APjAAAUO7vds5mlHMreJcxMneyCntJ/jm+3pqeH+2DuQd7KwLhAPTP5y
        B197E0zterku9Ia8JELYtLevaxSU
X-Google-Smtp-Source: APXvYqw5uAzRlQFg2aRaG6YqfcBvDdruk1TFgZu8sewtNr6zGomHK/0D9qbRrqTr4F3RjczaqKiogw==
X-Received: by 2002:adf:b1cb:: with SMTP id r11mr14338510wra.246.1573480074680;
        Mon, 11 Nov 2019 05:47:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:54 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/9] spec: add '.class = CInt'
Date:   Mon, 11 Nov 2019 14:47:41 +0100
Message-Id: <20191111134747.79516-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add it for the specifier that implies an integer type.
Since Cint is (and must be) zero, it changes nothing
but it helps a little for as documentation.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/parse.c b/parse.c
index d544ba51e..797b3971e 100644
--- a/parse.c
+++ b/parse.c
@@ -255,6 +255,7 @@ static struct symbol_op int_op = {
 	.type = KW_SPECIFIER,
 	.test = Set_T,
 	.set = Set_T|Set_Int,
+	.class = CInt,
 };
 
 static struct symbol_op double_op = {
@@ -275,6 +276,7 @@ static struct symbol_op short_op = {
 	.type = KW_SPECIFIER | KW_SHORT,
 	.test = Set_S|Set_Char|Set_Float|Set_Double|Set_Long|Set_Short,
 	.set = Set_Short,
+	.class = CInt,
 };
 
 static struct symbol_op signed_op = {
@@ -301,6 +303,7 @@ static struct symbol_op int128_op = {
 	.type = KW_SPECIFIER | KW_LONG,
 	.test = Set_S|Set_T|Set_Char|Set_Short|Set_Int|Set_Float|Set_Double|Set_Long|Set_Vlong|Set_Int128,
 	.set =  Set_T|Set_Int128,
+	.class = CInt,
 };
 
 static struct symbol_op if_op = {
-- 
2.24.0

