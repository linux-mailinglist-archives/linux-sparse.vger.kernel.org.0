Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CF1202AC4
	for <lists+linux-sparse@lfdr.de>; Sun, 21 Jun 2020 15:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbgFUNeb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 21 Jun 2020 09:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729654AbgFUNea (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 21 Jun 2020 09:34:30 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0FAC061794
        for <linux-sparse@vger.kernel.org>; Sun, 21 Jun 2020 06:34:30 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id k11so15161494ejr.9
        for <linux-sparse@vger.kernel.org>; Sun, 21 Jun 2020 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=pAZTSbqPRPSrYj6win1UfxL+If1zTlkPMFpf4ZwmDo8=;
        b=pkkKL59ZRHNEYeFF2seYtfrVe+P+qv7QWBYQUCsQUbUo4qcgxsX3yrfMj0tHHoy0Zc
         FCgMBd4JNfdDXXxZjQdYKlSgovhweqcTbQOLddPZ6XEchnLFLMsKvNmwEvuzMz5CqDz4
         bliN0a2PgY0ZE4qRoRkmdPzv4YrIRX5rq0clMmCgxTFKW2Vh548kilomG9ggUv8y8IKB
         YW7Wp5J2Vx0x66X0/doFyM23fGmUSUx/ar6hx0z0FzOu4AcNM9iITUimJawgXHSHOj5d
         QBBdpRKbkr+PfnwMZxOP0WcK95fvV8Mtb91oKtK3cqEYFf5khk91V9BeNFxdn8BdPU64
         oOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=pAZTSbqPRPSrYj6win1UfxL+If1zTlkPMFpf4ZwmDo8=;
        b=YiAIOGLaXWxiQ6dQhiEZnl/RwbqioGA9vFNJDoBvnttLZP22N7P/5IYEuH1BwAaRZH
         DygOoh7gs9SQux38daW6TMZ5+D7jVE5NVp9idS53hdWYW7S6D/PxFlhDOmbM/i142SGf
         agwuM/GusyQeF7FvzRB1iAO5FcPL2lsoEiC2FuRX9dbrWkh9DC4xZ/ixnew5EuQNSCJF
         +GjoBhyrH1Inmn8/CjoXVggE+RXyCQxKlEuj4UUqn0GeXb27PDZZV2dcHAPyVBnDGTrA
         AxXDuv4pHyru4lhPHy+xqpJBx/96Eb3lK9cYQsBxZn7QxC+wMXRC1CGCA2cA/F/t92l7
         OuWg==
X-Gm-Message-State: AOAM53203EgfqRA2sqOFtyTqJmX8TP4yT+ZRGPG/4iHzCUN+0/VjHV00
        jlavjne05n4TZEytqauOORN/8lqm
X-Google-Smtp-Source: ABdhPJyD6MPQq5BIr61+VLAdr3LrzxoWguryjo+15s4J3qreE4d8b06us7W6dhB/EAW5+C2pNvtepw==
X-Received: by 2002:a17:907:685:: with SMTP id wn5mr12390780ejb.283.1592746466872;
        Sun, 21 Jun 2020 06:34:26 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5fe:4ba0:7ffd:29fd])
        by smtp.gmail.com with ESMTPSA id u3sm10515189edx.25.2020.06.21.06.34.25
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 06:34:26 -0700 (PDT)
Date:   Sun, 21 Jun 2020 15:34:24 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Subject: [ANNOUNCE] Sparse v0.6.2
Message-ID: <20200621133424.tj4pgwmzkibb2d4m@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse v0.6.2 is out.

The source code can be found at the official repository:
   git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.2

The tarballs can be found at:
   https://www.kernel.org/pub/software/devel/sparse/dist/
with the following sha256sum:
   0395bada812d831b2f32948258690c1c5799761683d5d4f20c34e641037bd555  sparse-0.6.2.tar.gz
   519ca0de92c1c5dbb76494176c7e567ce4cc8f64a2ecd27b2fae32ce156421fc  sparse-0.6.2.tar.xz


Many thanks to people who have contributed to the 269 patches
of this release, reported a bug or made a suggestion:
   Ramsay Jones, Oleg Nesterov, John Levon, Alexey Gladkov,
   Xi Wang, Xan Phung, Toomas Soome, Quentin Monnet,
   Joe Perches, Davidson Francis, Garrit Franke, Ben Dooks,
   Randy Dunlap, Marco Elver Alex Kogan, Miguel Ojeda,
   Linus Torvalds, Paul Walmsley and kbuild test robot.

