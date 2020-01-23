Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053A8146FDC
	for <lists+linux-sparse@lfdr.de>; Thu, 23 Jan 2020 18:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgAWRiC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 23 Jan 2020 12:38:02 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42225 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgAWRiC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 23 Jan 2020 12:38:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id q6so4031441wro.9
        for <linux-sparse@vger.kernel.org>; Thu, 23 Jan 2020 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mVy94aXKV865wFj3z5ILpvY1tM6lUayJUIm39xlu0+Q=;
        b=HRgFEfra0dorBB2b0oCNObql4v+qrkCYo1KyFRJVCwOOrqv2VY+f/Dac1SSM6TKGBP
         +B06nIOHfNRQNCzvSty1Mp6pamLPvwx2vrKiQFR5wweZM+Grsk93dfX/i2ZhhDN1qxPB
         FNrtfkHKQPn0xAtSOkydot3hocpXw/whSVym418uyAOk4sc9jitZKH6/a2hnI1/me2Qd
         rgBvJv8h6oLZ7iRq3oITOVfW0gzIfWo+8yLxJf/FlWARgkaGkU5fCpXnQ5jvjMCz+bzA
         Qq/CBRdr84Zt8ec7sz3ddEUgMkoFgGFR5vT95jVS2suMNg+1Y6mqxuzNGKBN8jwI42zA
         Pyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mVy94aXKV865wFj3z5ILpvY1tM6lUayJUIm39xlu0+Q=;
        b=WmGkshebk7+2rU/IdCDeNMhkFXVBn7WzkB9M9v04CE4r0jYqG171UMKOZ3f9zYKjmu
         FY6cuQpiHlBy+F8LhnCnGW0oONicCYF/Er/tXSUezxCjB89VhICCcTp5NGZaA0ioISgO
         JXhl/M6jMrTQLecACeAP3UOtMtcptOepDercgE+5xuU7H4LiURRtT8tzEf/Ka38TsAj5
         g+uoOLg+gUY9kDaAQUSwC32x2GaoqnhN3VYezoxio6ig8NAQcoUiNzD60HkOA1NQLHhL
         TQXbwtCYiZC24PAUj9oXKAN5hqzGjeV5T9WfmAqgXgy/73KVeK6sMc6v/Ci7cZhdtVMC
         NodQ==
X-Gm-Message-State: APjAAAVbaw/YBNE0q9gcFtxrWB1D+naeplNeAn2CGC6cBp8Z73WwYP7J
        d+Yu+59lsnA1jjG80Nv8cDhuaezXu2o=
X-Google-Smtp-Source: APXvYqwbxhgwqfhZcGJu0oaCco9hnr+FHv/IpvI+FTe/Ht9AE1US8nsQuXNtqYjetx2Xs4eQwT0G6w==
X-Received: by 2002:a5d:49cc:: with SMTP id t12mr19698815wrs.363.1579801079939;
        Thu, 23 Jan 2020 09:37:59 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:a018:cdb:c9ea:e2fa])
        by smtp.gmail.com with ESMTPSA id r15sm3443355wmh.21.2020.01.23.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 09:37:58 -0800 (PST)
Date:   Thu, 23 Jan 2020 18:37:57 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     john.levon@joyent.com
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] predefine "i386" if needed
Message-ID: <20200123173757.p4tgt5yd5eu5ermp@ltop.local>
References: <20200123000136.24109-1-john.levon@joyent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123000136.24109-1-john.levon@joyent.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Applied and upstreamed.
Thank you.

-- Luc
