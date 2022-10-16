#!/bin/sh

#  generate_swiftgen_code.sh
#  Copy english translations -> base
#
#  Created by Andrei on 18/03/2021.


cd ..

echo 'PWD'
echo `pwd`

${SRCROOT}/Pods/SwiftGen/bin/swiftgen run strings -p ${SRCROOT}/stencils/strings.stencil --output ${SRCROOT}/ocktoapp/generated/L10n.swift ${SRCROOT}/ocktoapp/en.lproj/Localizable.strings

if [ $? -ne 0 ]; then
    echo "🛑 Could not generate swiftgen code"
    exit 42
fi
