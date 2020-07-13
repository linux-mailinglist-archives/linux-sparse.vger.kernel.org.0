Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2DE21D3F1
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Jul 2020 12:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgGMKut convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Mon, 13 Jul 2020 06:50:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:60124 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728382AbgGMKus (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Jul 2020 06:50:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5229EAE53;
        Mon, 13 Jul 2020 10:50:49 +0000 (UTC)
From:   =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: using sparse to catch refcount leaks
In-Reply-To: <20200710085927.GN2549@kadam>
References: <871rlk6630.fsf@suse.com> <20200710085927.GN2549@kadam>
Date:   Mon, 13 Jul 2020 12:50:44 +0200
Message-ID: <87a703eliz.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:
> In this CIFS case, the leak is on the success path (as well as the
> failure path) so my theory would be that it would be caught in testing
> and will only cause false positives for static analysis.  I can't see
> any automated way to know which success paths should take a reference
> and which should not.

Ah, I see. I guess with extra annotations and more sophisticated
analysis we could have something but it seems out of scope.

Anyway, thanks for looking into it.

Cheers,
-- 
Aurélien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg, DE
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah HRB 247165 (AG München)
