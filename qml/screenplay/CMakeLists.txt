# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritescreenplay
    URI io.scrite.screenplay
    GENERATE_PLUGIN_SOURCE
)

ecm_target_qml_sources(scritescreenplay
    SOURCES
        PageNumberBubble.qml
        ScreenplayBreakElementsContextMenu.qml
        ScreenplayEditorToolbar.qml
        ScreenplaySceneElementsContextMenu.qml
)

ecm_finalize_qml_module(scritescreenplay DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
