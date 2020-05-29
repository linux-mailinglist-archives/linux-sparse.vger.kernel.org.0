Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C351E87F0
	for <lists+linux-sparse@lfdr.de>; Fri, 29 May 2020 21:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgE2Tfn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Fri, 29 May 2020 15:35:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgE2Tfn (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 29 May 2020 15:35:43 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-sparse@vger.kernel.org
Subject: [Bug 207959] Don't warn about the universal zero initializer for a
 structure with the 'designated_init' attribute.
Date:   Fri, 29 May 2020 19:35:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo tools_sparse@kernel-bugs.kernel.org
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Sparse
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: luc.vanoostenryck@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: tools_sparse@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207959-200559-9knJuBqKx9@https.bugzilla.kernel.org/>
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

--- Comment #7 from Luc Van Oostenryck (luc.vanoostenryck@gmail.com) ---
(In reply to Linus Torvalds from comment #5)
> That said, I'm not sure the kernel cares. If sparse makes '{ 0 }' be
> equivalent to '{ }' and doesn't warn for it, it's not like it's a huge deal.
> 
> The problem with using 0 instead of NULL (or vice versa, which is a crime,
> and which is why NULL should never have been defined to plain 0) comes when
> it is actually confusing.

OK. I also detest this 'you can use 0 for pointers' but I think that '{ 0 }'
should just be understood as the standard idiom for '{ }' and that the current
situation where '{ 0 }' gives warnings while '{ }' doesn't s confusing and
annoying. So, I'll change Sparse's default to -Wno-universal-initializer.

> So I'd prefer the "0 for NULL" warning, even if this may not be the most
> important case for it.

Do you think it's worth to add -Wuniversal-initializer for the kernel so that
these warnings are still present for '{ 0 }'?

-- Luc

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
