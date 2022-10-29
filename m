Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F1F6120A3
	for <lists+linux-sparse@lfdr.de>; Sat, 29 Oct 2022 07:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJ2F4u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 29 Oct 2022 01:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiJ2F4t (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 29 Oct 2022 01:56:49 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FCBC58A6;
        Fri, 28 Oct 2022 22:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667023007; x=1698559007;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PoF/FukFQv/ncySQ/EfQ+QBhsD54eJkkPDRmjKz50fs=;
  b=ny/nCDmyCJIw/tekXqWx4VQR0MQNHNEa9qRk5FrnbztnmJ6X/U2EyX+i
   QZwbmTW9FWFXbiZGkisiewsiBRvEqAKMy2tQpSVidQoPBxeUvEsm013Ou
   1OGXABShT0I9MnHIICp9yCYZHRb71BJgHAnkfDKKpuByHWhfjbY4HWgKt
   i2WOE+0TE1r0YCDly4BCy3aLbfrBOVo9UgXHMcQCgVN0Vz0GZc0x2D2JW
   Ap1Ftk1D6Of2CyfRpoXOO0yvcEtnTYB2P/EIp5/o6ndFuoUp1pB8baQ1/
   NJKnzVNWDkmCR30Y8DBX0QEKuXqLTbH+F2i8Q6wrYCXvIBFtYr+ru10pb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="296050186"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="296050186"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 22:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722291363"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="722291363"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2022 22:56:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 22:56:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 22:56:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 22:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hse4XQjedralhWRtj6icMBXVks45pZ9VSkSIPHttdnP/cY1X+1w27MAtpqX7jZb8XbOpCPoJ7jkMvCE3zlolAk5uqF5B870rKf1q4hVLCMhLy5At8vEc1Y222PthcG5K1eK7Wx5r4PDF4H62etsPtzB2LcqKkUel8Y1V3zK2s6AuAGt9RCfT5CvCdsX2NnVfUbFwl4h/Ir97UMCsH3utfi5WFJoEnvSFFjET3NQTIABC785aA+gMiUo4+nFE51ZjQE489Zscm8kKn59ALIJ56jIxQt3XubrRIbcmiBgcMXWsJJmm1q3f+1RrpefvZeOdr5fhTmE28aJhLOijUA1s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd3l3W+t6ZsfPDOme20KZoOfU4gI/QA/4LkKccdpe2s=;
 b=OPX5XJDlmsfkBsG/z06N810VP4TR5YPXfqPBJOReVWK5E2I6TFOpwuota2Hk9jEB8FseI3Npchjkp57pQSbedxQPx4BQufr+G/a6dKRUsmQ7EFDjpdvwmWB7IZJD8UsYW/pezH9DwqHmQ8VVOosMdpLZ5zkGY8HhNoID9NYKVZoKIzL7Bj1br2Aok6VsgyyruOMv4DsTM6BZkE4M5gz78q+1VpvIJ1cMofMf54HQPwQJuUnb5baiCEs08ursx81cYWvNRYJehoZmDL2Rmr2jRpjM3IrHJQcJ9yJIA1boSJStWG9N/wii/H8vrJjAbPuhKO9VdnjovhtFQerWZvGcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 29 Oct
 2022 05:56:40 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::4ec5:eced:e4:7706]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::4ec5:eced:e4:7706%6]) with mapi id 15.20.5769.016; Sat, 29 Oct 2022
 05:56:39 +0000
