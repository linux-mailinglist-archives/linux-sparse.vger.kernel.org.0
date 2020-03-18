Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138B018A898
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Mar 2020 23:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgCRWve (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Mar 2020 18:51:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55624 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgCRWve (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Mar 2020 18:51:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id 6so25771wmi.5
        for <linux-sparse@vger.kernel.org>; Wed, 18 Mar 2020 15:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rX8oWOkidB+TYdBsHo65FHvW3qKND3QMdSm9Ix7Ipuk=;
        b=VKKaYz7pvSmZ5sQHtXy558ntXOclC3a0ytL9pIKcJJfDE+lrzcLsbH/U+1Ut5dgrfj
         vT7F10W3qNL8YPuWH1gmt1wQPO/+0UrNNSIXek0ymbFfABG3OnjFnaAJK9qHn/hFVrNF
         5Z0yn2kqSS24z68svL9XaHrUzyuRSXuBEAkV8hmfVGyOwlHG0BNERxjIDLoaacxFkrHD
         LjyQxgNWxresoQGc3wt59HghmjasYbnyWcAVlqz5VbbCJN//n5/3zL7GXPNqFLZ3GzO1
         PvXH1uVKR13RSSfUT2Dyd1WjmP7mielHsIeTW/ausrqXfaxytncRujgHrAcIbHwiK54m
         P6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rX8oWOkidB+TYdBsHo65FHvW3qKND3QMdSm9Ix7Ipuk=;
        b=OZd06DUr1CpLeNjxBmBoNpWSbWD8RR/gMiFok54/nchBnCATfgyLmIEHdbaLc9mMDj
         hLtteGb0y4skv1uZlvGDZLSPfU1YFdFgR9EqKu0UK9I4pXZP4Cgw4z5NwyVTINc9amrR
         zSHP43sNVnPYdZItWOhStaCgjgu5JLrftA6/JHd/611ChEns4mJsxYGQIcdIeOMBO9R6
         FR5azMN5uM+85UPbVDS726gi3zz3PmUQ/MAz75Sszp/3Hmzr5KteU9yXddjZy1FGF9Sq
         iyVffkeHM+ZIiboaDvaDsxtYB43+6+nQz/YH25CZMiJlQFQloDmfUNOb585G3KBc0C1U
         xDeg==
X-Gm-Message-State: ANhLgQ0mxe3IDgCtc7bH2FA6jZPXHuHVvulu/AFGReVVU4yQ29ac06iB
        QDJ1fBTZ5V50rg464BplzhI=
X-Google-Smtp-Source: ADFU+vsRvSX4WbeZoeA+6qJhCfIvhuE2Y5ReLDVPFkOU91fYM8+mrJsGrUVUAbi6DIl+I79ofqgmNw==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr7599146wmb.93.1584571890844;
        Wed, 18 Mar 2020 15:51:30 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:2512:9239:c7f7:571a])
        by smtp.gmail.com with ESMTPSA id n4sm413569wrs.64.2020.03.18.15.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 15:51:29 -0700 (PDT)
Date:   Wed, 18 Mar 2020 23:51:27 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Alexey Gladkov <gladkov.alexey@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH] sindex: Add option to search by location
Message-ID: <20200318225127.o6pjwwyxrluahqfe@ltop.local>
References: <20200318183924.343365-1-gladkov.alexey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318183924.343365-1-gladkov.alexey@gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Mar 18, 2020 at 07:39:24PM +0100, Alexey Gladkov wrote:
> To create plugin for text editor, it may be useful to be able to search
> by position in a file.

Look Good. Thanks.
Applied and pushed.

-- Luc 
