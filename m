Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28FBB5EB0F6
	for <lists+linux-sparse@lfdr.de>; Mon, 26 Sep 2022 21:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiIZTLR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 26 Sep 2022 15:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiIZTLQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 26 Sep 2022 15:11:16 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD02F7B1D1
        for <linux-sparse@vger.kernel.org>; Mon, 26 Sep 2022 12:11:12 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so13439806pjq.3
        for <linux-sparse@vger.kernel.org>; Mon, 26 Sep 2022 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=t0CfCoZqMGHjpwAIdJA1QP0G4eln/PQ4u1Lhg2kh+P8=;
        b=ZMjPeBN4gxWG5u3/aa/mxPmuEieRccWNlGNcEQAwF3i+nJOkd2vPCexg+9kG0aFyHe
         B20Qndr3PupebMoqQ3u++H9YArzaWICstuh2CRPt2ucWLgrSYASemROOU2humxTeTK4Q
         u1jKqPoqk2QnSVqH5IctQ9oqoCRSa2EEBwmls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=t0CfCoZqMGHjpwAIdJA1QP0G4eln/PQ4u1Lhg2kh+P8=;
        b=P6Pd/B0w0dQH1kwKR2BeDdBUfBP+e+bqs+vGfI7gMNpYAT0up7aZJHwu+Z5Z1Io+bS
         wLo1mzpnlX6P94HndZQ6UfuAK7BET8HOAbCESScgQ6VOapDTlJRdxVBWfOKi3PD1QkBJ
         0tRJAjuCLoJpSFJrMmeEOE4bTfwhff3ND2WM4tYf7RMHGC8e5rmreHB9JmTy28KSkAXQ
         7/49RKNvJfpyG9j+ZQrnFlkvQ4fqMUy9xJ3ro65GvEDwE8nE593JdmCrhfbwjl6nsUUr
         7RqrOFU8TMoC4FAqr97jxgoByy3+b7O57eak2VGcYgtXm+HTh2rdfWz3taeqWqbLffz3
         3WRw==
X-Gm-Message-State: ACrzQf2IPa8Lpg6JSaNnUFCfyDf3xmACBHGUJh17ud8bd3ZkEOr6lDnO
        5ZMOiCgVtF54HtgTphbnICD62g==
X-Google-Smtp-Source: AMsMyM5jfIId8O7l/si7yraVXZJS0LWZx8kdixNZvxHWXvLV5Ynwjjmwz1GPSZ49podHVTwBy/mxcw==
X-Received: by 2002:a17:90b:3a8e:b0:200:5585:4099 with SMTP id om14-20020a17090b3a8e00b0020055854099mr295386pjb.70.1664219471903;
        Mon, 26 Sep 2022 12:11:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b00176d8e33601sm11636791plg.203.2022.09.26.12.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 12:11:11 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Daniel Latypov <dlatypov@google.com>,
        Vitor Massaru Iha <vitor@massaru.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-sparse@vger.kernel.org
