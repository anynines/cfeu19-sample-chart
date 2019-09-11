#!/bin/bash

set -o errexit # Exit immediately if a simple command exits with a non-zero status
set -o nounset # Report the usage of uninitialized variables

echo "Build final release"

chart_dir=${PWD}/chart
final_chart_artifacts_dir=${PWD}/final-chart-artifacts
chart_version=$(<${PWD}/version/version)
chart_name=cfeu19-sample-chart-${chart_version}
chart_tarball_file=${final_chart_artifacts_dir}/${chart_name}.tgz
chart_checksum_file=${final_chart_artifacts_dir}/${chart_name}.tgz.sha256

echo 'Create final release tarball...'
cd ${chart_dir}
tar --exclude ./ci -czvf ${chart_tarball_file} .

echo 'Create checksum for final release...'
cd ${final_chart_artifacts_dir}
shasum -a 256 ${chart_name}.tgz > ${chart_checksum_file}
echo $(<${chart_checksum_file})

echo 'Done'
