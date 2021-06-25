#!/bin/sh

npm pack ./dalrae.cap.reuse.base &&
mkdir extend_demo &&
cd extend_demo && 
cds init &&
cp ../reuse-base-1.0.0.tgz . &&
pnpm add ./reuse-base-1.0.0.tgz &&
cds import ../ADDRESSES.edmx