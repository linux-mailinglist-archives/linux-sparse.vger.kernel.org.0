Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9291F1FFB60
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 20:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgFRS6u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 14:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgFRS6u (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 14:58:50 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC85C06174E
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 11:58:50 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gl26so7522667ejb.11
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 11:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0hjDs85/ZJrUquVK3BE+abBe4ID7ZyeWs9sRm4DW3rA=;
        b=aLHa/G5QEuJG4o5vfdtkmIAUKAyBLElJAQq7QWjdieNyvTmjIegmqdcGjd+5YL7S1p
         FNBhDJipsrCI2l9MMq1HzWq3VlyoEHOiKOy4mDlcZ8zscgl09UztwIHpUqganIcWlLKG
         oInu+J7yZOOBLSS7Wx7JWowU9l/0lcV37zrQIUUXb4DiySCvA/UUK/6kaihrrKUwBLCY
         BIRcoWtI99dKSTDj5Rq4KjwrNdEQhLIwg0UKPL3x5wtzeTKiwH9PUJbtG+L/80vu5bUA
         hM62dyUmEcgOZbIG61VsPl3MH1nHa8Vf4OtIWmhWxqQlftmvwEC8wH0Pp+gH5Kzyh+sA
         ozyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0hjDs85/ZJrUquVK3BE+abBe4ID7ZyeWs9sRm4DW3rA=;
        b=O9tW+BJnCKzJvz6ZK8gtyUg+bMx7whmtoZDILzX8ocdJQ5c0nwflAFaR1MTFn2hV/F
         4n86H5rOrAlhfYBrqfIVWqsgSpaLonpaF89qhIbbCZ92nnQAIu2u6Fee9TIOeLIYctVV
         sNOoQr/FKpoVzEJxSCyYyyGOsbkHM3v/81BWzXW/ZUa9A1LsQRHZ5Uhum3+CX+Nn6tOZ
         vlCEsH/VY0JyPbK5ZYguhiDtyuIKCzx/BSkUnht/eKOVkvwkvK5JcIdCJrsY1/CqFPNy
         dJR9NsaJfiJ/GHDe2FdbOalC3eao9n+cwzm8Owu06dcN9H8VdElkSmYLnuO37GEUtgJi
         u85w==
X-Gm-Message-State: AOAM533wH0eTFUnib/+8+bfmsZLjmrOXks4cByjUHLwGSd8fcTYZWmD5
        4itMa4Y8VcSbvRnylYsc/0UnTll5
X-Google-Smtp-Source: ABdhPJzlWn40ZL4ppAK2AmeJzymBtVrp1/O6zNjg+nyaYoGciKq+D1OJlw+YF+kdLl34uOuXFVd5tw==
X-Received: by 2002:a17:906:495a:: with SMTP id f26mr75212ejt.329.1592506728840;
        Thu, 18 Jun 2020 11:58:48 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id n6sm2662506edv.24.2020.06.18.11.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:58:48 -0700 (PDT)
Date:   Thu, 18 Jun 2020 20:58:47 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     garritfra <garritfranke@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] ir-validate: remove orphan comments
Message-ID: <20200618185847.ib25p2kt7kbsudbo@ltop.local>
References: <20200618140913.25321-1-garritfranke@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618140913.25321-1-garritfranke@gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Jun 18, 2020 at 04:09:14PM +0200, garritfra wrote:

Hi,

> Please let me know if these comments have a right to be there, but I
> think they are orphans and can be removed.

Indeed, they have been commited more or less by error and have
never been removed.

Thanks for the patch.
-- Luc
