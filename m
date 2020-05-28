Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F80C1E6F7C
	for <lists+linux-sparse@lfdr.de>; Fri, 29 May 2020 00:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437209AbgE1Wre convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Thu, 28 May 2020 18:47:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437200AbgE1Wre (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 18:47:34 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-sparse@vger.kernel.org
Subject: [Bug 207959] Don't warn about the universal zero initializer for a
 structure with the 'designated_init' attribute.
Date:   Thu, 28 May 2020 22:47:33 +0000
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
Message-ID: <bug-207959-200559-zVgylh0m00@https.bugzilla.kernel.org/>
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

--- Comment #6 from Asher Gordon (AsDaGo@posteo.net) ---
(In reply to Luc Van Oostenryck from comment #3)
> Can't you just add this option in your
> SPARSE_FLAGS or something like that?

Well, actually I'm not using Sparse for my project. I want to use the
'designated_init' attribute since it is supported by GCC. And I want to use the
attribute mainly so that users of my library get the warning, and I can't
control what flags the user uses (and GCC doesn't have a
-Wno-universal-initializer flag anyway).

(In reply to Linus Torvalds from comment #4)
> So yeah, the sparse defaults may be a bit kernel-centric.

That's fine, but perhaps GCC should add something like
-Wno-universal-initializer and use it by default. I'll suggest that in the GCC
bug (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95379).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
