#! /bin/bash

cd /tmp/toxtunnel && \    
nuget restore && \
xbuild /p:Configuration="Release POSIX" /p:PostBuildEvent= /target:Clean && \
xbuild /p:Configuration="Release POSIX" /p:PostBuildEvent= && \
rm -rf build_deb/Release
mv dist/Release/ build_deb/Release/
cp /usr/local/lib/libtox*.so* build_deb/Release/
chmod -R 777 build_deb/Release
cd build_deb && \
debuild -b -us -uc
