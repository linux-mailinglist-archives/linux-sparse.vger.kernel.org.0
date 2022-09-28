Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3A55ED789
	for <lists+linux-sparse@lfdr.de>; Wed, 28 Sep 2022 10:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbiI1IUP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 28 Sep 2022 04:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbiI1IUN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 28 Sep 2022 04:20:13 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EBD32071;
        Wed, 28 Sep 2022 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664353209; x=1695889209;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=04Wkn0qZogA2Q87sjtXUMOOBb5lQPanQ7LsMLt0KRaA=;
  b=Vbv9cL+pOjvIrT7Nw6tvYHlsXY/DCesl/qdgQW6buSfq/qYAs9M0eBYm
   sSZEsn10f1NrFvBnS29INqZQYB5+ueaIv1gh/CiKOP+lB427MJwOrfsB5
   AFkx6hnmzvtzdzHCZwpiAlopFWNrzaa2bbz2q7MzYXghs32yeb/WaL0DG
   PKZg7DoeXVCz1BDi2fJ/pBVIzoGWdmNcCtjDS1OBrO/UoxOOxGxfwABBp
   K4osaYUPF8XPfzHZoYr+Vy1zLLRmPpdrbeARjDlf14CnUCEKjL5yQjNTH
   QlevslJKx61Vs46nsS/BEDr0lsY0OGs6ydwdplSOcVAIMZjgmnzrlAcJ2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302452394"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="302452394"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 01:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="866886125"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="866886125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2022 01:20:07 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 01:20:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 01:20:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 01:20:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 01:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqLoEjEVGb1BRNyO2Ll95G+dgPqEhnkIzzxoS5skh38i5REVPNwoU3bY7mQtdpc7yjLe6t4M5w6ecr/oRclNSOh7csvVyIxwGgQ3bvS7hw7ZmZTgumyAedxFjHpJ12wN6dZa4jLlqiLym2QX+cnt5DwzQ/H2u9qiUJlKG/8Dht5KKXvZELFNi2qnxFVTaL34MmJfbDYxlT4dNUq0CGGBX+Bv1VZ2ZUG3CA3kSpesrLUVMwKBuCfmJgM/aHjFUAg6wWQXl8vcsRG7QfNThSKNU8tMj03P022QieJODjuZGgqH1sDvQHRwX0XfAoFJy0rtTa9oc1TGF8O2FnDSR4YN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYmbrWHGUPKCplZzEkoFMNhgtNym4S9Hw7S5vRKjbUs=;
 b=hSA/6yykFBEZ5Jw4oO+iD0x7RR9qchaGmgQAp3cNpAjocF151FQjhTSgtVTj7azvdIjvTeCBiayjAvttQL5f53uHJwaU/Av+YJs0IS9/seu8O/YReGqj4v2ohhLoKEMntD3PmyEcyT7uvI9Gm75hV21I8gks6u2DfWmrnG4pcIKzQKT0EMEykv3rMyHEjvoqWxivcDPnTMO9ZoqJ/91crFNBwY6U1e+DQAYEJS5N+WBhGVUiIpyC6ZDSG2GVFytQLw6FiwCScUjzh5jAUoXa3yzxPJ0VMNrEZB4egJstCVW4pdPE6oQXhcZEi/aE1smzFRl/g4zQQ6eq1KryAqDQ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SA2PR11MB5035.namprd11.prod.outlook.com (2603:10b6:806:116::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 08:19:58 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5654.025; Wed, 28 Sep 2022
 08:19:57 +0000
Message-ID: <8830dd87-222d-a680-6615-3a63b97cdb3e@intel.com>
Date:   Wed, 28 Sep 2022 11:19:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] overflow: Introduce overflows_type() and
 castable_to_type()
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>
CC:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Daniel Latypov <dlatypov@google.com>,
        Vitor Massaru Iha <vitor@massaru.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        <linux-hardening@vger.kernel.org>, <llvm@lists.linux.dev>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-sparse@vger.kernel.org>
