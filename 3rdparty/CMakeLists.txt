# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

list(APPEND scrite_SRCS
    3rdparty/phtranslator/LanguageCodes.h
    3rdparty/phtranslator/PhTranslateLib.cpp 3rdparty/phtranslator/PhTranslateLib.h
    3rdparty/phtranslator/PhTranslator.cpp 3rdparty/phtranslator/PhTranslator.h
    3rdparty/phtranslator/stdafx.cpp 3rdparty/phtranslator/stdafx.h
    3rdparty/phtranslator/targetver.h
)

list(APPEND scrite_SRCS
    3rdparty/poly2tri/common/shapes.cc 3rdparty/poly2tri/common/shapes.h
    3rdparty/poly2tri/common/utils.h
    3rdparty/poly2tri/poly2tri.h
    3rdparty/poly2tri/sweep/advancing_front.cc 3rdparty/poly2tri/sweep/advancing_front.h
    3rdparty/poly2tri/sweep/cdt.cc 3rdparty/poly2tri/sweep/cdt.h
    3rdparty/poly2tri/sweep/sweep.cc 3rdparty/poly2tri/sweep/sweep.h
    3rdparty/poly2tri/sweep/sweep_context.cc 3rdparty/poly2tri/sweep/sweep_context.h
)

list(APPEND scrite_SRCS
    # 3rdparty/quazip/quazip/JlCompress.cpp 3rdparty/quazip/quazip/JlCompress.h
    # 3rdparty/quazip/quazip/ioapi.h
    # 3rdparty/quazip/quazip/minizip_crypt.h
    # 3rdparty/quazip/quazip/qioapi.cpp
    # 3rdparty/quazip/quazip/quaadler32.cpp 3rdparty/quazip/quazip/quaadler32.h
    # 3rdparty/quazip/quazip/quachecksum32.cpp 3rdparty/quazip/quazip/quachecksum32.h
    # 3rdparty/quazip/quazip/quacrc32.cpp 3rdparty/quazip/quazip/quacrc32.h
    # 3rdparty/quazip/quazip/quagzipfile.cpp 3rdparty/quazip/quazip/quagzipfile.h
    # 3rdparty/quazip/quazip/quaziodevice.cpp 3rdparty/quazip/quazip/quaziodevice.h
    # 3rdparty/quazip/quazip/quazip.cpp 3rdparty/quazip/quazip/quazip.h
    # 3rdparty/quazip/quazip/quazip_global.h
    # 3rdparty/quazip/quazip/quazip_qt_compat.h
    # 3rdparty/quazip/quazip/quazipdir.cpp 3rdparty/quazip/quazip/quazipdir.h
    # 3rdparty/quazip/quazip/quazipfile.cpp 3rdparty/quazip/quazip/quazipfile.h
    # 3rdparty/quazip/quazip/quazipfileinfo.cpp 3rdparty/quazip/quazip/quazipfileinfo.h
    # 3rdparty/quazip/quazip/quazipnewinfo.cpp 3rdparty/quazip/quazip/quazipnewinfo.h
    # 3rdparty/quazip/quazip/unzip.c 3rdparty/quazip/quazip/unzip.h
    # 3rdparty/quazip/quazip/zip.c 3rdparty/quazip/quazip/zip.h
)

list(APPEND scrite_SRCS
    3rdparty/simplecrypt/simplecrypt.cpp 3rdparty/simplecrypt/simplecrypt.h
    3rdparty/sonnet/core_debug.cpp 3rdparty/sonnet/core_debug.h
    3rdparty/sonnet/sonnetcore_export.h
    3rdparty/sonnet/spellcheckservice.cpp 3rdparty/sonnet/spellcheckservice.h
)

set(scrite_SRCS ${scrite_SRCS} PARENT_SCOPE)