Subject: [PATCH v2] overflow: Introduce overflows_type() and castable_to_type()
Date:   Mon, 26 Sep 2022 12:11:09 -0700
Message-Id: <20220926191109.1803094-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=23674; h=from:subject; bh=u4b5EhRKbhmHqO3PVH0GCid/8a3LBtAJqtetUQD9A9o=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjMflMZnd4MG9qc67tbwKA7UMW1dlOcV6gGArXWHiv HuR8LT+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYzH5TAAKCRCJcvTf3G3AJqSED/ 4lGU7cgF8nOvpdNUnxaGn5z4Dl1DuAKLABHro1hKFsfMRHrO+oLZnHpcyt0CMOKkosiZiAcr511fBo jzut1rpzQYv/lOUZf9+VyDQlhSvttsAEXtbve6EcudJf9CL1Xklc8HM9SqHQgrjZv1U2K+vx/0Nbl5 /EZQhS27TMqvd9nCp5PYfw+N6sMbXrpePZz56OaRN6RAQinzqlziy7xhSnXF8IGMsrk+nSbgv0/r1C Ypr/RRYlUP80sPXwxGeXd51mG4f3FjaxLfPoptK4/u3plDgbC/74KbGzX8lAK3qz3McscFKdGPjP7W 9Ltuw4Y0ywYpCYFqKFjfq/CWrO0BTGQCV4zahux1Tf4KGJMkJVMxTh3+z3cnTYI1N8bwJ0ogRZ41ta XNJM0htNqmhrfjmEfW8RNHISdVu6t+xjL1pMeVIRAnsBTrwdRbJFPXM2pcYWiy/2xg7pyNGj/tn/jI 2VWjtN3jEG9b7t9+OzjE9Nw3mqBIEo7rv8lf21M1T/J6R3WZ/+Yh2mVQXedQ6OQWH3Fji5EcNtLvzU EMVHnYV7rAM7Vc5BVxxTSEQKM8CBvtMn/mW9HNtRzT2pMWyj8z4ruFel/mBfLOttfNxRk1vMeYEiP/ oVY0BGy9preiY8ipVi0JMSqqGuwAqiI5+eSgfHf8cjVPggY0laI8GTP0mfvQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Implement a robust overflows_type() macro to test if a variable or
constant value would overflow another variable or type. This can be
used as a constant expression for static_assert() (which requires a
constant expression[1][2]) when used on constant values. This must be
constructed manually, since __builtin_add_overflow() does not produce
a constant expression[3].

Additionally adds castable_to_type(), similar to __same_type(), but for
checking if a constant value would overflow if cast to a given type.

Add unit tests for overflows_type(), __same_type(), and castable_to_type()
to the existing KUnit "overflow" test.

