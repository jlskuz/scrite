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

pragma Singleton

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import io.scrite.components

import io.scrite.main as Utils
import io.scrite.helpers
import io.scrite.globals
import io.scrite.controls

import './settingsdialog' as P


DialogLauncher {
    id: root

    function launch() { return doLaunch() }

    name: "StructureIndexCardFieldsDialog"
    singleInstanceOnly: true

    dialogComponent: VclDialog {
        id: dialog

        title: "Customise Index Card Fields"
        width: Math.min(Scrite.window.width-80, 1050)
        height: Math.min(Scrite.window.height-80, 750)

        content: PageView {
            id: pageView
            pagesArray: ["This Document", "Default Global"]
            currentIndex: 0
            pageContent: Loader {
                width: pageView.availablePageContentWidth
                height: pageView.availablePageContentHeight
                sourceComponent: pageView.currentIndex === 0 ? thisDocumentPage : defaultGlobalPage
            }
        }
    }

    Component {
        id: thisDocumentPage

        P.StructureIndexCardFieldsPage {
            target: e_CurrentDocumentTarget
        }
    }

    Component {
        id: defaultGlobalPage

        P.StructureIndexCardFieldsPage {
            target: e_DefaultGlobalTarget
        }
    }

    QtObject {
        id: _private

        property VclDialog dialog
    }
}