Special thanks to Ramsay Jones who has reviewed and tested
numerous patches and found a lot of my typos and to Marco Elver
who has reported an embarrassing bug late in the release cycle.

The most notable changes are:
* sindex: a new cscope-like tool by Alexey Gladkov
* sparse can now use the option --arch=<arch> for non-native usage
* support for __auto_type & _Generic()
* the documentation can now be found on https://sparse.docs.kernel.org

Release notes for v0.6.2
------------------------

* add a new tool: sindex - the semantic utility
    Sindex is a simple to use cscope-like tool but understanding
    how symbols are used and which can track struct members.

* add support for GCC's __auto_type

* add support for _Generic

* fully propagate declarations downward.
    For example, it means that code like:
        static int foo(void);
        int foo(void) { return 0; }
    now behaves as expected: foo() is effectively static.

* multi-arch:
   * allow a single sparse executable to be used for multiple architectures
   * add support for -mcmodel & -f{pic,PIC,pie,PIE}, mainly for RISC-V
   * add new option, --arch=$ARCH, to specify the target architecture
   * move all arch-specific code into separate files (target-$ARCH.c)
   * try to support the various floating-point ABIs on ARM
   * fix wchar_t & wint_t for openbsd
   * add missing predefines for PPC
   * add missing predefines: __amd64 & __amd64__
   * sparc32 on SunOS/Solaris uses 128-bit long double
   * fix wchar_t & wint_t on SunOS/Solaris
   * teach sparse about -fshort-wchar
   * keep cygwin specifics with i386/x86-64 specifics
   * keep BSD & Darwin specifics with i386/x86-64 specifics
   * fix the signedness of plain chars
   * add support for s390 (ILP32)
   * add predefine for __mips__
   * predefine "i386" if needed
   * pre-define __unix__ and friends
   * add necessary defined for sunos-derived systems
   * improved detection of the native OS

* warnings:
   * improve diagnostic message about wrong redeclaration
   * conditionally accept { 0 } without warnings
   * add -Wexternal-function-has-definition
   * display the bitfield name in error messages
   * oversized bitfields are now errors
   * add an option to suppress warning 'no newline at EOF'
   * warn when jumping into statement expressions
   * warn when using undefined labels
   * warn on defined but unused labels

* attributes:
   * allows '__<attribute-name>__' for all attributes.
   * improve handling of function attributes
   * separate modifiers into type/declaration
   * add support for attributes 'unused' & 'gnu_inline'
   * simplify parsing of inline/__tls/__visible
   * better handle function-only attributes
   * teach sparse about gnu_inline
   * parse enum attributes and, for now, ignore them

* cgcc:
   * use -fshort-char for Cygwin
   * add support for riscv32 & riscv64
   * don't define __CYGWIN32__ on 64-bit
   * filter-out sparse-specific -msize-long & -msize-llp64
   * use -mfloat-abi=hard for armhf
   * define _BIG_ENDIAN when needed
   * remove definition of _STRING_ARCH_unaligned (defined by glibc)
   * removed unneeded predefines for integers (now defined by sparse)
   * better multi-arch support by using --arch=$ARCH

* testsuite:
   * avoid standard includes in the tests
   * fix testcase with non-constant initializer
    
* IR
   * add support for the linearization of builtins
   * generate OP_UNREACH from  __builtin_unreachable()
   * add OP_UNREACH after calls to __noreturn functions

* doc:
   * do not use obsolete sphinx's AutodocReporter
   * Sphinx's minimal version is now 1.7
   * add basic doc about the type system
   * doc is now accessible as: https://sparse.docs.kernel.org
   * release notes (old and current ones) have been added to the doc
   * now using the sphinx_rtd_theme instead of the classic theme

* misc:
   * add support for '-std=c17/c18'
   * simplify testing of which version of the standard is used
   * ensure that typeofs are evaluated before using show_typename()
   * use a single way to expand typeofs
   * various improvements to the 'dissect' tool
   * simplify the parsing of type specifiers
   * improve diagnostic messages concerning bitfields
   * fix premature examination of dereferenced object
   * various fixes for the expansion of constant symbols
   * fix type compatibility of _Atomic types
   * add support for builtin macros with argument
   * add support for __has_feature() & __has_extension()

