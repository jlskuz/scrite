# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritenotebook
    URI io.scrite.notebook
    GENERATE_PLUGIN_SOURCE
)

set(qml_singletons
    AddCharactersDialog.qml
    AddRelationshipDialog.qml
    RelationshipNameEditorDialog.qml
)

set_source_files_properties(${qml_singletons} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

ecm_target_qml_sources(scritenotebook
    SOURCES
        ${qml_singletons}
        CharacterRelationshipsGraphView.qml
        FormField.qml
        FormMenu.qml
        FormView.qml
        TextNoteView.qml
)

ecm_finalize_qml_module(scritenotebook DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
