Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74394181E3C
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 17:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbgCKQrp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 12:47:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45878 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgCKQrp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 12:47:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id m9so3505171wro.12
        for <linux-sparse@vger.kernel.org>; Wed, 11 Mar 2020 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=saut8IuDoYPjIV6rKK9Cs+VX6XTaZgBujekCH8Bu7o0=;
        b=c2ay5uwchcqvseWeOVvmKQoEd/rI/bK651JhpSAMF9Dn+F9yQc8p7MEtI8jdz90e1s
         Dl+unVyrTZeKotpPn/q6ath9ORQzix8b58qAs86giHZlth/rFB9PXEto28vpvXToCyqN
         rl6ouRusYdFRrwHGGqw5w8sxA9IAG36opMTQAMM+h4jp7OvepFDWSZcIdf6D7aegSuW+
         JEF64DWgoWo70x9Mkv8AHxHZ/3FwPyN0N4wicDBI5hzOZGfx+tBybOpwKqez0vb4qkh/
         YF3AuIq0ISFMtEPHT4flMDTn5Elm81AC9Z7481xI8AvFL3Py3p5wMyW6kkCNyloLcTdC
         dpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=saut8IuDoYPjIV6rKK9Cs+VX6XTaZgBujekCH8Bu7o0=;
        b=dlukzlT1svcxHQFntHdGIwYYjYiY475PaLy8ncFfj0gkKqtA/l8wotY7YGPbHchk5H
         hQ6dtrzy0BCTL+M6QW0RMD7A8k0svI9IDAcJlM76otJKxgbTj5UqZmmZXKxxVVaWVHkF
         9rVYgb4HPpLgCoKB8bkrBJb1jejFFMZBlP3P5gqi4X7bTn2TheTnZJ502nhJ0EBINtoB
         e+gftiD860zB/tccDffN4eEZS1sJ2l4bUPdeuw3eyVrhOn02+z+RqctSlbi3KD/YYrDG
         /9CKaDaT55UIRIRue23gyNNEaxBDrstORa7UMR/B0WzBFbL/KMKuFNjg9Ho83JUaDDD2
         taWg==
X-Gm-Message-State: ANhLgQ3uA/dx3adGEiQGWH7Qrjn28GbnR8AkOVihjCU6kdmMtTNa9FO1
        jO/N+90SpWhELZ2eqo22Om450V5G
X-Google-Smtp-Source: ADFU+vu4PjacCZweOmSdo0KaDxxZzUEQzPNWv6y6Wtg1HQ6rqc6+rvm+51s4Qihb193HkWK1nHKTVg==
X-Received: by 2002:a5d:640e:: with SMTP id z14mr5737854wru.204.1583945263749;
        Wed, 11 Mar 2020 09:47:43 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4075:2100:f42e:1199:6e9e:3f3])
        by smtp.gmail.com with ESMTPSA id d63sm8953939wmd.44.2020.03.11.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 09:47:42 -0700 (PDT)
Date:   Wed, 11 Mar 2020 17:47:42 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200311164742.3jjzixpsb34pwgfo@ltop.local>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
 <20200310171202.y5rhsydmmbewoarm@ltop.local>
 <20200311120427.GB19327@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311120427.GB19327@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Mar 11, 2020 at 01:04:27PM +0100, Oleg Nesterov wrote:
> On 03/10, Luc Van Oostenryck wrote:
> >
> > Anyway, only a warning should be issued (I'll send a patch for this).
> > I also wouldn't mind to add a new warning flag to suppress it,
> > something like -Wno-directive-within-macro.
> 
> OK, agreed. something like below?

Yes, perfect.

-- Luc