------------------------

Changes since previous release (v0.6.1) are:
   Alexey Gladkov (2):
      Add semantic index utility
      sindex: Add option to search by location

   Davidson Francis (1):
      show-parse: null pointer dereference in do_show_type()

   Garrit Franke (1):
      ir-validate: remove orphan comments

   Joe Perches (1):
      Add '__' prefix and suffix to all __attribute__ #defines

   John Levon (5):
      Add -Wexternal-function-has-definition
      define __PRAGMA_REDEFINE_EXTNAME
      add necessary defined for sunos-derived systems
      pre-define __unix__ and friends
      predefine "i386" if needed

   Luc Van Oostenryck (229):
      options: add support for -fpic, -fPIC, -fpie & -fPIE
      options: add support for -mcmodel
      arch: add predefine for __mips__
      arch: reorder MACH_XXX defines
      arch: add support for s390 (ILP32)
      arch: change the arch when changing -m32/64
      arch: add an option to specify the desired arch: --arch=<arch>
      cgcc: specify the arch via --arch
      cgcc: removed unneeded predefines for integers
      .gitignore: alphasort the patterns
      remove unused KW_STATEMENT
      remove unused SYM_MEMBER
      remove unused SYM_TYPEDEF
      remove unneeded MOD_TYPE
      show-type: add a test program to test do_show_type() & friends
      arch: fix setting the endianness
      cgcc: remove _STRING_ARCH_unaligned
      cgcc: let sparse define _BIG_ENDIAN
      typeof: fix up comment in examine_pointer_type()
      typeof: add a test for unexamined typeof
      typeof: examine it at show-time
      spec: process chars like other integer types
      spec: types[] is indexed by the specifier class
      spec: add '.class = CInt'
      spec: improve parsing of __int128
      spec: KW_SHORT is not needed
      spec: KW_LONG is not needed
      spec: s/size/rank/
      arch: fix the signedness of plain chars
      arch: simplify i386/x86-64 specifics
      arch: do not needlessly set bitness on 32-bit archs
      arch: remove impossible cases with 64-bit arch not being lp64
      arch: keep BSD & Darwin specifics with i386/x86-64 specifics
      function attributes apply to the function declaration
      option: move all option parsing helpers before their potential uses
      arch: keep cygwin specifics with i386/x86-64 specifics
      arch: teach sparse about -fshort-wchar
      cgcc: let cygwin use -fshort-wchar
      option: allow handle_switches() to set non-boolean values
      option: use handle_switches() for -m flags
      option: simpler handling of key-value for suboptions
      add tests for function attributes
      fix assignment: pointer to __pure/__noreturn function to void *
      fix assignment check with function attribute
      propagate function modifiers only to functions
      let function definition inherit prototype attributes
      allow 'static' forward declaration
      spec: make ctype_declare[] more readable
      spec: get rid of all specifier MOD_XXX
      fp-abi: add tests for ARM's -mfloat-abi=... & -msoft-float
      fp-abi: teach sparse about -mfloat-abi on ARM
      fp-abi: teach sparse about -m{hard,soft}-float
      cgcc: use -mfloat-abi=hard for armhf
      arch: char32_t should be the same as uint32_t, not uint
      arch: (almost) all platforms simply use int for int32
      arch: add predefines for INT128 only on supported archs
      arch: use a variable for the OS
      arch: fix wchar_t & wint_t on SunOS/Solaris
      arch: sparc32 on SunOS/Solaris uses 128-bit long doubles
      arch: add note for 128-bit long double on mips64
      spec: replace lllong_ctype by int128_ctype
      cgcc: filter-out -msize-long & -msize-llp64
      arch: add missing predfines: __amd64 & __amd64__
      arch: add missing predefines for PPC
      arch: fix wchar_t & wint_t for openbsd
      cgcc: add support for riscv64
      simplify initialization of Wdeclarationafterstatement
      allow to test the standard version outside of lib.c
      alt definition for STANDARD_GNU89 & friends
      testsuite: avoid standard includes in the tests
      remove redundant degenerate() in compatible_assignment_types()
      bitfield: add testcases for invalid bitfield width
      bitfield: don't warn twice on invalid width
      bitfield: oversized bitfields are errors
      bitfield: keep the bitfield ident
      bitfield: display the bitfield name in error messages
      reorganize the __STDC_VERSION__/__STRICT_ANSI__ switch statement
      simplify definition of __STRICT_ANSI__
      separate definition of __STDC_NO_ATOMICS__ and friends from C11
      teach sparse about C17
      fix premature examination of dereferenced object
      split testcases for type punning & constant initializer expansion
      add testcase for expansion of default initializers
      add testcase for addressability of degenerated symbol
      add testcase for addressability of 'complex' symbols
      add test for union cast
      add test for dereference cost of symbol with complex type
      add test for constant expansion of complex initializer
      extract mark_addressable() from evaluate_addressof().
      fix addressability marking in evaluate_addressof()
      degenerated arrays & functions are addressable too
      fix expansion of initializer (mismatching size)
      fix expansion of initializer (mismatching type)
      fix expansion of initializer (default)
      fix simplify_loads() when doing type punning
      fix cost of dereference of symbols with complex type
      mark strings as examined & evaluated
      testcase: remove trailing ';' in commands
      typeof: do not let classify_type() do its own SYM_TYPEOF expansion
      typeof: extract examine_typeof() from examine_symbol_type()
      typeof: avoid using is_bitfield_type()
      improve diagnostic message about wrong redeclaration
      cgcc: add support for riscv32
      cgcc: rename 'ppc64+{be,le}' to 'ppc64{be,le}'
      arch: move arch-specificities to their own files
      arch: move parsing of --arch=<ARCH> to target.c
      arch: move handle_arch_finalize() into target_init()
      arch: use an arch-specific default for -msize-long
      arch: move target-specific predefines to the target files.
      arch: move cmodel predefines to the target files.
      arch: use arch_target for INT128's predefine
      arch: arch_mach is not needed anymore
      fix testcase with non-constant initializer
      ptrlist: fix typos
      add predefine_nostd()
      fix typo when detecting SunOS
      detect native OS in alphabetical order
      detect native OS on OpenBSD & NetBSD
      detect OS_UNIX as native OS
      allow to easily test if the OS is UNIX-like
      fix type compatibility of _Atomic
      inline: add some tests
      do the tree inlining during expansion phase
      teach sparse about -pedantic/-Wpedantic
      cpp: silently allow conditional directives within a macro
      cpp: remove extra newlines during macro expansion
      cpp: fix redefinition of a macro during its own expansion
      add testcases for OP_UNREACH
      add instruction OP_UNREACH
      add an implicit __builtin_unreachable() for __noreturn
      add support for linearization of builtins
      teach sparse to linearize __builtin_unreachable()
      add support for GCC's __auto_type
      do not use expr->left for conditionals
      doc: do not use obsolete sphinx.ext.autodoc.AutodocReporter
      doc: fix the warnings when building the doc
      doc: remove done item from the TODO
      misc: fix typo: s/OS_UNIX/OS_NATIVE/
      attribute: sort the table of modifier names
      attribute: add helper apply_mod() and use it
      attribute: allow some attribute to be present multiple times
      attribute: add support for unused
      attribute: separate modifiers into type/declaration
      attribute: teach sparse about attribute((gnu_inline))
      univ-init: add helper match_token_zero()
      attribute: '__tls' is just another 'declaration' modifier
      attribute: 'inline' is just another 'declaration' modifier
      attribute: 'externally_visible' is just another 'declaration' modifier
      testsuite: add a few testcases for nested functions
      misc: fix testcase typeof-safe
      misc: s/fntype/rettype/
      misc: always use the node for current_fn
      bad-goto: add testcase for 'jump inside discarded expression statement'
      bad-goto: add testcases for linearization of invalid labels
      bad-goto: reorganize testcases and add some more
      bad-goto: do not linearize if the IR will be invalid
      bad-goto: reorg test in evaluate_goto_statement()
      bad-goto: simplify testing of undeclared labels
      bad-goto: do not linearize function with undeclared labels
      bad-goto: catch labels with reserved names
      scope: no memset() needed after __alloc_scope()
      scope: move scope opening/ending inside compound_statement()
      scope: extract bind_symbol_with_scope() from bind_symbol()
      scope: __func__ is special
      scope: __label__ is special
      scope: s/{start,end}_symbol_scope/{start,end}_block_scope/
      scope: let labels have their own scope
      scope: add is_in_scope()
      scope: give a scope for labels & gotos
      bad-goto: jumping inside a statement expression is an error
      bad-goto: label expression inside a statement expression is UB
      bad-goto: extract check_label_declaration()
      bad-goto: check declaration of label expressions
      bad-label: check for unused labels
      bad-label: mark labels as used when needed
      bad-label: respect attribute((unused))
      univ-init: conditionally accept { 0 } without warnings
      add an option to suppress warning 'no newline at EOF'
      testsuite: add testcase for duplicated local definitions
      add support for _Generic
      univ-init: scalar initializer needs some additional checks
      univ-init: set default to -Wno-universal-initializer
      pre-process: remove unneeded declaration of show_token_sequence()
      generic: fix crash when nothing match
      nios2: add declaration for __builtin_{rd,wr}ctl()
      builtin: can be initialized later
      builtin: use a table for the builtins
      builtin: unify the 2 tables of builtins
      builtin: add support for arch-specific builtins
      arch: add specificities for Nios2
      arch: add specificities for Blackfin
      arch: add specificities for Alpha
      testsuite: plain chars are never compatible with [un]signed chars
      ctype: keep modifiers & base_type close
      doc: add some doc for the type system
      doc: move meta-doc to its own section
      doc: add link to the doc on kernel.org in the man page
      doc: add release notes for incoming v0.6.2
      doc: show the ToC in the sidebar
      Sparse v0.6.2-rc1
      sindex: minimal version for sqlite3 is 3.24
      sindex: use -stdc=gnu99
      doc: reindent the sublists in the relnotes
      attribute: parse but ignore enum attributes
      doc: fix code-block formatting in v0.6.2 relnotes
      doc: minimal version for Sphinx is 1.7
      doc: add intro stolen from the wiki
      doc: copy the old relnotes here
      doc: update TODO
      doc: fix some typos
      doc: fix markup in types.rst (s/```/``/)
      doc: reformulate an item in the TODO
      build: let the C++ compiler be configurable
      testsuite: be less paranoid with timeout
      pre-process: add testcases for __has_feature() & __has_extension()
      pre-process: rename 'expander' into 'expand_simple'
      pre-process: add support for builtin macros
      pre-process: add support for __has_feature() & __has_extension()
      pre-process: make __has_{attribute,builtin}() true builtin macros
      Sparse v0.6.2-rc2
      gensel: add testcases from DR481
      gensel: use temporary variable in generic selection
      gensel: controlling expression must be lvalue converted
      gensel: controlling expression must be pointer-converted
      gensel: validate the type of the associations
      doc: switch to the sphinx_rtd theme
      doc: add some info to the main page
      doc: update release notes
      Sparse v0.6.2

   Oleg Nesterov (20):
      show_parse: avoid null pointer dereference in do_show_type()
      dissect: don't report anonymous members in initializers
      dissect: turn mk_name() into deanon()
      dissect: change deanon() to handle the !node case
      dissect: disallow NULL pointers in struct reporter
      dissect: introduce reporter->r_memdef()
      dissect: introduce dissect_ctx
      dissect: change do_symbol(SYM_FN) to check base_type->stmt != NULL
      dissect: kill return_type
      dissect: set sym->kind for reporter
      dissect: enforce sym->kind='f' when it looks like a function call
      dissect: introduce sym_is_local() for reporter
      dissect: move __sparse() callsite from test-dissect.c to dissect.c
      dissect: use show_ident() to print dctx->ident
      dissect: don't set ->ident = '?' in no_member()
      dissect: kill no_member()
      struct_union_enum_specifier: always initialize sym->scope
      dissect: fix sym_is_local(SYM_STRUCT/UNION/ENUM)
      dissect: enforce toplevel() if SYM_STRUCT was not defined
      make "directive in macro's argument list" a warning

   Quentin Monnet (1):
      build: fix LLVM version detection

   Ramsay Jones (6):
      lib.c: fix spelling of _BIG_ENDIAN
      cgcc: fix definition of 'linux' macro
      cgcc: only define __CYGWIN32__ for -m32 builds
      evaluate: mark evaluate_generic_selection() as static
      pre-process: fix a compiler array subscript type warning
      doc: correct some spelling

   Toomas Soome (1):
      correct sparcv9 defines

   Xan Phung (1):
      domtree: domtree_build() creates extraneous bb->doms entries

   Xi Wang (1):
      fix pointer casts in evaluate_compare()

------------------------
