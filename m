Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D46153D3F
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 04:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgBFDIP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 5 Feb 2020 22:08:15 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36863 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgBFDIP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 5 Feb 2020 22:08:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so5235824wma.1
        for <linux-sparse@vger.kernel.org>; Wed, 05 Feb 2020 19:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3naoDQl1pbrjQuQF+K3DgQD1LgXQOeuo04nPJY4QE84=;
        b=mbgEUn2JrgTmG+hmlusTP+P/JqRHmQw7cO+nfVY6sYieAPUKufLSblh59QqeyII50I
         NNog8XHuQ9ukxValzuFPnKF+iwhd5ZgzBKCsXpVvNnKOXE3lpJSnzVgWlF/+D1F48E4d
         OGVD8+SkAttO/VSyBxDQh4U+E9zygK+HBRoUmd6bi3jGt/6xf0ECGCpwq+L3k5YjdqbT
         LDVeTrs61ahu72lELTu6wN1QZ0d0O4DMSzH50ZESQflhfB0E6iY1wuA79xiKg8UWeV8M
         YQ+iIQh2tBJZeDEIPG8kwuTtomY/cm5pvZvIHSFSp5BpLqRyqKn+2hDykr0RYV7HQyFt
         7JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3naoDQl1pbrjQuQF+K3DgQD1LgXQOeuo04nPJY4QE84=;
        b=s1oG/E7vrm7UiwZqbVi3DorB6kAwTUlV6XWS8ZRVhOrQgp8ZhdjzOYlm7jP93GupR7
         i2fjrbtW2vc91LZM81zQ8Jw04W00lF2vBuU3Cd/FdlCeT5ARUBZ1wnsM44cvI5Chef8P
         Xl/X0ILdEHPyt4wIKlO9b95zzWFs6Y/qwp71ZGrYPTPELva1FCeYqIxS3XbWMlvc0ZPj
         5azxdtZp98s91uldmjhepFh6K1EuaiEivzxUmHs+Vg/hl6tAXPvMbh8XiZas0Hvb2m3m
         JhqhP/miAUByuXSaBSSjhCswhVk71mEWotV+LzxbjHLLoQAU7AoVxjiB7ynhHeI0qS+N
         BvFA==
X-Gm-Message-State: APjAAAU7yNlL3Cb2acOonRaCN3HESWpJQkEgVfhqCjMzbhkrbU4i0TtU
        kNnYJul1+w0QoQw/JeENorg=
X-Google-Smtp-Source: APXvYqyRbevO+uhpV+AgjtXOcZ8aF9i6JfRtpuh1bH14ltgnLVvYWKR2IrDd68sesN3InbMVjCMNog==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr1261688wmd.102.1580958493185;
        Wed, 05 Feb 2020 19:08:13 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:b994:38a3:ea82:feda])
        by smtp.gmail.com with ESMTPSA id 133sm1917385wme.32.2020.02.05.19.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 19:08:12 -0800 (PST)
Date:   Thu, 6 Feb 2020 04:08:11 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH 0/4] dissect: minor fixes/cleanups
Message-ID: <20200206030811.lkcvfmwgztrx44js@ltop.local>
References: <20200204165119.GA24330@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204165119.GA24330@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Feb 04, 2020 at 05:51:19PM +0100, Oleg Nesterov wrote:

Thanks for theses patches and the following one.

-- Luc 
