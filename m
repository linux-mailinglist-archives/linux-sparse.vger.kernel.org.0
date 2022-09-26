Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042F15EAD10
	for <lists+linux-sparse@lfdr.de>; Mon, 26 Sep 2022 18:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiIZQs5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 26 Sep 2022 12:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiIZQry (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 26 Sep 2022 12:47:54 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB0180F59;
        Mon, 26 Sep 2022 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664206867; x=1695742867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=08oKMcxxiTXt48DizpMHtSAF1zSfLPxCAGRIMbMjaVY=;
  b=OMwtYKBE4csQSw08vIQfv/nfkmENZKLuqJ3DGfmIKHzhfPP0mw5RhDHV
   8vq8kha0dNXkBJFkvxBJQf0jV1vSMNg9jNB2JfrDnKwzzudJ0z/gFHHF3
   vZBOOzoqWptCL7JiMyn8kCi4Zoxs+Tz6tsorSqLObQr0Fas4rnN2U3M4k
   qLGfmvW3gEiFwnYtoWNGkfO80j9QWrJbTK0sCcQ2fioLkbuty8Q9Lh2iX
   hFsRxrupkMdAoJXDufr/6/Ndq8XGv4e6W/4BCq6Swf9LghnBnfiazqfN+
   j0pqN+PknQM6FfBU3EcbF1sxzsBfJRlFlrsLJY70GGwLRBGd/3Idn1Z7R
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="288199474"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="288199474"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 08:41:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763481011"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="763481011"
Received: from bsochack-mobl2.ger.corp.intel.com (HELO paris.ger.corp.intel.com) ([10.249.128.215])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 08:40:58 -0700
From:   Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mchehab@kernel.org, chris@chris-wilson.co.uk,
        matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
        jani.nikula@intel.com, nirmoy.das@intel.com, airlied@redhat.com,
        daniel@ffwll.ch, andi.shyti@linux.intel.com,
        andrzej.hajda@intel.com, keescook@chromium.org,
        mauro.chehab@linux.intel.com, linux@rasmusvillemoes.dk,
        vitor@massaru.org, dlatypov@google.com, ndesaulniers@google.com,
        trix@redhat.com, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org, linux-sparse@vger.kernel.org,
        nathan@kernel.org, gustavoars@kernel.org,
        luc.vanoostenryck@gmail.com
Subject: [PATCH v12 6/9] drm/i915: Check for integer truncation on the configuration of ttm place
Date:   Mon, 26 Sep 2022 18:39:50 +0300
Message-Id: <20220926153953.3836470-7-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
References: <20220926153953.3836470-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

There is an impedance mismatch between the first/last valid page
frame number of ttm place in unsigned and our memory/page accounting in
unsigned long.
As the object size is under the control of userspace, we have to be prudent
and catch the conversion errors.
To catch the implicit truncation as we switch from unsigned long to
unsigned, we use overflows_type check and report E2BIG or overflow_type
prior to the operation.

v3: Not to change execution inside a macro. (Mauro)
    Add safe_conversion_gem_bug_on() macro and remove temporal
    SAFE_CONVERSION() macro.
v4: Fix unhandled GEM_BUG_ON() macro call from safe_conversion_gem_bug_on()
v6: Fix to follow general use case for GEM_BUG_ON(). (Jani)
v7: Fix to use WARN_ON() macro where GEM_BUG_ON() macro was used. (Jani)
v8: Replace safe_conversion() with check_assign() (Kees)

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> (v2)
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v3)
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> (v5)
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
 drivers/gpu/drm/i915/intel_region_ttm.c | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index bf99d1f02bd9..e6bbc0f8b7e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -140,14 +140,14 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		place->fpfn = offset >> PAGE_SHIFT;
-		place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
+		WARN_ON(check_assign(offset >> PAGE_SHIFT, &place->fpfn));
+		WARN_ON(check_assign(place->fpfn + (size >> PAGE_SHIFT), &place->lpfn));
 	} else if (mr->io_size && mr->io_size < mr->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place->flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
 			place->fpfn = 0;
-			place->lpfn = mr->io_size >> PAGE_SHIFT;
+			WARN_ON(check_assign(mr->io_size >> PAGE_SHIFT, &place->lpfn));
 		}
 	}
 }
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 575d67bc6ffe..37a964b20b36 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -209,14 +209,23 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		place.fpfn = offset >> PAGE_SHIFT;
-		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
+		if (WARN_ON(check_assign(offset >> PAGE_SHIFT, &place.fpfn))) {
+			ret = -E2BIG;
+			goto out;
+		}
+		if (WARN_ON(check_assign(place.fpfn + (size >> PAGE_SHIFT), &place.lpfn))) {
+			ret = -E2BIG;
+			goto out;
+		}
 	} else if (mem->io_size && mem->io_size < mem->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
 			place.fpfn = 0;
-			place.lpfn = mem->io_size >> PAGE_SHIFT;
+			if (WARN_ON(check_assign(mem->io_size >> PAGE_SHIFT, &place.lpfn))) {
+				ret = -E2BIG;
+				goto out;
+			}
 		}
 	}
 
@@ -224,6 +233,8 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	mock_bo.bdev = &mem->i915->bdev;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
+
+out:
 	if (ret == -ENOSPC)
 		ret = -ENXIO;
 	if (!ret)
-- 
2.37.1

