Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9F017E388
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Mar 2020 16:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgCIPZh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-sparse@lfdr.de>); Mon, 9 Mar 2020 11:25:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29716 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726729AbgCIPZh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 9 Mar 2020 11:25:37 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-ccDC4QhiOrijGoZME0WYEw-1; Mon, 09 Mar 2020 11:25:32 -0400
X-MC-Unique: ccDC4QhiOrijGoZME0WYEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D9C9800D5E;
        Mon,  9 Mar 2020 15:25:31 +0000 (UTC)
Received: from comp-core-i7-2640m-0182e6.redhat.com (unknown [10.43.2.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5CFB8272AF;
        Mon,  9 Mar 2020 15:25:27 +0000 (UTC)
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH] Add symantic index utility
Date:   Mon,  9 Mar 2020 16:25:09 +0100
Message-Id: <20200309152509.6707-1-gladkov.alexey@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

sindex is the simple to use cscope-like tool based on sparse/dissect.
Unlike cscope it runs after pre-processor and thus it can't index the
code filtered out by ifdef's, but otoh it understands how the symbol
is used and it can track the usage of struct members.

To create an index for your linux kernel configuration:

$ make C=2 CHECK="sindex add --"

Now, to find where a definition of the pid field from the task_struct
structure:

$ sindex search -m def task_struct.pid
(def) include/linux/sched.h 793 11   pid_t    pid;

default output format:

SOURCE-FILE \t LINE-NUMBER \t COLUMN \t IN FUNCTION NAME \t CODE LINE

To find where this field changes:

$ sindex search -m w task_struct.pid
(-w-) fs/exec.c 1154 6 de_thread   tsk->pid = leader->pid;
(-w-) kernel/fork.c 2155 3 copy_process  p->pid = pid_nr(pid);

To get only filenames and line number you can change output format:

$ sindex search -f '%f:%l' -m w task_struct.pid
fs/exec.c:1154
kernel/fork.c:2155

Current limitations:

* inline functions are ignored;
* unknown #include leads to a fatal error.

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Alexey Gladkov <gladkov.alexey@gmail.com>
---
 .gitignore |    1 +
 Makefile   |   11 +-
 sindex.c   | 1109 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1120 insertions(+), 1 deletion(-)
 create mode 100644 sindex.c

diff --git a/.gitignore b/.gitignore
index 91305a6a..58598364 100644
--- a/.gitignore
+++ b/.gitignore
@@ -19,6 +19,7 @@ graph
 obfuscate
 sparse
 sparse-llvm
+sindex
 test-dissect
 test-inspect
 test-lexing
diff --git a/Makefile b/Makefile
index e2d3a7de..7b269950 100644
--- a/Makefile
+++ b/Makefile
@@ -140,6 +140,16 @@ else
 $(warning Your system does not have libxml, disabling c2xml)
 endif
 
+HAVE_SQLITE := $(shell $(PKG_CONFIG) --exists sqlite3 2>/dev/null && echo 'yes')
+ifeq ($(HAVE_SQLITE),yes)
+PROGRAMS += sindex
+INST_PROGRAMS += sindex
+sindex-ldlibs := $(shell $(PKG_CONFIG) --libs sqlite3)
+sindex-cflags := $(shell $(PKG_CONFIG) --cflags sqlite3)
+else
+$(warning Your system does not have sqlite3, disabling sindex)
+endif
+
 # Can we use gtk (needed for test-inspect)
 GTK_VERSION:=3.0
 HAVE_GTK:=$(shell $(PKG_CONFIG) --exists gtk+-$(GTK_VERSION) 2>/dev/null && echo 'yes')
@@ -228,7 +238,6 @@ cflags   += $($(*)-cflags) $(CPPFLAGS) $(CFLAGS)
 
 selfcheck: $(OBJS:.o=.sc)
 
-
 SPARSE_VERSION:=$(shell git describe --dirty 2>/dev/null || echo '$(VERSION)')
 lib.o: version.h
 version.h: FORCE
diff --git a/sindex.c b/sindex.c
new file mode 100644
index 00000000..8478fe33
--- /dev/null
+++ b/sindex.c
@@ -0,0 +1,1109 @@
+/*
+ * sindex - semantic indexer for C.
+ *
+ * Copyright (C) 2020  Alexey Gladkov
+ */
+
+#define _GNU_SOURCE
+#include <sys/types.h>
+#include <sys/stat.h>
+
+#include <unistd.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <ctype.h>
+#include <errno.h>
+#include <error.h>
+#include <sqlite3.h>
+
+#include "dissect.h"
+
+#define U_DEF (0x100 << U_SHIFT)
+#define SINDEX_DATABASE_VERSION 1
+
+#define message(fmt, ...) error(0, 0, (fmt), ##__VA_ARGS__)
+
+static const char *sindex_command = NULL;
+
+// common options
+static const char *sindex_dbfile = "sindex.sqlite";
+static int sindex_verbose = 0;
+static char cwd[PATH_MAX];
+static size_t n_cwd;
+
+// 'add' command options
+static struct string_list *sindex_filelist = NULL;
+static int sindex_include_local_syms = 0;
+
+struct sindex_streams {
+	sqlite3_int64 id;
+};
+
+static struct sindex_streams *sindex_streams = NULL;
+static int sindex_streams_nr = 0;
+
+// 'search' command options
+static int sindex_search_modmask;
+static int sindex_search_modmask_defined = 0;
+static int sindex_search_kind = 0;
+static char *sindex_search_path = NULL;
+static char *sindex_search_symbol = NULL;
+static const char *sindex_search_format = "(%m) %f\t%l\t%c\t%C\t%s";
+
+static sqlite3 *sindex_db = NULL;
+static sqlite3_stmt *lock_stmt = NULL;
+static sqlite3_stmt *unlock_stmt = NULL;
+static sqlite3_stmt *insert_rec_stmt = NULL;
+static sqlite3_stmt *select_file_stmt = NULL;
+static sqlite3_stmt *insert_file_stmt = NULL;
+static sqlite3_stmt *delete_file_stmt = NULL;
+
+struct command {
+	const char *name;
+	int dbflags;
+	void (*parse_cmdline)(int argc, char **argv);
+	void (*handler)(int argc, char **argv);
+};
+
+static void
+show_usage(void)
+{
+	if (sindex_command)
+		printf("Try '%s %s --help' for more information.\n",
+		       program_invocation_short_name, sindex_command);
+	else
+		printf("Try '%s --help' for more information.\n",
+		       program_invocation_short_name);
+	exit(1);
+}
+
+static void
+show_help(int ret)
+{
+	printf(
+	    "Usage: %1$s [options]\n"
+	    "   or: %1$s [options] add    [command options] [--] [compiler options] [files...]\n"
+	    "   or: %1$s [options] rm     [command options] pattern\n"
+	    "   or: %1$s [options] search [command options] pattern\n"
+	    "\n"
+	    "These are common %1$s commands used in various situations:\n"
+	    "  add      Generate or updates symantic index file for c-source code;\n"
+	    "  rm       Remove files from the index by pattern;\n"
+	    "  search   Make index queries.\n"
+	    "\n"
+	    "Options:\n"
+	    "  -D, --database=FILE    Specify database file (default: %2$s);\n"
+	    "  -v, --verbose          Show information about what is being done;\n"
+	    "  -h, --help             Show this text and exit.\n"
+	    "\n"
+	    "Environment:\n"
+	    "  SINDEX_DATABASE        Database file location.\n"
+	    "\n"
+	    "Report bugs to authors.\n"
+	    "\n",
+	    program_invocation_short_name, sindex_dbfile);
+	exit(ret);
+}
+
+static void
+show_help_add(int ret)
+{
+	printf(
+	    "Usage: %1$s add [options] [--] [compiler options] files...\n"
+	    "\n"
+	    "Utility creates or updates a symbol index.\n"
+	    "\n"
+	    "Options:\n"
+	    "  --include-local-syms   Include into the index local symbols;\n"
+	    "  -v, --verbose          Show information about what is being done;\n"
+	    "  -h, --help             Show this text and exit.\n"
+	    "\n"
+	    "Environment:\n"
+	    "  SINDEX_BASEDIRE        Project top directory.\n"
+	    "\n"
+	    "Report bugs to authors.\n"
+	    "\n",
+	    program_invocation_short_name);
+	exit(ret);
+
+}
+
+static void
+show_help_rm(int ret)
+{
+	printf(
+	    "Usage: %1$s rm [options] pattern\n"
+	    "\n"
+	    "Utility removes source files from the index.\n"
+	    "The pattern is a glob(7) wildcard pattern.\n"
+	    "\n"
+	    "Options:\n"
+	    "  -v, --verbose          Show information about what is being done;\n"
+	    "  -h, --help             Show this text and exit.\n"
+	    "\n"
+	    "Report bugs to authors.\n"
+	    "\n",
+	    program_invocation_short_name);
+	exit(ret);
+}
+
+static void
+show_help_search(int ret)
+{
+	printf(
+	    "Usage: %1$s search [options] [pattern]\n"
+	    "\n"
+	    "Utility searches information about symbol by pattern.\n"
+	    "The pattern is a glob(7) wildcard pattern.\n"
+	    "\n"
+	    "Options:\n"
+	    "  -f, --format=STRING    Specify an output format;\n"
+	    "  -p, --path=PATTERN     Search symbols only in specified directories;\n"
+	    "  -m, --mode=MODE        Search only the specified type of access;\n"
+	    "  -k, --kind=KIND        Specify a kind of symbol;\n"
+	    "  -v, --verbose          Show information about what is being done;\n"
+	    "  -h, --help             Show this text and exit.\n"
+	    "\n"
+	    "The KIND can be one of the following: `s', `f', `v', `m'.\n"
+	    "\n"
+	    "Report bugs to authors.\n"
+	    "\n",
+	    program_invocation_short_name);
+	exit(ret);
+}
+
+static void
+sindex_error_print_progname(void)
+{
+	fprintf(stderr, "%s: ", program_invocation_short_name);
+	if (sindex_command)
+		fprintf(stderr, "%s: ", sindex_command);
+}
+
+static void
+set_search_modmask(const char *v)
+{
+	size_t n = strlen(v);
+
+	if (n != 1 && n != 3)
+		error(1, 0, "the length of mode value must be 1 or 3: %s", v);
+
+	sindex_search_modmask_defined = 1;
+	sindex_search_modmask = 0;
+
+	if (n == 1) {
+		switch (v[0]) {
+			case 'r': v = "rrr"; break;
+			case 'w': v = "ww-"; break;
+			case 'm': v = "mmm"; break;
+			case '-': v = "---"; break;
+			default: error(1, 0, "unknown modificator: %s", v);
+		}
+	} else if (!strcmp(v, "def")) {
+		sindex_search_modmask = U_DEF;
+		return;
+	}
+
+	int modes[] = {
+		U_R_AOF, U_W_AOF, U_R_AOF | U_W_AOF,
+		U_R_VAL, U_W_VAL, U_R_VAL | U_W_VAL,
+		U_R_PTR, U_W_PTR, U_R_PTR | U_W_PTR,
+	};
+
+	for (int i = 0; i < 3; i++) {
+		switch (v[i]) {
+			case 'r': sindex_search_modmask |= modes[i * 3];     break;
+			case 'w': sindex_search_modmask |= modes[i * 3 + 1]; break;
+			case 'm': sindex_search_modmask |= modes[i * 3 + 2]; break;
+			case '-': break;
+			default:  error(1, 0,
+			                "unknown modificator in the mode value"
+			                " (`r', `w', `m' or `-' expected): %c", v[i]);
+		}
+	}
+}
+
+static void
+parse_cmdline(int argc, char **argv)
+{
+	static struct option long_options[] = {
+		{ "database", required_argument, 0, 'D' },
+		{ "verbose", no_argument, 0, 'v' },
+		{ "help", no_argument, 0, 'h' },
+		{0, 0, 0, 0 }
+	};
+	int c;
+	char *env;
+
+	if ((env = getenv("SINDEX_DATABASE")) != NULL)
+		sindex_dbfile = env;
+
+	while ((c = getopt_long(argc, argv, "+D:vh", long_options, NULL)) != -1) {
+		switch (c) {
+			case 'D':
+				sindex_dbfile = optarg;
+				break;
+			case 'v':
+				sindex_verbose++;
+				break;
+			case 'h':
+				show_help(0);
+		}
+	}
+
+	if (optind == argc) {
+		message("command required");
+		show_usage();
+	}
+}
+
+static void
+parse_cmdline_add(int argc, char **argv)
+{
+	static struct option long_options[] = {
+		{ "include-local-syms", no_argument, 0, 1 },
+		{ "verbose", no_argument, 0, 'v' },
+		{ "help", no_argument, 0, 'h' },
+		{0, 0, 0, 0 }
+	};
+	int c;
+
+	opterr = 0;
+
+	while ((c = getopt_long(argc, argv, "+vh", long_options, NULL)) != -1) {
+		switch (c) {
+			case 1:
+				sindex_include_local_syms = 1;
+				break;
+			case 'v':
+				sindex_verbose++;
+				break;
+			case 'h':
+				show_help_add(0);
+			case '?':
+				goto done;
+		}
+	}
+done:
+	if (optind == argc) {
+		message("more arguments required");
+		show_usage();
+	}
+
+	// enforce tabstop
+	tabstop = 1;
+
+	// step back since sparse_initialize will ignore argv[0].
+	optind--;
+
+	sparse_initialize(argc - optind, argv + optind, &sindex_filelist);
+}
+
+static void
+parse_cmdline_rm(int argc, char **argv)
+{
+	static struct option long_options[] = {
+		{ "verbose", no_argument, 0, 'v' },
+		{ "help", no_argument, 0, 'h' },
+		{0, 0, 0, 0 }
+	};
+	int c;
+
+	while ((c = getopt_long(argc, argv, "+vh", long_options, NULL)) != -1) {
+		switch (c) {
+			case 'v':
+				sindex_verbose++;
+				break;
+			case 'h':
+				show_help_rm(0);
+		}
+	}
+
+	if (optind == argc) {
+		message("more arguments required");
+		show_usage();
+	}
+}
+
+static void
+parse_cmdline_search(int argc, char **argv)
+{
+	struct option long_options[] = {
+		{ "format", required_argument, 0, 'f' },
+		{ "path", required_argument, 0, 'p' },
+		{ "mode", required_argument, 0, 'm' },
+		{ "kind", required_argument, 0, 'k' },
+		{ "verbose", no_argument, 0, 'v' },
+		{ "help", no_argument, 0, 'h' },
+		{ 0, 0, 0, 0 }
+	};
+	int c;
+
+	while ((c = getopt_long(argc, argv, "+f:m:k:p:vh", long_options, NULL)) != -1) {
+		switch (c) {
+			case 'f':
+				sindex_search_format = optarg;
+				break;
+			case 'm':
+				set_search_modmask(optarg);
+				break;
+			case 'k':
+				sindex_search_kind = tolower(optarg[0]);
+				break;
+			case 'p':
+				sindex_search_path = optarg;
+				break;
+			case 'v':
+				sindex_verbose++;
+				break;
+			case 'h':
+				show_help_search(0);
+		}
+	}
+
+	if (optind < argc)
+		sindex_search_symbol = argv[optind++];
+}
+
+static int
+query_appendf(sqlite3_str *query, const char *fmt, ...)
+{
+	int status;
+	va_list args;
+
+	va_start(args, fmt);
+	sqlite3_str_vappendf(query, fmt, args);
+	va_end(args);
+
+	if ((status = sqlite3_str_errcode(query)) == SQLITE_OK)
+		return 0;
+
+	if (status == SQLITE_NOMEM)
+		message("not enough memory");
+
+	if (status == SQLITE_TOOBIG)
+		message("string too big");
+
+	return -1;
+}
+
+static inline void
+sqlite_bind_text(sqlite3_stmt *stmt, const char *field, const char *var, int len)
+{
+	if (sqlite3_bind_text(stmt, sqlite3_bind_parameter_index(stmt, field), var, len, SQLITE_STATIC) != SQLITE_OK)
+		error(1, 0, "unable to bind value for %s: %s", field, sqlite3_errmsg(sindex_db));
+}
+
+static inline void
+sqlite_bind_int64(sqlite3_stmt *stmt, const char *field, long long var)
+{
+	if (sqlite3_bind_int64(stmt, sqlite3_bind_parameter_index(stmt, field), var) != SQLITE_OK)
+		error(1, 0, "unable to bind value for %s: %s", field, sqlite3_errmsg(sindex_db));
+}
+
+static inline void
+sqlite_prepare(const char *sql, sqlite3_stmt **stmt)
+{
+	int ret;
+	do {
+		ret = sqlite3_prepare_v2(sindex_db, sql, -1, stmt, NULL);
+		if (ret != SQLITE_OK && ret != SQLITE_BUSY)
+			error(1, 0, "unable to prepare query: %s: %s", sqlite3_errmsg(sindex_db), sql);
+	} while (ret == SQLITE_BUSY);
+}
+
+static inline void
+sqlite_prepare_persistent(const char *sql, sqlite3_stmt **stmt)
+{
+	int ret;
+	do {
+		ret = sqlite3_prepare_v3(sindex_db, sql, -1, SQLITE_PREPARE_PERSISTENT, stmt, NULL);
+		if (ret != SQLITE_OK && ret != SQLITE_BUSY)
+			error(1, 0, "unable to prepare query: %s: %s", sqlite3_errmsg(sindex_db), sql);
+	} while (ret == SQLITE_BUSY);
+}
+
+static inline void
+sqlite_reset_stmt(sqlite3_stmt *stmt)
+{
+	// Contrary to the intuition of many, sqlite3_reset() does not reset the
+	// bindings on a prepared statement. Use this routine to reset all host
+	// parameters to NULL.
+	sqlite3_clear_bindings(stmt);
+	sqlite3_reset(stmt);
+}
+
+static int
+sqlite_run(sqlite3_stmt *stmt)
+{
+	int ret = sqlite3_step(stmt);
+	if (ret != SQLITE_DONE && ret != SQLITE_ROW)
+		error(1, 0, "unable to process query: %s: %s", sqlite3_errmsg(sindex_db), sqlite3_sql(stmt));
+	return ret;
+}
+
+static void
+sqlite_command(const char *sql)
+{
+	sqlite3_stmt *stmt;
+	sqlite_prepare(sql, &stmt);
+	sqlite_run(stmt);
+	sqlite3_finalize(stmt);
+}
+
+static sqlite3_int64
+get_db_version(void)
+{
+	sqlite3_stmt *stmt;
+	sqlite3_int64 dbversion;
+
+	sqlite_prepare("PRAGMA user_version", &stmt);
+	sqlite_run(stmt);
+	dbversion = sqlite3_column_int64(stmt, 0);
+	sqlite3_finalize(stmt);
+
+	return dbversion;
+}
+
+static void
+set_db_version(void)
+{
+	sqlite3_str *query = sqlite3_str_new(sindex_db);
+
+	if (query_appendf(query, "PRAGMA user_version = %d", SINDEX_DATABASE_VERSION) < 0)
+		exit(1);
+
+	char *sql = sqlite3_str_finish(query);
+	sqlite_command(sql);
+	sqlite3_free(sql);
+}
+
+static void
+open_temp_database(void)
+{
+	const char *database_schema[] = {
+		"ATTACH ':memory:' AS tempdb",
+		"CREATE TABLE tempdb.sindex ("
+			" file INTEGER NOT NULL,"
+			" line INTEGER NOT NULL,"
+			" column INTEGER NOT NULL,"
+			" symbol TEXT NOT NULL,"
+			" kind INTEGER NOT NULL,"
+			" context TEXT,"
+			" mode INTEGER NOT NULL"
+		")",
+		NULL,
+	};
+
+	for (int i = 0; database_schema[i]; i++)
+		sqlite_command(database_schema[i]);
+}
+
+static void
+open_database(const char *filename, int flags)
+{
+	int exists = !access(filename, R_OK);
+
+	if (sqlite3_open_v2(filename, &sindex_db, flags, NULL) != SQLITE_OK)
+		error(1, 0, "unable to open database: %s: %s", filename, sqlite3_errmsg(sindex_db));
+
+	sqlite_command("PRAGMA journal_mode = WAL");
+	sqlite_command("PRAGMA synchronous = OFF");
+	sqlite_command("PRAGMA secure_delete = FAST");
+	sqlite_command("PRAGMA busy_timeout = 2147483647");
+	sqlite_command("PRAGMA foreign_keys = ON");
+
+	if (exists) {
+		if (get_db_version() < SINDEX_DATABASE_VERSION)
+			error(1, 0, "%s: Database too old. Please rebuild it.", filename);
+		return;
+	}
+
+	set_db_version();
+
+	const char *database_schema[] = {
+		"CREATE TABLE file ("
+			" id INTEGER PRIMARY KEY AUTOINCREMENT,"
+			" name TEXT UNIQUE NOT NULL,"
+			" mtime INTEGER NOT NULL"
+		")",
+		"CREATE TABLE sindex ("
+			" file INTEGER NOT NULL REFERENCES file(id) ON DELETE CASCADE,"
+			" line INTEGER NOT NULL,"
+			" column INTEGER NOT NULL,"
+			" symbol TEXT NOT NULL,"
+			" kind INTEGER NOT NULL,"
+			" context TEXT,"
+			" mode INTEGER NOT NULL"
+		")",
+		"CREATE UNIQUE INDEX sindex_0 ON sindex (symbol, kind, mode, file, line, column)",
+		"CREATE INDEX sindex_1 ON sindex (file)",
+		NULL,
+	};
+
+	for (int i = 0; database_schema[i]; i++)
+		sqlite_command(database_schema[i]);
+}
+
+struct index_record {
+	const char *context;
+	int ctx_len;
+
+	const char *symbol;
+	int sym_len;
+
+	int kind;
+	unsigned int mode;
+	long long mtime;
+	sqlite3_int64 file;
+	int line;
+	int col;
+};
+
+static void
+insert_record(struct index_record *rec)
+{
+	sqlite_bind_text(insert_rec_stmt,  "@context", rec->context, rec->ctx_len);
+	sqlite_bind_text(insert_rec_stmt,  "@symbol",  rec->symbol, rec->sym_len);
+	sqlite_bind_int64(insert_rec_stmt, "@kind",    rec->kind);
+	sqlite_bind_int64(insert_rec_stmt, "@mode",    rec->mode);
+	sqlite_bind_int64(insert_rec_stmt, "@file",    rec->file);
+	sqlite_bind_int64(insert_rec_stmt, "@line",    rec->line);
+	sqlite_bind_int64(insert_rec_stmt, "@column",  rec->col);
+	sqlite_run(insert_rec_stmt);
+	sqlite_reset_stmt(insert_rec_stmt);
+}
+
+static void
+update_stream(void)
+{
+	if (sindex_streams_nr >= input_stream_nr)
+		return;
+
+	sindex_streams = realloc(sindex_streams, input_stream_nr * sizeof(struct sindex_streams));
+	if (!sindex_streams)
+		error(1, errno, "realloc");
+
+	sqlite_run(lock_stmt);
+
+	for (int i = sindex_streams_nr; i < input_stream_nr; i++) {
+		struct stat st;
+		const char *filename;
+		char fullname[PATH_MAX];
+		sqlite3_int64 cur_mtime = 0;
+
+		if (input_streams[i].fd != -1) {
+			/*
+			 * FIXME: Files in the input_streams may be duplicated.
+			 */
+			if (stat(input_streams[i].name, &st) < 0)
+				error(1, errno, "stat: %s", input_streams[i].name);
+
+			cur_mtime = st.st_mtim.tv_sec;
+
+			if (!realpath(input_streams[i].name, fullname))
+				error(1, errno, "realpath: %s", input_streams[i].name);
+
+			if (!strncmp(fullname, cwd, n_cwd) && fullname[n_cwd] == '/') {
+				filename = fullname + n_cwd + 1;
+				sindex_streams[i].id = 0;
+			} else {
+				sindex_streams[i].id = -1;
+				continue;
+			}
+		} else {
+			sindex_streams[i].id = -1;
+			continue;
+		}
+
+		if (sindex_verbose > 1)
+			message("filename: %s", filename);
+
+		sqlite_bind_text(select_file_stmt, "@name", filename, -1);
+
+		if (sqlite_run(select_file_stmt) == SQLITE_ROW) {
+			sqlite3_int64 old_mtime;
+
+			sindex_streams[i].id = sqlite3_column_int64(select_file_stmt, 0);
+			old_mtime = sqlite3_column_int64(select_file_stmt, 1);
+
+			sqlite_reset_stmt(select_file_stmt);
+
+			if (cur_mtime == old_mtime)
+				continue;
+
+			sqlite_bind_text(delete_file_stmt, "@name", filename, -1);
+			sqlite_run(delete_file_stmt);
+			sqlite_reset_stmt(delete_file_stmt);
+		}
+
+		sqlite_reset_stmt(select_file_stmt);
+
+		sqlite_bind_text(insert_file_stmt,  "@name",  filename, -1);
+		sqlite_bind_int64(insert_file_stmt, "@mtime", cur_mtime);
+		sqlite_run(insert_file_stmt);
+		sqlite_reset_stmt(insert_file_stmt);
+
+		sindex_streams[i].id = sqlite3_last_insert_rowid(sindex_db);
+	}
+
+	sqlite_run(unlock_stmt);
+
+	sindex_streams_nr = input_stream_nr;
+}
+
+static void
+r_symbol(unsigned mode, struct position *pos, struct symbol *sym)
+{
+	static struct ident null;
+	struct ident *ctx = &null;
+	struct index_record rec;
+
+	update_stream();
+
+	if (sindex_streams[pos->stream].id == -1)
+		return;
+
+	if (!sindex_include_local_syms && sym_is_local(sym))
+		return;
+
+	if (!sym->ident) {
+		warning(*pos, "empty ident");
+		return;
+	}
+
+	if (dissect_ctx)
+		ctx = dissect_ctx->ident;
+
+	rec.context = ctx->name;
+	rec.ctx_len = ctx->len;
+	rec.symbol  = sym->ident->name;
+	rec.sym_len = sym->ident->len;
+	rec.kind    = sym->kind;
+	rec.mode    = mode;
+	rec.file    = sindex_streams[pos->stream].id;
+	rec.line    = pos->line;
+	rec.col     = pos->pos;
+
+	insert_record(&rec);
+}
+
+static void
+r_member(unsigned mode, struct position *pos, struct symbol *sym, struct symbol *mem)
+{
+	struct ident *ni, *si, *mi;
+	static struct ident null;
+	struct ident *ctx = &null;
+	struct index_record rec;
+
+	update_stream();
+
+	if (sindex_streams[pos->stream].id == -1)
+		return;
+
+	if (!sindex_include_local_syms && sym_is_local(sym))
+		return;
+
+	ni = built_in_ident("?");
+	si = sym->ident ?: ni;
+	/* mem == NULL means entire struct accessed */
+	mi = mem ? (mem->ident ?: ni) : built_in_ident("*");
+
+	if (dissect_ctx)
+		ctx = dissect_ctx->ident;
+
+	static char memname[1024];
+	snprintf(memname, sizeof(memname), "%.*s.%.*s", si->len, si->name, mi->len, mi->name);
+
+	rec.context = ctx->name;
+	rec.ctx_len = ctx->len;
+	rec.symbol  = memname;
+	rec.sym_len = si->len + mi->len + 1;
+	rec.kind    = 'm';
+	rec.mode    = mode;
+	rec.file    = sindex_streams[pos->stream].id;
+	rec.line    = pos->line;
+	rec.col     = pos->pos;
+
+	insert_record(&rec);
+}
+
+static void
+r_symdef(struct symbol *sym)
+{
+	r_symbol(U_DEF, &sym->pos, sym);
+}
+
+static void
+r_memdef(struct symbol *sym, struct symbol *mem)
+{
+	r_member(U_DEF, &mem->pos, sym, mem);
+}
+
+static void
+command_add(int argc, char **argv)
+{
+	struct reporter reporter = {
+		.r_symdef = r_symdef,
+		.r_symbol = r_symbol,
+		.r_memdef = r_memdef,
+		.r_member = r_member,
+	};
+
+	open_temp_database();
+
+	sqlite_prepare_persistent(
+		"BEGIN IMMEDIATE",
+		&lock_stmt);
+
+	sqlite_prepare_persistent(
+		"COMMIT",
+		&unlock_stmt);
+
+	sqlite_prepare_persistent(
+		"INSERT OR IGNORE INTO tempdb.sindex "
+		"(context, symbol, kind, mode, file, line, column) "
+		"VALUES (@context, @symbol, @kind, @mode, @file, @line, @column)",
+		&insert_rec_stmt);
+
+	sqlite_prepare_persistent(
+		"SELECT id, mtime FROM file WHERE name == @name",
+		&select_file_stmt);
+
+	sqlite_prepare_persistent(
+		"INSERT INTO file (name, mtime) VALUES (@name, @mtime)",
+		&insert_file_stmt);
+
+	sqlite_prepare_persistent(
+		"DELETE FROM file WHERE name == @name",
+		&delete_file_stmt);
+
+	dissect(&reporter, sindex_filelist);
+
+	sqlite_run(lock_stmt);
+	sqlite_command("INSERT OR IGNORE INTO sindex SELECT * FROM tempdb.sindex");
+	sqlite_run(unlock_stmt);
+
+	sqlite3_finalize(insert_rec_stmt);
+	sqlite3_finalize(select_file_stmt);
+	sqlite3_finalize(insert_file_stmt);
+	sqlite3_finalize(delete_file_stmt);
+	sqlite3_finalize(lock_stmt);
+	sqlite3_finalize(unlock_stmt);
+	free(sindex_streams);
+}
+
+static void
+command_rm(int argc, char **argv)
+{
+	sqlite3_stmt *stmt;
+
+	sqlite_command("BEGIN IMMEDIATE");
+	sqlite_prepare("DELETE FROM file WHERE name GLOB @file", &stmt);
+
+	if (sindex_verbose > 1)
+		message("SQL: %s", sqlite3_sql(stmt));
+
+	for (int i = 0; i < argc; i++) {
+		sqlite_bind_text(stmt, "@file",  argv[i], -1);
+		sqlite_run(stmt);
+		sqlite_reset_stmt(stmt);
+	}
+
+	sqlite3_finalize(stmt);
+	sqlite_command("COMMIT");
+}
+
+static inline void
+print_mode(char *value)
+{
+	char str[3];
+	int v = atoi(value);
+
+	if (v == U_DEF) {
+		printf("def");
+		return;
+	}
+
+#define U(m) "-rwm"[(v / m) & 3]
+	str[0] = U(U_R_AOF);
+	str[1] = U(U_R_VAL);
+	str[2] = U(U_R_PTR);
+
+	printf("%.3s", str);
+#undef U
+}
+
+static char *sindex_file_name;
+static FILE *sindex_file_fd;
+static int sindex_file_lnum;
+static char *sindex_line;
+static size_t sindex_line_buflen;
+static int sindex_line_len;
+
+static void
+print_file_line(const char *name, int lnum)
+{
+	/*
+	 * All files are sorted by name and line number. So, we can reopen
+	 * the file and read it line by line.
+	 */
+	if (!sindex_file_name || strcmp(sindex_file_name, name)) {
+		if (sindex_file_fd) {
+			fclose(sindex_file_fd);
+			free(sindex_file_name);
+		}
+
+		sindex_file_name = strdup(name);
+
+		if (!sindex_file_name)
+			error(1, errno, "strdup");
+
+		sindex_file_fd = fopen(name, "r");
+
+		if (!sindex_file_fd)
+			error(1, errno, "fopen: %s", name);
+
+		sindex_file_lnum = 0;
+	}
+
+	do {
+		if (sindex_file_lnum == lnum) {
+			if (sindex_line[sindex_line_len-1] == '\n')
+				sindex_line_len--;
+			printf("%.*s", sindex_line_len, sindex_line);
+			break;
+		}
+		sindex_file_lnum++;
+		errno = 0;
+	} while((sindex_line_len = getline(&sindex_line, &sindex_line_buflen, sindex_file_fd)) != -1);
+
+	if (errno && errno != EOF)
+		error(1, errno, "getline");
+}
+
+static int
+search_query_callback(void *data, int argc, char **argv, char **colname)
+{
+	char *fmt = (char *) sindex_search_format;
+	char buf[32];
+	int quote = 0;
+	int n = 0;
+
+	while (*fmt != '\0') {
+		char c = *fmt;
+
+		if (quote) {
+			quote = 0;
+			switch (c) {
+				case 't': c = '\t'; break;
+				case 'r': c = '\r'; break;
+				case 'n': c = '\n'; break;
+			}
+		} else if (c == '%') {
+			char *pos = ++fmt;
+
+			c = *fmt;
+
+			if (c == '\0')
+				error(1, 0, "unexpected end of format string");
+
+			int colnum = 0;
+
+			switch (c) {
+				case 'f': colnum = 0; goto print_string;
+				case 'l': colnum = 1; goto print_string;
+				case 'c': colnum = 2; goto print_string;
+				case 'C': colnum = 3; goto print_string;
+				case 'n': colnum = 4; goto print_string;
+				case 'm':
+					if (n) {
+						printf("%.*s", n, buf);
+						n = 0;
+					}
+					print_mode(argv[5]);
+					fmt++;
+					break;
+				case 'k':
+					if (n) {
+						printf("%.*s", n, buf);
+						n = 0;
+					}
+					printf("%c", atoi(argv[6]));
+					fmt++;
+					break;
+				case 's':
+					if (n) {
+						printf("%.*s", n, buf);
+						n = 0;
+					}
+					print_file_line(argv[0], atoi(argv[1]));
+					fmt++;
+					break;
+				case -1:
+print_string:
+					if (n) {
+						printf("%.*s", n, buf);
+						n = 0;
+					}
+					printf("%s", argv[colnum]);
+					fmt++;
+					break;
+			}
+
+			if (pos == fmt)
+				error(1, 0, "invalid format specification: %%%c", c);
+
+			continue;
+		} else if (c == '\\') {
+			quote = 1;
+			fmt++;
+			continue;
+		}
+
+		if (n == sizeof(buf)) {
+			printf("%.*s", n, buf);
+			n = 0;
+		}
+
+		buf[n++] = c;
+		fmt++;
+	}
+
+	if (n)
+		printf("%.*s", n, buf);
+	printf("\n");
+
+	return 0;
+}
+
+static void
+command_search(int argc, char **argv)
+{
+	char *sql;
+	char *dberr = NULL;
+	sqlite3_str *query = sqlite3_str_new(sindex_db);
+
+	if (query_appendf(query,
+	                  "SELECT"
+	                  " file.name,"
+	                  " sindex.line,"
+	                  " sindex.column,"
+	                  " sindex.context,"
+	                  " sindex.symbol,"
+	                  " sindex.mode,"
+	                  " sindex.kind "
+	                  "FROM sindex, file "
+	                  "WHERE sindex.file == file.id") < 0)
+		goto fail;
+
+	if (sindex_search_kind) {
+		if (query_appendf(query, " AND sindex.kind == %d", sindex_search_kind) < 0)
+			goto fail;
+	}
+
+	if (sindex_search_symbol) {
+		if (query_appendf(query, " AND ") < 0)
+			goto fail;
+
+		int ret;
+
+		if (strpbrk(sindex_search_symbol, "*?[]"))
+			ret = query_appendf(query, "sindex.symbol GLOB %Q", sindex_search_symbol);
+		else
+			ret = query_appendf(query, "sindex.symbol == %Q", sindex_search_symbol);
+
+		if (ret < 0)
+			goto fail;
+	}
+
+	if (sindex_search_modmask_defined) {
+		if (!sindex_search_modmask) {
+			if (query_appendf(query, " AND sindex.mode == %d", sindex_search_modmask) < 0)
+				goto fail;
+		} else if (query_appendf(query, " AND (sindex.mode & %d) != 0", sindex_search_modmask) < 0)
+			goto fail;
+	}
+
+	if (sindex_search_path) {
+		if (query_appendf(query, " AND file.name GLOB %Q", sindex_search_path) < 0)
+			goto fail;
+	}
+
+	if (query_appendf(query, " ORDER BY file.name, sindex.line, sindex.column ASC", sindex_search_path) < 0)
+		goto fail;
+
+	sql = sqlite3_str_value(query);
+
+	if (sindex_verbose > 1)
+		message("SQL: %s", sql);
+
+	sqlite3_exec(sindex_db, sql, search_query_callback, 0, &dberr);
+	if (dberr)
+		error(1, 0, "sql query failed: %s", dberr);
+fail:
+	sql = sqlite3_str_finish(query);
+	sqlite3_free(sql);
+
+	if (sindex_file_fd) {
+		fclose(sindex_file_fd);
+		free(sindex_file_name);
+	}
+	free(sindex_line);
+}
+
+
+int
+main(int argc, char **argv)
+{
+	struct command commands[] = {
+		{
+			.name          = "add",
+			.dbflags       = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE,
+			.parse_cmdline = parse_cmdline_add,
+			.handler       = command_add
+		},
+		{
+			.name          = "rm",
+			.dbflags       = SQLITE_OPEN_READWRITE,
+			.parse_cmdline = parse_cmdline_rm,
+			.handler       = command_rm
+		},
+		{
+			.name          = "search",
+			.dbflags       = SQLITE_OPEN_READONLY,
+			.parse_cmdline = parse_cmdline_search,
+			.handler       = command_search
+		},
+		{ .name = NULL },
+	};
+	struct command *cmd;
+
+	error_print_progname = sindex_error_print_progname;
+
+	if (!realpath(".", cwd))
+		error(1, errno, "unable to get current directory");
+	n_cwd = strlen(cwd);
+
+	parse_cmdline(argc, argv);
+
+	for (cmd = commands; cmd->name && strcmp(argv[optind], cmd->name); cmd++);
+	if (!cmd->name)
+		error(1, 0, "unknown command: %s", argv[optind]);
+	optind++;
+
+	sindex_command = cmd->name;
+
+	if (cmd->parse_cmdline)
+		cmd->parse_cmdline(argc, argv);
+
+	open_database(sindex_dbfile, cmd->dbflags);
+	cmd->handler(argc - optind, argv + optind);
+
+	sqlite3_close(sindex_db);
+
+	return 0;
+}
-- 
2.24.1

