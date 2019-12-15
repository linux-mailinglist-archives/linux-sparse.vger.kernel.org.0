Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA1711F752
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 12:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfLOLGb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 06:06:31 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36899 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfLOLGb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 06:06:31 -0500
Received: by mail-wm1-f65.google.com with SMTP id f129so3485209wmf.2
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 03:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jcDGabL82HDSm+RwP1s6SSP6/ijyKq6STUEaM045po=;
        b=XbZweWBmLjv4AkpLv0N7wlmGWC59YFXotI8JTAqiVvAf1b2zAjQyT/k1rby4e+AeCD
         jyUdBiI347YvAOU6yKc00aQa+w8GGpk+VIcAyeOQQoONaIjmHL7G7rIVBAnDmwd69FUh
         onYsXJCGNdP9NxbGcsx8+3c0QVJLtZQ9gFaxGfRrR2BjXNudg7+Es3ox9zIfa5wXwfrK
         tXSQ2JPMZtyuTM1Ep7AwMHgy3bYbfBTsHKB7ioqfsHtwOz6cumE9OoX533EB5GVxwrA7
         zF6+zuqcSiiKRYdoCVmF0V8WDBddpWgiYDoJ2NIvQ+CoSDT1QzGl5EgwJ7YwKb062u28
         o6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jcDGabL82HDSm+RwP1s6SSP6/ijyKq6STUEaM045po=;
        b=lubx9cR6kpQNBTBa73kLn/5+DL1A4Gz/kyj8QrUEpLrU7lvG07Bsjr8x2HInpqTlcc
         AahnoE0J6oF6zdZJv6+blxPkKGR7JeqwC8k/UpLIAj9kApz6+DxP2dPrrhAamj1lLqyf
         aiX3ttc+hMbPhp0laSIDzwh4Iu8Xn7ZS52ijz+VGg2xQTs+wMA5DDkUhIRDXxbfq6oEM
         ukmSWGYzw1lxrrgakfW4ru6w5rDM+spp/zEMU9pg1kYqGz//OuaeGsusvfsvaKDFvEv6
         dhMvn6CiJT9NGzazYVav6axHBbePOc1lRdNqYBGsCiyv4n03NKBTfD8HQ9dGMduoySIR
         xaBA==
X-Gm-Message-State: APjAAAV+QnNGjkmmmTAGiTqeBIm4hqwS6u6b2UfmR6irmKx/vg367Ra0
        UsloNoQGSfvWdPIDeFm/DB3binOY
X-Google-Smtp-Source: APXvYqxGvhnSmM3P5rWmqRURgY0Jag0nftzxaGFSP3YKKCSD9T55P2jVr4xdJy/aTq68VclpDZ4HwA==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr7602965wmi.89.1576407989142;
        Sun, 15 Dec 2019 03:06:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:180:4f0:43c8:9084])
        by smtp.gmail.com with ESMTPSA id r5sm16760690wrt.43.2019.12.15.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 03:06:28 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/4] tidy-up of typeof expansion
Date:   Sun, 15 Dec 2019 12:04:21 +0100
Message-Id: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Patches 1, 3 & 4 are no-ops but patch 2 avoid typeof expansing
being done differently in classify_type() than in the usual
examine_symbol_type().

The series can also be found at:
  git://github.com/lucvoo/sparse-dev.git eval-typeof

Luc Van Oostenryck (4):
  mark strings as examined & evaluated
  typeof: do not let classify_type() do its own SYM_TYPEOF expansion
  typeof: extract examine_typeof() from examine_symbol_type()
  typeof: avoid using is_bitfield_type()

 evaluate.c | 10 ++++++----
 symbol.c   | 41 +++++++++++++++++++++--------------------
 2 files changed, 27 insertions(+), 24 deletions(-)


base-commit: 82dee2e25887f26df7126d6789a419eaf14beb8c
-- 
2.24.0

