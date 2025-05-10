# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritenotifications
    URI io.scrite.notifications
    GENERATE_PLUGIN_SOURCE
)

set(qml_singletons
    NotificationsLayer.qml
    NotificationsView.qml
)

set_source_files_properties(${qml_singletons} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

ecm_target_qml_sources(scritenotifications
    SOURCES
        ${qml_singletons}
)

ecm_finalize_qml_module(scritenotifications DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
