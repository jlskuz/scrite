# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritescrited
    URI io.scrite.scrited
    GENERATE_PLUGIN_SOURCE
)

ecm_target_qml_sources(scritescrited
    SOURCES
        ScritedToolbar.qml
)

ecm_finalize_qml_module(scritescrited DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
