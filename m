Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBC2C8C98
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 17:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfJBPSE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 11:18:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46130 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfJBPSD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 11:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Vk7qAgRTG423k3xbh3jSPYxfHfe4B5MfBEpxtc8zfHE=; b=RpUKes1HDL9e+dtuMrpnCizFS
        3wJ+eJ9011l6HiNwFzvION3iQHGZcB698Ku7wJccsaI6aJuZFyG9R07W8HBup8ZNewn/qFygnCo34
        YyZX0om+xAJ/ANQ2VI+qPXulgOX7pl4gzHDRDlCNc3EUNny6CyePG0aI+1Ms1IdJMrJMlJCyOL8c0
        OQZl/KXZdFJrTYdX+LlPwKX129mTvafSGM+4btmZCEdTBrM2S6XKzmWplITALgizCLS6vqLEQDZi2
        xSBH2DFXZaS1Q+bP1tqbaoDMYRTHaRYeuQ8BUjlRrke7oISuVTFT4dfDYAHEjxo8B74rdHsT+fpqu
        HmwdOrsUA==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFgOB-0006K9-Lo
        for linux-sparse@vger.kernel.org; Wed, 02 Oct 2019 15:18:03 +0000
To:     Linux-Sparse <linux-sparse@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: problem with bit field sizes
Message-ID: <995abb2b-5ece-c256-ef8d-d772c6164ac1@infradead.org>
Date:   Wed, 2 Oct 2019 08:18:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

With sparse 0.6.1-rc1 and Linux kernel v5.4-rc1, sparse is complaining about
bit field sizes in 2 header files: include/linux/sched.h and
kernel/sched/sched.h.  They both use a calculation + define macro for the
bit field sizes.

../kernel/sched/sched.h:809:31: error: bad integer constant expression
../kernel/sched/sched.h:809:61: error: invalid named zero-width bitfield `value'
../kernel/sched/sched.h:810:45: error: bad integer constant expression
../kernel/sched/sched.h:810:77: error: invalid named zero-width bitfield `tasks'

../include/linux/sched.h:596:43: error: bad integer constant expression
../include/linux/sched.h:596:73: error: invalid named zero-width bitfield `value'
../include/linux/sched.h:597:43: error: bad integer constant expression
../include/linux/sched.h:597:67: error: invalid named zero-width bitfield `bucket_id'

I added #include <linux/log2.h> to both of these header files so that
bits_per() would be defined, but that did not help solve the problem.


-- 
~Randy
