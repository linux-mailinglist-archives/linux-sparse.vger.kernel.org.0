Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82FF8C2533
	for <lists+linux-sparse@lfdr.de>; Mon, 30 Sep 2019 18:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732286AbfI3QdF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 30 Sep 2019 12:33:05 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:43022 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfI3QdF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 30 Sep 2019 12:33:05 -0400
Received: by mail-ed1-f54.google.com with SMTP id r9so9216420edl.10
        for <linux-sparse@vger.kernel.org>; Mon, 30 Sep 2019 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G84nbsWjyKxnIb+e2e+wiTN4qAUfXIWACQHS1Y+CWNk=;
        b=qQ+7KFCNycFy1VrY047vpevb2hTqRcQQoYpkf/Eiulbh7XloTeKpg7hVivOfyszegm
         35jxaTZJ6+aCJ4FjgmO1yuH3WBAYWZnPOptlxF6EM90sanVAL/xwL/NHraMMcIpTDn4k
         z7FC8SHMStFOJUpd8eFt/xkJ28pP5WkrwOMyKF27tD2OrBOOhU9yD3A3fpcnDh4GaO/e
         z1xqNMPSzIcfcpxvXoavlP4akEKxqi0ZHHVmeOLznRVD1UV0GOnFYiLTxNWhYS8nKvB4
         YnoNi9yudF+Pa5plW+BZ0GE0n6jLU1kPt7fNpcg0jhFOYJXqim1ihycoxN2DSQB3jIMX
         mxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G84nbsWjyKxnIb+e2e+wiTN4qAUfXIWACQHS1Y+CWNk=;
        b=itnWFEMklfdaw9+RSd2oJKEF5d6q96SHmmnpdQ/1i2sPth4WWiDvYhULSQjXXdPsyZ
         +y9UhFB5fhK4XsgVFcpY6u5RVlyxlKRNDjGikKEP/2M4Ik1BW7qdkxVOt8e1ZoqhfeKY
         tzslw+CCKWcuRtuJ9ScCg1PwAuerd4TF4apVNUkCNmJ69N7zjeZ4ldS5m5uD0nt2qxth
         8y9JhJZyJpFsRqi+k/WXM5pAC6wjQy2ZlPrKt0EN6mUU1DNgvjX0ciUr4dpwQGKww1tP
         NSg/tUfDrJH/krSbtgyUwnMYtIUpOhZTuyzO9PAi1meA9tpRH8ng72z7OhwzQ8XIT/mf
         mr+Q==
X-Gm-Message-State: APjAAAVzQDmuqbHSuJxeFF1tvMJz6f8XD95XnRQ2MOgU73DQsRXz30x0
        fsj9c0L5XlyRJ8u9x9myH6Q=
X-Google-Smtp-Source: APXvYqzIH1EB/jMoYJ3hZark54ho2utyqSU/CRFGRrzCKYWM65EXD4SHMqXkdxvkPasZg5zBbuNpRg==
X-Received: by 2002:a17:906:4990:: with SMTP id p16mr20634286eju.9.1569861181986;
        Mon, 30 Sep 2019 09:33:01 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:7167:7859:9bcf:1ec4])
        by smtp.gmail.com with ESMTPSA id i5sm2518950edv.29.2019.09.30.09.33.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 09:33:01 -0700 (PDT)
Date:   Mon, 30 Sep 2019 18:32:59 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: <linux/kernel.h>: container_of()
Message-ID: <20190930163258.7nrseddp5mk6wyz4@ltop.local>
References: <db1c5b13-8864-f7a9-81b7-8cb153760778@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db1c5b13-8864-f7a9-81b7-8cb153760778@infradead.org>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, May 06, 2019 at 01:30:09PM -0700, Randy Dunlap wrote:
> Hi,
> 
> sparse (0.6.0) seems to have problems with container_of().
> My x86_64 allmodconfig build has 88 warnings like these:
> 
> ../kernel/bpf/verifier.c:7701:39: warning: unknown expression (4 0)
> 
> ../include/linux/genhd.h:221:32: warning: unknown expression (4 0)
> 
> ../fs/proc/array.c:686:32: warning: unknown expression (4 0)
> 
> ../drivers/infiniband/hw/hns/hns_roce_device.h:1003:16: warning: unknown expression (4 0)
> 

Hi,

This is now fixed in sparse's upstream.


Cheers,
-- Luc
