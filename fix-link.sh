#!/bin/bash

libs="`find /opt/local -iname *.dylib -o -iname *.so -o -ipath '*MacOS/*'`"

for i in $libs ; do
  if [ "`otool -L $i | egrep -q '[[:space:]]libphonon.4.dylib' ; echo $?`" -eq 0 ] ; then
    echo "Fixing $i"
    sudo install_name_tool -change libphonon.4.dylib /opt/local/lib/libphonon.dylib $i
  fi
done
