Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4105F6BBC1C
	for <lists+linux-sparse@lfdr.de>; Wed, 15 Mar 2023 19:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjCOSdW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 15 Mar 2023 14:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbjCOSdJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 15 Mar 2023 14:33:09 -0400
X-Greylist: delayed 12598 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Mar 2023 11:33:05 PDT
Received: from mail.pinedalecol.com (mail.pinedalecol.com [38.242.223.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3C619C4B
        for <linux-sparse@vger.kernel.org>; Wed, 15 Mar 2023 11:33:04 -0700 (PDT)
Received: by mail.pinedalecol.com (Postfix, from userid 1001)
        id 87594AE2985; Wed, 15 Mar 2023 10:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pinedalecol.com;
        s=mail; t=1678871137;
        bh=PX1a+qXfAxEHThxyEDiykIvbszIgr3FWbFaJ++Zb97Q=;
        h=Date:From:To:Subject:From;
        b=c3S9mWpfrSlpwEUqyoo5/f1hRYFDHqCD8/TXNPMdc7cQtwdSpRftgRYA+wsJYf4ky
         IM6fBMUC1oXoSPdw94MTjtrdU3gGy/ZtytepgtqIm9iFGXdATBZ0hy6UnVx0g8hyH2
         0qe7jXCBTPcWaSz915b3ktyo/qPDZKZTM6DiUDqP8TPfLLhUnQUU3XpUU+16AWbIiG
         8W7XoEl931gXNPinvjua0DrKsCvqHlMODi4/BYysvn7v1UK8Q9xVJW3IKGSOZb2UAS
         0VSB0dPt9bbNr9Xn6vH0m/s/7IUp3jl8x042VxusdwNDQtg9e6+a6VC+m57aEk9Fip
         HzErpl14bZXTw==
Received: by mail.pinedalecol.com for <linux-sparse@vger.kernel.org>; Wed, 15 Mar 2023 09:05:26 GMT
Message-ID: <20230315084500-0.1.25.7d8k.0.9ooasfcc4m@pinedalecol.com>
Date:   Wed, 15 Mar 2023 09:05:26 GMT
From:   "Victor Pollard" <victor.pollard@pinedalecol.com>
To:     <linux-sparse@vger.kernel.org>
Subject: Wake up - Audit time
X-Mailer: mail.pinedalecol.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED,URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: pinedalecol.com]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: pinedalecol.com]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [38.242.223.15 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: pinedalecol.com]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Good morning,

we provide a solution that significantly shortens the audit time, enables=
 standards control and non-compliance reporting:

=E2=97=8F Audits - to check quality or process standards (ISO, 5S, LPA)
=E2=97=8F Scheduler - all work can be scheduled and linked to the notific=
ation system
=E2=97=8F Checklists - for carrying out work "point by point" with a desc=
ription illustrated with a photo or video
=E2=97=8F Non-conformances - immediately report non-conformances and send=
 them to responsible persons
=E2=97=8F Tests - to check knowledge after training or (customer's) expec=
tations
=E2=97=8F Summary of Results and Reports - presented on dashboards

Are you open to a conversation about using such a tool in your company?


Yours faithfully,
Victor Pollard
