Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8503C153DF0
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 05:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgBFEtY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 5 Feb 2020 23:49:24 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58568 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbgBFEtY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 5 Feb 2020 23:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=9p8MvTXY3cPcPJQGZ32ySfDlFYhjd+PWl6fvLCd1/O8=; b=ekxKadDIPP3iZz2U7DR8CyDpJo
        IajV3A09Phmhm4bw8fA+/pYj6sfCeBRqjsXfiV1Hq1dnFgcQqaHVo0aOxuYie2oZytnDohBxp54zb
        YojPpWB4STwrFAoJl2iCG5oROBLSDxzDhL2y+iKWtwpmrO4aJuansPAd0Q9JH9ZSiYnP8ZDNDSHX5
        F2G2FGi0frI8XPW5T/jkHM0Se5SXfBA+KOrBxOmLHInDEFGXvbu3p6GfXKxh7PQorKudvVJ1Oyj9F
        lUsGSe4PICrQtGdnmD7msPjujz7Dmzo52ms4dWL7IaVqVNqVdmp6YeTHKMFnBoUpFgDWtd2DTj04B
        zI89MmMQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izZ6Q-0005yD-4m; Thu, 06 Feb 2020 04:49:22 +0000
To:     Linux-Sparse <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: sparse problem with Linux kernel v5.5
Message-ID: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
Date:   Wed, 5 Feb 2020 20:49:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

