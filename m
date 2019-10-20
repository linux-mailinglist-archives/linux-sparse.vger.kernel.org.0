Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDD7DDECE
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 16:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfJTOMV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 10:12:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50809 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfJTOMV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 10:12:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id q13so453195wmj.0
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dN09VuEU8FEi9aqArC2fPVUGP7M8syOIHcU0Zd/1WTE=;
        b=Lcldm7myB349TvrTeLe4iIh03R0de5rtzRS62r5MfMomFNlUAP8GzG/m47B4KNqroI
         azBviS0XZJ/QlJk6nVAa99is1nfum3V8NFzIa2WKJspYIw4/A+rH8NK3EB/MyPHp2COK
         5qcCa3Tcph0wz5mE2IWk98wyKVlbVGl7xVanmdWTozTxDNc8sj+ZYfg7KKscQ4oZ/wQj
         M8f0WC1QGMK0Um/K2n4GFtgdBfS/KToutBJtJ119Hj2HnK9L/R6DIOye/vnblOkFqVHL
         dVv9D8UDXVA/bue92W9cf0zYgqVi0U+vu3EEKMimghDgZ6GHFX5fYjBtM+8IrVWYJaJt
         PPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dN09VuEU8FEi9aqArC2fPVUGP7M8syOIHcU0Zd/1WTE=;
        b=MoMNuH9XQ9L/5wec00iWNjIz8g95ZRfiBtpIFQZo0omq4lQit1BN+G4/1Q/b8M7CvH
         rpVWXcvwFaH+2H+pm/kOm0R97bnTtSoORWgwIoXXXjZ1/9ZKKQgSeGrUviju0Lu3l3KF
         4tu/vaiioXC4uPqqQzS80lIIeOpVlH0VMiGjmSQjl2MQLsR62RolmY1x87Zfs6qXzWvg
         YpoXq7Zl+rvCPg2RFuamfJzyhSAd9OwnIk226/yL4nuzrgAsg3XkuvCWzONWxLYvhAdB
         M7ipXQmuxw1vM8DviyDEjipaj6Zp6lBx5fqfOBjN4vox6LAJm635pCd0qqyzJ3xNvC/F
         QRCg==
X-Gm-Message-State: APjAAAVYekOmeuZu4Q3TEDWIDQHGxMWuztjO6kxpP0oCiYwR8cPpMLZE
        u4yf+FwFueeQSkzyVwGaz5O9u+IF
X-Google-Smtp-Source: APXvYqyNnXA3gE9mKVNGqput0YW3N5wnaZFSh9pPS4i41ocwr6KxeK4NBXJoVojKbuT0w7bzac4izg==
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr14958036wmj.85.1571580739186;
        Sun, 20 Oct 2019 07:12:19 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id u1sm18735036wru.90.2019.10.20.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:12:18 -0700 (PDT)
Date:   Sun, 20 Oct 2019 16:12:17 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/5] validation: ignore temporary ~ files
Message-ID: <20191020141216.zkwqacom4m44un4r@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-2-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-2-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:11AM +0100, Ben Dooks wrote:
> Ignore any ~ files left in the directory.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  validation/.gitignore | 1 +

This patch can be dropped because the equivalent has already
been added to the main .gitignore.

-- Luc
