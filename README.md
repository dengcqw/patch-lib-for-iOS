# patch-lib-for-iOS
Compile patch tool to iOS static lib

## issues
1. original 'patch.c' rename to 'c_patch.c'.
2. 'ed_PROGRAM' is a definition used by makefile. 
   It may affect some functions.
3. config.h is generated by run configure.
   change `HAVE_SETMODE` to 0, because setmode function is different from system's. I don't know why.
4. rename main function to patch_main, because this is a static lib

## thanks
I refer to this [hint](http://stackoverflow.com/a/19885606) to succeed compiling patch. Thanks.

## ToDo
remove patch useless function to reduce lib size

## Test
see my repo [Reactive-Native-Demo](https://github.com/dengcqw/Reactive-Native-Demo)
run it directly. enjoy it!
