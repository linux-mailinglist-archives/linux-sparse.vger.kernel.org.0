Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C315CBF12
	for <lists+linux-sparse@lfdr.de>; Fri,  4 Oct 2019 17:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389689AbfJDPXc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 4 Oct 2019 11:23:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33189 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389591AbfJDPXc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 4 Oct 2019 11:23:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so7751109wrs.0
        for <linux-sparse@vger.kernel.org>; Fri, 04 Oct 2019 08:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=t34ylWacRa3ytQcF9AxtQ3FkuXVMC9jXzy1MNR410Pc=;
        b=Gz9o7wl6xT15XFG6ZZIaV54CIE1dWcRCrtk9ZvKV6+cc9Sc7c7XmgWyFwF2PkGZQa5
         IrRxyITiHXAWLYO7WtsJTjTu/5nvGJfl9npoDhDkQj9aDqHRCc58CtIXk2vMgokbIS4u
         vnWpBUVjw+QBKP3q0mZ72tF0aJQuegSyuhJdUJOTZMHes2jc3piri3Yqmm7ToIYiDhnk
         CxzUNy5fJFM9SHrPxe0OMqGam3E/Pnb80j6c6s50yZhYs17UZIMTIf5//SzGRqzXyp83
         Lto3MggA9dF5zFAE+nKUIpGGIfiOxIYmKq1Er28wl8Dl6BiHOFw3PwM1cxAMMinIezH0
         m9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=t34ylWacRa3ytQcF9AxtQ3FkuXVMC9jXzy1MNR410Pc=;
        b=k6Uxfzjkpin1jd5Yq2YOzF7GEKip7fsS9k0XTNLTVAX2FJPeHd7ofU0Cw9U2+5nHVQ
         jyV+oIK/qMR6shrb28Og9WWaEre6/UvETISfBJRe/fzH6sjCMcsdHXgfa1iF4W/zdagy
         APbYaOUxXH+ztuKEtGh+sYjlNVkFwVHJd9zKhZE8K+GEj0go3jlHZKjC8Q/hnvovkhkj
         anapxVpyNW3dqvSZeMfbmBCqJ/CxNPApmjv7w3rSjJVec4KARX8vkCBrXeL+qYKIjMeQ
         rCwa38hEkLifhO/cKDQsPn5RWEvGpBTc1duehH7qRNT9SlxqXstgLLXlWlDxZRbzJdzi
         aEAA==
X-Gm-Message-State: APjAAAXbsZ7DYMVvEPBxFoT6Tm7biA80r9Fxib4U7cR85Tfefy7ciMTH
        5brK4ZF/AwyLuJEoa011OzTg9RmExz4=
X-Google-Smtp-Source: APXvYqzBzX9tzgcVG/VgEzqcwoZftZrPy/qxjIE/0dCmv423gxjiy4jcwnBnsjpnwikH06VVkh8XcA==
X-Received: by 2002:adf:fcc7:: with SMTP id f7mr11924984wrs.319.1570202608397;
        Fri, 04 Oct 2019 08:23:28 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id y13sm9978485wrg.8.2019.10.04.08.23.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 08:23:27 -0700 (PDT)
Date:   Fri, 4 Oct 2019 16:23:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/1] Makefile: Add back rule to make (touch)
 check_list_local.h
Message-ID: <20191004152326.GT18429@dell>
References: <20191004150434.2299-1-lee.jones@linaro.org>
 <20191004151757.GA21515@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191004151757.GA21515@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, 04 Oct 2019, Dan Carpenter wrote:

> Thanks, Lee!  This is for Smatch.

Ah yes, so it is.

I pull the ML from the Smatch FAQ without reading the Q properly. :)

> This is for Smatch.  I will push this in a few hours or tomorrow
> morning.

Thanks.  No rush from my side.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
