#!/bin/bash

source bzr2git.source

## The following procedure forces
# all branches to be originating from the trunk version

while read line ; do
    bzr2git_user $line
done < repos/user-sequence
