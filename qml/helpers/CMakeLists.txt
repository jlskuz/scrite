# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritehelpers
    URI io.scrite.helpers
    GENERATE_PLUGIN_SOURCE
)

ecm_target_qml_sources(scritehelpers
    SOURCES
        AlphabetMappings.qml
        AttachmentsDropArea.qml
        AttachmentsView.qml
        BoxShadow.qml
        BusyIcon.qml
        BusyOverlay.qml
        CheckListView.qml
        ColorMenu.qml
        ColorToolButton.qml
        DialogLauncher.qml
        DisabledFeatureNotice.qml
        FileSelector.qml
        FlatToolButton.qml
        FlickableTextArea.qml
        Link.qml
        LodLoader.qml
        MarkSceneAsMenu.qml
        MenuLoader.qml
        PageView.qml
        PdfView.qml
        RectangleTabView.qml
        RubberBand.qml
        SceneFeaturedImage.qml
        SceneTypeImage.qml
        ScrollArea.qml
        SearchBar.qml
        Selection.qml
        SidePanel.qml
        SimpleToolButton.qml
        SpecialSymbolsSupport.qml
        SpellingSuggestionsMenu.qml
        TagText.qml
        TextAreaInput.qml
        TextAreaSpellingSuggestionsMenu.qml
        TextTabBar.qml
        TextViewEdit.qml
        TrapeziumTabView.qml
        UiElementHighlight.qml
        UserAccountToolButton.qml
        ZoomSlider.qml
)

ecm_finalize_qml_module(scritehelpers DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritehelpers ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
