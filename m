Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68BD62A1A63
	for <lists+linux-sparse@lfdr.de>; Sat, 31 Oct 2020 21:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgJaUEI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 31 Oct 2020 16:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbgJaUEH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 31 Oct 2020 16:04:07 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28CEC0617A6
        for <linux-sparse@vger.kernel.org>; Sat, 31 Oct 2020 13:04:07 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t11so10105697edj.13
        for <linux-sparse@vger.kernel.org>; Sat, 31 Oct 2020 13:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9FQeY/rUeYVMLGRJ11TXebmHGXYLJSjcEzQE/jBqNQQ=;
        b=s9Iti7kpdPT1wxnGKxM0i71paRhkTKzIyj5Xxg5AzRFllBYEbtLWPGeV3hmCnZ4m4e
         tm2dZrF+zTo8A3+0L4RXYstRlPHwS9sXDKyE4JmzZof/AnQC1bMDwJ2KoVOnEis4QYW2
         Fo6gRwPBkVtbVpgo+2Ur2cgaTaJZvD0vyMQuECFhljc4ky4JKRzmEAK89uQgj1Ew0TW/
         hFLNzPmkHpqkDU5o97ySqRPt+Tb/Dpc3MR4eLc3JqXGdJcP8APKx+6RfksDrlo+h/svD
         gmipBhy73esIPz02K/btmQXtSbd5mUc4xKei+Nfa6za7cc60fJ2HFeRgoOEKfuh0eDQV
         Jt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9FQeY/rUeYVMLGRJ11TXebmHGXYLJSjcEzQE/jBqNQQ=;
        b=PuSMdKESY84GTLmZgrLSKHnFG/mJYO4T71O627Zmrvj9HScBXqurKtqtu0k3N3tbcW
         OJpZVomwR408cYhoui9LuUWDnTsdnCS9dGxpyYE0F0FrevD3eqT7/H6beJq2phhJ+JsI
         tWBtR5XylYenN1yd2A0tDqqJpGJ/jIG3A63wSRMcE0ACzuld6iGhRAgh51jQemVRRVYC
         N+c9dgecvmScWxv/eJTjhDum0MHBce09lLmj3YaF8hUAahFZ/Or8q3tzHU2jH5VElOP5
         pa6zRJdxFDSguUi3IgB2oPxIgmvj3aktkTZEOsg9ZFkf9dQd7g3ILMnpcdndcse+Z0Kq
         EV3w==
X-Gm-Message-State: AOAM533jaDimjDiz/zT13tevtCoXYKrp2nksZzubiBCSvhSH59ubZOvc
        QAoA6N1uHL7twjHT2kWb0splocqFaGg=
X-Google-Smtp-Source: ABdhPJySKBUKt4e0MtXkaZHcc926uBSnDOXWSETNVHAj39h1zr46qIbb3XTuFPP35FupfdyXDYo0RA==
X-Received: by 2002:a05:6402:651:: with SMTP id u17mr8906452edx.206.1604174646087;
        Sat, 31 Oct 2020 13:04:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:a86e:27a8:de95:3d6])
        by smtp.gmail.com with ESMTPSA id u26sm6070667edt.39.2020.10.31.13.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 13:04:05 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] testsuite: add new tags: check-output-{match,returns}
Date:   Sat, 31 Oct 2020 21:04:00 +0100
Message-Id: <20201031200402.31312-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This two patches should help to write IR-related testcases by
allowing an easy way to check that every occurence of a given
instruction has a specific operand or that all functions
have the same specified return value.

Luc Van Oostenryck (2):
  testsuite: add a new tag: check-output-match
  testsuite: add a new tag: check-output-returns

 Documentation/test-suite.rst | 13 +++++++++
 validation/test-suite        | 56 ++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)


base-commit: 49c98aa3ed1b315ed2f4fbe44271ecd5bdd9cbc7
-- 
2.29.2

