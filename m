Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33AF138582
	for <lists+linux-sparse@lfdr.de>; Sun, 12 Jan 2020 09:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732380AbgALIVt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 12 Jan 2020 03:21:49 -0500
Received: from mail3.iservicesmail.com ([217.130.24.75]:17620 "EHLO
        mail3.iservicesmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732369AbgALIVt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 12 Jan 2020 03:21:49 -0500
IronPort-SDR: /PCmiUeBN/BeWPkk52ApeQKwqryf5WZnUKnzQ6ck/kfSk/0BnHYw3AGJwv+K9/krwP19LOaGko
 HzKJmlb5rB+Q==
IronPort-PHdr: =?us-ascii?q?9a23=3A6l3YnR12orNKLPCismDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIfLPad9pjvdHbS+e9qxAeQG9mCsLQe1bWd6v+ocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmTSwbalsIBi3rwjdudQajIl/Iast1x?=
 =?us-ascii?q?XFpWdFdf5Lzm1yP1KTmBj85sa0/JF99ilbpuws+c1dX6jkZqo0VbNXAigoPG?=
 =?us-ascii?q?Az/83rqALMTRCT6XsGU2UZiQRHDg7Y5xznRJjxsy/6tu1g2CmGOMD9UL45VS?=
 =?us-ascii?q?i+46ptVRTkjiALOSMl/27Nj8xxjLtXrQympxxl247UZ5uVO+BifqzDZN8VW2?=
 =?us-ascii?q?xBUt9NWixdHoOzdZcAD+ofMuZdsYb9oUcOoQKgCgmqHe/hzThIhnno0qw6yu?=
 =?us-ascii?q?guDwfG1xEkE98ArHjYsND5OaEPWu630abI1y3OYf1W1zfn9obGcQ0vrv6QUr?=
 =?us-ascii?q?x/asfR1UsiGB/ZglmMtYDpITWY3fkNvWiB6OpgUPqihXQ5pAFtvDev3NonhY?=
 =?us-ascii?q?nOhoITxVDP6CJ0wJ4rKt2kVkF7e9ClEJxWtyGVLIZ2QtgiTHp0tyog1rIGvp?=
 =?us-ascii?q?u7cDIKyJQk3hPSbeGMfYuQ4h/7SuqdPDV1iGh4dL+xmxq+61asx+LmWsS60F?=
 =?us-ascii?q?tHqDdOnMPWuXAXzRPT79CKSv56/ki8xzmCzxvT6uRYIUAskqrbNoIhzqYwlp?=
 =?us-ascii?q?UNtUTDGTf7mEDsg6+XckUk4Pan6+D7brjpvJOcKYh0hRzkPaQgncy/B/o3Ph?=
 =?us-ascii?q?IQUGiA4ei81bvj8lPlQLhSkPE6j6vUvIrHKckVuqK1GRFZ34k55xuxDzqqyN?=
 =?us-ascii?q?EYkmMGLFJBdhKHlY/pO1TWLfDgE/i/n0qjkC1lxvDBOL3hDY7ALnjYkLj6Yb?=
 =?us-ascii?q?lx8VJTyA02zdxF55JUCakNIOjvVU/pqNzYEhg5PhSww+bmDtV9y4wfVXuUAq?=
 =?us-ascii?q?+BKqzSq0SI6fw0LumSa48apiz9J+Im5/Hwl385n0ESfa2z0ZsQcnC4EacuH0?=
 =?us-ascii?q?LMZXvqn8dECn8DpBEzZPLlhUfEUjNJYXu2GaUm6WIBBZqiHLvEE7ignLGblB?=
 =?us-ascii?q?i8GJIeMnhLFl2WDnDueIWHW+wGYwqdJ8ZglnoPUr33GKE70hT7jALmxqAvEe?=
 =?us-ascii?q?3S9WVMrZ//2cJq4OvcvREp/zcyBMOYlWGOGTIn1lgUTiM7ifks6Xd2zU2OhP?=
 =?us-ascii?q?Mg2/E=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HrAgA40RpelyMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYFoBAEBAQELAQEBGggBgSWBTVIgEpNQgU0?=
 =?us-ascii?q?fg0OLY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQE?=
 =?us-ascii?q?BAQEFBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAE?=
 =?us-ascii?q?OAVODBIJLAQEzhUuYLAGNBA0NAoUdgkkECoEJgRojgTYBjBgagUE/gSMhgis?=
 =?us-ascii?q?IAYIBgn8BEgFsgkiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkU?=
 =?us-ascii?q?PgQmIA4ROgX2jN1d0AYEecTMagiYagSBPGA2IG44tQIEWEAJPjFuCMgEB?=
X-IPAS-Result: =?us-ascii?q?A2HrAgA40RpelyMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYFoBAEBAQELAQEBGggBgSWBTVIgEpNQgU0fg0OLY4EAgx4Vh?=
 =?us-ascii?q?gcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABA?=
 =?us-ascii?q?QEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEzh?=
 =?us-ascii?q?UuYLAGNBA0NAoUdgkkECoEJgRojgTYBjBgagUE/gSMhgisIAYIBgn8BEgFsg?=
 =?us-ascii?q?kiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4ROgX2jN?=
 =?us-ascii?q?1d0AYEecTMagiYagSBPGA2IG44tQIEWEAJPjFuCMgEB?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; 
   d="scan'208";a="304019397"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 12 Jan 2020 09:00:00 +0100
Received: (qmail 24457 invoked from network); 12 Jan 2020 05:00:21 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-sparse@vger.kernel.org>; 12 Jan 2020 05:00:21 -0000
Date:   Sun, 12 Jan 2020 06:00:20 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-sparse@vger.kernel.org
Message-ID: <30299451.460802.1578805221374.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

