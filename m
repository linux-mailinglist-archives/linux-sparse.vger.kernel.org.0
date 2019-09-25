Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBC9BE803
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfIYWDr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:03:47 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44195 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfIYWDr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:03:47 -0400
Received: by mail-ed1-f66.google.com with SMTP id r16so115230edq.11
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=13v02PYYx/ImJuDoqBReiaR2v1A0oI5B2jlIyxIv0Ag=;
        b=K0QgT41/NWLwpwc6ORlQqd7N+P7Uxt+OwJX9zifD2FtImoLUem1HmVJWYh2HI4ckxL
         ARrPVObz9KC/Iy1JB5JjwKDVv+gB4MK69dGgvOPXnh2rdvR/glEwFquQaqAO6td5pUDQ
         KaLUmhAzTYDzAodJSEQSGLvencJ7lOSMXqCwURqebhNrjVNoBoJM95t345zQrdS0pWPB
         slNVDJEmuQiWlHbJlzOU/Igc3/RNwBtoILWiFgW1kpttWEezhh4GoOJsCggwflMwoSbP
         uSxbRHQg7S0VUlKkmMGJV0SeYe9UzWgmhEhi61xLF1WngWtaQCI/y3h9VGBIXID80GUv
         9PuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=13v02PYYx/ImJuDoqBReiaR2v1A0oI5B2jlIyxIv0Ag=;
        b=WKZp8marGal8srLTIcHo2DE/o+rGNPq3LQcCYSEH1hug6fUgJa1QhJOHgkYWkx3hEe
         yqoTaclrDqfzz3RMNd5qDz4C58DEqIcmVUE/j8WlD9pR0zCp+o3iuRRzjZpGGokrzZDW
         cbkRPV3S21kr0tDVhltTsKQTPpa/3yVy7KMncqqQzV9rO0izDHWUG9LDuvocHHNWVH6N
         dfEUafMRlnxIsP4QNh3XdPG0cCFT0OGqMASQdnxUr8+FruJ9RgkHGlC+fIxB6S7Qenee
         NvzKPbGvnPhFJViYcEbfjuLW6PXABvPXsQUeAkRcAD9WlAG8wHNpIllJArrXBoolqMcP
         j0UA==
X-Gm-Message-State: APjAAAXkAIBT3EhpntNVkuizwWsUVC9hWeKmItZDj07iveaX7um7kXUI
        d+qmfSZpnToEMPz7tvbPh8ACfcxL
X-Google-Smtp-Source: APXvYqwDRzFlupHPq8d1jTux/dpNlyEJhOV7z8d2/plKLxc7rV/9lLvaz9fZH6tpXyqEYzDJyU6PNA==
X-Received: by 2002:a05:6402:709:: with SMTP id w9mr205772edx.85.1569449025794;
        Wed, 25 Sep 2019 15:03:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:553b:deac:4ba3:2b98])
        by smtp.gmail.com with ESMTPSA id f8sm56810eds.71.2019.09.25.15.03.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:03:44 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] fix sign extension in casting enums
Date:   Thu, 26 Sep 2019 00:03:37 +0200
Message-Id: <20190925220340.5128-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
References: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In a declaration like:
	enum {
		a = 0x80000000,
		b = -1,
	}
the underlying type should be long and b's value should be
0xffffffffffffffff (on a 64-bit machine) but is 0xffffffff.

The fix is in cast_enum_list() to change the the type of the
enumeration after casting its value and not before since
the original type is needed for the cast.


This series is also available at:
  git://git.kernel.org/pub/scm/devel/sparse/sparse-dev.git fix-enum-sign-extend

Dan Carpenter (1):
  fix sign extension in casting enums

Luc Van Oostenryck (2):
  add test for enum sign extension
  remove useless optimization in cast_enum_list()

 parse.c                       |  4 +---
 validation/enum-sign-extend.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 validation/enum-sign-extend.c

-- 
2.23.0

