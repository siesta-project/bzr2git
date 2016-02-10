#!/bin/bash

source bzr2git.source

rm -rf siesta.git 
mkdir siesta.git
cd siesta.git
git init --bare

# clean marks directory
rm -rf $_MARKS_DIR
mkdir -p $_MARKS_DIR
marks_dir=../$marks_dir

cd ../

## The following procedure forces
# all branches to be originating from the trunk version

set_siesta_user siesta

# First fetch the trunk versions
bzr2git trunk master

# This allows many branches which are
# based on 3.0 to be present
for v in 0.11 0.15 0.9 1.1 1.3 2.0 2.1 2.5 3.0 4.0
do
    bzr2git siesta-$v $v
done

set_siesta_user agarcia

# no dependencies
bzr2git trunk-bessel bessel
bzr2git trunk-elpa elpa
bzr2git trunk-fdf fdf
bzr2git trunk-genq genq
bzr2git trunk-mixing mixing
bzr2git trunk-mixrho mixrho
bzr2git trunk-mk mk
bzr2git trunk-radfunc radfunc

# new dependency
bzr2git trunk-rhog rhog
bzr2git trunk-rhog-minim rhog-minim

# new dependency
bzr2git trunk-nc-pseudo nc-pseudo
bzr2git trunk-atom-xml atom-xml
bzr2git trunk-ncps-shells ncps-shells

# new dependency
bzr2git trunk-pexsi pexsi
#bzr2git pexsi-dist
#bzr2git pexsi-dos
#bzr2git pexsi-hio
#bzr2git pexsi-hksk
#bzr2git pexsi-mixing
#bzr2git trunk-pexsi-bracket pexsi-bracket
#bzr2git trunk-pexsi-matio pexsi-matio
#bzr2git trunk-pexsi-v0.7 pexsi-v0.7

# new dependency
bzr2git trunk-sparse sparse
bzr2git trunk-refcount refcount
bzr2git trunk-scf scf
bzr2git trunk-scf-lit scf-lit

set_siesta_user npandersen
bzr2git ts-scf ts

set_siesta_user rcuadrado
bzr2git fix-so+nc-bug spin-orbit
