#!/bin/bash
set -e

VER=1.0
RPMBUILD_DIR=$(rpm --eval %{_topdir})

pushd "$(dirname $0)" > /dev/null
tar  -pczf sty-etc-"${VER}".tar.gz sty-etc-"${VER}"

RPM_DIR="${PWD}"
popd > /dev/null

cd "${RPMBUILD_DIR}"/SPECS
cp "${RPM_DIR}"/*.spec .
cp "${RPM_DIR}"/sty-etc-"${VER}".tar.gz ../SOURCES
cd -

#spectool -g -R "${RPMBUILD_DIR}"/SPECS/sty-etc.spec
rpmbuild --clean -ba "${RPMBUILD_DIR}"/SPECS/sty-etc.spec
