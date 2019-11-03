Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFA6ED3DB
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 17:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfKCQ2m (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 11:28:42 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38200 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfKCQ2m (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 11:28:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id z19so9448363wmk.3
        for <linux-sparse@vger.kernel.org>; Sun, 03 Nov 2019 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4jQ+zC5IodqEFt6LWtd62dh8JuP7Ud3CU3syV/ExeE=;
        b=dJ0gZBQ8uVLP3IQShXGlSpUHyBqhqSo9C9035apopTdze2yS2K2dEnJRzhCJ7C/EtC
         eLQCyTJmh2U5MMQ34p5Jm1ZT34jmye/k+OsqBbu+6czEvibvudCEiB+W8CZF+RHhZhUc
         ONirMzDhDK3JrUQ4q8amNub31hW4BfzbDMAZj8NrLYd27VcQwBYDUP4dqe9g1c5Vyli2
         4cUzmIOTqOmm+1M+NITNlMNNqLHtuhsax3xKOb33P1yRaJ1CcTzYDPMQFjfgBfQI66bP
         PWoPmb9882+3qRi8lzMfkG5iq9L7Sdu3w3hD0p7kLZWNK1CLSnQ25CHELWg7vg/Yrc6/
         xpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s4jQ+zC5IodqEFt6LWtd62dh8JuP7Ud3CU3syV/ExeE=;
        b=MsSuo9XwET4LuabK7CeR52mW06ySagNO8XyZoHKEUB3fxJWvte5fLMKCEVSTF52dyy
         FVeLr578T7kiUxM5tRmxOppVcY5IewHSI5nKZG8G7ZTIwRpvHHUPyh1beY/t8aPj7xCP
         xvVAFH7G0K2UqBfW6tbp/jN8+E+g+HKqebAdJz7bK2ymQ6PgFhKaGrTrJH3RMHXJzcgg
         FjsDi83cUJCS6CEP11HG0u0ENnBgpq5G2OUqQ1byBXiLXc5qGgGeEmApBx5mTPQ0r/U6
         1wtY56Nmiem5zkU1opg0/eKWJ0t6diSATN9NxsSmUkwo13nYp922VhhzjI3vlibgOSbj
         o4fQ==
X-Gm-Message-State: APjAAAVlOQHUeF+DJGD4xWfXzt1D0zmkxw3QL2qjPv6N8zwAOE6MQr2u
        2SnOXyhsiBK11Xzoi0cdgy/TOZvT
X-Google-Smtp-Source: APXvYqy6TCl0CCQLAgg0FBk21UO34GtNRQRDbcPFqOLIjl5mIBzzUjWBlzroW4KmLN63/b1xf7zsiA==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr12780614wmf.132.1572798519890;
        Sun, 03 Nov 2019 08:28:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:d83d:1405:3788:2299])
        by smtp.gmail.com with ESMTPSA id o189sm20902060wmo.23.2019.11.03.08.28.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 08:28:39 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/4] remove unused or unneeded constants
Date:   Sun,  3 Nov 2019 17:26:31 +0100
Message-Id: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

As a preparatory step before adding some doc for the type
system a some changes in show_typename(), remove some of the
unused parsing & typing related constants.

Luc Van Oostenryck (4):
  remove unused KW_STATEMENT
  remove unused SYM_MEMBER
  remove unused SYM_TYPEDEF
  remove unneeded MOD_TYPE

 ast-inspect.c | 2 --
 gdbhelpers    | 3 ---
 show-parse.c  | 3 ---
 symbol.c      | 4 +---
 symbol.h      | 8 +++-----
 5 files changed, 4 insertions(+), 16 deletions(-)

-- 
2.23.0