Message-ID: <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
Date:   Sat, 29 Oct 2022 08:55:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Content-Language: en-US
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     <keescook@chromium.org>
CC:     <airlied@linux.ie>, <trix@redhat.com>, <dlatypov@google.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
        <llvm@lists.linux.dev>, <arnd@kernel.org>,
        <intel-gfx@lists.freedesktop.org>, <nathan@kernel.org>,
        <rodrigo.vivi@intel.com>, <mchehab@kernel.org>,
        <tvrtko.ursulin@linux.intel.com>, <mauro.chehab@linux.intel.com>,
        <ndesaulniers@google.com>, <gustavoars@kernel.org>,
        <vitor@massaru.org>, <luc.vanoostenryck@gmail.com>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8b94ed-3f95-4d40-df28-08dab97258d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oE/UYuA9/e59msMrTbunzZDipGEwj4ZIbBtabAbMYOp0j3tPi6z4GuJzL+dzWHiYSQWNZC/Te+KiIJYu9Pg2OHwn/HUSub8mTvhzLnqHZp+93GexFWbaEIidMLDFWLJNASwu3axv/+pjQC3UB4LIrHGQ27eeXbrz0P1RgtbDo7EkiaCLynC4n8M2dKn2HRKqX6pAWL88my6igm2scifudvDd7cSGWRktxwqum/arz2OoeyMoeflK3EFEs8HXVfZu3dnnqUy1PnAIQfrWVvQrh7mjgzDU788DGh86PAFnB8LsC4aqPaOS6VJNNsTxBBVIYgpLQXjfTgKbaWf9/VzDUkQpeDZA38zBZNAgCBpzgvgZdcygE+/hChR+u6HHpgnapHoxrb4rgOXMI/VsLDYK+2fM149dgRGvRZsXizpx4IdoJCY4rPfwZPBOWJTHT6g521jUNdEWBlA51XU4YRtoSo6PLD1kps8mIZXue0y7dYJhJ4774ljL1cpLXxkQxk2ReN9MtIoFvxghxpG8PYXr2eHSQb1m0V4UEHmzBfy6JUl8VlnzThS5u/kE7Z6wE7NmB3q6y4hmWLbzXJOIWMIZ60lHLAhDA9B3fDT9uCj+fxlmg1PDg5dCZkYGYy0/R4I2NemaQTFvKGpz4/tk1lCKcvCiKmBveGz+Ib+a5nonOx2h6sbtPj8nI/InmrnL18Pxrz7GAC53W9gXtXyunKIg8u2A1GtteKcQdp8gnCrYCodQDuPepE8AnK9ACNJva5kq54lY0hFMtkM80yFgZGTMiDiHT8tDSbusCBv6e9xveZIQjQw5nFFqP3JCCQ7icL1xepvGHOoGAaeoRK7Bi2Al2OY1SuFiTOi9bOvwXGfy7EI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(478600001)(6666004)(53546011)(6506007)(6512007)(26005)(316002)(6916009)(6486002)(966005)(38100700002)(82960400001)(2616005)(36756003)(186003)(83380400001)(31696002)(31686004)(86362001)(2906002)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(30864003)(8936002)(7416002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejFXNjB4TE1Dcnl4cWQ1K2lrU1FkZDFsS2QvdFJhVGFLVmp6YVlCMG5RK0xP?=
 =?utf-8?B?em82ZkFteUhUcE1sUTdRbnovNWlaVHNoczAwTy9sVDJkODhnd1JvVjZJRUhB?=
 =?utf-8?B?WmtPMkJsRTN3U0VaRlFIVnlDWU15dWh2S1FJczM0R3JGdnROVGx0d2VhcjFM?=
 =?utf-8?B?OENzRHZkeDgxYjEvQlpzYUtJdU9MNkZWU1gzelhUYkNOR2k5Y2NRRDB6RDF4?=
 =?utf-8?B?eWt1TW02YmJXRURIVDc5YnJTdkhxdnVHV3VvSEw3ajdJbHhPZ0hIcFgyMDlm?=
 =?utf-8?B?aDhHL010RkdOaWVHVkhKTW5Zd0ZYbThyRTVWTUE3S3RPb1dvWklDbVVZL0F4?=
 =?utf-8?B?SDlpVW8vUEI0ZE1USnB6OGl3SEVhQXNqR01VNFFVYnpCZnJxNGV0NzB2QThZ?=
 =?utf-8?B?QzBTOWVXSjl4UWNJUHNZRXR0a3hQOWJvZEpJVzdSc1dIdUREbUc0UmR3UE1H?=
 =?utf-8?B?Wk9QcWRVM1pPUmtwenRKdVNLTGR6eDZuSlgrNnc2bW94dUZxUW1PRkluRXlx?=
 =?utf-8?B?ZlB0L1NJV0xEZFh5Z2VLSDBGVWc0cXRta3RQSS9zVXhxZDIyNEkzUmQxVXky?=
 =?utf-8?B?dVgzTFJvOTVaMVM4ZURsbi9UQXdndkJOVXJXTTJneVJHejBSZ2JaMCtGUmNo?=
 =?utf-8?B?SzY3Q0Q2MWJOQkdpamRCN1lEcVJ5Y1p3R25qTFNlQk12VWNuQWJuVGhka045?=
 =?utf-8?B?ZDhaUXREN0FldWtXKzFoRUcwYlNHQXpLN3pXN3U0R0ZwaGo5NkdiUlJvOWJK?=
 =?utf-8?B?bmpCRFZSdEx1blU0eUdkUU10YUJtcEIwVWVuLzB2TmUxZlh3VFdzSHhVemE3?=
 =?utf-8?B?dG5Eb0hJMlIzRTVTUTZlQjBYbWdubEd3ejZCM0J1VDU1MTdRK0IrK2pyM24x?=
 =?utf-8?B?WlhKK2VZYm9jcEZyOGtrNlpLamplcUhQaDZDdmpDYzdmbnh5UDhscDZIWlJ3?=
 =?utf-8?B?SnYyR3Jvb2lmOG84ejZlZDlFblhHS25JK0hldmlDN1Y5MXgzZUh4cElkUHVy?=
 =?utf-8?B?TW9XcmErZWlINTdqcVRnV2dmVzRBTTBGYmpYbEltTysyYjdaeHhtZEoyVEFx?=
 =?utf-8?B?MEF5ZkJhaVVQUlVVQjZlcC9nKzBwVnZMTFNGNENlSDFDSENCMTE2Tm1XbXhn?=
 =?utf-8?B?Wkx3UU1Ga0tGaVFTNlErNDMrWVFGY1NZWWovbzZGcWFrbXBJK2Rvb1F3RTZj?=
 =?utf-8?B?SDlqOVhTQWhWMlhvWGFjN1E4N1RGL05Ub2NwdzlQaU0vZ2pTL0tmd2NOZmtl?=
 =?utf-8?B?c0N4UFd5UHFSdlpqSDRvSTdpa2lvZGRMZmxVbVBvblB2bnZVL3B6VHdONzZ1?=
 =?utf-8?B?M21nR3FjQnRUSGtkUmVVUUwxTjZWZlQ1LzljTDRnQlF3cXdrRFBWWkNVSWN4?=
 =?utf-8?B?Tk9JQVJ2eWdnVDArVGh1bVg1SzE2c1E0WVN2Wjl5UzVmeldUUXdKS0lLVk9H?=
 =?utf-8?B?MHNhMGdsUzFnUHNQOEtDVDZXcVRRR1ExRUh1dER2ZThXTDFpaWozREk3YVE0?=
 =?utf-8?B?Zjk2ajRUckpiaUIwcDY3aXlqUzR6Z3RJcFJyY3A5TStYVFZzaHIxdnFvaFA3?=
 =?utf-8?B?WnNRd0t6L2N2dFMrQUlNSlZOQWx2eFh6aGNoTnl3dkJ6cXRyMlViekphQlJV?=
 =?utf-8?B?ajlyRkdXUGFWWDNXRWFuSzZaWm50UUIrNXVkdVhhcU5FQ0tERjBOUjZ6aTVK?=
 =?utf-8?B?RVVHeDU3czRqNU92aEozVzhpbXo2Mmp2Q0hvaWx4cVBEUy9RQUNwbmZtLzNS?=
 =?utf-8?B?RVFxSHBFWk5yNG5IZEpHdzUzb0JZYTZoOHJTV0JZbTNjSlBVT0x4d3U4NXRh?=
 =?utf-8?B?VWtEa2p1RGIvRXA5RGhCWFRKcW5zQ1laOVVWeDdCM1pzaU9kblBjTVNOZmY3?=
 =?utf-8?B?MEp6TlZaUlpPeERveU9jY0ZiTWY0NFl5eU10cEQ0em45dWZYRTRvUnlqaXQ5?=
 =?utf-8?B?Wjlsc2o3dUh4U0d2TXBPak9wTWJ5S0gyendxS3lkelcxdTFyU2V5dEJVc1hO?=
 =?utf-8?B?cU01Zld5aGtsOXBRZlRTZVNZcXRlcm96bi9ESHNOZkpTWFEzMzNBcmZsSzBW?=
 =?utf-8?B?b05iRmtNNXlucU9ya3A0VnAzOG55TUZXOTAxUWlRTXVNQ2lUM25xUk1acHgy?=
 =?utf-8?B?V2ZyK0xsa21naFY3VUpwanJqWjRWdFdXbW05OWZVbVUzaCt6U2ZEOXdBMDJr?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8b94ed-3f95-4d40-df28-08dab97258d6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 05:56:39.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfc57qQMkNnxp5cSafJvZc32YKMzcAsNqLHkhVeifSfwyQa3NeKG1PhEcIJCUUYfTY76cU8Y/Pe5ewKBmZWPmZX7l7g+Y85dpknDE5jBWBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi Kees,

I've updated to v5 with the last comment of Nathan.
Could you please kindly review what more is needed as we move forward 
with this patch?

Br,

G.G.

On 10/24/22 11:11 PM, Gwan-gyeong Mun wrote:
> From: Kees Cook <keescook@chromium.org>
> 
> Implement a robust overflows_type() macro to test if a variable or
> constant value would overflow another variable or type. This can be
> used as a constant expression for static_assert() (which requires a
> constant expression[1][2]) when used on constant values. This must be
> constructed manually, since __builtin_add_overflow() does not produce
> a constant expression[3].
> 
> Additionally adds castable_to_type(), similar to __same_type(), but for
> checking if a constant value would overflow if cast to a given type.
> 
> Add unit tests for overflows_type(), __same_type(), and castable_to_type()
> to the existing KUnit "overflow" test.
> 
> [1] https://en.cppreference.com/w/c/language/_Static_assert
> [2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
> [3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
>      6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
>      Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
> 
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Daniel Latypov <dlatypov@google.com>
> Cc: Vitor Massaru Iha <vitor@massaru.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v5: drop the cc-disable-warning and just disable the warning directly (Nathan)
> v4:
>   - move version v2 changelog commit message to under the --- marker (Mauro)
>   - remove the #pragma addition in the code and modify the Makefile to handle the
>     same feature (Jani)
> v3:
>   - chagne to use uintptr_t type when checking for overflow of pointer type
>     variable
> v2:
>   - fix comment typo
>   - wrap clang pragma to avoid GCC warnings
>   - style nit cleanups
>   - rename __castable_to_type() to castable_to_type()
>   - remove prior overflows_type() definition
> v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
> ---
>   drivers/gpu/drm/i915/i915_user_extensions.c |   2 +-
>   drivers/gpu/drm/i915/i915_utils.h           |   4 -
>   include/linux/compiler.h                    |   1 +
>   include/linux/overflow.h                    |  48 +++
>   lib/Makefile                                |   4 +
>   lib/overflow_kunit.c                        | 383 +++++++++++++++++++-
>   6 files changed, 436 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
> index c822d0aafd2d..e3f808372c47 100644
> --- a/drivers/gpu/drm/i915/i915_user_extensions.c
> +++ b/drivers/gpu/drm/i915/i915_user_extensions.c
> @@ -51,7 +51,7 @@ int i915_user_extensions(struct i915_user_extension __user *ext,
>   			return err;
>   
>   		if (get_user(next, &ext->next_extension) ||
> -		    overflows_type(next, ext))
> +		    overflows_type(next, uintptr_t))
>   			return -EFAULT;
>   
>   		ext = u64_to_user_ptr(next);
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 6c14d13364bf..67a66d4d5c70 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -111,10 +111,6 @@ bool i915_error_injected(void);
>   #define range_overflows_end_t(type, start, size, max) \
>   	range_overflows_end((type)(start), (type)(size), (type)(max))
>   
> -/* Note we don't consider signbits :| */
> -#define overflows_type(x, T) \
> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> -
>   #define ptr_mask_bits(ptr, n) ({					\
>   	unsigned long __v = (unsigned long)(ptr);			\
>   	(typeof(ptr))(__v & -BIT(n));					\
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 973a1bfd7ef5..947a60b801db 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -236,6 +236,7 @@ static inline void *offset_to_ptr(const int *off)
>    * bool and also pointer types.
>    */
>   #define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_unsigned_type(type) (!is_signed_type(type))
>   
>   /*
>    * This is needed in functions which generate the stack canary, see
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index 19dfdd74835e..58eb34aa2af9 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -127,6 +127,54 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>   	(*_d >> _to_shift) != _a);					\
>   }))
>   
> +#define __overflows_type_constexpr(x, T) (			\
> +	is_unsigned_type(typeof(x)) ?				\
> +		(x) > type_max(typeof(T)) ? 1 : 0		\
> +	: is_unsigned_type(typeof(T)) ?				\
> +		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
> +		: (x) < type_min(typeof(T)) ||			\
> +		  (x) > type_max(typeof(T)) ? 1 : 0)
> +
> +#define __overflows_type(x, T)		({	\
> +	typeof(T) v = 0;			\
> +	check_add_overflow((x), v, &v);		\
> +})
> +
> +/**
> + * overflows_type - helper for checking the overflows between value, variables,
> + *		    or data type
> + *
> + * @n: source constant value or variable to be checked
> + * @T: destination variable or data type proposed to store @x
> + *
> + * Compares the @x expression for whether or not it can safely fit in
> + * the storage of the type in @T. @x and @T can have different types.
> + * If @x is a constant expression, this will also resolve to a constant
> + * expression.
> + *
> + * Returns: true if overflow can occur, false otherwise.
> + */
> +#define overflows_type(n, T)					\
> +	__builtin_choose_expr(__is_constexpr(n),		\
> +			      __overflows_type_constexpr(n, T),	\
> +			      __overflows_type(n, T))
> +
> +/**
> + * castable_to_type - like __same_type(), but also allows for casted literals
> + *
> + * @n: variable or constant value
> + * @T: variable or data type
> + *
> + * Unlike the __same_type() macro, this allows a constant value as the
> + * first argument. If this value would not overflow into an assignment
> + * of the second argument's type, it returns true. Otherwise, this falls
> + * back to __same_type().
> + */
> +#define castable_to_type(n, T)						\
> +	__builtin_choose_expr(__is_constexpr(n),			\
> +			      !__overflows_type_constexpr(n, T),	\
> +			      __same_type(n, T))
> +
>   /**
>    * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
>    *
> diff --git a/lib/Makefile b/lib/Makefile
> index 161d6a724ff7..583daefe4ac1 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -376,6 +376,10 @@ obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
>   obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
>   obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
>   obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
> +# We're expecting to do a lot of "always true" or "always false" tests.
> +ifdef CONFIG_CC_IS_CLANG
> +CFLAGS_overflow_kunit.o += -Wno-tautological-constant-out-of-range-compare
> +endif
>   obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
>   CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
>   obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index 5369634701fa..edd3baf1fe6f 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -246,7 +246,7 @@ DEFINE_TEST_ARRAY(s64) = {
>   
>   #define DEFINE_TEST_FUNC_TYPED(n, t, fmt)				\
>   static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
> -{							   		\
> +{									\
>   	check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, add, "+", p->b, p->a, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, sub, "-", p->a, p->b, p->diff, p->d_of);	\
> @@ -708,6 +708,384 @@ static void overflow_size_helpers_test(struct kunit *test)
>   #undef check_one_size_helper
>   }
>   
> +static void overflows_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +	unsigned int var;
> +
> +#define __TEST_OVERFLOWS_TYPE(func, arg1, arg2, of)	do {		\
> +	bool __of = func(arg1, arg2);					\
> +	KUNIT_EXPECT_EQ_MSG(test, __of, of,				\
> +		"expected " #func "(" #arg1 ", " #arg2 " to%s overflow\n",\
> +		of ? "" : " not");					\
> +	count++;							\
> +} while (0)
> +
> +/* Args are: first type, second type, value, overflow expected */
> +#define TEST_OVERFLOWS_TYPE(__t1, __t2, v, of) do {			\
> +	__t1 t1 = (v);							\
> +	__t2 t2;							\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, t2, of);		\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, __t2, of);		\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);	\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
> +} while (0)
> +
> +	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
> +#endif
> +
> +	/* Check for macro side-effects. */
> +	var = INT_MAX - 1;
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
> +	var = INT_MAX - 1;
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
> +
> +	kunit_info(test, "%d overflows_type() tests finished\n", count);
> +#undef TEST_OVERFLOWS_TYPE
> +#undef __TEST_OVERFLOWS_TYPE
> +}
> +
> +static void same_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +	int var;
> +
> +#define TEST_SAME_TYPE(t1, t2, same)			do {	\
> +	typeof(t1) __t1h = type_max(t1);			\
> +	typeof(t1) __t1l = type_min(t1);			\
> +	typeof(t2) __t2h = type_max(t2);			\
> +	typeof(t2) __t2l = type_min(t2);			\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1h));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1l));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t1h, t1));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t1l, t1));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2h));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2l));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t2h, t2));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t2l, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1h));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1l));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t1h, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t1l, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2h));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2l));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t2h, t1));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t2l, t1));	\
> +} while (0)
> +
> +#if BITS_PER_LONG == 64
> +# define TEST_SAME_TYPE64(base, t, m)	TEST_SAME_TYPE(base, t, m)
> +#else
> +# define TEST_SAME_TYPE64(base, t, m)	do { } while (0)
> +#endif
> +
> +#define TEST_TYPE_SETS(base, mu8, mu16, mu32, ms8, ms16, ms32, mu64, ms64) \
> +do {									\
> +	TEST_SAME_TYPE(base,  u8,  mu8);				\
> +	TEST_SAME_TYPE(base, u16, mu16);				\
> +	TEST_SAME_TYPE(base, u32, mu32);				\
> +	TEST_SAME_TYPE(base,  s8,  ms8);				\
> +	TEST_SAME_TYPE(base, s16, ms16);				\
> +	TEST_SAME_TYPE(base, s32, ms32);				\
> +	TEST_SAME_TYPE64(base, u64, mu64);				\
> +	TEST_SAME_TYPE64(base, s64, ms64);				\
> +} while (0)
> +
> +	TEST_TYPE_SETS(u8,   true, false, false, false, false, false, false, false);
> +	TEST_TYPE_SETS(u16, false,  true, false, false, false, false, false, false);
> +	TEST_TYPE_SETS(u32, false, false,  true, false, false, false, false, false);
> +	TEST_TYPE_SETS(s8,  false, false, false,  true, false, false, false, false);
> +	TEST_TYPE_SETS(s16, false, false, false, false,  true, false, false, false);
> +	TEST_TYPE_SETS(s32, false, false, false, false, false,  true, false, false);
> +#if BITS_PER_LONG == 64
> +	TEST_TYPE_SETS(u64, false, false, false, false, false, false,  true, false);
> +	TEST_TYPE_SETS(s64, false, false, false, false, false, false, false,  true);
> +#endif
> +
> +	/* Check for macro side-effects. */
> +	var = 4;
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(var++, int));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(int, var++));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(var++, var++));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +
> +	kunit_info(test, "%d __same_type() tests finished\n", count);
> +
> +#undef TEST_TYPE_SETS
> +#undef TEST_SAME_TYPE64
> +#undef TEST_SAME_TYPE
> +}
> +
> +static void castable_to_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +
> +#define TEST_CASTABLE_TO_TYPE(arg1, arg2, pass)	do {	\
> +	bool __pass = castable_to_type(arg1, arg2);		\
> +	KUNIT_EXPECT_EQ_MSG(test, __pass, pass,			\
> +		"expected castable_to_type(" #arg1 ", " #arg2 ") to%s pass\n",\
> +		pass ? "" : " not");				\
> +	count++;						\
> +} while (0)
> +
> +	TEST_CASTABLE_TO_TYPE(16, u8, true);
> +	TEST_CASTABLE_TO_TYPE(16, u16, true);
> +	TEST_CASTABLE_TO_TYPE(16, u32, true);
> +	TEST_CASTABLE_TO_TYPE(16, s8, true);
> +	TEST_CASTABLE_TO_TYPE(16, s16, true);
> +	TEST_CASTABLE_TO_TYPE(16, s32, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s8, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s16, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s32, true);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE(16, u64, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s64, true);
> +#endif
> +
> +#define TEST_CASTABLE_TO_TYPE_VAR(width)	do {				\
> +	u ## width u ## width ## var = 0;					\
> +	s ## width s ## width ## var = 0;					\
> +										\
> +	/* Constant expressions that fit types. */				\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), s ## width ## var, true);	\
> +	/* Constant expressions that do not fit types. */			\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width ## var, false);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width ## var, false);	\
> +	/* Non-constant expression with mismatched type. */			\
> +	TEST_CASTABLE_TO_TYPE(s ## width ## var, u ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(u ## width ## var, s ## width, false);		\
> +} while (0)
> +
> +#define TEST_CASTABLE_TO_TYPE_RANGE(width)	do {				\
> +	unsigned long big = U ## width ## _MAX;					\
> +	signed long small = S ## width ## _MIN;					\
> +	u ## width u ## width ## var = 0;					\
> +	s ## width s ## width ## var = 0;					\
> +										\
> +	/* Constant expression in range. */					\
> +	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width ## var, true);	\
> +	/* Constant expression out of range. */					\
> +	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width, false); \
> +	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width ## var, false); \
> +	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width, false); \
> +	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width ## var, false); \
> +	/* Non-constant expression with mismatched type. */			\
> +	TEST_CASTABLE_TO_TYPE(big, u ## width, false);				\
> +	TEST_CASTABLE_TO_TYPE(big, u ## width ## var, false);			\
> +	TEST_CASTABLE_TO_TYPE(small, s ## width, false);			\
> +	TEST_CASTABLE_TO_TYPE(small, s ## width ## var, false);			\
> +} while (0)
> +
> +	TEST_CASTABLE_TO_TYPE_VAR(8);
> +	TEST_CASTABLE_TO_TYPE_VAR(16);
> +	TEST_CASTABLE_TO_TYPE_VAR(32);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE_VAR(64);
> +#endif
> +
> +	TEST_CASTABLE_TO_TYPE_RANGE(8);
> +	TEST_CASTABLE_TO_TYPE_RANGE(16);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE_RANGE(32);
> +#endif
> +	kunit_info(test, "%d castable_to_type() tests finished\n", count);
> +
> +#undef TEST_CASTABLE_TO_TYPE_RANGE
> +#undef TEST_CASTABLE_TO_TYPE_VAR
> +#undef TEST_CASTABLE_TO_TYPE
> +}
> +
>   static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(u8_u8__u8_overflow_test),
>   	KUNIT_CASE(s8_s8__s8_overflow_test),
> @@ -730,6 +1108,9 @@ static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(shift_nonsense_test),
>   	KUNIT_CASE(overflow_allocation_test),
>   	KUNIT_CASE(overflow_size_helpers_test),
> +	KUNIT_CASE(overflows_type_test),
> +	KUNIT_CASE(same_type_test),
> +	KUNIT_CASE(castable_to_type_test),
>   	{}
>   };
>   
