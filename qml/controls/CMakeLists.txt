# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

ecm_add_qml_module(scritecontrols
    URI io.scrite.controls
    GENERATE_PLUGIN_SOURCE
)

ecm_target_qml_sources(scritecontrols
    SOURCES
    VclButton.qml
    VclCheckBox.qml
    VclComboBox.qml
    VclDialog.qml
    VclFileDialog.qml
    VclGroupBox.qml
    VclLabel.qml
    VclMenu.qml
    VclMenuItem.qml
    VclRadioButton.qml
    VclScrollBar.qml
    VclText.qml
    VclTextField.qml
    VclToolButton.qml
)

ecm_finalize_qml_module(scritecontrols DESTINATION ${KDE_INSTALL_QMLDIR})

# install(TARGETS scritecontrols ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
