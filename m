Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0DD8F67FF
	for <lists+linux-sparse@lfdr.de>; Sun, 10 Nov 2019 09:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfKJIiJ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 10 Nov 2019 03:38:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36272 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfKJIiJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 10 Nov 2019 03:38:09 -0500
Received: by mail-wr1-f66.google.com with SMTP id r10so11421137wrx.3
        for <linux-sparse@vger.kernel.org>; Sun, 10 Nov 2019 00:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GfA53QcCN8vfqi/W0QzLNNdh1qv3IBjkKBVSbo3PtDk=;
        b=Anu21StsADe3BVL3rRJiC9r16NR5sSybUL+VA8uYx321YAvtldMk/jsO6z6XFDMWCG
         4j1GRx9dxLnftlw6ZLe97UxkVdXO35tOb4GhJH2b/dOps7cDq+GZDkQEP2WnSvzElA1l
         OWZOyP71a/kcfgkfusLSeQzUhdFN6dIKi2QbYQLwI9qX8ZAceo9l8xNnOaD1evDrR3Wh
         0e9Y0bIuhZKLSsfboFdgsKFHz7oJbLjsoSNPMPAnTl4TnBNE2xf4L1zfvfCy4ijNx3y8
         dHufy1DPm+StJbqmoH6yId71I3P0R/0wilLJYQbWr/vH+v920tgKYA4cYWvPgg0eO98o
         l2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GfA53QcCN8vfqi/W0QzLNNdh1qv3IBjkKBVSbo3PtDk=;
        b=fFDvRmFhzeU/BMXweg+cppWS4KZ+7v7H5l3t2foVe+zMnDmtIEHh4PioYC57ipqh/h
         zGISGv1Wt28dqf7yWUUytZZyph1Gnb9QaV+SaBEl0PLit+8nC6W1rCJ6OxOeMR+9Zuo2
         W5mfQ4OWXYbh4yUv5WJILJUcOQMSslSxLK/yBpgR7rc8XISGzTPbqd9pKUItUQqKGwBg
         2bAFtx9y+jPh5tsjaNQBNuVVxYM0dHm+ALaiHnOAdbg9XozsmEvZZoYbghbaSJKI8yXM
         6qmOQ6dQhgg4Sgex+3mNLumQsiZP/c1G3O3o0TPM6etpQIsaWs9pC5c4y6NzCswbUb9P
         2oIw==
X-Gm-Message-State: APjAAAVBR9dR2jvhzWdrUatUe/d13/cOGXsUAcQtQwfb4VhHb/ey5Rhv
        T7bjHc7LuV5Oc4tUl99+EYY=
X-Google-Smtp-Source: APXvYqyDCgXOZfR8xxDKQtl+MBJG+3xGoMeV1LD4wxzNyRCWjOLTsiFmdmFgW2O7gj2/nGKT4fFTxg==
X-Received: by 2002:adf:f386:: with SMTP id m6mr9892011wro.201.1573375086139;
        Sun, 10 Nov 2019 00:38:06 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:b861:14dc:6a81:f1a7])
        by smtp.gmail.com with ESMTPSA id l4sm11341145wml.33.2019.11.10.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 00:38:05 -0800 (PST)
Date:   Sun, 10 Nov 2019 09:38:04 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/4] typeof: add a test for unexaminated typeof
Message-ID: <20191110083804.2mraperxbdih2wcd@ltop.local>
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
 <20191109133519.63010-4-luc.vanoostenryck@gmail.com>
 <83003c2b-7e92-334c-1acf-be5d4a70191d@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83003c2b-7e92-334c-1acf-be5d4a70191d@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Nov 10, 2019 at 01:32:40AM +0000, Ramsay Jones wrote:
> 
> typo in subject: s/unexaminated/unexamined/
> 
> On 09/11/2019 13:35, Luc Van Oostenryck wrote:
> > The base type of pointers are not examined when the pointer is.
> > It neends to be done later when looked at.
> 
> s/neends/needs/

Thanks for noticing,
-- Luc 
