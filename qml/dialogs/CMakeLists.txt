# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritedialogs
    URI io.scrite.dialogs
    GENERATE_PLUGIN_SOURCE
)

set(qml_singletons
        AboutDialog.qml
        BackupsDialog.qml
        CollaboratorsDialog.qml
        ExportConfigurationDialog.qml
        FontSelectionDialog.qml
        HomeScreen.qml
        MessageBox.qml
        PdfDialog.qml
        RenameCharacterDialog.qml
        ReportConfigurationDialog.qml
        SettingsDialog.qml
        SplashScreen.qml
        StructureIndexCardFieldsDialog.qml
        StructureStoryBeatsDialog.qml
        TitlePageDialog.qml
        UserAccountDialog.qml
        WaitDialog.qml
)

set_source_files_properties(${qml_singletons} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

ecm_target_qml_sources(scritedialogs
    SOURCES ${qml_singletons}
)

ecm_target_qml_sources(scritedialogs PRIVATE PATH homescreen
    SOURCES
        homescreen/HomeScreenImpl.qml
        homescreen/Poster.qml
)

ecm_target_qml_sources(scritedialogs PRIVATE PATH pdfdialog
    SOURCES
        pdfdialog/PdfDialogImpl.qml
)

ecm_target_qml_sources(scritedialogs PRIVATE PATH settingsdialog
    SOURCES
        settingsdialog/ApplicationOptionsPage.qml
        settingsdialog/ApplicationSettingsTab.qml
        settingsdialog/ApplicationThemePage.qml
        settingsdialog/LanguageFontsPage.qml
        settingsdialog/LanguageOptionsPage.qml
        settingsdialog/LanguageSettingsTab.qml
        settingsdialog/LanguageTransiliterationPage.qml
        settingsdialog/NotebookOptionsPage.qml
        settingsdialog/NotebookSettingsTab.qml
        settingsdialog/ScreenplayFormattingRulesPage.qml
        settingsdialog/ScreenplayOptionsPage.qml
        settingsdialog/ScreenplayPageSetupPage.qml
        settingsdialog/ScreenplaySettingsTab.qml
        settingsdialog/StructureIndexCardFieldsPage.qml
        settingsdialog/StructureOptionsPage.qml
        settingsdialog/StructureSettingsTab.qml
        settingsdialog/StructureStoryBeatsPage.qml
        settingsdialog/impl_SettingsDialog.qml
)

ecm_target_qml_sources(scritedialogs PRIVATE
    SOURCES
        exportconfigurationdialog/ex_editor_CheckBox.qml
        exportconfigurationdialog/ex_editor_IntegerSpinBox.qml
        exportconfigurationdialog/ex_editor_TextBox.qml
        exportconfigurationdialog/ex_editor_Unknown.qml
        exportconfigurationdialog/impl_ExportConfigurationDialog.qml

        reportconfigurationdialog/CharactersView.qml
        reportconfigurationdialog/editor_CheckBox.qml
        reportconfigurationdialog/editor_EnumSelector.qml
        reportconfigurationdialog/editor_IntegerSpinBox.qml
        reportconfigurationdialog/editor_MultipleCharacterNameSelector.qml
        reportconfigurationdialog/editor_MultipleEpisodeSelector.qml
        reportconfigurationdialog/editor_MultipleLocationSelector.qml
        reportconfigurationdialog/editor_MultipleSceneSelector.qml
        reportconfigurationdialog/editor_MultipleTagGroupSelector.qml
        reportconfigurationdialog/editor_TextBox.qml
        reportconfigurationdialog/editor_Unknown.qml
        reportconfigurationdialog/impl_ReportConfigurationDialog.qml

        useraccountdialog/AccountEmailScreen.qml
        useraccountdialog/JunctionScreen.qml
        useraccountdialog/PlanCard.qml
        useraccountdialog/ReloadUserScreen.qml
        useraccountdialog/UserProfileScreen.qml
        useraccountdialog/WelcomeScreen.qml
)

ecm_finalize_qml_module(scritedialogs DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
