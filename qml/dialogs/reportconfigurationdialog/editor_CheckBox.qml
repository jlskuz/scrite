/****************************************************************************
**
** Copyright (C) VCreate Logic Pvt. Ltd. Bengaluru
** Author: Prashanth N Udupa (prashanth@scrite.io)
**
** This code is distributed under GPL v3. Complete text of the license
** can be found here: https://www.gnu.org/licenses/gpl-3.0.txt
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import io.scrite.components 1.0

import io.scrite.main as Utils
import io.scrite.globals
import io.scrite.controls
import io.scrite.helpers

VclCheckBox {
    property var fieldInfo
    property AbstractReportGenerator report

    checked: report ? report.getConfigurationValue(fieldInfo.name) : false
    checkable: true
    font.pointSize: Runtime.idealFontMetrics.font.pointSize

    text: fieldInfo.label

    onToggled: report ? report.setConfigurationValue(fieldInfo.name, checked) : false
}
