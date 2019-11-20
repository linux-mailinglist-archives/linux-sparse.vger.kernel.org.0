Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F04310308B
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 01:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfKTAKP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 19:10:15 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55678 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfKTAKP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 19:10:15 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so5151523wmb.5
        for <linux-sparse@vger.kernel.org>; Tue, 19 Nov 2019 16:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hl0+MLs9zObisy3RJ+Lf077Deoh8q5EIcGgepjRcVqo=;
        b=HJNOOkKHMCCLBVau5hZupc8uhJzh20aJqOxuMbdxMY4MRLr5Q2UA1Jh15pmzVa+NPI
         aI5ZtN0Ibq5O8eX/d4yNaw/8lFLWyz1r4RgU9IpU/ZPWp23rqATOBoiZsT59ikrqnnPl
         vHySvIoxvJ7yqinzVuKRLv9HHGlRDJDkWuU0eJV8TPWbnhinxYlvoRrVhdNR+hU3tCWU
         WXsJ2LD0mt7bLIBYbx7pe7Gldig+WasgzgUmL/eflPfapTZbGIfj1rsQmyosaCHHKs0V
         jMOlT6cK9KyYP/CXk4YX5T9UN1sDaG7lFFuzPDQUuxT4NjMXrbJKJun9k+cTtptjijbt
         bWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hl0+MLs9zObisy3RJ+Lf077Deoh8q5EIcGgepjRcVqo=;
        b=KU1V8t4JfMJKi2xIgxW0v+9NDaPJIrHVHJGpMq8cdUk0Tqb2bfmOLac/F1WrLQdS4N
         bzy3kYSAtRop0bu3SSLVzdjT6KE9miMHyZk8UjDbByf+FDmUL4cHZi+4ILSpRr6OTbhN
         mW2qJfWyMlomJutGQ0T8/j8KQ3ZamEjNybk7rYCzPopsnqKV/MZQaSAMH4hntgE6e931
         DSthYcJKj7t90cOo1CdtvnCEDXa+Lm0TBNgJEMbFTIisRTBudbUnZ3WekPfmyWHDJbGV
         nx+FosNzLjqi02i9ZqwcO9ZkHA7sDn9Mh9Nv+P9EzXiXg/19eR5IF6pmRBf44l3ahC8H
         esIw==
X-Gm-Message-State: APjAAAWNyWKaHE5l1ntYbdJuxO0kTPnqbEjGOCkDZcETj3fuC/uJ7nOD
        IbYgVSRuicPWW/gXsJiwL91QBUV2
X-Google-Smtp-Source: APXvYqy174Z4kLccda/WA+utIIAchNBBMPM9bJGEU0QkvUM7JpYktUxvJBbq4y6vdRtzxEb/Wbgo9w==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr50203wml.41.1574208612630;
        Tue, 19 Nov 2019 16:10:12 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
        by smtp.gmail.com with ESMTPSA id c24sm33398808wrb.27.2019.11.19.16.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 16:10:12 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] fix propagation of function attributes
Date:   Wed, 20 Nov 2019 01:02:19 +0100
Message-Id: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Function attributes need to be propagated differently
than the usual specifiers: For example, in code like:
	#define __noreturn __attribute__((noreturn))
	__noreturn void foo(int a);
the __noreturn attribute should be applied to the function
type while a specifier like 'const' would be applied to its
return type. Also, when declaring the corresponding
function pointer or functionpointer pointer:
	__noreturn void (*fptr)(int);
	__noreturn void (**fptr)(int);
the attribute should also be applied to the function type,
not one of the pointer types.
 
This series fixes (hopefully) the previous attempt to solve
this problem. The main patch is #4, pacthes #2 & #3 are
kinda related preparatory patches and patch #5 is clearly
related but independent (and a bit discutable, so will
probably be omitted when pushed to kernel.org).

Many thanks to Ramsay Jones for noticing the problem!


Luc Van Oostenryck (5):
  add tests for function attributes
  fix assignment: pointer to __pure/__noreturn function to void *
  fix assignment check with function attribute
  propagate function modifiers only to functions
  allow omitted function attribute in definition

 evaluate.c                               | 14 +++++--
 parse.c                                  | 49 +++++++++++++-----------
 symbol.h                                 |  5 ++-
 validation/attr-visible.c                | 13 +++++++
 validation/attr-visible2.c               | 10 +++++
 validation/bitwise-function-pointer.c    | 17 ++++++++
 validation/function-attribute-inner.c    |  9 +++++
 validation/function-attribute-omitted.c  | 13 +++++++
 validation/function-attribute-pointer.c  | 33 ++++++++++++++++
 validation/function-attribute-void-ptr.c | 14 +++++++
 validation/function-attribute.c          | 15 +++++---
 validation/function-redecl2.c            |  3 --
 validation/pure-function.c               | 17 ++++++--
 13 files changed, 171 insertions(+), 41 deletions(-)
 create mode 100644 validation/attr-visible.c
 create mode 100644 validation/attr-visible2.c
 create mode 100644 validation/bitwise-function-pointer.c
 create mode 100644 validation/function-attribute-inner.c
 create mode 100644 validation/function-attribute-omitted.c
 create mode 100644 validation/function-attribute-pointer.c
 create mode 100644 validation/function-attribute-void-ptr.c

-- 
2.24.0