References: <20220926191109.1803094-1-keescook@chromium.org>
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220926191109.1803094-1-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SA2PR11MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 765604f5-7648-4cbd-710d-08daa12a3af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bkj7HrtjvtO/ZsJ/PrK4vG5SuHvvtAQX1hxcLxvHReP4I6GjIogQ8d8EeI/Xi7jKMsg9RoLmX2iYnQZX29SN5Sib5P4crbd9Wm1Av2WcGqzelIuLp0BrP8MNjMU/vXbSSnjR/z1PbrMIAvnNoArPzso7gCwIylPHDFM5CR3S5UllpNIB1+i/u2bAuKljdXLWV//afcitEclLqvcB3TfQ6T14f4MdHbKMF6qEQBEIg1VeoDYCu45s3L6CPawzPGoONT3RFCMqVVnDRT5wQQnQ1pvDTczyAqMH4xAXxJ+jAvi/sK2c4wqyjTSIMdi7P1Ec1QpFLTfer9yW2b1n/6A/yvPy3VPquSEIMeTOZAcSJ7x9mQdLM3xHXohCb6OqaN7zpM83XCtszy6rxTjgTh0mzz/s8WcJzlI3roCBPO5NcvfD7BZpCxNtSYuVb6awcu5SwnWLgtAWWoCnhH32WuFhjCsoAbcGs+vGZQ6sGQB4exYyaSFS8o6+dsLOpuCi501GGa5hNPRwIHu7jH4Drn28RxYpzXnzhlg6GN2VZyvqF7iAVq+e0diNDzsvUadtw79EhgiKC9QT6v2irHTIomu+ppfUX4iBqIc2f1QK0DvXz4H2BgLkOx4/IQNF4v0hxvH0na2QMIpt0Rk3qshivuSFv3OdSkGuS4xgz7IAq50hxuVt7ueVCX4i64XYqVquJ4SFh3QhQOTJU8PkEKInegoABMpc+xTH6fENWqMa48lsHpiR7N28trW7FoDfypwKatKrOQoB1uFXleZs9xVGpVZ0dKPfKmI5QHZFsJ3J17jhmFahYFvdqIGYOYwSo0UelGfvPMjjVYVfXAc3PjV6rb0YDp4d0p0Re5VUxEeP9pCRMGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(30864003)(6486002)(966005)(478600001)(6666004)(7416002)(5660300002)(2616005)(31696002)(6512007)(8936002)(86362001)(316002)(53546011)(6506007)(82960400001)(36756003)(6916009)(186003)(26005)(54906003)(66476007)(66946007)(4326008)(38100700002)(66556008)(31686004)(41300700001)(2906002)(8676002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzVQT1hCMUV0b296bytybmVjV01Yd1BNdGxlcEFVM3pTZ3V0NkF1THVtZjIz?=
 =?utf-8?B?S1pzWUQ5SGNiMDdTRERSNUl4M3pRWW9CVDA4VFloaUZGYlg2QjVqanNSbW54?=
 =?utf-8?B?VnhKRURQREYxRzNYcWxzVzFQR2tNY25uVmVaODBOOUxzdUxkMUdOeldFTzlp?=
 =?utf-8?B?cUxJU09Pck82WGdGb3pPUEF1NFJ2cjJrNlZiUkFGY1JWSTN3ZDBCRFN2OGJY?=
 =?utf-8?B?YTBEb1lqOUE5djFaS0lJR2U5aC9Lb3FHT01OTU52aDdMQUVMb040UGpVNUli?=
 =?utf-8?B?MGs4WXptZ2lzNmJBaDFNVjVzc2dITDVyQkxSdFNZVnlWODZIUE1KTkVXSlJs?=
 =?utf-8?B?LzVoNk9wOGt0b1V5Q0JBWnBVQmVRdmlybERvazVxZURRVVU0dUphSERhSk1k?=
 =?utf-8?B?ZWJ3Wk9aVkszU0Z4aGU0ekFGdXRRSEFxR0dsUDFWYlFNMmc4WGVVN0dpQ2FB?=
 =?utf-8?B?b2RZWXBGTCthTkVZbzE0RTcwQUZzdGE1VkkzSXBLbFF0cEZMdFYxRFJOZFpn?=
 =?utf-8?B?cXFmRTVPdVZodk9UZEk5OW5TN2lsWTZuUnJ0cEl2ZGdOcE5iWUlqNWZUS0t4?=
 =?utf-8?B?VVBMMnlDSHkzbXRsNjJraGMyYmRScGFkcHo5N2U3aGhHMFBNdytJdVhsNy9L?=
 =?utf-8?B?ZEZhRzI2SHJ1SlhFckljd3lqODBHMjdJZzBmVWloWm91NlNWSUZYdTRYKzlC?=
 =?utf-8?B?dllrU0ltL3JNOG05TExUbWYzbE9qNFNlZ3I3UDZkSkZJVlBsRnFmZStXS0hk?=
 =?utf-8?B?M3JSZDB0ZVVDSkFtZWRvSzhEdjk3SnJ4ZXZ6WktaZDJsYmtkd0Fid2ZPZVo4?=
 =?utf-8?B?OWwvQ25SeEsySEcxS0E2RHRESEM3Sisza3hSOTV0bUR0VUtCRlE4Tk84ZnAv?=
 =?utf-8?B?MGxrZE50cFVhWmtCOXZiK0ZHT1dEVUNTN1V0NUFpWDEyS0J0OW0xNW1TVU5Q?=
 =?utf-8?B?L0pwYnI0bjEwTHpGOUNRRGlsWXVsczlqSWc1Unp3T0R1RzVvNTZSOHZGbE5E?=
 =?utf-8?B?MnM0WXcxVkJtckZvclZzeThIdWNpNTVZbXk5MHp3andUZXltUDJJakh0dzFt?=
 =?utf-8?B?dHRnbDVyR1JzbjcrNTltWVA4dXpKQzBpNXVXOVZvTmswRk56TTFxQjNBc0Nx?=
 =?utf-8?B?b1hFTkdacFY3YWpVMTdzaE90S2VBTEdrc3NnV2NkckNmRGlxcC80c1ZPazU3?=
 =?utf-8?B?RjgrTEVkOXZmVVVneC8vNkwzcVBUY1A3YUwrdWEwVVg4RU9XNzVkWWNrMndz?=
 =?utf-8?B?QVZ5TDBFUXlJKzdCUkdZTEVMMTR1Skx5VGNGbWgzcFE0RjFDazB4Y3N4SmI0?=
 =?utf-8?B?WXdJL2NYVFk2MlA2dkN3eWp0azJBQlAvd3BhL0RBZmtBNXZqcnlkakJzRHpu?=
 =?utf-8?B?a24yTjZ5aGNUQVFSREFlU2x5RVFvazVOaU9iR0JINXRZb0JtaTBHWVNObit4?=
 =?utf-8?B?b2dWczZTeEIvdGR4dmxIdnZzWVF5SEprdGNWUjJNWXQzYXZ3bGxpeXVnM0RH?=
 =?utf-8?B?WUMvc1JFVS9UN2wzNm5idTQzdzZoa1lVeUlxT3VFNTR1RkVPWjZuOXpMalpM?=
 =?utf-8?B?MVI0TkY5M1ViUkFYTnhoRW5rc0M3MzBrS1R4TFk2LzR2SGROZ2UweTA1Tk1v?=
 =?utf-8?B?Mk1ydDFNdzNhSm83dXhFODN5MDFjbTZrSWxhYjYxQnQvVnYxQ2tqaHM3Y1pI?=
 =?utf-8?B?NUZTc0hxWlVoS0dxWGpjenJHUHJ5ZmpYOTJFNzdXbmxRY1dYWkhHSnlzdjRN?=
 =?utf-8?B?VDI2ZFYxSVdzNUFhZVZEeTNPNzJ5dC9zdUc2MkdhaHlnQmtoaUlZekUyOXZZ?=
 =?utf-8?B?dXRWR0ExTzUvbVZNampWUTRIN2xzK2RFblIrSkVTTEZRalE0eiswa0hwdXdP?=
 =?utf-8?B?MVJpd0UrK09Denk0UGRhQ0l3VXE3UHlTckM0RUNTck9HOUoxS29SaklMWlh5?=
 =?utf-8?B?a2FoTThlWmNabzdFM1BENFBiOEdqTXlMN3BEYXJNWVc3eVE3d0gxc1FaOURS?=
 =?utf-8?B?S3BwbStSVmorcDdqbExhZEN5d2JjRnRkWVBuZ05relU4QzAxMk1TZjkvU3lS?=
 =?utf-8?B?L3d5WUZ6NW9kbTVlSUhFU0xOV25QM0k5bUYvQ0xxWllNTzVUQXZyU2lUdTVU?=
 =?utf-8?B?SXJ1U2lZRVVqbHhLRkhya2R2Sk5Pc2pXVkZsM2pxSmdtS3hpclZjVmN6YzJk?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 765604f5-7648-4cbd-710d-08daa12a3af4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 08:19:57.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W3vga1ytzyBumohtYaY9XQuBBuJ1ABqkri8zNPZ/lj8b/8le5mlmdh3XK8iwnpcmeOMaLgTrKFdTQ5g+0K99qcNQqvdYJIImGIMWWvHig4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5035
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi Kees,

