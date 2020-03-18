Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702C918A192
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Mar 2020 18:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCRRb1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Mar 2020 13:31:27 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:43778 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgCRRb1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Mar 2020 13:31:27 -0400
Received: by mail-wr1-f46.google.com with SMTP id b2so25252179wrj.10
        for <linux-sparse@vger.kernel.org>; Wed, 18 Mar 2020 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8eASX61uoLNJMkUk+a2+jRbEoJcbF7uQE30dswMw+1k=;
        b=HbUkuzXHnDwr4TcCDDeD90IhDWr4VWCyi/7RmDzRWu0/2TYhSYQUQVu8HWC6UJMJqj
         E8WXbD0IB+0C10k5X6leIEEXg/jUW/QzQGRTk2rqBw4/EuSmIl4Hovb0GJYsQd4cGPyq
         zsT1dkfiiRsT6frQ04rNkjOq1KFAZeNBGYDAjyzGL39ZApK9ZAz+geeGB0vNjW6L2kF+
         yJOw/0h4GqszSc47P3CxWKl97CrzfHsvMGk19OdjFSRKAa6FBW+YpAjlJ3AuVDHQrCsZ
         EjCKBkY9mEw9eUFYm+0QYyCDipXkJNRvEh9yqqBn6vnTCWYX3DiENOdOUwU2opCaEDLB
         5jTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eASX61uoLNJMkUk+a2+jRbEoJcbF7uQE30dswMw+1k=;
        b=cW56f8IccaWq3cLj+nscJYj6GuwcyCMPh0JFB9RNJFwRXKnjeIE7vq/5wHxVgu45jm
         XaaXBZNpujaSs/14zUyCR/Kg81BZq34gEotar8PBNahZdX1UTyiaLateCzLrhgYPBlK9
         Fbptg9+jJGdeN2kZ1Wd6sHEOnbnBnL5QXF2y6pcorHv1m/OIL+YGI2EzNspFNHHWDz14
         7Z4Y6nXavxvZXwkRSS9fqVrjLbTjZ+4XFN0iyE1LHWaE4Dy8Qdoa+j3Pfg1I1hxmIEey
         yON/p3rI/SjNmJobPQh73bcr9STU6r0oH4jeGE+nl/aszn9o1Z7Y/JiysnxS5VvWpEFU
         Gijw==
X-Gm-Message-State: ANhLgQ2Gky3GXmEbeSViEdNx6NJ6UxFdpyx6FHMzzBwuUAra43JDga3O
        qrIwkebFwH1r2UElejIh/sXBxIlz
X-Google-Smtp-Source: ADFU+vs5Zp0oBEPzVQx2XZvcYoLEGi9kO4NfF9NszpjYJ2bX/7c3YKJPjN/hUsruU2WMbnjRrn3vHg==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr6904648wrw.252.1584552685482;
        Wed, 18 Mar 2020 10:31:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:81ce:3038:2a0a:bf02])
        by smtp.gmail.com with ESMTPSA id u17sm10268051wrm.43.2020.03.18.10.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:31:24 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/5] add instruction OP_UNREACH
Date:   Wed, 18 Mar 2020 18:31:17 +0100
Message-Id: <20200318173120.63939-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
References: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/IR.rst | 3 +++
 linearize.c          | 3 +++
 opcode.def           | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/IR.rst b/Documentation/IR.rst
index 9d6f2299eaf1..33a761662fad 100644
--- a/Documentation/IR.rst
+++ b/Documentation/IR.rst
@@ -47,6 +47,9 @@ Terminators
 	* .type: type of .cond, must be an integral type
 	* .multijmp_list: pairs of case-value - destination basic block
 
+.. op:: OP_UNREACH
+	Mark code as unreachable
+
 .. op:: OP_COMPUTEDGOTO
 	Computed goto / branch to register
 
diff --git a/linearize.c b/linearize.c
index 30ed2a302d95..f1e538e23ae1 100644
--- a/linearize.c
+++ b/linearize.c
@@ -183,6 +183,7 @@ static const char *opcodes[] = {
 	[OP_BR] = "br",
 	[OP_CBR] = "cbr",
 	[OP_SWITCH] = "switch",
+	[OP_UNREACH] = "unreach",
 	[OP_COMPUTEDGOTO] = "jmp *",
 	
 	/* Binary */
@@ -399,6 +400,8 @@ const char *show_instruction(struct instruction *insn)
 		} END_FOR_EACH_PTR(jmp);
 		break;
 	}
+	case OP_UNREACH:
+		break;
 
 	case OP_PHISOURCE: {
 		struct instruction *phi;
diff --git a/opcode.def b/opcode.def
index 57d827f449b5..2583e2f4a602 100644
--- a/opcode.def
+++ b/opcode.def
@@ -10,6 +10,7 @@ OPCODE(RET,             BADOP,    BADOP,    BADOP, 1, OPF_NONE)
 OPCODE(BR,              BADOP,    BADOP,    BADOP, 0, OPF_NONE)
 OPCODE(CBR,             BADOP,    BADOP,    BADOP, 1, OPF_NONE)
 OPCODE(SWITCH,          BADOP,    BADOP,    BADOP, 1, OPF_NONE)
+OPCODE(UNREACH,         BADOP,    BADOP,    BADOP, 0, OPF_NONE)
 OPCODE(COMPUTEDGOTO,    BADOP,    BADOP,    BADOP, 1, OPF_NONE)
 OPCODE_RANGE(TERMINATOR, RET, COMPUTEDGOTO)
 
-- 
2.25.1

