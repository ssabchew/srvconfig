#!/bin/bash
set -e

VER=1.0
RPMBUILD_DIR=$(rpm --eval %{_topdir})

if ! command rpmdev-setuptree ; then
    echo please install rpmdevtools
    exit 1
fi

# Create RPMDEV tree
rpmdev-setuptree

pushd "$(dirname $0)" > /dev/null
mv sty-etc sty-etc-"${VER}"
tar  -pczf sty-etc-"${VER}".tar.gz sty-etc-"${VER}"
sed -e "s|Version:        1.0|Version:        ${VER}|" sty-etc.spec

RPM_DIR="${PWD}"
popd > /dev/null

cd "${RPMBUILD_DIR}"/SPECS
cp "${RPM_DIR}"/*.spec .
cp "${RPM_DIR}"/sty-etc-"${VER}".tar.gz ../SOURCES
cd -

#spectool -g -R "${RPMBUILD_DIR}"/SPECS/sty-etc.spec
rpmbuild --clean -ba "${RPMBUILD_DIR}"/SPECS/sty-etc.spec

mv "${RPM_DIR}"/sty-etc-"${VER}" "${RPM_DIR}"/sty-etc
rm -rf "${RPM_DIR}"/sty-etc-"${VER}".tar.gz
