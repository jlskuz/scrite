# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritefloatingdockpanels
    URI io.scrite.floatingdockpanels
    GENERATE_PLUGIN_SOURCE
)

set(qml_singletons
    FloatingDockLayer.qml
    FloatingShortcutsDock.qml
    FloatingMarkupToolsDock.qml
)

set_source_files_properties(${qml_singletons} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

ecm_target_qml_sources(scritefloatingdockpanels
    SOURCES
        ${qml_singletons}
        FloatingDock.qml
)

ecm_finalize_qml_module(scritefloatingdockpanels DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
