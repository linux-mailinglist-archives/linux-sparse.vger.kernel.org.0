Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0761E6F0D
	for <lists+linux-sparse@lfdr.de>; Fri, 29 May 2020 00:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436874AbgE1WcA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Thu, 28 May 2020 18:32:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436803AbgE1Wb7 (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 18:31:59 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-sparse@vger.kernel.org
Subject: [Bug 207959] Don't warn about the universal zero initializer for a
 structure with the 'designated_init' attribute.
Date:   Thu, 28 May 2020 22:31:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo tools_sparse@kernel-bugs.kernel.org
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Sparse
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: torvalds@linux-foundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: tools_sparse@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207959-200559-E7pP0OflsO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207959-200559@https.bugzilla.kernel.org/>
References: <bug-207959-200559@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207959

Linus Torvalds (torvalds@linux-foundation.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |torvalds@linux-foundation.o
                   |                            |rg

--- Comment #5 from Linus Torvalds (torvalds@linux-foundation.org) ---
That said, I'm not sure the kernel cares. If sparse makes '{ 0 }' be eqivalent
to '{ }' and doesn't warn for it, it's not like it's a huge deal.

The problem with using 0 instead of NULL (or vice versa, which is a crime, and
which is why NULL should never have been defined to plain 0) comes when it is
actually confusing. 

For something like a silly zero struct initializer it's not like it's the end
of the world. I do find the whole "0 could be a pointer, and NULL could be used
for an integer or float" to be very distasteful, and the C++ people in
particular were in denial about their brokenness for much much too long.

So I'd prefer the "0 for NULL" warning, even if this may not be the most
important case for it.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
