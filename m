Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E68184C2E
	for <lists+linux-sparse@lfdr.de>; Fri, 13 Mar 2020 17:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgCMQRy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 13 Mar 2020 12:17:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40222 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726620AbgCMQRy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 13 Mar 2020 12:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584116272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V+ABNxzUrA1BrNeIVsS76XPNGVIclNpuKqpA3GL1LGk=;
        b=J0/dVMuG/MSUQ6+zOoTaixTNIlAvU08td8yKBlcZGfCgualyuqakeYBKcp8rO9kalFrxYE
        KUiD9kDmI5UxV4QrDHC2IVvxjOXQPp507Nc2Av+1nnknXr9y0jhelEOGYC5BX96UTzBbp6
        RmmkZzp+naVqAjMWtBjpSyLtTUwZV2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-jb65F_FOPluXJUgOw8m0Mg-1; Fri, 13 Mar 2020 12:17:51 -0400
X-MC-Unique: jb65F_FOPluXJUgOw8m0Mg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35E3718FF660;
        Fri, 13 Mar 2020 16:17:50 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 538BD8FBE5;
        Fri, 13 Mar 2020 16:17:49 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri, 13 Mar 2020 17:17:49 +0100 (CET)
Date:   Fri, 13 Mar 2020 17:17:48 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] cpp: silently allow conditional directives within macro
Message-ID: <20200313161748.GA22910@redhat.com>
References: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
 <20200312211630.53710-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200312211630.53710-1-luc.vanoostenryck@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 03/12, Luc Van Oostenryck wrote:
>
> @@ -2098,6 +2103,12 @@ static void handle_preprocessor_line(struct stream *stream, struct token **line,
>  		if (false_nesting)
>  			goto out;
>  	}
> +
> +	if (expanding) {
> +		if (Wdirective_within_macro && !is_cond)
                    ^^^^^^^^^^^^^^^^^^^^^^^
I am not sure Wdirective_within_macro is really useful after this change,
I'd suggest to drop my patch but this is up to you.

Anyway,

> +			warning(start->pos, "directive in macro's argument list");
> +		expanding = 0;		// warn only once
> +	}

then you should probably update preprocessor22.c ? See below.

I am not sure about validation/preprocessor/expand-redef.c added by the
previous patch,

	 * check-output-start

	 1 2 1 2
	 * check-output-end

shouldn't you add check-known-to-fail into this file or change the output

	1
	2 1
	2

?

Oleg.


--- a/validation/preprocessor/preprocessor22.c
+++ b/validation/preprocessor/preprocessor22.c
@@ -19,13 +19,6 @@ define_struct(a, {
  *
  * check-command: sparse -E $file
  *
- * check-error-start
-preprocessor/preprocessor22.c:6:1: warning: directive in macro's argument list
-preprocessor/preprocessor22.c:8:1: warning: directive in macro's argument list
-preprocessor/preprocessor22.c:10:1: warning: directive in macro's argument list
-preprocessor/preprocessor22.c:12:1: warning: directive in macro's argument list
- * check-error-end
- *
  * check-output-start
 
 struct {

