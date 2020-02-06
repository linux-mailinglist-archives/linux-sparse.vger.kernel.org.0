Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16666153DF9
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 05:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgBFE6m (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 5 Feb 2020 23:58:42 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58668 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgBFE6m (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 5 Feb 2020 23:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=1YuS472cJn71QR4J2ig3cgOx2lj61xdwClvZVscywY0=; b=uql/5XTrjH7Z9s8qlUPdpwqdmt
        NsWBO2a/c7b1AT/1anprnHlDWVPZHGGMHeOmC9fKhvKI2jJQlHuiBN5JlI1AwdZutFg8k7MdbeIm+
        7BT8Ntp875DBQjKOWlgzW9kl9fPqQ7Rtq/QbakIDXGH15DJoQuB5UtkADRzJclbNnsCgc08Y9rbpT
        zHOFO6B6zq8ie6prImwogXCw7Oj1fLAo+ErKfd5OgcUSvT2RfNjtYTmZrcN0Em57HWqi8phhcJ5VT
        CX17wcktzC9vZjMFF3uJhW9zT9PFl6AX2WTUfAoG9pz6eyiMq2zuGh3HK4vRFdsodyFQ4VJs85yWf
        ps66JrMA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izZFR-0000XE-DK; Thu, 06 Feb 2020 04:58:41 +0000
Subject: Re: sparse problem with Linux kernel v5.5
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Linux-Sparse <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
Message-ID: <91fb0247-d64f-504c-7452-bf937c33d295@infradead.org>
Date:   Wed, 5 Feb 2020 20:58:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: base64
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

T24gMi81LzIwIDg6NDkgUE0sIFJhbmR5IER1bmxhcCB3cm90ZToNCj4gc3BhcnNlIGlzIHYw
LjYuMS4NCj4gDQo+IE9uIGtlcm5lbCB2NS41LCBJIGNhbid0IGdldCBwYXN0IGFuIGVycm9y
IG9uIG5ldC9jb3JlL2JwZl9za19zdG9yYWdlLmMuDQoNClNvcnJ5LCB0aGlzIGlzIG9uIGxp
bnV4LW5leHQgMjAyMC0wMjA1LCBub3QgbWFpbmxpbmUuDQoNCg0KPiBBbHNvLCB3aGF0IGlz
IGVycm5vIDEzNz8gKDB4ODkpDQo+IA0KPiAgIENIRUNLICAgLi4vbmV0L2NvcmUvYnBmX3Nr
X3N0b3JhZ2UuYw0KPiAvYmluL3NoOiBsaW5lIDE6IDI2NDQyIEtpbGxlZCAgICAgICAgICAg
ICAgICAgIHNwYXJzZSAtRF9fbGludXhfXyAtRGxpbnV4IC1EX19TVERDX18gLUR1bml4IC1E
X191bml4X18gLVdiaXR3aXNlIC1Xbm8tcmV0dXJuLXZvaWQgLVduby11bmtub3duLWF0dHJp
YnV0ZSAtRF9feDg2XzY0X18gLS1hcmNoPXg4Nl82NCAtbWxpdHRsZS1lbmRpYW4gLW02NCAt
V3AsLU1ELG5ldC9jb3JlLy5icGZfc2tfc3RvcmFnZS5vLmQgLW5vc3RkaW5jIC1pc3lzdGVt
IC91c3IvbGliNjQvZ2NjL3g4Nl82NC1zdXNlLWxpbnV4LzcvaW5jbHVkZSAtSS4uL2FyY2gv
eDg2L2luY2x1ZGUgLUkuL2FyY2gveDg2L2luY2x1ZGUvZ2VuZXJhdGVkIC1JLi4vaW5jbHVk
ZSAtSS4vaW5jbHVkZSAtSS4uL2FyY2gveDg2L2luY2x1ZGUvdWFwaSAtSS4vYXJjaC94ODYv
aW5jbHVkZS9nZW5lcmF0ZWQvdWFwaSAtSS4uL2luY2x1ZGUvdWFwaSAtSS4vaW5jbHVkZS9n
ZW5lcmF0ZWQvdWFwaSAtaW5jbHVkZSAuLi9pbmNsdWRlL2xpbnV4L2tjb25maWcuaCAtaW5j
bHVkZSAuLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmggLURfX0tFUk5FTF9fIC1X
YWxsIC1XdW5kZWYgLVdlcnJvcj1zdHJpY3QtcHJvdG90eXBlcyAtV25vLXRyaWdyYXBocyAt
Zm5vLXN0cmljdC1hbGlhc2luZyAtZm5vLWNvbW1vbiAtZnNob3J0LXdjaGFyIC1mbm8tUElF
IC1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb24gLVdlcnJvcj1pbXBsaWNp
dC1pbnQgLVduby1mb3JtYXQtc2VjdXJpdHkgLXN0ZD1nbnU4OSAtbW5vLXNzZSAtbW5vLW1t
eCAtbW5vLXNzZTIgLW1uby0zZG5vdyAtbW5vLWF2eCAtbTY0IC1mYWxpZ24tanVtcHM9MSAt
ZmFsaWduLWxvb3BzPTEgLW1uby04MDM4NyAtbW5vLWZwLXJldC1pbi0zODcgLW1wcmVmZXJy
ZWQtc3RhY2stYm91bmRhcnk9MyAtbXNraXAtcmF4LXNldHVwIC1tdHVuZT1nZW5lcmljIC1t
bm8tcmVkLXpvbmUgLW1jbW9kZWw9a2VybmVsIC1EQ09ORklHX1g4Nl9YMzJfQUJJIC1EQ09O
RklHX0FTX0NGST0xIC1EQ09ORklHX0FTX0NGSV9TSUdOQUxfRlJBTUU9MSAtRENPTkZJR19B
U19DRklfU0VDVElPTlM9MSAtRENPTkZJR19BU19TU1NFMz0xIC1EQ09ORklHX0FTX0FWWD0x
IC1EQ09ORklHX0FTX0FWWDI9MSAtRENPTkZJR19BU19BVlg1MTI9MSAtRENPTkZJR19BU19T
SEExX05JPTEgLURDT05GSUdfQVNfU0hBMjU2X05JPTEgLVduby1zaWduLWNvbXBhcmUgLWZu
by1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtbWluZGlyZWN0LWJyYW5jaD10aHVuay1l
eHRlcm4gLW1pbmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIgLWZuby1qdW1wLXRhYmxlcyAtZm5v
LWRlbGV0ZS1udWxsLXBvaW50ZXItY2hlY2tzIC1Xbm8tZnJhbWUtYWRkcmVzcyAtV25vLWZv
cm1hdC10cnVuY2F0aW9uIC1Xbm8tZm9ybWF0LW92ZXJmbG93IC1PMiAtLXBhcmFtPWFsbG93
LXN0b3JlLWRhdGEtcmFjZXM9MCAtZm5vLXJlb3JkZXItYmxvY2tzIC1mbm8taXBhLWNwLWNs
b25lIC1mbm8tcGFydGlhbC1pbmxpbmluZyAtV2ZyYW1lLWxhcmdlci10aGFuPTIwNDggLWZz
dGFjay1wcm90ZWN0b3Itc3Ryb25nIC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaCAtV25vLXVudXNlZC1jb25zdC12YXJpYWJsZSAtZm5vLXZh
ci10cmFja2luZy1hc3NpZ25tZW50cyAtcGcgLW1yZWNvcmQtbWNvdW50IC1tZmVudHJ5IC1E
Q0NfVVNJTkdfRkVOVFJZIC1mbm8taW5saW5lLWZ1bmN0aW9ucy1jYWxsZWQtb25jZSAtZmxp
dmUtcGF0Y2hpbmc9aW5saW5lLWNsb25lIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50
IC1XdmxhIC1Xbm8tcG9pbnRlci1zaWduIC1mbm8tc3RyaWN0LW92ZXJmbG93IC1mbm8tbWVy
Z2UtYWxsLWNvbnN0YW50cyAtZm1lcmdlLWNvbnN0YW50cyAtZm5vLXN0YWNrLWNoZWNrIC1m
Y29uc2VydmUtc3RhY2sgLVdlcnJvcj1kYXRlLXRpbWUgLVdlcnJvcj1pbmNvbXBhdGlibGUt
cG9pbnRlci10eXBlcyAtV2Vycm9yPWRlc2lnbmF0ZWQtaW5pdCAtZnNhbml0aXplPWtlcm5l
bC1hZGRyZXNzIC1mYXNhbi1zaGFkb3ctb2Zmc2V0PTB4ZGZmZmZjMDAwMDAwMDAwMCAtLXBh
cmFtIGFzYW4tZ2xvYmFscz0xIC0tcGFyYW0gYXNhbi1pbnN0cnVtZW50YXRpb24td2l0aC1j
YWxsLXRocmVzaG9sZD0wIC0tcGFyYW0gYXNhbi1zdGFjaz0xIC1mc2FuaXRpemUtY292ZXJh
Z2U9dHJhY2UtcGMgLUkgLi4vbmV0L2NvcmUgLUkgLi9uZXQvY29yZSAtREtCVUlMRF9NT0RG
SUxFPScibmV0L2NvcmUvYnBmX3NrX3N0b3JhZ2UiJyAtREtCVUlMRF9CQVNFTkFNRT0nImJw
Zl9za19zdG9yYWdlIicgLURLQlVJTERfTU9ETkFNRT0nImJwZl9za19zdG9yYWdlIicgLi4v
bmV0L2NvcmUvYnBmX3NrX3N0b3JhZ2UuYw0KPiBtYWtlWzNdOiAqKiogWy4uL3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQ6MjY4OiBuZXQvY29yZS9icGZfc2tfc3RvcmFnZS5vXSBFcnJvciAx
MzcNCj4gDQo+IA0KPiBZZXMsIHBpZCAyNjQ0MiAoS2lsbGVkKSB3YXMgc3BhcnNlLg0KPiBN
eSBsYXB0b3AgaGFzIDhHQiBvZiBSQU0gKHg4Nl82NCkuDQo+IEkgaGF2ZSBoaXQgdGhpcyBl
cnJvciAzeCwgc28gSSB3b3VsZCBzYXkgdGhhdCBpdCBpcyBlYXNpbHkgcmVwcm9kdWNpYmxl
IChmb3IgbWUpLg0KPiANCj4gQW55IGlkZWFzL3N1Z2dlc3Rpb25zPw0KPiANCj4gDQo+IHRo
YW5rcy4NCj4gDQoNCg0KLS0gDQp+UmFuZHkNClJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCg==
