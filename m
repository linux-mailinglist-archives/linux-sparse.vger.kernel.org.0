Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D215C1E6CE1
	for <lists+linux-sparse@lfdr.de>; Thu, 28 May 2020 22:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407321AbgE1UwQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Thu, 28 May 2020 16:52:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407319AbgE1UwP (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 16:52:15 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-sparse@vger.kernel.org
Subject: [Bug 207959] Don't warn about the universal zero initializer for a
 structure with the 'designated_init' attribute.
Date:   Thu, 28 May 2020 20:52:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo tools_sparse@kernel-bugs.kernel.org
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Sparse
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: AsDaGo@posteo.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: tools_sparse@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207959-200559-GOVNPvIDGp@https.bugzilla.kernel.org/>
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

--- Comment #2 from Asher Gordon (AsDaGo@posteo.net) ---
(In reply to Luc Van Oostenryck from comment #1)
> In fact, sparse already support this via the option
> '-Wno-universal-initializer'.

Perhaps '-Wno-universal-initializer' should be the default?

> My very personal point of view is that the correct syntax should be '{ }'
> because it conveys much better the idea of a default initializer. This
> single zero in '{ 0 }' is just confusing.

I can see your point, but unfortunately, as Ramsay Jones says here[1] and
Alexander Monakov here[2], this is not standard C. So '{ }' isn't an option if
we want to be portable. Andrew Pinski's suggestion[3] is also an option, but
that seems ugly to me.

[1]  https://marc.info/?l=linux-sparse&m=159069587406366&w=2
[2]  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95379#c4
[3]  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95379#c1

I'm writing a library, Mu[4], which has a structure for which the
'designated_init' attribute is appropriate (see the 'MU_OPT' structure
here[5]). However, I don't want to force my users not to use '{ 0 }', which is
why I think this feature would be useful.

[4]  https://nongnu.org/libmu/
[5]  https://git.savannah.nongnu.org/cgit/libmu.git/tree/src/options.h#n85

Also, a minor note: In the test program I attached, the attribute needs to be
specified after the closing brace to work with Sparse.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
