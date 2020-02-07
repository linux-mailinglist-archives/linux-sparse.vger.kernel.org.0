Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F631553B6
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 09:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgBGIaV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 03:30:21 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:9658 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726130AbgBGIaV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 03:30:21 -0500
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0178QIjH024887;
        Fri, 7 Feb 2020 00:30:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=facebook;
 bh=RjnXAVjGtxdFGgG261PT0ztZ/nXs5L+xUvgZ/kgawDw=;
 b=m7MbeZ4Q8ymWdC6+9KHLaXQ0q0K8q9IXv87iTqeAP+ceA6msPfusGKlDuwcPsIvKG1Ge
 m8zWHeK8vGqad5ve1Cpw+UUJbK7xMenrIJGYg0v61JUoq7S4UsXHsl+XCN77Xqpssyr5
 qgFDkZBJxtziTxuld1w3q7OAKhBlTnhidnY= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2y0ryju0kc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 07 Feb 2020 00:30:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 7 Feb 2020 00:30:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBQHubjbr35mHcKhqVQjMOLXccq7DvoMf84mgZ79vr+Dzz/fXCq3p+cgcZWzm+LlsGOqdUoGu2qqXB7heW2SdkKtZ4fCrVVuw1GsHK+/EZNo4jgsI8hPPKZObXOn6bfSoG8QlrbuPtlMA5bpo1iDMCt47Lvs+3lotAqbF8dAaLAvwIWraQtNv8VS++z5VQhrxlUeE32KBRu27gpTJChLeK+hVQ6HRnuW4nBKJmoV2k2oo7/FEwg7lykJERaLSYhs/2awrqjh/JXSv1BzJwivowsBXgQjH+FUE1YQ7/4BIQW/rFdgnPzxIjMskld1jXmAcLIS6tiPoYJur0VWb1nnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6M9nzUuGkuPEePu0J/Rj73NiaWr8+JhzrzT3f0rTkI=;
 b=V5QhF/xKmQ17mrXuM9MyNaed17W9NlZ9HNRB6xxTT3x4r3FqrC1QrZibDYPYOE/zeZD4zf8PLfdezUKNIG93UUFdNNwpxE1bFJc0zcp+zILzpkifbAev4aSDf6Ic3Afy0Wapuas7l6zPEvkRTrzaxs6Eu489eOMr+Clewx0ZDrbpEXlpTw0Xv0+ZPqyZhxh+ADMEt6urJGrRauZOUKxOnDymkoYhmIXM6odWuH4YBfmyxgAe4322qTIs5UTyjLRHkzuV2jYD4xsJbdO0ocNb2togz3ZxR7v/Wl9p8VPocQdBv0AsSILHD46lczLsy0mST9J7vA0yoJo3ViGe9Vh9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6M9nzUuGkuPEePu0J/Rj73NiaWr8+JhzrzT3f0rTkI=;
 b=hBUjzZK3l/U3pJIoK4VK8rDACsdVNwi6l853003R9ohGjh6qr/GOC5z3amFj+BJk79+2X8DdgpKit9bkUS7/Na8MhKhYnOf1hviJU7GH6PCp56HCwBlNdKqmdzeWnHtl5AjElp5SFG5Y6K/cmnRl8PmdYyLkZ3+XHcAaW67ni7A=
