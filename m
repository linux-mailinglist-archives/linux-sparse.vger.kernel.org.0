Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34578E282
	for <lists+linux-sparse@lfdr.de>; Thu, 15 Aug 2019 03:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfHOBsY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 14 Aug 2019 21:48:24 -0400
Received: from movementarian.org ([178.79.150.28]:50900 "EHLO
        movementarian.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfHOBsX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 14 Aug 2019 21:48:23 -0400
X-Greylist: delayed 3294 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Aug 2019 21:48:23 EDT
Received: from movement by movementarian.org with local (Exim 4.92)
        (envelope-from <movement@movementarian.org>)
        id 1hy41A-0002Ba-Mb; Thu, 15 Aug 2019 01:53:28 +0100
Date:   Thu, 15 Aug 2019 01:53:28 +0100
From:   John Levon <levon@movementarian.org>
To:     smatch@vger.kernel.org, linux-sparse@vger.kernel.org
Cc:     yuri.pankov@nexenta.com
Subject: noreturn attribute doesn't work in smatch
Message-ID: <20190815005328.GA8004@movementarian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Url:  http://www.movementarian.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


./smatch: a.c:20 main() error: double free of 'str'

given:

```
#include <stdlib.h>
#include <string.h>

__attribute__((__noreturn__)) void
die(void)
{
        exit(1);
}

int
main(void)
{
        char *str = strdup("test");

        if (str != NULL) {
                free(str);
                die();
        }

        free(str);

        return (0);
}
```

As far as I can figure out, this looks like a sparse problem: an
'inline' or 'extern' specifier in this position gets marked as the
relevant MOD_* flag for the function, but the noreturn doesn't bubble
up in the same way. Some quick lame attempts to add ctx->is_noreturn did
not go well.

I think this might be the underlying issue behind sparse's failing test
validation/function-redecl2.c but I'm not positive.

We can do:

```
#ifdef __CHECKER__
#define SMATCH_NORETURN __attribute__((__noreturn__))
#else
#define SMATCH_NORETURN /* would break gcc otherwise */
#endif

__attribute__((__noreturn__)) void
die(void) SMATCH_NORETURN
{
```

but it's ... unlovely.

Any thoughts?

thanks
john
