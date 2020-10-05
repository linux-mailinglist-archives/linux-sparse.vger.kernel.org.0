Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0067F282EC0
	for <lists+linux-sparse@lfdr.de>; Mon,  5 Oct 2020 04:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgJECAS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 4 Oct 2020 22:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgJECAQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 4 Oct 2020 22:00:16 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E76C0613CE
        for <linux-sparse@vger.kernel.org>; Sun,  4 Oct 2020 19:00:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e18so1808021wrw.9
        for <linux-sparse@vger.kernel.org>; Sun, 04 Oct 2020 19:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CtuCivygniPd6EyrCt51z5m0F/aX4W1u/gPyV7KoBuc=;
        b=gfwzySgHivtl7We/o04KoAzXiIFHQyMBhx1Oe1u/LoB17UEokAIuHSaRyNM4QsaBEd
         vPyutgl5g+qAFmTl/3mngXx8WCeVA0EdhSKxKdklpOP1caZU82zbAFzK2zsSkMyQzBAF
         f8jr/eBo49jBXl/H945HbDn8gffOsZ9AL24fZkHcrHW1x6aRkiiWrekxcRHmkwLYhkF/
         XwrNQRHT6CCXV2CrC+XkDReHl9SdR+7h15UavFVhs3XnzL8sFXEojot6kpxA8DgAP+zm
         eVouI134VYedUsmDjhVw8B508alcYAif820Sst2yIOZCX2ruwF2sjGv9FXxo5BCbmwtW
         uP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtuCivygniPd6EyrCt51z5m0F/aX4W1u/gPyV7KoBuc=;
        b=ckJanZ6OR40EwRquQSnKWxcT3ytplKog9KivmgsKBHS3OJtfzVbIbULfsu9Kk32oga
         kLyuirWBjO0NsmtPprSnU6qphoMkzShH0LoN7bBBzQSJhAFLtBP+s5tQKcsXFjtOIYrQ
         maODPuf3MN6sAQ3GUlinANl7xxS4FUEZiQefMYBIcLCoQZozk72/r7KpolGcLU6A/IB/
         Hvj1sfuOhr1iAXXFbOBJ9qSfXFBdE1jbqbm/RZDSQeN/OGDHoCucijqTVG0aRRrVpoDE
         02LnTGwjIkd6q25gGoP0hQrVM9KxXfSyjG+JTv32BZSIuGNB2dENoXVAvPoD2wpER4bi
         /Ndw==
X-Gm-Message-State: AOAM533TeeKGrplg7nejucQN0EcDNXsUkVq0a74WGTYsZCRpa2ATUh8o
        VCX1Xi3jfsrCn//Bfy8wNpWvTqqYo3I=
X-Google-Smtp-Source: ABdhPJxzbEjmMldOIl1lUXQvpn0h8iz6ytvBfRCkDB0wc/RJ2t6dbMYPhBXU649XcC5ZYFq9Tdqs7w==
X-Received: by 2002:adf:b1cb:: with SMTP id r11mr9249666wra.339.1601863214224;
        Sun, 04 Oct 2020 19:00:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:f14e:9b66:59e7:4769])
        by smtp.gmail.com with ESMTPSA id b189sm5541132wmb.37.2020.10.04.19.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 19:00:13 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 8/8] add support for "%Lx" (and "%Ls")
Date:   Mon,  5 Oct 2020 04:00:02 +0200
Message-Id: <20201005020002.1108-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005020002.1108-1-luc.vanoostenryck@gmail.com>
References: <20201005020002.1108-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 verify-format.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/verify-format.c b/verify-format.c
index b27440b87c6b..4b4730285237 100644
--- a/verify-format.c
+++ b/verify-format.c
@@ -168,6 +168,9 @@ static struct format_type *parse_printf_get_fmt(struct format_type *type,
 				szmod++;
 				ptr++;
 			}
+		} else if (*ptr == 'L') {
+			szmod++;
+			ptr++;
 		} else {
 			if (*ptr == 'h') { // short/char to int
 				szmod = -1;
-- 
2.28.0

