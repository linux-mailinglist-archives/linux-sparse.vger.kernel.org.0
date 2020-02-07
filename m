Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4F70154FC6
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 01:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgBGAfA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 19:35:00 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:9344 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726509AbgBGAfA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 19:35:00 -0500
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0170T0LQ001711;
        Thu, 6 Feb 2020 16:34:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=56Z1rRombx0519tW7tlr8ZJ+W7yL9CRtLjtbfeZdWgY=;
 b=JJ6twEiBtSaGXqDFvWUJ5WiQci4GRY0VbUbpVWACiqy0V9bZYs/HeqeW/Bu//2mrYVyp
 NMi9jE3bd1Gne63/yufRD/TIbQHHO6HZHkEgA8JLUQmh8oadj1HgedJi+5IJ2bXD4VBF
 OStz/Bi4SUEODy0SnTl3scG8gnVz8OjJfdM= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2y0vk987mp-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 06 Feb 2020 16:34:48 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 6 Feb 2020 16:34:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZgQ3Bzv9aFH1loQFAa7AwFTf0GCEOlct2bOEt+/BxmbyYtJjMUPCd8NNfrknE5vpxANsy/hmk5faYtjsrwYlLB+OgPAq/iuaNeQ/dniX4BQxXV9mckakZ5M1P/CZw6dcNNYLaH8tjyS1A5CjN2Ug+70gGmeVu44DGv3RtgKOaRYnaquUSoZtVIKJcNXR+UdOxWWzv4ddfDgYIex13IoD4w1qmgcHzxy7kSn2lOlZRbwxA3Fs2NTbii1NrXcroDUz3IdZczE1Fm4zLWQZxntFs+Xld8X0SFfnqrDj2h9PKqG0JHkivJ+QX4lQk9Z0EqzA6JNCl4ovrzz+nh0I/V/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Z1rRombx0519tW7tlr8ZJ+W7yL9CRtLjtbfeZdWgY=;
 b=Ol+VB+87zDpEVTp7lQzivH1tazLJa3IGGXjEIoPOBzP/Ym/Waj/hh6j6I3Wb//WAdj2sWRzR4RDJqJn1x5KvOvoPol3x1gbLbsgzPDNUIon1LhgIv1VVENml0eRJjGL4f7lb+QeESyFinDwWvPGzM1TtHJLAxzdcoh/YWtFv/eQ5gwgG8rmL7CkVhUBG1fSrGNPHlXgDZEHvsksg6RtmR/t8qjQbp02xpV17L9iJ5Bqwi8R+i+SNpdSC9l8beLxE/KNizMFTFG2tXdUFThMAgroHOiBDM83QvwK1O01ElS17n0DpHUh2IV/LdNHnLzXXrudIEh36TNzttDo+PHa/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Z1rRombx0519tW7tlr8ZJ+W7yL9CRtLjtbfeZdWgY=;
 b=C6oH9qZisx5kNjewHZAc678uRN5yt/PfeAMdjJ5Z88h/OAGNSckqLDfp8gkH77VKwUbguIQRSu4gAnYY00tGlk50sEw3Mc01MG1KSU3DvuDkgCsXfBOW84r66TTRW6deS92kAhjYsDsR511rTMlPzLVUrszRQEuRWVjVCl3MStM=
