Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352E01D55A2
	for <lists+linux-sparse@lfdr.de>; Fri, 15 May 2020 18:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgEOQMD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 15 May 2020 12:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726183AbgEOQMD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 15 May 2020 12:12:03 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F61C061A0C
        for <linux-sparse@vger.kernel.org>; Fri, 15 May 2020 09:12:02 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id w7so4130867wre.13
        for <linux-sparse@vger.kernel.org>; Fri, 15 May 2020 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SDU5gyH1GAJ5+bztG/WWIPLPk0sMhEz8CbcMyt27xdo=;
        b=Yxpic7dooDJBInEZAbBheTsZE/RC8uoXPZpFYghNKItScXNIhpje9cNfE0X0ry7Ll5
         JQThF15u6sj53EhvNmMcOSDmZyBB4q00WgTFxaCvFMEgVlkmkPbGjlOqjBZ0ROnHaooC
         bjiDnSU/YKjicMULLO/Rz9GX3mE0H7rJO9uc13PxMHphZrUx52xWkpGiIwLHtNsKZ182
         12FM5N/nNUYkl0ZhBJ+QCOfKBcFhFYBZUT8Yq5oO1UWxEC7y8CP4H+khZ9eDS1baWXj2
         d1gfzP7lBaLI1cOcegbQwWCtmK5BpsvzjLk7jDy1iJDBp5Rj9/kreIFEMhRu0mL5r1QV
         XhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SDU5gyH1GAJ5+bztG/WWIPLPk0sMhEz8CbcMyt27xdo=;
        b=p9WLgVpPoh2YMmoDVsInW1lagfdzx+1halGofqS/4Ysi91rZG1JEUjEvWiTw6dDoNc
         hHPoTqJ3SoAvaacpCa4rShdmk7MDNqSMWM/0j8awUnaaySx/Ic/jBSml6vieIW6jNjCX
         DV3ZUuBGJ0ueiZcMke/A61CVIcpir647makVrrTFlTFZtpWuGpE8dl1bS3ofiQ8OqeZ1
         dp4Ni3aznqRwbb3Xx7xmy0z/we5cm4eqmImOATYJs3t4IXFWfIvhwbif5zOUwBEvnZ/u
         KXlW8izdFFN3pc2dlmeVvSW11lfk2yvVxlWBLq7uM4WwxLxlHtQTQafjKOmovUKpAJVn
         t3gQ==
X-Gm-Message-State: AOAM532dixKV90J1pHk5xRaBNI0DoRzTlM5l/FkJ/OclsgN1tOP60s9i
        hHV9xT9RdjfQLw8KLiihj2NXqfFl
X-Google-Smtp-Source: ABdhPJwezX5/cxmy9WgWhjmQFVi9vTVwQsZJmJ8YN3uQ5Y/mJhfjjZoTPcyrU023EVp3F/TQ0/m6/g==
X-Received: by 2002:adf:a298:: with SMTP id s24mr4994278wra.184.1589559121516;
        Fri, 15 May 2020 09:12:01 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:2165:33bb:5acc:e0bf])
        by smtp.gmail.com with ESMTPSA id 81sm4674690wme.16.2020.05.15.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 09:12:00 -0700 (PDT)
Date:   Fri, 15 May 2020 18:11:59 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: complain about re-declared functions with different modifiers
Message-ID: <20200515161159.esquifvwlcgtzirj@ltop.local>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
 <20200515133617.GF2078@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515133617.GF2078@kadam>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, May 15, 2020 at 04:36:17PM +0300, Dan Carpenter wrote:
> Yeah.  That's it.  When I see the call, I want to parse the statements
> so I need the symbol with the implementation.

OK, thanks. I'll look at this this WE. 

-- Luc
