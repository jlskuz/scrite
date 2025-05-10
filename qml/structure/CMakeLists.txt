# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritestructure
    URI io.scrite.structure
    GENERATE_PLUGIN_SOURCE
)

set_source_files_properties(AnnotationPropertyEditorDock.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

ecm_target_qml_sources(scritestructure
    SOURCES
    AnnotationItem.qml
    AnnotationPropertyEditor.qml
    AnnotationPropertyEditorDock.qml
    IndexCardFields.qml
    StructureGroupsMenu.qml
)

ecm_finalize_qml_module(scritestructure DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritestructure ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
