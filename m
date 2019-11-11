Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A59DF73B5
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 13:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKKMTu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 07:19:50 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33426 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfKKMTu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 07:19:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id a17so11923407wmb.0
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p4ovk1sUXuKFfD/beDNioteobYBsteeGhVikW78bjWs=;
        b=Qvs6WG6KKYDv8eMj/qfqOVCAZjZEAJ07zuPul3HsO5wPs45Otv1QG4RAey9rqx1O2L
         /ertJwBPQ0oe9AFNM+xyIPdBneGro/FUGN7kARLIeb0cRgljAD8jIuaLP9AByTH2B1ww
         2hjNC6NPkun7fMIxdY+5d2Q39gmlwZ88+Rrb7BUs374bmJNmEF4e03xPmM2J1FmfGJx4
         JN0W0PZbV/+zP0QxrFPbm36FXdX47I6mQzCHRTqXDB2H5Oqew6y/fo0eQC4FhhywytBd
         wUIU32pcxeJdELxsRMKz57zq2he8VnYLU+88wIVn0SM2ZBV3RIakOUb3bQcI5Evhah8M
         7ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p4ovk1sUXuKFfD/beDNioteobYBsteeGhVikW78bjWs=;
        b=oebKamTtwPF34ggJQK2+7+JsIWG0O8Kya9Fvo0R9R0oD1mCorJxAQBrYRSN69TKmqv
         PrVzsPvC/dF3jPSvh8ippXlMc8y/1sVAC9Zovv1e6ZMMAZVcbZo+tV4XZYPIgIF/RA0Y
         aQoIXz/anQBrjzO/q9UEj63icrbkPVRAIYhvE0cepgUX6LbqBxm1MJV6eQnVjmdmNjrw
         vxQziWATZwa1jqUSPSWqcT6LoUF4bntpqw9NT9GLOBbpLLg21GOtu9eTgSqTtNiK9Uwk
         tKxLUpBx1lj3ie+VjfCYd4Ko4dA8rx+VB+ZQMQbXo7+05VDLFP+xLPVcY2yQKm3uRHTz
         M0Zg==
X-Gm-Message-State: APjAAAW7cFHCZlYiWzfg5Bw549qNwOgir8RHj5D4H1mgETymzQxsxvYb
        DQ4P0647wlS3V4/y3FMtpzYZcZh1
X-Google-Smtp-Source: APXvYqyLES2ien1dJauBcIp05y5+LXoFV9lnK9X3xBAyPubwCXeRDqYzSV1JSrdSLDbyQV5KULl0ig==
X-Received: by 2002:a1c:9c54:: with SMTP id f81mr9470653wme.89.1573474787955;
        Mon, 11 Nov 2019 04:19:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id j14sm16256478wrp.16.2019.11.11.04.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 04:19:47 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] cleanup arch-specifics
Date:   Mon, 11 Nov 2019 13:19:41 +0100
Message-Id: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is a small cleanup of the arch-specific code
and is essentially a preparatory step for some code
reorganization there.

Luc Van Oostenryck (3):
  arch: keep cygwin specifics with i386/x86-64 specifics
  arch: remove impossible case with mips64 not being lp64
  arch: do not unneedlessly set bitness on 32-bit archs

 target.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.24.0

