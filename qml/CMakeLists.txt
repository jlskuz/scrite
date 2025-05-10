# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

add_subdirectory(controls)
add_subdirectory(structure)
add_subdirectory(helpers)
add_subdirectory(dialogs)
add_subdirectory(tasks)
add_subdirectory(notebook)
add_subdirectory(notifications)
add_subdirectory(floatingdockpanels)
add_subdirectory(overlays)
add_subdirectory(screenplay)
add_subdirectory(scrited)
add_subdirectory(globals)

ecm_add_qml_module(scritemain
    URI io.scrite.main
    GENERATE_PLUGIN_SOURCE
)

ecm_target_qml_sources(scritemain
    SOURCES
        js/utils.js
        Main.qml
        NotebookView.qml
        ScreenplayEditor.qml
        ScriteMainWindow.qml
        ScritedView.qml
        StructureView.qml
        TimelineView.qml
)

ecm_finalize_qml_module(scritemain DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
