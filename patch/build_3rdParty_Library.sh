#!/bin/sh
# build_3rdParty_Library.sh
 
outdir=outdir
mkdir -p $outdir/arm $outdir/i386

libname="patch"
sdkversion="9.2"

if [[ $1 == "ios" ]]; then

    echo "build arm"

    make distclean
    unset CPPFLAGS CFLAGS LDFLAGS CPP CXX CC CXXFLAGS DEVROOT SDKROOT LD

    export DEVROOT="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain"
    export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS$sdkversion.sdk"
    export CFLAGS="-arch armv7 -pipe -no-cpp-precomp -isysroot$SDKROOT -miphoneos-version-min=9.0 -I$SDKROOT/usr/include/"
    export CPPFLAGS="$CFLAGS"
    export CXXFLAGS=""
    export LDFLAGS="-L$SDKROOT/usr/lib/"
    export LD="$DEVROOT/usr/bin/ld"
    export CPP=""
    export CXX="$DEVROOT/usr/bin/clang++"
    export CC="$DEVROOT/usr/bin/clang"

    ./configure --host=arm-apple-darwin --enable-static=yes --enable-dynamic=no

    make

    exit 0
    #cp src/.libs/lib$libname.a $outdir/arm/lib$libname_armv7.a

fi


if [[ $1 == 'sim' ]]; then

    echo "build simulator"

    #if [ ! -e $CONFIGFILE ]; then
        xcrun make distclean

        unset CPPFLAGS CFLAGS LDFLAGS CPP CXX CC CXXFLAGS DEVROOT SDKROOT LD

        export DEVROOT="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain"
        export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator$sdkversion.sdk"
        export CFLAGS="-arch x86_64 -pipe -no-cpp-precomp -isysroot$SDKROOT -miphoneos-version-min=7.0 -I$SDKROOT/usr/include/"
        export CPPFLAGS=""
        export CXXFLAGS="$CFLAGS"
        export LDFLAGS="-L$SDKROOT/usr/lib/"
        export LD="$DEVROOT/usr/bin/ld"
        export CPP=""
        export CXX="$DEVROOT/usr/bin/clang++"
        export CC="$DEVROOT/usr/bin/clang"
        CONFIGFILE=$PWD/config.h
        ./configure --enable-static=yes --enable-dynamic=noe
    #fi

    #xcrun makme

    #cp src/.libs/lib$libname.a $outdir/i386/lib$libname_i386.a

    # are the fat libs making the bundle too big?
    #/usr/bin/lipo -arch armv7 $outdir/arm/lib$libname_armv7.a -arch i386 $outdir/i386/lib$libname_i386.a -create -output $outdir/lib$libname.a

fi

unset CPPFLAGS CFLAGS LDFLAGS CPP CXX CC CXXFLAGS DEVROOT SDKROOT



