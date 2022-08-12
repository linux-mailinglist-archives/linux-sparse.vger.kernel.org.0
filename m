Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947F1590D54
	for <lists+linux-sparse@lfdr.de>; Fri, 12 Aug 2022 10:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbiHLIZs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 12 Aug 2022 04:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237391AbiHLIZp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 12 Aug 2022 04:25:45 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361671CFE3
        for <linux-sparse@vger.kernel.org>; Fri, 12 Aug 2022 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660292744; x=1691828744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FB2lahP4crs2/qoLp5I+IRob3sO2RmAimKp+BBUaGSU=;
  b=yIEMSTyvA1UWi50KIdD6T3nb1LgNLXBYumYxT8JBEhoFceK+bhlWbPPg
   AQQR5PotR6eQDuGeg9jHWlLuqov5Tqhc9SiyS/FBCDdgmcJFwOLcMxSWI
   Y0kuzFxyJkADRp5rXy2mWhWnrtKOhiEnjew0BP0hGdIM3g4mN5TnUb5QU
   QqHueoGtcTBO8yusvxscFzxS5zwCb3Lst+pRJv1PILuoyJ4dEredINKZH
   G65evATii6Pfc1gFuDseQTIhwT3Y2Su3+CZ0q3079grRHwUUfwJKR/Y7c
   0LXMoYtn/GXQG1m2UP5Fmrl9UYMEmnnrz7nW4fDTOUfI071Z65avTuJZ2
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="168993649"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 01:25:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 12 Aug 2022 01:25:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 01:25:40 -0700
Date:   Fri, 12 Aug 2022 09:25:23 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
CC:     <luc.vanoostenryck@gmail.com>, <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: Add support for the zicbom extension
Message-ID: <YvYOc9Mk8y1dFvnp@wendy>
References: <20220811033138.20676-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220811033138.20676-1-palmer@rivosinc.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Aug 10, 2022 at 08:31:38PM -0700, Palmer Dabbelt wrote:
> This was recently added to binutils and with any luck will soon be in
> Linux, without it sparse will fail when trying to build new kernels on
> systems with new toolchains.
> 

In passing while testing the zihintpause one:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  target-riscv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target-riscv.c b/target-riscv.c
> index 217ab7e8..db0f7e57 100644
> --- a/target-riscv.c
> +++ b/target-riscv.c
> @@ -19,6 +19,7 @@
>  #define RISCV_GENERIC	(RISCV_MUL|RISCV_DIV|RISCV_ATOMIC|RISCV_FPU)
>  #define RISCV_ZICSR	(1 << 10)
>  #define RISCV_ZIFENCEI	(1 << 11)
> +#define RISCV_ZICBOM	(1 << 12)
>  
>  static unsigned int riscv_flags;
>  
> @@ -41,6 +42,7 @@ static void parse_march_riscv(const char *arg)
>  		{ "c",		RISCV_COMP },
>  		{ "_zicsr",	RISCV_ZICSR },
>  		{ "_zifencei",	RISCV_ZIFENCEI },
> +		{ "_zicbom",	RISCV_ZICBOM },
>  	};
>  	int i;
>  
> @@ -131,6 +133,8 @@ static void predefine_riscv(const struct target *self)
>  		predefine("__riscv_zicsr", 1, "1");
>  	if (riscv_flags & RISCV_ZIFENCEI)
>  		predefine("__riscv_zifencei", 1, "1");
> +	if (riscv_flags & RISCV_ZICBOM)
> +		predefine("__riscv_zicbom", 1, "1");
>  
>  	if (cmodel)
>  		predefine_strong("__riscv_cmodel_%s", cmodel);
> -- 
> 2.34.1
> 
