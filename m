Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B39FE98CC
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfJ3JD6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33726 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfJ3JD5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id s1so1377704wro.0
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YLrKDbG0Uig/Q1kHW2FPrySAaD9/HLx/iFCqAXOspqM=;
        b=LVc85pbFXWB2S9aGlpN/k7WjG3LVmz/EaXhwCg07nB9/i8cokxctyxeivMvGq8vuyQ
         eb9QgjBoOQEvsNomAl/JYjYAxMirP6jDDzoKVvQx3dUmQlT4+ZDd7LbCAKUGgwJj0acw
         kgmdARJKIdHZbrrA0/NuSfKuUMGl905QSWw2OnYiu6UhZcZNsIwgCVw0kpYZcovEUJ0Y
         wtzMVn4ET/8y6UeoXjG8+818NENQTo8Bi1ysRQ5iQMs9EDt2y/X3vp1cGJ+eiBxFRHT8
         7FAycpVxe83cPxzpMv5hDjTueUGPFUBKyA35TAA9bkBNSgDi/xPSbj+LAgiImhQu4gub
         pGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YLrKDbG0Uig/Q1kHW2FPrySAaD9/HLx/iFCqAXOspqM=;
        b=rp28KQnG50tWXPWIeF0wtphAuH8QcLCXUD2tN2ktuD04ylqJE02N4zHPPpry/UfF69
         nVe5Dg4Pn0kCa4fosKY9L1FXTknHqRfz2vVAEIicLejs3iN6lZDTXGlp1mDCk64789lk
         nkeGGhgaI+QsV+t69SEbSFexl4MwfsTvpFoZZEYTa2Qu8FvKPCl5+jnGsd15egWsnT+T
         vjRZhaz+eoCXSHRsqJYeCGzWOf2CeGdoM4CMqN0dhDxYjBiCdjFcpqo8U4/T/1sR8iVA
         26hfv6u7GEh+j+WRKDp4baHKK4eUJAb/gpcjguW4k9tZXoOsxEed4Nx+w/AHcQ9TrPzE
         f3rg==
X-Gm-Message-State: APjAAAW4ZNo5/NZlsXayJj9X5paQTr9f8UR/uWOrIEdze9k230XBPFuM
        R354H10cA11qhGbVN4Z/0Z98vkGU
X-Google-Smtp-Source: APXvYqx7a+UZTLxYXFhq3gUdfGSV4ehNFyXVxIj1R0MlnpZxr6AJrQKca6D8EmQZ5RKbCg2dN1SzHQ==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr22996647wrn.295.1572426234536;
        Wed, 30 Oct 2019 02:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:54 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 7/7] cgcc: removed unneeded predefines for integers
Date:   Wed, 30 Oct 2019 10:03:33 +0100
Message-Id: <20191030090333.3412-14-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that the arch is passed to sparse via '--arch=ARCH',
all predefines for integers and pointers are defined in sparse
itself. So, integer_types() & define_size_t() are now unneeded.

Remove these functions and -D__SIZEOF_POINTER__.

Note: sparc64 had also an entry for 128-bit integers (with
      name 'LONG_LONG_LONG' and suffix 'LLL'); GCC only
      predefines the SIZEOF macros which sparse also does
      (but for all archs). So, it's fine to remove these also.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 52 ++++------------------------------------------------
 1 file changed, 4 insertions(+), 48 deletions(-)

diff --git a/cgcc b/cgcc
index 0ac9a55cd..8e8c510e3 100755
--- a/cgcc
+++ b/cgcc
@@ -148,30 +148,6 @@ sub quote_arg {
 
 # -----------------------------------------------------------------------------
 
-sub integer_types {
-    my ($char,@dummy) = @_;
-
-    my %pow2m1 =
-	(8 => '127',
-	 16 => '32767',
-	 32 => '2147483647',
-	 64 => '9223372036854775807',
-	 128 => '170141183460469231731687303715884105727',
-	 );
-    my @types = (['SCHAR',''], ['SHRT',''], ['INT',''], ['LONG','L'], ['LONG_LONG','LL'], ['LONG_LONG_LONG','LLL']);
-
-    my $result = " -D__CHAR_BIT__=$char";
-    while (@types && @_) {
-	my $bits = shift @_;
-	my ($name,$suffix) = @{ shift @types };
-	die "$0: weird number of bits." unless exists $pow2m1{$bits};
-	$result .= " -D__${name}_MAX__=" . $pow2m1{$bits} . $suffix;
-    }
-    return $result;
-}
-
-# -----------------------------------------------------------------------------
-
 sub float_types {
     my ($has_inf,$has_qnan,$dec_dig,@bitsizes) = @_;
     my $result = " -D__FLT_RADIX__=2";
@@ -241,14 +217,6 @@ sub float_types {
 
 # -----------------------------------------------------------------------------
 
-sub define_size_t {
-    my ($text) = @_;
-    # We have to undef in order to override check's internal definition.
-    return ' -U__SIZE_TYPE__ ' . &quote_arg ("-D__SIZE_TYPE__=$text");
-}
-
-# -----------------------------------------------------------------------------
-
 sub add_specs {
     my ($spec) = @_;
     if ($spec eq 'sunos') {
@@ -299,27 +267,18 @@ sub add_specs {
     } elsif ($spec eq 'sparc') {
 	return (
 		' --arch=sparc' .
-		&integer_types (8, 16, 32, $m64 ? 64 : 32, 64) .
-		&float_types (1, 1, 33, [24,8], [53,11], [113,15]) .
-		&define_size_t ($m64 ? "long unsigned int" : "unsigned int") .
-		' -D__SIZEOF_POINTER__=' . ($m64 ? '8' : '4'));
+		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'sparc64') {
 	return (
 		' --arch=sparc64' .
-		&integer_types (8, 16, 32, 64, 64, 128) .
-		&float_types (1, 1, 33, [24,8], [53,11], [113,15]) .
-		&define_size_t ("long unsigned int") .
-		' -D__SIZEOF_POINTER__=8');
+		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'x86_64') {
 	return (' --arch=x86_64' .
 		&float_types (1, 1, 33, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc') {
 	return (' -D_BIG_ENDIAN -D_STRING_ARCH_unaligned=1' .
 		' --arch=ppc' .
-		&integer_types (8, 16, 32, $m64 ? 64 : 32, 64) .
-		&float_types (1, 1, 21, [24,8], [53,11], [113,15]) .
-		&define_size_t ($m64 ? "long unsigned int" : "unsigned int") .
-		' -D__SIZEOF_POINTER__=' . ($m64 ? '8' : '4'));
+		&float_types (1, 1, 21, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'ppc64') {
 	return (' -D_STRING_ARCH_unaligned=1 ' .
 		' --arch=ppc64' .
@@ -331,10 +290,7 @@ sub add_specs {
     } elsif ($spec eq 's390x') {
 	return (' -D_BIG_ENDIAN' .
 		' --arch=s390x' .
-		&integer_types (8, 16, 32, $m64 ? 64 : 32, 64) .
-		&float_types (1, 1, 36, [24,8], [53,11], [113,15]) .
-		&define_size_t ("long unsigned int") .
-		' -D__SIZEOF_POINTER__=' . ($m64 ? '8' : '4'));
+		&float_types (1, 1, 36, [24,8], [53,11], [113,15]));
     } elsif ($spec eq 'arm') {
 	return (' --arch=arm' .
 		&float_types (1, 1, 36, [24,8], [53,11], [53, 11]));
-- 
2.23.0

