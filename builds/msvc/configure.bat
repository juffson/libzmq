@ECHO OFF
:-  configure.bat creates platform.hpp and configures the build process
:-  You MUST run this before building via msbuild or VisualStudio.

IF %1.==--help. (
    ECHO Syntax: configure [ switch ]
    ECHO    --help                  show this help
    GOTO END
)
ECHO Configuring libzmq...

ECHO //  Generated by configure.bat> platform.hpp
ECHO. >> platform.hpp
ECHO #ifndef __PLATFORM_H_INCLUDED__>> platform.hpp
ECHO #define __PLATFORM_H_INCLUDED__>> platform.hpp
ECHO. >> platform.hpp
ECHO #define ZMQ_HAVE_WINDOWS 1>> platform.hpp

:-  Check for dependencies
IF EXIST "..\..\..\libsodium" (
    ECHO Building with libsodium
    ECHO #define HAVE_LIBSODIUM 1>> platform.hpp
) ELSE (
    ECHO Building without libsodium
    ECHO #undef HAVE_LIBSODIUM>> platform.hpp
)

ECHO. >> platform.hpp
ECHO #endif>> platform.hpp

:-  Copy property files for test suite; these are the
:-  same for all versions of VS so we maintain only the ones
:-  in vs2015

COPY /Y vs2015\libzmq\libzmq.props           vs2010\libzmq >nul
COPY /Y vs2015\inproc_lat\inproc_lat.props   vs2010\inproc_lat >nul
COPY /Y vs2015\inproc_thr\inproc_thr.props   vs2010\inproc_thr >nul
COPY /Y vs2015\local_lat\local_lat.props     vs2010\local_lat  >nul
COPY /Y vs2015\local_thr\local_thr.props     vs2010\local_thr  >nul
COPY /Y vs2015\remote_lat\remote_lat.props   vs2010\remote_lat >nul
COPY /Y vs2015\remote_thr\remote_thr.props   vs2010\remote_thr >nul

COPY /Y vs2015\libzmq\libzmq.props           vs2012\libzmq >nul
COPY /Y vs2015\inproc_lat\inproc_lat.props   vs2012\inproc_lat >nul
COPY /Y vs2015\inproc_thr\inproc_thr.props   vs2012\inproc_thr >nul
COPY /Y vs2015\local_lat\local_lat.props     vs2012\local_lat  >nul
COPY /Y vs2015\local_thr\local_thr.props     vs2012\local_thr  >nul
COPY /Y vs2015\remote_lat\remote_lat.props   vs2012\remote_lat >nul
COPY /Y vs2015\remote_thr\remote_thr.props   vs2012\remote_thr >nul

COPY /Y vs2015\libzmq\libzmq.props           vs2013\libzmq >nul
COPY /Y vs2015\inproc_lat\inproc_lat.props   vs2013\inproc_lat >nul
COPY /Y vs2015\inproc_thr\inproc_thr.props   vs2013\inproc_thr >nul
COPY /Y vs2015\local_lat\local_lat.props     vs2013\local_lat  >nul
COPY /Y vs2015\local_thr\local_thr.props     vs2013\local_thr  >nul
COPY /Y vs2015\remote_lat\remote_lat.props   vs2013\remote_lat >nul
COPY /Y vs2015\remote_thr\remote_thr.props   vs2013\remote_thr >nul
