Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA4DF9BA7
	for <lists+linux-sparse@lfdr.de>; Tue, 12 Nov 2019 22:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKLVNa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 12 Nov 2019 16:13:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37310 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfKLVNa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 12 Nov 2019 16:13:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so4508948wmj.2
        for <linux-sparse@vger.kernel.org>; Tue, 12 Nov 2019 13:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zTDgm8TTQ1tHD5W3kIrYqMjZ8M2WgHgN7F/X/UAUy80=;
        b=XzsW654M8WfjtW+PRyq/MUBi0myoSVgxyhB1GQXkuVM7D09myqkPmN3crasKNzHKyW
         pGAy8eYtCkDcEf9kdKYiFxdCWVeAVhrhT+ay5DAnQ3XLqZLJL8yMC1dKg/dPjlx3YNR8
         0Ayn8VMLvgvwX85iYxWdSqM/CeavkVo4UlISTHjPRBmYbdAtkYFkOHMcwJp9iOm+wMm8
         JGC9qm8njBDW6klQ6KBUSnaOVZxVzR/DcNe9HEuI4GqHU5bUuTmHYy7plUBYghBMcmYW
         iK4MG0awc2y1ggUggvhzVCapeoUifX8LtcvN+xRnumqCjDINIO7F79Rbjl9AqbO2SGMD
         Vi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zTDgm8TTQ1tHD5W3kIrYqMjZ8M2WgHgN7F/X/UAUy80=;
        b=Q1Hbdaodfv9rCUCvalGAMV5JT9O+J5xwwOseONespHYCkooEEHsvevcfjOTFfja9ax
         SUAJeAUjGjVcy7ZHfK1S02RiZSOF8CBpMf4Flvt93DEa8x/b1UStErq17yh2TTQuKW24
         UmyKuh7S3RnT8r1tDj1bmjkq4OO4WugW1YPyT2xrveihQ8uF/0TlaNmlMCi3EGjfFz1W
         MXf0wEIzImZfN75SNjYb410R1vIGKv4mGcjhkcLmL74p6rTmK5RqlAWEWN6wxEpp+1AJ
         lnS0i1sx7+Xh1wwQkJY830fQMfQ5XkWR/yqZO6aOOeK9JZTI0w4cxNrZdDyrZ1l6CR9t
         iPbQ==
X-Gm-Message-State: APjAAAX9mDdSKb2n3NscjV3zc1rZnYMP/Q7+d06pNKkbwmXBALLAM//V
        OaS2RcwAoK3Vo3xlCYBe4oY=
X-Google-Smtp-Source: APXvYqwPq64xQ1fBEkFnsOnpWMk50Oih5CfvD1nCw7UEcVYft7gGhklsKeFbGSvbebTQ56lDkl2atQ==
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr6265783wmi.64.1573593208417;
        Tue, 12 Nov 2019 13:13:28 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4058:bc00:f133:7aba:dc22:ad9a])
        by smtp.gmail.com with ESMTPSA id j7sm122309wro.54.2019.11.12.13.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 13:13:27 -0800 (PST)
Date:   Tue, 12 Nov 2019 22:13:27 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     John Levon <john.levon@joyent.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add -Wexternal-function-has-definition
Message-ID: <20191112211327.meg6xdbjltucpywu@ltop.local>
References: <1573575238-8915-1-git-send-email-john.levon@joyent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573575238-8915-1-git-send-email-john.levon@joyent.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

n Tue, Nov 12, 2019 at 04:13:58PM +0000, John Levon wrote:
> Some older codebases hit this warning all the time, so it's useful
> to be able to disable it.

Thank you.
 
> @@ -2769,10 +2769,12 @@ static struct token *parse_function_body(struct token *token, struct symbol *dec
> -	if (decl->ctype.modifiers & MOD_EXTERN) {
> -		if (!(decl->ctype.modifiers & MOD_INLINE))
> -			warning(decl->pos, "function '%s' with external linkage has definition", show_ident(decl->ident));
> +	if (Wexternal_function_has_definition &&
> +		decl->ctype.modifiers & MOD_EXTERN &&
> +		!(decl->ctype.modifiers & MOD_INLINE)) {
> +		warning(decl->pos, "function '%s' with external linkage has definition", show_ident(decl->ident));

I've slightly changed this part to have the test of the W flag
next to the warning itself, which I prefer:
-	if (decl->ctype.modifiers & MOD_EXTERN) {
-		if (!(decl->ctype.modifiers & MOD_INLINE))
+	if ((decl->ctype.modifiers & (MOD_EXTERN|MOD_INLINE)) == MOD_EXTERN) {
+		if (Wexternal_function_has_definition)


Best regards,
-- Luc
