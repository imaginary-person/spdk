#!/usr/bin/env bash
testdir=$(readlink -f "$(dirname "$0")")
rootdir=$(readlink -f "$testdir/../../")
source "$testdir/common.sh"

"$rootdir/scripts/setup.sh"
nvmes=($(nvme_in_userspace))

run_test "spdk_dd_basic_rw" "$testdir/basic_rw.sh" "${nvmes[@]}"
run_test "spdk_dd_posix" "$testdir/posix.sh"