Received: from MN2PR15MB3213.namprd15.prod.outlook.com (20.179.21.76) by
 MN2PR15MB2541.namprd15.prod.outlook.com (20.179.144.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Fri, 7 Feb 2020 00:34:42 +0000
Received: from MN2PR15MB3213.namprd15.prod.outlook.com
 ([fe80::acf4:f398:385a:1fcf]) by MN2PR15MB3213.namprd15.prod.outlook.com
 ([fe80::acf4:f398:385a:1fcf%7]) with mapi id 15.20.2707.020; Fri, 7 Feb 2020
 00:34:42 +0000
Date:   Thu, 6 Feb 2020 16:34:34 -0800
From:   Martin KaFai Lau <kafai@fb.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>
CC:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Arthur Fabre <afabre@cloudflare.com>
Subject: Re: sparse problem with Linux kernel v5.5
Message-ID: <20200207003434.klmw4vuwbrkv7ykt@kafai-mbp>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
 <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: CO2PR04CA0144.namprd04.prod.outlook.com (2603:10b6:104::22)
 To MN2PR15MB3213.namprd15.prod.outlook.com (2603:10b6:208:3d::12)
MIME-Version: 1.0
Received: from kafai-mbp (2620:10d:c090:200::da3) by CO2PR04CA0144.namprd04.prod.outlook.com (2603:10b6:104::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend Transport; Fri, 7 Feb 2020 00:34:40 +0000
X-Originating-IP: [2620:10d:c090:200::da3]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12374d06-a504-42a6-41c7-08d7ab65858a
X-MS-TrafficTypeDiagnostic: MN2PR15MB2541:
X-Microsoft-Antispam-PRVS: <MN2PR15MB2541AD18D50092B4FB3ECADAD51C0@MN2PR15MB2541.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39860400002)(346002)(376002)(366004)(189003)(199004)(1076003)(4326008)(86362001)(6666004)(53546011)(52116002)(110136005)(54906003)(316002)(6496006)(66556008)(55016002)(186003)(66476007)(33716001)(66946007)(81166006)(16526019)(81156014)(8936002)(8676002)(2906002)(9686003)(5660300002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR15MB2541;H:MN2PR15MB3213.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDXyo0vPRB2E8GpuKVhvaV2I+jO73df8czAf5hTMCSRFcje1+VkwsxrpkgIyKfqn2IHxWcZmuBl5jz/nnVeuZvOkHf/TOBFE2T88VV2GwHa/rEvhlfnsih9aBdHZmN/GCw/cotwKuaIvkX9rne+A7aLVSmmS4ovLOIPZ/Ld/YPa9mXU0uZzTnqs9/sLZim1SiIXYyFjXjazVvD8M2fqfxO+TtkyEAB8YfmDElFa0og9L+jYzFAfwPMdTdX0BX2iESpFY2Bj/IhJMLqOKEvSfKoYS6w6BRlKtV1bu8HJNpxyUz/g2rl7/7WWZk5LQrDgjNk/0UTp0aZiOvM/xvcf/S0pfMNLvgQ9UHYjMlqp/+E/h0y+4O52uP4oc6nqyLiH3P074j1rZ30UGMyMSRPPeavKEotAbgbnjFSZMN7F4YCtzWe2BNR4b9ljf+6GtcVYj
X-MS-Exchange-AntiSpam-MessageData: jEhGLlYLPneO89NPg51Moa7o+3+ObwzqPfgnOyogsNwsDm6jksiH+NbBenE0BRKMPW0AJSb/F55m9cax/OiDL6O6pBm5TVhlihnMtaSXtSO6sd8PtiaJvAQDOwTSVGk74nYI1R0bksDmyCpMjoYVvukHX12qjm8rp998Z9g8U9g=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12374d06-a504-42a6-41c7-08d7ab65858a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 00:34:41.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctzWWi5E5irqTTlS/XkvrnjMejUQM1GuqSf6VfEInBldddfF0w198XcNglsx8ES1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2541
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-06_04:2020-02-06,2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002070000
X-FB-Internal: deliver
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 06, 2020 at 03:47:21PM -0800, Linus Torvalds wrote:
> On Thu, Feb 6, 2020 at 12:06 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > However, I thought that the 5+seconds of runtime with 2.9Gb of memory
> > consumption I reported earlier was somehow excessive. So, I looked
> > at the preprocessed file and my editor (and several other tools) chocked
> > near the end ... It appears that one line is 2.8Mb on a total of 6.2MB
> > and contains 28968 times the expression for num_possible_cpus().
> 
> Whee..
> 
> > The origin of this is situted at line 647:
> >         smap->bucket_log = max_t(u32, 1, ilog2(roundup_pow_of_two(...));
> > because ilog2() is an 'interesting' macro which is already expanded
> > inside roundup_pow_of_two().
> 
> Yeah, so we have "const_ilog2()" expanding its argument 63 times (to
> handle the "just turn it into a constant" case), and so
> 
>    ilog2(roundup_pow_of_two(x))
> 
> where both ilog2() and roundup_pow_of_two() contains a const_ilog()
> ends up internally essentially expanding x 63*63 times. Plus a couple
> for the non-constant case.
> 
> And in this case 'x' wasn't all that simple to begin with on SMP.
> 
> And then the "max_t" thing adds another factor of 7 due to the whole
> "let's keep a constant expression constant" with all the careful "can
> I use a variable or not" code.
> 
> So you get 7*63*63 expansions of num_possible_cpus(), plus that "some
> slop" for the other cases.
> 
> I wonder if we could just make sparse _warn_ about this kind of
> situation with expressions that are very big - even if they turn into
> nothing)?
> 
> Because I bet it's not good for a real compiler either. Compile time
> does matter to people, and this clearly wasn't intentional.
> 
> And even if we apply a patch to avoid it here, that's fine, but others
> might be lurking.
> 
> Of course, sometimes you do want to have that kind of nested expansion
> on purpose - creating huge expression lists for some initializer or
> whatever. And sometimes the constant value is what you care about, and
> are willing to have complex expressions.
> 
> I don't think anybody intended for the expression to be quite _that_
> complex, though..
> 
> > This exists since the introduction of this file in commit
> >     6ac99e8f23d4 bpf: Introduce bpf sk local storage
> > but back then it made sparse consume only about 500Mb of memory on it.
> 
> Well, the fact that sparse memory use has exploded by a factor of 6 is
> not exactly good either. What happened?
> 
> > but a better patch should, I think, directly use ilog2() and avoid the roundup.
> 
> No, I think it would be better to just split that expression up.
> 
> Right now the code does:
> 
>         /* Use at least 2 buckets, select_bucket() is undefined
> behavior with 1 bucket */
>         smap->bucket_log = max_t(u32, 1,
> ilog2(roundup_pow_of_two(num_possible_cpus())));
>         nbuckets = 1U << smap->bucket_log;
> 
> so it calculates the log2, and then does "1U << log2".
> 
> Instead, it could just calculate the nbuckets first, and then do the
> "log2()" on that:
> 
>         /* Use at least 2 buckets, select_bucket() is undefined
> behavior with 1 bucket */
>         nbuckets = max_t(u32, 2, roundup_pow_of_two(num_possible_cpus()));
>         smap->bucket_log = ilog2(buckets);
> 
> because honestly, that is just a whole lot more legible anyway. Maybe
> even split _that_ up, and have the max_t as a separate thing.
Thanks for the suggestion.  I can post a patch for this.

-- Martin

> 
> Right now the constant in the comment (2) doesn't match the constant
> in the code (1) because the code is too dense for its own good.
> 
> Of course, currently that "too dense for its own good" code ends up
> evaluating to a constant on UP. Which the easier-to-read code does
> not.
> 
> I'm not convinced that it makes sense to optimize for UP that much.
> 
>                 Linus
