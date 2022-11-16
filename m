Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B982B62C58D
	for <lists+linux-sparse@lfdr.de>; Wed, 16 Nov 2022 17:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbiKPQ4K (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 16 Nov 2022 11:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234062AbiKPQzj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 16 Nov 2022 11:55:39 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EE0B41
        for <linux-sparse@vger.kernel.org>; Wed, 16 Nov 2022 08:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668617729; x=1700153729;
  h=date:from:to:subject:message-id:mime-version;
  bh=bmKAC31Ms+gp8vNS3kikIM7bLD3KNK02Lko+nK0hyTg=;
  b=SdFNpaFfAqEujxG0B5WYgsP7ekacGQigWgbco0Tb2ntx9Bh/FE5HGWAv
   YTFmgQ0bsUFu96cmG+FtIHpuc5rgaZ9YujeCvEyXw6u6W0CnM+T3yGN6+
   M6YfTYb1XNnWPZwcl30ysetwCoQGbnQ4di1FWkEGany55n/RqrUbSOZHR
   tRs56pwmDoE9nXWNWXeHRIqHgO8trdT1BjnULhrRmaX6Ua2sbGb+z1RaY
   LLT+AL8q/njDkxK6TAwffvINeoVhdCdfJnSInCi4dRL94gx5r7QJGpCl3
   QvN3NERHjuHXZ61RQ94SwCf+ZOxfNRLa0ovcq8Ki50pvRKakq5xIL3zZN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="376865467"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="376865467"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 08:55:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="708235826"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="708235826"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.32.192])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 08:55:28 -0800
Date:   Wed, 16 Nov 2022 17:55:25 +0100 (CET)
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     linux-sparse@vger.kernel.org
Subject: [PATCH] xtensa: switch to little endianness
Message-ID: <44d1263-fe1-17b6-82d-fd2bbaa55cd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Current gcc options only support the little endian mode on Xtensa,
switch over to it.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
  target-xtensa.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-xtensa.c b/target-xtensa.c
index 3620b4a3..48e4bf76 100644
--- a/target-xtensa.c
+++ b/target-xtensa.c
@@ -22,7 +22,7 @@ static void predefine_xtensa(const struct target *self)
  const struct target target_xtensa = {
  	.mach = MACH_XTENSA,
  	.bitness = ARCH_LP32,
-	.big_endian = true,
+	.big_endian = false,

  	.bits_in_longdouble = 64,

-- 
2.30.2

