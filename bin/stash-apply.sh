#!/bin/bash

STASH_LIST=`git stash list | fzf | cut -d':' -f 1`
    if [ -n "$STASH_LIST" ] ; then
        echo "$STASH_LIST"
        git stash apply $STASH_LIST
    fi