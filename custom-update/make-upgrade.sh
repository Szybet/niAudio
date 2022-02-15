#!/bin/bash
## those are propably procesor names, just do it all
md5sum zImage
cp -f zImage update-dir/upgrade/mx6ull-ntx/zImage-E60U20

cp -f zImage update-dir/upgrade/mx6sll-ntx/zImage-E60K00
cp -f zImage update-dir/upgrade/mx6sll-ntx/zImage-E60QL0
cp -f zImage update-dir/upgrade/mx6sll-ntx/zImage-E60QM0
cp -f zImage update-dir/upgrade/mx6sll-ntx/zImage-E70K00
cp -f zImage update-dir/upgrade/mx6sll-ntx/zImage-E80K00

md5sum update-dir/upgrade/*/* > update-dir/manifest.md5sum

echo "md5sum file:"
md5sum update-dir/upgrade/*/*
rm zImage