Received: from MN2PR15MB3213.namprd15.prod.outlook.com (20.179.21.76) by
 MN2PR15MB3005.namprd15.prod.outlook.com (20.178.252.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 08:30:05 +0000
Received: from MN2PR15MB3213.namprd15.prod.outlook.com
 ([fe80::acf4:f398:385a:1fcf]) by MN2PR15MB3213.namprd15.prod.outlook.com
 ([fe80::acf4:f398:385a:1fcf%7]) with mapi id 15.20.2707.020; Fri, 7 Feb 2020
 08:30:05 +0000
Date:   Fri, 7 Feb 2020 00:29:54 -0800
From:   Martin KaFai Lau <kafai@fb.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
CC:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Arthur Fabre <afabre@cloudflare.com>
Subject: Re: sparse problem with Linux kernel v5.5
Message-ID: <20200207082954.majgsx5trepwb46n@kafai-mbp>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
 <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
 <b6d24fd2-e5b8-7010-86b5-c46f65536eef@kleine-koenig.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6d24fd2-e5b8-7010-86b5-c46f65536eef@kleine-koenig.org>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: MWHPR19CA0049.namprd19.prod.outlook.com
 (2603:10b6:300:94::11) To MN2PR15MB3213.namprd15.prod.outlook.com
 (2603:10b6:208:3d::12)
MIME-Version: 1.0
Received: from kafai-mbp (2620:10d:c090:180::2579) by MWHPR19CA0049.namprd19.prod.outlook.com (2603:10b6:300:94::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Fri, 7 Feb 2020 08:30:04 +0000
X-Originating-IP: [2620:10d:c090:180::2579]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59901b48-edec-4754-cd51-08d7aba7eeda
X-MS-TrafficTypeDiagnostic: MN2PR15MB3005:
X-Microsoft-Antispam-PRVS: <MN2PR15MB300577F10402E0E8E7A5FD85D51C0@MN2PR15MB3005.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(16526019)(186003)(6666004)(6496006)(2906002)(478600001)(52116002)(9686003)(81156014)(8676002)(8936002)(81166006)(6916009)(53546011)(55016002)(33716001)(5660300002)(316002)(1076003)(4326008)(4744005)(66946007)(86362001)(66556008)(54906003)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR15MB3005;H:MN2PR15MB3213.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jy3r8qEwwGc7to/1yePk9ybrKDo784jQJWVeuVhlqyiWV82jnRtNBZNLcyTpIRfurZS47vVrQeWkbj9BA7qWTrEgO5ZF0KGQuQd6ihTdipkozgm4z625J39FPUzz4WKMVyZBEwaThJNm+zCoNhT5nfW6A4OxVx/uhPKvv6DPzf2/2ONlX6QWIJbG0RuGPFP+/5wIUTIgAfeAd4XmVxC6N6TQrGTAnvgTA6XjYk7DRZQJx68yZyyhjFcmTH9x6B0pbn2yTiDrawF5EmoS+reGd5mhRrzzIcOoM11Jg60Hgp3ceMEBJ+bSP/1nQ1MJfsg8yFcmDPcK3jFgrskGcpQl6O5iuQkwcC/HFA/CvaRiRH1iuTveL8Znt88/k8CRogBeTC+N2h97vfZOSk546Oyw5PFJyHf78fBKy7td0uX+RFfL4NZev22vojLAfqu88JV4
X-MS-Exchange-AntiSpam-MessageData: mAl+s+O58iy7WZnWIQ4ArWfZfybAzuGGz0whUrK8Yro8593dUf9N9vAOjdJ0jp3BwvMrd10DifRYrHyJluwl7a74jMbWFUiOfYJbXnek9IRwD1LwtuuT3xxuryuIheOtLYT7csX6Zh4NxKvj0dc9HZDGiT7BLkpzN4gpc6eRq7E=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59901b48-edec-4754-cd51-08d7aba7eeda
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 08:30:05.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gSUWvEXClCx5mG2YGpTfZwHrWoc9ElpGN5Z5qCLFHJlwfUA2C9thk7TgCTrmdkr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3005
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-06_04:2020-02-06,2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=826 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002070065
X-FB-Internal: deliver
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Feb 07, 2020 at 07:34:57AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On 2/7/20 12:47 AM, Linus Torvalds wrote:
> > Instead, it could just calculate the nbuckets first, and then do the
> > "log2()" on that:
> > 
> >         /* Use at least 2 buckets, select_bucket() is undefined
> > behavior with 1 bucket */
> >         nbuckets = max_t(u32, 2, roundup_pow_of_two(num_possible_cpus()));
> >         smap->bucket_log = ilog2(buckets);
> 
> 
> Isn't it kind of ineffective to first round to a power of two and then
> take the ilog2 of it?
> 
> At a first glance I'd say that
> 
> 	ilog2(roundup_pow_of_two(x)) == ilog(x - 1) + 1
> 
> for x > 1. (Maybe even for x == 1? Didn't care to check, I think it
> doesn't matter for the case at hand.)
> 
> This RHS might be easier to optimize for the compiler?!
I believe x == 1 needs an extra case since ilog2(0) won't work.

Since this function (map creation) is not on the fast path,
I currently opt for Linus's suggestion which its code is more
self-explanatory.

Thanks,
Martin