To check the intel-gfx ci results and test results from other mailing 
lists, I have rebased this patch and included it in this series [1].

[1] https://patchwork.freedesktop.org/series/109169/

G.G

On 9/26/22 10:11 PM, Kees Cook wrote:
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
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2:
>   - fix comment typo
>   - wrap clang pragma to avoid GCC warnings
>   - style nit cleanups
>   - rename __castable_to_type() to castable_to_type()
>   - remove prior overflows_type() definition
> v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
> ---
>   drivers/gpu/drm/i915/i915_utils.h |   4 -
>   include/linux/compiler.h          |   1 +
>   include/linux/overflow.h          |  48 ++++
>   lib/overflow_kunit.c              | 388 +++++++++++++++++++++++++++++-
>   4 files changed, 436 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..d14b7faee054 100644
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
> index 7713d7bcdaea..c631107e93b1 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -244,6 +244,7 @@ static inline void *offset_to_ptr(const int *off)
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
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index f385ca652b74..fffc3f86181d 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -16,6 +16,11 @@
>   #include <linux/types.h>
>   #include <linux/vmalloc.h>
>   
> +/* We're expecting to do a lot of "always true" or "always false" tests. */
> +#ifdef CONFIG_CC_IS_CLANG
> +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> +#endif
> +
>   #define DEFINE_TEST_ARRAY_TYPED(t1, t2, t)			\
>   	static const struct test_ ## t1 ## _ ## t2 ## __ ## t {	\
>   		t1 a;						\
> @@ -246,7 +251,7 @@ DEFINE_TEST_ARRAY(s64) = {
>   
>   #define DEFINE_TEST_FUNC_TYPED(n, t, fmt)				\
>   static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
> -{							   		\
> +{									\
>   	check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, add, "+", p->b, p->a, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, sub, "-", p->a, p->b, p->diff, p->d_of);	\
> @@ -708,6 +713,384 @@ static void overflow_size_helpers_test(struct kunit *test)
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
> @@ -730,6 +1113,9 @@ static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(shift_nonsense_test),
>   	KUNIT_CASE(overflow_allocation_test),
>   	KUNIT_CASE(overflow_size_helpers_test),
> +	KUNIT_CASE(overflows_type_test),
> +	KUNIT_CASE(same_type_test),
> +	KUNIT_CASE(castable_to_type_test),
>   	{}
>   };
>   
