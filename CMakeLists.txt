# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

cmake_minimum_required(VERSION 3.16)
project(Scrite VERSION 1.0.5 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(KF_DEP_VERSION "6.0.0")

find_package(ECM ${KF_DEP_VERSION} REQUIRED CONFIG)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${CMAKE_MODULE_PATH})

include(KDEInstallDirs)
include(ECMQmlModule)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Charts Concurrent Gui Multimedia Network Pdf PrintSupport Qml Quick QuickControls2 Svg Widgets Xml)
find_package(KF${QT_VERSION_MAJOR} ${KF_DEP_VERSION} REQUIRED COMPONENTS Sonnet)
find_package(Hunspell)
find_package(QuaZip-Qt6)
#find_package(ZLIB)

add_subdirectory(qml)
add_subdirectory(3rdparty)
add_subdirectory(src)

qt_standard_project_setup()

list(APPEND scrite_SRCS
    main.cpp
)

qt_add_executable(Scrite WIN32 MACOSX_BUNDLE ${scrite_SRCS})


qt6_add_qml_module(Scrite
    URI io.scrite.components
    VERSION 1.0
    QML_FILES
        misc/fetchogattribs.js
    RESOURCES
        misc/annotations_metadata.json
        misc/structure_groups.lst
        misc/scrited_closing_frame_video.mp4
        misc/scriptalay_info.md
        misc/homescreen_info.md
    NO_RESOURCE_TARGET_PATH
    OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_CURRENT_SOURCE_DIR}/../Release/
)

target_include_directories(Scrite PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/quazip/quazip
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/simplecrypt
    ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/sonnet
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/automation
    ${CMAKE_CURRENT_SOURCE_DIR}/src/core
    ${CMAKE_CURRENT_SOURCE_DIR}/src/document
    ${CMAKE_CURRENT_SOURCE_DIR}/src/exporters
    ${CMAKE_CURRENT_SOURCE_DIR}/src/importers
    ${CMAKE_CURRENT_SOURCE_DIR}/src/interfaces
    ${CMAKE_CURRENT_SOURCE_DIR}/src/network
    ${CMAKE_CURRENT_SOURCE_DIR}/src/printing
    ${CMAKE_CURRENT_SOURCE_DIR}/src/quick
    ${CMAKE_CURRENT_SOURCE_DIR}/src/quick/items
    ${CMAKE_CURRENT_SOURCE_DIR}/src/quick/objects
    ${CMAKE_CURRENT_SOURCE_DIR}/src/reports
    ${CMAKE_CURRENT_SOURCE_DIR}/src/restapikey
    ${CMAKE_CURRENT_SOURCE_DIR}/src/utils
)

target_compile_definitions(Scrite PRIVATE
    INSTALLATION_PLUGIN_PATH=""
    PHTRANSLATE_STATICLIB
    SCRITE_VERSION="1.0.5"
)

target_link_libraries(Scrite PRIVATE
    Qt::Charts
    Qt::Concurrent
    Qt::Core
    Qt::Gui
    Qt::Multimedia
    Qt::Network
    Qt::Pdf
    Qt::PrintSupport
    Qt::Qml
    Qt::Quick
    Qt::QuickControls2
    Qt::Svg
    Qt::Widgets
    Qt::Xml
    KF6::SonnetCore
    KF6::SonnetUi
    QuaZip::QuaZip
    scritecontrols
    scritestructure
    scritehelpers
    scritedialogs
    scritetasks
    scritenotebook
    scritenotifications
    scritefloatingdockpanels
    scriteoverlays
    scritescreenplay
    scritescrited
    scriteglobals
)


# Resources:

add_subdirectory(font)
add_subdirectory(icons)
add_subdirectory(images)

set_source_files_properties("js/getBoxToBoxArrow.js"
    PROPERTIES QT_RESOURCE_ALIAS "getBoxToBoxArrow.js"
)
set(scrite_ui_resource_files
    "js/getBoxToBoxArrow.js"
)

qt_add_resources(Scrite "scrite_ui"
    PREFIX
        "/dragonman225-curved-arrows"
    FILES
        ${scrite_ui_resource_files}
)
set(scrite_ui1_resource_files
    "LICENSE.txt"
)

qt_add_resources(Scrite "scrite_ui1"
    PREFIX
        "/"
    FILES
        ${scrite_ui1_resource_files}
)

if(CMAKE_BUILD_TYPE STREQUAL Release)
    target_compile_definitions(Scrite PRIVATE
        QT_NO_DEBUG_OUTPUT
    )
endif()

if(EXISTS ../profilingtools/timeprofiler.cpp)
    target_sources(Scrite PUBLIC
        ../profilingtools/timeprofiler.cpp ../profilingtools/timeprofiler.h
    )
endif()

if(EXISTS ../profilingtools/callgraph.cpp)
    target_sources(Scrite PUBLIC
        ../profilingtools/callgraph.cpp ../profilingtools/callgraph.h
    )
endif()

if(MACOS)
    target_sources(Scrite PUBLIC
        3rdparty/sonnet/nsspellcheckerdebug.cpp 3rdparty/sonnet/nsspellcheckerdebug.h
        3rdparty/sonnet/sonnet/src/plugins/nsspellchecker/nsspellcheckerclient.h 3rdparty/sonnet/sonnet/src/plugins/nsspellchecker/nsspellcheckerclient.mm
        3rdparty/sonnet/sonnet/src/plugins/nsspellchecker/nsspellcheckerdict.h 3rdparty/sonnet/sonnet/src/plugins/nsspellchecker/nsspellcheckerdict.mm
        src/core/systemtextinputmanager_macos.h src/core/systemtextinputmanager_macos.mm
    )

    target_compile_definitions(Scrite PRIVATE
        SONNET_AVOID_HUNSPELL_CLIENT
    )

    target_link_libraries(Scrite PRIVATE
        "-framework AppKit"
        "-framework Carbon"
        z
    )
endif()

if(WIN32)
    target_sources(Scrite PUBLIC
        3rdparty/sonnet/plugins/windows/windowsclient.cpp 3rdparty/sonnet/plugins/windows/windowsclient.h
        src/core/systemtextinputmanager_windows.cpp src/core/systemtextinputmanager_windows.h
    )

    target_include_directories(Scrite PRIVATE
        /QtZlib
    )

    target_compile_definitions(Scrite PRIVATE
        QUAZIP_STATIC
        SONNET_AVOID_HUNSPELL_CLIENT
    )

    target_link_libraries(Scrite PRIVATE
        Ole32.lib
        User32.lib
    )
endif()

if(linux-g++)
    target_sources(Scrite PUBLIC
        3rdparty/sonnet/config-hunspell.h
        3rdparty/sonnet/hunspelldebug.cpp 3rdparty/sonnet/hunspelldebug.h
    )

    target_include_directories(Scrite PRIVATE
        /usr/include/hunspell
    )

    target_link_libraries(Scrite PRIVATE
        Hunspell::Hunspell
        z
    )
endif()

install(TARGETS Scrite
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)


qt6_generate_deploy_qml_app_script(
    TARGET Scrite
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
    MACOS_BUNDLE_POST_BUILD
)
install(SCRIPT ${deploy_script})
