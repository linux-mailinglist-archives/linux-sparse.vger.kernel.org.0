Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58CA27FCBB
	for <lists+linux-sparse@lfdr.de>; Thu,  1 Oct 2020 11:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731692AbgJAJ7J (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 1 Oct 2020 05:59:09 -0400
Received: from imap3.hz.codethink.co.uk ([176.9.8.87]:50066 "EHLO
        imap3.hz.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgJAJ7J (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 1 Oct 2020 05:59:09 -0400
Received: from cpc98990-stkp12-2-0-cust216.10-2.cable.virginm.net ([86.26.12.217] helo=rainbowdash.codethink.co.uk)
        by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kNukJ-0006mc-8Y; Thu, 01 Oct 2020 10:19:27 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.94)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1kNukI-001YtQ-AW; Thu, 01 Oct 2020 10:19:26 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org
Cc:     thomas.preston@codethink.co.uk, christopher.phang@codethink.co.uk
Subject: format updates for handing format attribute
Date:   Thu,  1 Oct 2020 10:19:19 +0100
Message-Id: <20201001091923.372349-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi, this is the update set for the format attributes.

I think the only thing I'm still thinking about is whether to
just merged patches 3 and 4.

branch:

https://gitlab.com/CodethinkLabs/sparse.git  bjdooks/printf-v062


