Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 058DA10A88D
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfK0CGw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:52 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37985 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfK0CGw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:52 -0500
Received: by mail-wm1-f67.google.com with SMTP id z19so5614307wmk.3
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/YcXigu/hWYZvX8Q8LgbNLtE81U/TAct75ah6OSChFA=;
        b=lSqX6dID+RVLPns4QN9xJ16S5vIZqTLp4BkA1N4FzwK31iuFiQ0lEs5jjaDfp5xsmX
         TrV644X8QBaJfrBoVzARYr/pAHRZYhxUajZIF1dT8tXI6Yu7wd148fGGGTR34gDM0h0h
         oq2JORS94XGJpa9fCq3EGUMnpFR3BZK6bP62EkQAr4gqOys3VQzW+9QNU0ISPEvFVxOZ
         547ebw4lPoJSbpBJZSe4y0zC6Fzs5OhVc7zCnoW1KSYIgCuLPXZGYcmxefJvHgeYT6Sj
         Xpo9v0NQ3FO8VeFIfB5AG3nYP5jDyFfhvq08VOBupFfs2fDt9Lp7611eTIA1PeFq+iJT
         77Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/YcXigu/hWYZvX8Q8LgbNLtE81U/TAct75ah6OSChFA=;
        b=aQFc9zMtu9Q/b/2MAWyXvAUzUgxAM5qcPpCyeP7b0tNz6l+kE+8TGZIFJZxBlzSMI+
         W9lztFkgoNtTtA8SgoVykzl66lKehoBaK7HlN6aCv97d82HIC2g15TxbbEeqLcLv+i2E
         mC2e18N8nw/1TLV2/iRmcwkvr+NdG+d+CBCOvUSY5G0ip1vt0eWa9IA1aAKSh9Y+VKBT
         VUEB9BzSnn/zaXLmEyeWlkiAVl7QqjuyqxLX53KO+uAgK2yssWZRdqriOOHgIMtfJuF7
         LjIqIHGcwTEtcmuPDJo3H1uKcmZqHfb0itSDajciJ1q7DE0jJyU1xfAGhfyhN513e5C8
         8mUQ==
X-Gm-Message-State: APjAAAU9kOzoShInOlmuRN2HwewohoVX5Bk6y20n4JbCLHaOawEJbjod
        2/SJ7QRGlKL9kqFJrb5AblIUMYJR
X-Google-Smtp-Source: APXvYqxPaF6yTQHmtRJmiuKHlvRF4+cpPsyBLMvozmlPY04X1k7Ly3dCM18BKON5/OjKKodmWTBUiA==
X-Received: by 2002:a1c:ca:: with SMTP id 193mr1682462wma.111.1574820409523;
        Tue, 26 Nov 2019 18:06:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:48 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 00/12] Miscellaneous arch specific fixes
Date:   Wed, 27 Nov 2019 03:06:31 +0100
Message-Id: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These patches contains some fixes for the type specific types:
* signedness of plain char when defaulting to unsigned
* long double
* predefine for INT128
* int32_t & char32_t
as well as simplifying and moving around some code about
these arch specifities.


Changes since v1:
* int32_t & char32_t: use Linux convention by default
* predefine __SIZEOF_INT128__ only where supported
* avoid #ifdef for OS-specifics
* fix which platforms support 128-bit long double

---

Luc Van Oostenryck (12):
  arch: fix the signedness of plain chars
  arch: simplify i386/x86-64 specifics
  arch: keep BSD & Darwin specifics with i386/x86-64 specifics
  arch: do not needlessly set bitness on 32-bit archs
  arch: remove impossible cases with 64-bit arch not being lp64
  arch: char32_t should be the same as uint32_t, not uint
  arch: (almost) all platforms simply use int for int32
  arch: add predefines for INT128 only on supported archs
  arch: use a variable for the OS
  arch: fix wchar_t & wint_t on SunOS/Solaris
  arch: sparc32 on SunOS/Solaris uses 128-bit long doubles
  arch: add note for 128-bit long double on mips64

 lib.c                             | 41 +++++++++--------
 lib.h                             |  1 +
 machine.h                         | 26 +++++++++--
 target.c                          | 76 ++++++++++++++++++-------------
 validation/char-signed-native.c   |  9 ++++
 validation/char-unsigned-native.c | 11 +++++
 validation/char-unsigned.c        |  2 +-
 validation/preprocessor/predef.c  |  2 +
 8 files changed, 114 insertions(+), 54 deletions(-)
 create mode 100644 validation/char-signed-native.c
 create mode 100644 validation/char-unsigned-native.c


base-commit: fd3528aa0409874386610ce63bb647fff8312fd9
-- 
2.24.0