c3BhcnNlIGlzIHYwLjYuMS4NCg0KT24ga2VybmVsIHY1LjUsIEkgY2FuJ3QgZ2V0IHBhc3Qg
YW4gZXJyb3Igb24gbmV0L2NvcmUvYnBmX3NrX3N0b3JhZ2UuYy4NCkFsc28sIHdoYXQgaXMg
ZXJybm8gMTM3PyAoMHg4OSkNCg0KICBDSEVDSyAgIC4uL25ldC9jb3JlL2JwZl9za19zdG9y
YWdlLmMNCi9iaW4vc2g6IGxpbmUgMTogMjY0NDIgS2lsbGVkICAgICAgICAgICAgICAgICAg
c3BhcnNlIC1EX19saW51eF9fIC1EbGludXggLURfX1NURENfXyAtRHVuaXggLURfX3VuaXhf
XyAtV2JpdHdpc2UgLVduby1yZXR1cm4tdm9pZCAtV25vLXVua25vd24tYXR0cmlidXRlIC1E
X194ODZfNjRfXyAtLWFyY2g9eDg2XzY0IC1tbGl0dGxlLWVuZGlhbiAtbTY0IC1XcCwtTUQs
bmV0L2NvcmUvLmJwZl9za19zdG9yYWdlLm8uZCAtbm9zdGRpbmMgLWlzeXN0ZW0gL3Vzci9s
aWI2NC9nY2MveDg2XzY0LXN1c2UtbGludXgvNy9pbmNsdWRlIC1JLi4vYXJjaC94ODYvaW5j
bHVkZSAtSS4vYXJjaC94ODYvaW5jbHVkZS9nZW5lcmF0ZWQgLUkuLi9pbmNsdWRlIC1JLi9p
bmNsdWRlIC1JLi4vYXJjaC94ODYvaW5jbHVkZS91YXBpIC1JLi9hcmNoL3g4Ni9pbmNsdWRl
L2dlbmVyYXRlZC91YXBpIC1JLi4vaW5jbHVkZS91YXBpIC1JLi9pbmNsdWRlL2dlbmVyYXRl
ZC91YXBpIC1pbmNsdWRlIC4uL2luY2x1ZGUvbGludXgva2NvbmZpZy5oIC1pbmNsdWRlIC4u
L2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaCAtRF9fS0VSTkVMX18gLVdhbGwgLVd1
bmRlZiAtV2Vycm9yPXN0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJpZ3JhcGhzIC1mbm8tc3Ry
aWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1mc2hvcnQtd2NoYXIgLWZuby1QSUUgLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV2Vycm9yPWltcGxpY2l0LWludCAt
V25vLWZvcm1hdC1zZWN1cml0eSAtc3RkPWdudTg5IC1tbm8tc3NlIC1tbm8tbW14IC1tbm8t
c3NlMiAtbW5vLTNkbm93IC1tbm8tYXZ4IC1tNjQgLWZhbGlnbi1qdW1wcz0xIC1mYWxpZ24t
bG9vcHM9MSAtbW5vLTgwMzg3IC1tbm8tZnAtcmV0LWluLTM4NyAtbXByZWZlcnJlZC1zdGFj
ay1ib3VuZGFyeT0zIC1tc2tpcC1yYXgtc2V0dXAgLW10dW5lPWdlbmVyaWMgLW1uby1yZWQt
em9uZSAtbWNtb2RlbD1rZXJuZWwgLURDT05GSUdfWDg2X1gzMl9BQkkgLURDT05GSUdfQVNf
Q0ZJPTEgLURDT05GSUdfQVNfQ0ZJX1NJR05BTF9GUkFNRT0xIC1EQ09ORklHX0FTX0NGSV9T
RUNUSU9OUz0xIC1EQ09ORklHX0FTX1NTU0UzPTEgLURDT05GSUdfQVNfQVZYPTEgLURDT05G
SUdfQVNfQVZYMj0xIC1EQ09ORklHX0FTX0FWWDUxMj0xIC1EQ09ORklHX0FTX1NIQTFfTkk9
MSAtRENPTkZJR19BU19TSEEyNTZfTkk9MSAtV25vLXNpZ24tY29tcGFyZSAtZm5vLWFzeW5j
aHJvbm91cy11bndpbmQtdGFibGVzIC1taW5kaXJlY3QtYnJhbmNoPXRodW5rLWV4dGVybiAt
bWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlciAtZm5vLWp1bXAtdGFibGVzIC1mbm8tZGVsZXRl
LW51bGwtcG9pbnRlci1jaGVja3MgLVduby1mcmFtZS1hZGRyZXNzIC1Xbm8tZm9ybWF0LXRy
dW5jYXRpb24gLVduby1mb3JtYXQtb3ZlcmZsb3cgLU8yIC0tcGFyYW09YWxsb3ctc3RvcmUt
ZGF0YS1yYWNlcz0wIC1mbm8tcmVvcmRlci1ibG9ja3MgLWZuby1pcGEtY3AtY2xvbmUgLWZu
by1wYXJ0aWFsLWlubGluaW5nIC1XZnJhbWUtbGFyZ2VyLXRoYW49MjA0OCAtZnN0YWNrLXBy
b3RlY3Rvci1zdHJvbmcgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV2ltcGxpY2l0
LWZhbGx0aHJvdWdoIC1Xbm8tdW51c2VkLWNvbnN0LXZhcmlhYmxlIC1mbm8tdmFyLXRyYWNr
aW5nLWFzc2lnbm1lbnRzIC1wZyAtbXJlY29yZC1tY291bnQgLW1mZW50cnkgLURDQ19VU0lO
R19GRU5UUlkgLWZuby1pbmxpbmUtZnVuY3Rpb25zLWNhbGxlZC1vbmNlIC1mbGl2ZS1wYXRj
aGluZz1pbmxpbmUtY2xvbmUgLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLVd2bGEg
LVduby1wb2ludGVyLXNpZ24gLWZuby1zdHJpY3Qtb3ZlcmZsb3cgLWZuby1tZXJnZS1hbGwt
Y29uc3RhbnRzIC1mbWVyZ2UtY29uc3RhbnRzIC1mbm8tc3RhY2stY2hlY2sgLWZjb25zZXJ2
ZS1zdGFjayAtV2Vycm9yPWRhdGUtdGltZSAtV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVy
LXR5cGVzIC1XZXJyb3I9ZGVzaWduYXRlZC1pbml0IC1mc2FuaXRpemU9a2VybmVsLWFkZHJl
c3MgLWZhc2FuLXNoYWRvdy1vZmZzZXQ9MHhkZmZmZmMwMDAwMDAwMDAwIC0tcGFyYW0gYXNh
bi1nbG9iYWxzPTEgLS1wYXJhbSBhc2FuLWluc3RydW1lbnRhdGlvbi13aXRoLWNhbGwtdGhy
ZXNob2xkPTAgLS1wYXJhbSBhc2FuLXN0YWNrPTEgLWZzYW5pdGl6ZS1jb3ZlcmFnZT10cmFj
ZS1wYyAtSSAuLi9uZXQvY29yZSAtSSAuL25ldC9jb3JlIC1ES0JVSUxEX01PREZJTEU9JyJu
ZXQvY29yZS9icGZfc2tfc3RvcmFnZSInIC1ES0JVSUxEX0JBU0VOQU1FPSciYnBmX3NrX3N0
b3JhZ2UiJyAtREtCVUlMRF9NT0ROQU1FPSciYnBmX3NrX3N0b3JhZ2UiJyAuLi9uZXQvY29y
ZS9icGZfc2tfc3RvcmFnZS5jDQptYWtlWzNdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6MjY4OiBuZXQvY29yZS9icGZfc2tfc3RvcmFnZS5vXSBFcnJvciAxMzcNCg0KDQpZ
ZXMsIHBpZCAyNjQ0MiAoS2lsbGVkKSB3YXMgc3BhcnNlLg0KTXkgbGFwdG9wIGhhcyA4R0Ig
b2YgUkFNICh4ODZfNjQpLg0KSSBoYXZlIGhpdCB0aGlzIGVycm9yIDN4LCBzbyBJIHdvdWxk
IHNheSB0aGF0IGl0IGlzIGVhc2lseSByZXByb2R1Y2libGUgKGZvciBtZSkuDQoNCkFueSBp
ZGVhcy9zdWdnZXN0aW9ucz8NCg0KDQp0aGFua3MuDQotLSANCn5SYW5keQ0KDQo=
