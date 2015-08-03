#!/bin/bash
set -e

RPMBUILD_DIR=$(rpm --eval %{_topdir})

if ! command rpmdev-setuptree ; then
    echo please install rpmdevtools
    exit 1
fi

# Create RPMDEV tree
rpmdev-setuptree

pushd "$(dirname $0)" > /dev/null
VER=$(cat VER)
mv sty-etc sty-etc-"${VER}"
tar  -pczf sty-etc-"${VER}".tar.gz sty-etc-"${VER}"
sed -i "s|Version.*|Version:        ${VER}|" sty-etc.spec

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
