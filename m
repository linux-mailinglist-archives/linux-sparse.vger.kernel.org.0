Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08400214BFA
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 13:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgGELVx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 07:21:53 -0400
Received: from raptor.unsafe.ru ([5.9.43.93]:60518 "EHLO raptor.unsafe.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbgGELVx (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 07:21:53 -0400
X-Greylist: delayed 584 seconds by postgrey-1.27 at vger.kernel.org; Sun, 05 Jul 2020 07:21:52 EDT
Received: from comp-core-i7-2640m-0182e6 (ip-89-102-33-211.net.upcbroadband.cz [89.102.33.211])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by raptor.unsafe.ru (Postfix) with ESMTPSA id EB0EA20479;
        Sun,  5 Jul 2020 11:12:07 +0000 (UTC)
Date:   Sun, 5 Jul 2020 13:12:04 +0200
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] sindex: avoid a warning with 'case -1:'
Message-ID: <20200705111204.lqutcuzkjkb4unl7@comp-core-i7-2640m-0182e6>
References: <20200704235453.7756-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200704235453.7756-1-luc.vanoostenryck@gmail.com>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.1 (raptor.unsafe.ru [5.9.43.93]); Sun, 05 Jul 2020 11:12:08 +0000 (UTC)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 05, 2020 at 01:54:53AM +0200, Luc Van Oostenryck wrote:
> When parsing the format, there is a 'case -1:' which:
> * seems to be there only for the following label (but mixing
>   labels with cases, like here, is OK).
> * on architectures where chars are unsigned, the compiler complains:
> 	warning: case label value is less than minimum value for type
> 
> So, remove the unneeded 'case -1:' and use an explicit 'default:'
> to catch invalid formats. Also, align the label with the cases,
> it looks nicer so.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Looks good :)

Reviewed-by: Alexey Gladkov <gladkov.alexey@gmail.com>

> ---
>  sindex.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sindex.c b/sindex.c
> index ea092a4a434b..22836a957213 100644
> --- a/sindex.c
> +++ b/sindex.c
> @@ -970,8 +970,8 @@ static int search_query_callback(void *data, int argc, char **argv, char **colna
>  					print_file_line(argv[0], atoi(argv[1]));
>  					fmt++;
>  					break;
> -				case -1:
> -print_string:
> +
> +				print_string:
>  					if (n) {
>  						printf("%.*s", n, buf);
>  						n = 0;
> @@ -979,6 +979,9 @@ print_string:
>  					printf("%s", argv[colnum]);
>  					fmt++;
>  					break;
> +				default:
> +					break;
> +
>  			}
>  
>  			if (pos == fmt)
> -- 
> 2.27.0
> 

-- 
Rgrds, legion

