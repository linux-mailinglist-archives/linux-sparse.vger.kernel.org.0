Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D22151E82
	for <lists+linux-sparse@lfdr.de>; Tue,  4 Feb 2020 17:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgBDQv3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 4 Feb 2020 11:51:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24511 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727307AbgBDQv3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 4 Feb 2020 11:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580835088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=cM0HqxEtwqprMioDZxwFf+VjDlezxdXFvEmml/vuHlw=;
        b=MTBYcrenHofCyPORsSkoCcSI9WYuQ8k4Kxbyjbhp9gjIT5GxQBdm++1ADI3WDIqK0VKX8m
        fqp/4b/vtAtEnalsAflrfX+JRzfOdNOic/DEIxJYI19XNlbaUYyneb/flzE5lZKJsDMZpy
        vVFTJO1lf9cL8z4ioyM40FTRt+4tjtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-PGTZ0J9WMYOzAdBlVHdX9A-1; Tue, 04 Feb 2020 11:51:21 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2CB1034B05;
        Tue,  4 Feb 2020 16:51:20 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 20CD21001B08;
        Tue,  4 Feb 2020 16:51:19 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue,  4 Feb 2020 17:51:20 +0100 (CET)
Date:   Tue, 4 Feb 2020 17:51:19 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 0/4] dissect: minor fixes/cleanups
Message-ID: <20200204165119.GA24330@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: PGTZ0J9WMYOzAdBlVHdX9A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hello,

Preparations for the new functionality.

Oleg.
---
 dissect.c      | 42 +++++++++++++++++++-----------------------
 test-dissect.c |  7 +++----
 2 files changed, 22 insertions(+), 27 deletions(-)

