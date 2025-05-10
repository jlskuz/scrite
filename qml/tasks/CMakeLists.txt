# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritetasks
    URI io.scrite.tasks
    GENERATE_PLUGIN_SOURCE
)

ecm_target_qml_sources(scritetasks
    SOURCES
    OpenFileTask.qml
    OpenFromLibraryTask.qml
    SaveFileTask.qml
)

ecm_finalize_qml_module(scritetasks DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