[1] https://en.cppreference.com/w/c/language/_Static_assert
[2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
[3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
    6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
    Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,

Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: Daniel Latypov <dlatypov@google.com>
Cc: Vitor Massaru Iha <vitor@massaru.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2:
 - fix comment typo
 - wrap clang pragma to avoid GCC warnings
 - style nit cleanups
 - rename __castable_to_type() to castable_to_type()
 - remove prior overflows_type() definition
v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
---
 drivers/gpu/drm/i915/i915_utils.h |   4 -
 include/linux/compiler.h          |   1 +
 include/linux/overflow.h          |  48 ++++
 lib/overflow_kunit.c              | 388 +++++++++++++++++++++++++++++-
 4 files changed, 436 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index c10d68cdc3ca..d14b7faee054 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -111,10 +111,6 @@ bool i915_error_injected(void);
 #define range_overflows_end_t(type, start, size, max) \
 	range_overflows_end((type)(start), (type)(size), (type)(max))
 
-/* Note we don't consider signbits :| */
-#define overflows_type(x, T) \
-	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
-
 #define ptr_mask_bits(ptr, n) ({					\
 	unsigned long __v = (unsigned long)(ptr);			\
 	(typeof(ptr))(__v & -BIT(n));					\
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 7713d7bcdaea..c631107e93b1 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -244,6 +244,7 @@ static inline void *offset_to_ptr(const int *off)
  * bool and also pointer types.
  */
 #define is_signed_type(type) (((type)(-1)) < (__force type)1)
+#define is_unsigned_type(type) (!is_signed_type(type))
 
 /*
  * This is needed in functions which generate the stack canary, see
diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 19dfdd74835e..58eb34aa2af9 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -127,6 +127,54 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 	(*_d >> _to_shift) != _a);					\
 }))
 
+#define __overflows_type_constexpr(x, T) (			\
+	is_unsigned_type(typeof(x)) ?				\
+		(x) > type_max(typeof(T)) ? 1 : 0		\
+	: is_unsigned_type(typeof(T)) ?				\
+		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
+		: (x) < type_min(typeof(T)) ||			\
+		  (x) > type_max(typeof(T)) ? 1 : 0)
+
+#define __overflows_type(x, T)		({	\
+	typeof(T) v = 0;			\
+	check_add_overflow((x), v, &v);		\
+})
+
+/**
+ * overflows_type - helper for checking the overflows between value, variables,
+ *		    or data type
+ *
+ * @n: source constant value or variable to be checked
+ * @T: destination variable or data type proposed to store @x
+ *
+ * Compares the @x expression for whether or not it can safely fit in
+ * the storage of the type in @T. @x and @T can have different types.
+ * If @x is a constant expression, this will also resolve to a constant
+ * expression.
+ *
+ * Returns: true if overflow can occur, false otherwise.
+ */
+#define overflows_type(n, T)					\
+	__builtin_choose_expr(__is_constexpr(n),		\
+			      __overflows_type_constexpr(n, T),	\
+			      __overflows_type(n, T))
+
+/**
+ * castable_to_type - like __same_type(), but also allows for casted literals
+ *
+ * @n: variable or constant value
+ * @T: variable or data type
+ *
+ * Unlike the __same_type() macro, this allows a constant value as the
+ * first argument. If this value would not overflow into an assignment
+ * of the second argument's type, it returns true. Otherwise, this falls
+ * back to __same_type().
+ */
+#define castable_to_type(n, T)						\
+	__builtin_choose_expr(__is_constexpr(n),			\
+			      !__overflows_type_constexpr(n, T),	\
+			      __same_type(n, T))
+
 /**
  * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
  *
diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
index f385ca652b74..fffc3f86181d 100644
--- a/lib/overflow_kunit.c
+++ b/lib/overflow_kunit.c
@@ -16,6 +16,11 @@
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 
+/* We're expecting to do a lot of "always true" or "always false" tests. */
+#ifdef CONFIG_CC_IS_CLANG
+#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
+#endif
+
 #define DEFINE_TEST_ARRAY_TYPED(t1, t2, t)			\
 	static const struct test_ ## t1 ## _ ## t2 ## __ ## t {	\
 		t1 a;						\
@@ -246,7 +251,7 @@ DEFINE_TEST_ARRAY(s64) = {
 
 #define DEFINE_TEST_FUNC_TYPED(n, t, fmt)				\
 static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
-{							   		\
+{									\
 	check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);	\
 	check_one_op(t, fmt, add, "+", p->b, p->a, p->sum, p->s_of);	\
 	check_one_op(t, fmt, sub, "-", p->a, p->b, p->diff, p->d_of);	\
@@ -708,6 +713,384 @@ static void overflow_size_helpers_test(struct kunit *test)
 #undef check_one_size_helper
 }
 
+static void overflows_type_test(struct kunit *test)
+{
+	int count = 0;
+	unsigned int var;
+
+#define __TEST_OVERFLOWS_TYPE(func, arg1, arg2, of)	do {		\
+	bool __of = func(arg1, arg2);					\
+	KUNIT_EXPECT_EQ_MSG(test, __of, of,				\
+		"expected " #func "(" #arg1 ", " #arg2 " to%s overflow\n",\
+		of ? "" : " not");					\
+	count++;							\
+} while (0)
+
+/* Args are: first type, second type, value, overflow expected */
+#define TEST_OVERFLOWS_TYPE(__t1, __t2, v, of) do {			\
+	__t1 t1 = (v);							\
+	__t2 t2;							\
+	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, t2, of);		\
+	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, __t2, of);		\
+	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);	\
+	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
+} while (0)
+
+	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
+	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
+	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
+	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
+#endif
+	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
+	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
+	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
+	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
+	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
+	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
+#endif
+	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
+	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
+	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
+	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
+#endif
+	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
+#endif
+	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
+	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
+	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
+#if BITS_PER_LONG == 64
+	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
+	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
+	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
+	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
+	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
+	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
+	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
+	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
+	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
+	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
+	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
+	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
+#endif
+
+	/* Check for macro side-effects. */
+	var = INT_MAX - 1;
+	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
+	var = INT_MAX - 1;
+	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
+	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
+
+	kunit_info(test, "%d overflows_type() tests finished\n", count);
+#undef TEST_OVERFLOWS_TYPE
+#undef __TEST_OVERFLOWS_TYPE
+}
+
+static void same_type_test(struct kunit *test)
+{
+	int count = 0;
+	int var;
+
+#define TEST_SAME_TYPE(t1, t2, same)			do {	\
+	typeof(t1) __t1h = type_max(t1);			\
+	typeof(t1) __t1l = type_min(t1);			\
+	typeof(t2) __t2h = type_max(t2);			\
+	typeof(t2) __t2l = type_min(t2);			\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1h));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1l));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t1h, t1));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t1l, t1));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2h));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2l));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t2h, t2));	\
+	KUNIT_EXPECT_EQ(test, true, __same_type(__t2l, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t1, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1h));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1l));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t1h, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t1l, t2));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2h));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2l));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t2h, t1));	\
+	KUNIT_EXPECT_EQ(test, same, __same_type(__t2l, t1));	\
+} while (0)
+
+#if BITS_PER_LONG == 64
+# define TEST_SAME_TYPE64(base, t, m)	TEST_SAME_TYPE(base, t, m)
+#else
+# define TEST_SAME_TYPE64(base, t, m)	do { } while (0)
+#endif
+
+#define TEST_TYPE_SETS(base, mu8, mu16, mu32, ms8, ms16, ms32, mu64, ms64) \
+do {									\
+	TEST_SAME_TYPE(base,  u8,  mu8);				\
+	TEST_SAME_TYPE(base, u16, mu16);				\
+	TEST_SAME_TYPE(base, u32, mu32);				\
+	TEST_SAME_TYPE(base,  s8,  ms8);				\
+	TEST_SAME_TYPE(base, s16, ms16);				\
+	TEST_SAME_TYPE(base, s32, ms32);				\
+	TEST_SAME_TYPE64(base, u64, mu64);				\
+	TEST_SAME_TYPE64(base, s64, ms64);				\
+} while (0)
+
+	TEST_TYPE_SETS(u8,   true, false, false, false, false, false, false, false);
+	TEST_TYPE_SETS(u16, false,  true, false, false, false, false, false, false);
+	TEST_TYPE_SETS(u32, false, false,  true, false, false, false, false, false);
+	TEST_TYPE_SETS(s8,  false, false, false,  true, false, false, false, false);
+	TEST_TYPE_SETS(s16, false, false, false, false,  true, false, false, false);
+	TEST_TYPE_SETS(s32, false, false, false, false, false,  true, false, false);
+#if BITS_PER_LONG == 64
+	TEST_TYPE_SETS(u64, false, false, false, false, false, false,  true, false);
+	TEST_TYPE_SETS(s64, false, false, false, false, false, false, false,  true);
+#endif
+
+	/* Check for macro side-effects. */
+	var = 4;
+	KUNIT_EXPECT_EQ(test, var, 4);
+	KUNIT_EXPECT_TRUE(test, __same_type(var++, int));
+	KUNIT_EXPECT_EQ(test, var, 4);
+	KUNIT_EXPECT_TRUE(test, __same_type(int, var++));
+	KUNIT_EXPECT_EQ(test, var, 4);
+	KUNIT_EXPECT_TRUE(test, __same_type(var++, var++));
+	KUNIT_EXPECT_EQ(test, var, 4);
+
+	kunit_info(test, "%d __same_type() tests finished\n", count);
+
+#undef TEST_TYPE_SETS
+#undef TEST_SAME_TYPE64
+#undef TEST_SAME_TYPE
+}
+
+static void castable_to_type_test(struct kunit *test)
+{
+	int count = 0;
+
+#define TEST_CASTABLE_TO_TYPE(arg1, arg2, pass)	do {	\
+	bool __pass = castable_to_type(arg1, arg2);		\
+	KUNIT_EXPECT_EQ_MSG(test, __pass, pass,			\
+		"expected castable_to_type(" #arg1 ", " #arg2 ") to%s pass\n",\
+		pass ? "" : " not");				\
+	count++;						\
+} while (0)
+
+	TEST_CASTABLE_TO_TYPE(16, u8, true);
+	TEST_CASTABLE_TO_TYPE(16, u16, true);
+	TEST_CASTABLE_TO_TYPE(16, u32, true);
+	TEST_CASTABLE_TO_TYPE(16, s8, true);
+	TEST_CASTABLE_TO_TYPE(16, s16, true);
+	TEST_CASTABLE_TO_TYPE(16, s32, true);
+	TEST_CASTABLE_TO_TYPE(-16, s8, true);
+	TEST_CASTABLE_TO_TYPE(-16, s16, true);
+	TEST_CASTABLE_TO_TYPE(-16, s32, true);
+#if BITS_PER_LONG == 64
+	TEST_CASTABLE_TO_TYPE(16, u64, true);
+	TEST_CASTABLE_TO_TYPE(-16, s64, true);
+#endif
+
+#define TEST_CASTABLE_TO_TYPE_VAR(width)	do {				\
+	u ## width u ## width ## var = 0;					\
+	s ## width s ## width ## var = 0;					\
+										\
+	/* Constant expressions that fit types. */				\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_min(s ## width), s ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(type_min(u ## width), s ## width ## var, true);	\
+	/* Constant expressions that do not fit types. */			\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width, false);		\
+	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width ## var, false);	\
+	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width, false);		\
+	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width ## var, false);	\
+	/* Non-constant expression with mismatched type. */			\
+	TEST_CASTABLE_TO_TYPE(s ## width ## var, u ## width, false);		\
+	TEST_CASTABLE_TO_TYPE(u ## width ## var, s ## width, false);		\
+} while (0)
+
+#define TEST_CASTABLE_TO_TYPE_RANGE(width)	do {				\
+	unsigned long big = U ## width ## _MAX;					\
+	signed long small = S ## width ## _MIN;					\
+	u ## width u ## width ## var = 0;					\
+	s ## width s ## width ## var = 0;					\
+										\
+	/* Constant expression in range. */					\
+	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width ## var, true);	\
+	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width, true);		\
+	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width ## var, true);	\
+	/* Constant expression out of range. */					\
+	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width, false); \
+	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width ## var, false); \
+	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width, false); \
+	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width ## var, false); \
+	/* Non-constant expression with mismatched type. */			\
+	TEST_CASTABLE_TO_TYPE(big, u ## width, false);				\
+	TEST_CASTABLE_TO_TYPE(big, u ## width ## var, false);			\
+	TEST_CASTABLE_TO_TYPE(small, s ## width, false);			\
+	TEST_CASTABLE_TO_TYPE(small, s ## width ## var, false);			\
+} while (0)
+
+	TEST_CASTABLE_TO_TYPE_VAR(8);
+	TEST_CASTABLE_TO_TYPE_VAR(16);
+	TEST_CASTABLE_TO_TYPE_VAR(32);
+#if BITS_PER_LONG == 64
+	TEST_CASTABLE_TO_TYPE_VAR(64);
+#endif
+
+	TEST_CASTABLE_TO_TYPE_RANGE(8);
+	TEST_CASTABLE_TO_TYPE_RANGE(16);
+#if BITS_PER_LONG == 64
+	TEST_CASTABLE_TO_TYPE_RANGE(32);
+#endif
+	kunit_info(test, "%d castable_to_type() tests finished\n", count);
+
+#undef TEST_CASTABLE_TO_TYPE_RANGE
+#undef TEST_CASTABLE_TO_TYPE_VAR
+#undef TEST_CASTABLE_TO_TYPE
+}
+
 static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(u8_u8__u8_overflow_test),
 	KUNIT_CASE(s8_s8__s8_overflow_test),
@@ -730,6 +1113,9 @@ static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(shift_nonsense_test),
 	KUNIT_CASE(overflow_allocation_test),
 	KUNIT_CASE(overflow_size_helpers_test),
+	KUNIT_CASE(overflows_type_test),
+	KUNIT_CASE(same_type_test),
+	KUNIT_CASE(castable_to_type_test),
 	{}
 };
 
-- 
2.34.1

