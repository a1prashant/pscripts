#!/bin/bash
# file: include-pscripts.sh
# info: To enable pscripts from inside your ~/.bashrc source this file
# usage: source include-pscripts.sh
# author: a1prashant

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

alias srcvim="~/pscripts/srcvim.sh"
alias srcgrep="~/pscripts/srcgrep.sh"

pscripts_src_files=("cpp" "h" "BUILD" "CMakeListstxt")
