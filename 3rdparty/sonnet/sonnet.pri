DEFINES += SONNETUI_EXPORT=""
DEFINES += SONNETCORE_EXPORT=""
DEFINES += INSTALLATION_PLUGIN_PATH=""
DEFINES += SONNET_STATIC

INCLUDEPATH += $$PWD

HEADERS +=  $$PWD/sonnetcore_export.h \
            $$PWD/core_debug.h \
            $$PWD/spellcheckservice.h

SOURCES +=  $$PWD/core_debug.cpp \
    $$PWD/spellcheckservice.cpp

# HEADERS  += $$PWD/plugins/dummy/dummyclient.h
#
# SOURCES  += $$PWD/plugins/dummy/dummyclient.cpp

macx {
HEADERS +=  $$PWD/nsspellcheckerdebug.h \
            $$PWD/sonnet/src/plugins/nsspellchecker/nsspellcheckerdict.h \
            $$PWD/sonnet/src/plugins/nsspellchecker/nsspellcheckerclient.h
SOURCES +=  $$PWD/nsspellcheckerdebug.cpp
OBJECTIVE_SOURCES += $$PWD/sonnet/src/plugins/nsspellchecker/nsspellcheckerdict.mm \
            $$PWD/sonnet/src/plugins/nsspellchecker/nsspellcheckerclient.mm
LIBS    +=  -framework AppKit
DEFINES += SONNET_AVOID_HUNSPELL_CLIENT # We use a native NSSpellChecker from AppKit
}

win32 {
HEADERS += $$PWD/plugins/windows/windowsclient.h
SOURCES += $$PWD/plugins/windows/windowsclient.cpp
LIBS    += Ole32.lib
DEFINES += SONNET_AVOID_HUNSPELL_CLIENT # We use ISpellChecker from Windows SDK
}

linux-g++ {
HEADERS +=  $$PWD/hunspelldebug.h \
            $$PWD/config-hunspell.h
SOURCES +=  $$PWD/hunspelldebug.cpp
LIBS    += -lhunspell
INCLUDEPATH += /usr/include/hunspell
}
