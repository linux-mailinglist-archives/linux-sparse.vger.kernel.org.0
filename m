Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822271E6D92
	for <lists+linux-sparse@lfdr.de>; Thu, 28 May 2020 23:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436527AbgE1VYj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Thu, 28 May 2020 17:24:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436505AbgE1VYg (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 17:24:36 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-sparse@vger.kernel.org
Subject: [Bug 207959] Don't warn about the universal zero initializer for a
 structure with the 'designated_init' attribute.
Date:   Thu, 28 May 2020 21:24:35 +0000
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
Message-ID: <bug-207959-200559-nznJfyeqKD@https.bugzilla.kernel.org/>
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

--- Comment #3 from Luc Van Oostenryck (luc.vanoostenryck@gmail.com) ---
(In reply to Asher Gordon from comment #2)
> Perhaps '-Wno-universal-initializer' should be the default?

Well, that's really the point.
The problem Sparse also gives the warnings corresponding to clang's -Wnonnull
and my understanding is that these warnings are desired for the kernel even
when coming from using '{ 0 }'.

> > My very personal point of view is that the correct syntax should be '{ }'
> > because it conveys much better the idea of a default initializer. This
> > single zero in '{ 0 }' is just confusing.
> 
> I can see your point, but unfortunately, as Ramsay Jones says here[1] and
> Alexander Monakov here[2], this is not standard C. So '{ }' isn't an option
> if we want to be portable.

Yes, I know, it's a pity. It's why I said 'should be'.

> Andrew Pinski's suggestion[3] is also an option,
> but that seems ugly to me.

Yes, it's far from ideal.

> I'm writing a library, Mu[4], which has a structure for which the
> 'designated_init' attribute is appropriate (see the 'MU_OPT' structure
> here[5]). However, I don't want to force my users not to use '{ 0 }', which
> is why I think this feature would be useful.

Interesting.
Yes, I understand. Git was in the same kind of situation, it's why I added
'-Wno-universal-initializer'. Can't you just add this option in your
SPARSE_FLAGS or something like that?

> Also, a minor note: In the test program I attached, the attribute needs to
> be specified after the closing brace to work with Sparse.

Yes, it's a known problem. Sparse accept 'type attributes' (those situated just
after the keyword 'struct', 'union' or 'enum') but ignore them.
I've some unfinished patches for this ... since some time already :(

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
