Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16C04DDF44
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 17:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfJTPxH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 11:53:07 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35823 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfJTPxH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 11:53:07 -0400
Received: by mail-wm1-f68.google.com with SMTP id 14so3691949wmu.0
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i+vjDj6ElIeFCfJkzZtTqSr0kAX2Ab4iIMI7ni38vlI=;
        b=PBBv50gASFEMvuAWpzmEiLNdfhTzeElPIoGysbUFuONik9T+VkJkPzdM8xlVW34RL4
         iGO/rFffxrVbz3lzrV8hK2mFknagNllhnDvbSYCOeRhRBLu8IxMFCKj8hBdEXeHEdfOv
         fVMoDCTXudlabrx/obJUJqLee66OB8TJUYvMv37ZblTCOTiKBLj0miWuE9IRcWsRqNfI
         v88Qm9UjRi3mM5NZnOM4jbqIhYgxP607J8Qm82uXImzRdxufn19M9mCEuR9te2N9xqyu
         dlN3Gej1kMeE3Co7O9nFD7OriAeywnJ/7qNsZbkmM5YtAhxx/oXaCDwPEXWpPIpfqggF
         jaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i+vjDj6ElIeFCfJkzZtTqSr0kAX2Ab4iIMI7ni38vlI=;
        b=sOO7erNiaX2JAtJyhWHwgolW1rzN3icnoYVxXVSByCqXv7ZlGP57fE8p/cN1uAA8Ns
         lepHYSBh53j/N4R3IrFPr05t6Gy5QWIryqGtOKdgAhYf+zVWwmchU/8t/ngkYDMap68U
         UpKh+dmXgFTh+sfIh0OgEjI7c8SMPGb8VIXELszqFizrQ1JO2wAtPN3gR9VGS0iLBlSa
         HxnOM0po4GZ4Ewyld4QpBpQKqI2xovZ0jKAmlXAvjJVrDAz1+NI3vCepHsC+ZI93di8F
         ELcvnBmipalsRhD4Y/KHLhGaJ++j6bQmNqaq1eukDwD/JsAWS/W6I4eA04QEDZfyNzMc
         r0kg==
X-Gm-Message-State: APjAAAW7NWyXwRErX1YIjRzikfHeXGAZuY/51qFd6Az9ECbHg5TriXwF
        AMZXZbBXTYoGrW8cA6X/eL7mY5pF
X-Google-Smtp-Source: APXvYqzcOjXKoqd721RBCNI/mykxRaA60d3gM8GUsvrPRoYlpX26+9kCjcXIaaeurjD5e57uHlLwcg==
X-Received: by 2002:a1c:5f82:: with SMTP id t124mr16297490wmb.114.1571586783500;
        Sun, 20 Oct 2019 08:53:03 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id 36sm1742111wrj.42.2019.10.20.08.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 08:53:02 -0700 (PDT)
Date:   Sun, 20 Oct 2019 17:53:01 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 5/5] tests: add varargs printf format tests
Message-ID: <20191020155301.eqtjwm5a3dnfjhe4@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-6-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-6-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:15AM +0100, Ben Dooks wrote:
> Add some tests for the new printf format checking code.
> Note, these do not all pass yet.

All of them pass here. I'm missing something?
If you have more tests, I prefer you already add them and mark
them with 'check-known-to-fail' so that we know what is not yet working.

I would also prefer to have this patch moved to the beginning of the series.

-- Luc
