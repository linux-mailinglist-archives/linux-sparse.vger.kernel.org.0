Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE25CDDF4
	for <lists+linux-sparse@lfdr.de>; Mon,  7 Oct 2019 11:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfJGJGT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 7 Oct 2019 05:06:19 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45852 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbfJGJGT (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 7 Oct 2019 05:06:19 -0400
Received: by mail-ed1-f67.google.com with SMTP id h33so11634917edh.12
        for <linux-sparse@vger.kernel.org>; Mon, 07 Oct 2019 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UdlU5qXP3NgBCRYXjKMAdOKsn7iNL9QVgLdsuSYQ9kQ=;
        b=S73x2z5kb75r+rIF4TyEYMtuKnb7pDBoRzsN7pJ8h6ZdzJQPReORRbtjgZCfX0oCzY
         844PdVhk606een7JUJmpEEqvidPJcq7u9iP/q72Y5Bw3R7pJWKWXz826eLckgv6cB6ws
         cTNNVjKo5iN+c1Mii0LqOG2AGvQBwGwrTVdsrkIk9Cpomh16Uf7GJ+Blagquxa7RXe7K
         I+gP/+Gv9i8OXSJA9XmJoEtdD08Hb/tw3aTap7VdfE0OJmm5MV9Q+VsmpxAAp1q+nrQB
         ThvUx4j2gO4RQdNsfRckvfmthpfR+Mrw9q4fDNR/I4W0kW0ZZiLqXtAoQQoNoxxHKjiC
         jCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UdlU5qXP3NgBCRYXjKMAdOKsn7iNL9QVgLdsuSYQ9kQ=;
        b=nX1QS0DU+LNKS/E5gpq5HITiHoPWSeHIq4LfTeuWvkz3Pd4O8C+S4dVyk+gdHYKShO
         aSf+eFMlEM0uIvp8+b9ms2hwKElJW8W2XHej2XG+40bhkuV0IhUpcrwI5DqpthxX3OT/
         7IESIokSIm1rhtTdX/DMVYwxACoxC2CPfr6RbdA1lpxF2Yf1/STwssKiygbcW2HDEMb9
         /04tp03PLz9Ziomc0q22l5wSl3F9raX3dAEBefDYIvsb+koaiLQE8RE1690l9vNCvpl9
         hJj7Ad9NTXur01ewXGPsHPgJ0dBkSIzmmOGcIg2EmADbjh/+X815p8qGBiutMSskFbwo
         SsyQ==
X-Gm-Message-State: APjAAAUo7l5g12TGeINwwC9LFP3uc7MhZdB0c80qByaBicgBdUZi3bBW
        puVpAGnWSJcoPCMWfwh7ivMUZYa8
X-Google-Smtp-Source: APXvYqxscAzwTMUhONCxaPIghrDoTzYZcBK45ZqC9pmoFC4+qupow8fiS3mV7IFKOFecfbH9qQPa5g==
X-Received: by 2002:a17:906:6d53:: with SMTP id a19mr15435836ejt.332.1570439175117;
        Mon, 07 Oct 2019 02:06:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:784e:f4d0:1300:f15a])
        by smtp.gmail.com with ESMTPSA id gj14sm1746424ejb.62.2019.10.07.02.06.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 02:06:14 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] Sparse v0.6.1-rc2 is now out.
Date:   Mon,  7 Oct 2019 11:06:10 +0200
Message-Id: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The source code can be found at its usual repository:
  git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1-rc2

The tarballs are found at:
    https://www.kernel.org/pub/software/devel/sparse/dist/

Many thanks to people who have contributed to this release:
Ben Dooks, Dan Carpenter, Jann Horn, Randy Dunlap, Thomas Weißschuh,
Ramsay Jones, Linus Torvalds, Oliver Hartkopp and Ilya Maximets,

Most changes since the previous release (v0.6.1-rc1) belong in 2 categories:
1) small fixes and iprovements
2) do the evaluation & expansion of ASM operands

The complete list of patches are:
  Ben Dooks (1):
      .gitignore: add temporary *~ files

  Dan Carpenter (1):
      fix sign extension in casting enums

  Jann Horn (1):
      evaluate: externally_visible functions don't need a declaration

  Luc Van Oostenryck (32):
      expand: add explanation to 'conservative'
      add test for evaluation of invalid assignments
      also accept casts of AS pointers to uintptr_t
      man: explain role of uintptr_t & unsigned long in casts from AS pointers
      fix allowing casts of AS pointers to uintptr_t
      cgcc: fix wrong processing of -MD & -MMD
      constexpr: relax constexprness of constant conditionals
      more consistent type info in error messages
      shorter message for non-scalar in conditionals
      expand: add test for expansion of compound literals
      expand: add missing expansion of compound literals
      dissect: fix processing of ASM statements
      string: add helper string_expression()
      string: use string_expression() in parse_static_assert()
      asm: add test evaluation, expansion & linearization of ASM operands
      asm: check earlier that body & constraints are strings
      asm: use a specific struct for asm operands
      asm: keep using struct asm_operand during linearization
      asm: parse constraints
      asm: use parse_asm_constraint() to verify constraints
      asm: missing evaluation of asm statements
      asm: linearization of output memory operands is different
      asm: fix liveness memory operand
      asm: fix missing expansion of asm statements
      asm: arrays & functions in non-memory operand degenerate into pointers
      do not linearize invalid expression
      add test for enum sign extension
      remove useless optimization in cast_enum_list()
      asm: warn on invalid empty constraints
      make 'directive in argument list' clearer
      expand more builtins like __builtin_ffs()
      cleanup: make arch_msize_long static

  Randy Dunlap (1):
      problem building sparse 0.6.0 (sparse-llvm)

  Thomas Weißschuh (1):
      expand: 'conservative' must not bypass valid simplifications

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7e8c2abcc..03cbf5ac4 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-VERSION=0.6.1-rc1
+VERSION=0.6.1-rc2
 
 ########################################################################
 # The following variables can be overwritten from the command line
-- 
2.23.0

