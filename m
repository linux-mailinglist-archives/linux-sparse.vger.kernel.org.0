Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEFF1E6EDA
	for <lists+linux-sparse@lfdr.de>; Fri, 29 May 2020 00:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437062AbgE1W0O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Thu, 28 May 2020 18:26:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:32780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437074AbgE1W0G (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 18:26:06 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-sparse@vger.kernel.org
Subject: [Bug 207959] Don't warn about the universal zero initializer for a
 structure with the 'designated_init' attribute.
Date:   Thu, 28 May 2020 22:26:01 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207959-200559-Of344ruqqL@https.bugzilla.kernel.org/>
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

--- Comment #4 from Linus Torvalds (torvalds@linux-foundation.org) ---
On Thu, May 28, 2020 at 2:24 PM <bugzilla-daemon@bugzilla.kernel.org> wrote:
>
> Well, that's really the point.
> The problem Sparse also gives the warnings corresponding to clang's -Wnonnull
> and my understanding is that these warnings are desired for the kernel even
> when coming from using '{ 0 }'.

In the kernel, the empty initializer is be the usual way to create a
zero initializer. So yes, { 0 } may exist, but it generally should be
used for initializing something that is known to be an integer. And if
it's a pointer, it should warn, because '0' should never have been a
valid pointer, traditional C or not.

It's not like we use pedantic and portable standard C to begin with.

So yeah, the sparse defaults may be a bit kernel-centric.

             Linus

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
