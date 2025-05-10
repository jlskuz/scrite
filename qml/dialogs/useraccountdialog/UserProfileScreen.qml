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

import QtQml 2.15
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import io.scrite.components 1.0

import io.scrite.main as Utils
import io.scrite.globals
import io.scrite.controls
import io.scrite.helpers
import io.scrite.dialogs

Item {
    id: root

    property bool modal: !Scrite.user.info.hasActiveSubscription
    property string title: {
        if(Scrite.user.loggedIn) {
            if(Scrite.user.info.firstName && Scrite.user.info.firstName !== "")
                return "Hi, " + Scrite.user.info.firstName + "."
            if(Scrite.user.info.lastName && Scrite.user.info.lastName !== "")
                return "Hi, " + Scrite.user.info.lastName + "."
        }
        return "Hi, there."
    }

    Component.onCompleted: {
        if(Scrite.user.loggedIn)
            Runtime.showHelpTip("UserProfileDialog")
    }

    PageView {
        id: userProfilePageView
        anchors.fill: parent

        Announcement.onIncoming: (type, data) => {
                                     if(type === Runtime.announcementIds.userProfileScreenPage) {
                                         currentIndex = Math.max(0, pagesArray.indexOf(data))
                                     }
                                 }

        pagesArray: ["Profile", "Subscriptions", "Installations", "Notifications"]
        currentIndex: Scrite.user.loggedIn && Scrite.user.info.hasActiveSubscription ? 0 : 1
        maxPageListWidth: {
            if(pagesArray.length < 2)
                return 120

            let textMetrics = Qt.createQmlObject("import QtQuick 2.15; TextMetrics { }", userProfilePageView)
            textMetrics.font.pointSize = Runtime.idealFontMetrics.font.pointSize
            textMetrics.text = ( () => {
                                    const options = pagesArray
                                    let ret = ""
                                    options.forEach( (option) => {
                                                        if(option.length > ret.length)
                                                        ret = option
                                                    })
                                    return ret
                                })()

            const ret = textMetrics.advanceWidth + 50
            textMetrics.destroy()

            return ret
        }
        pageContent: {
            switch(userProfilePageView.currentIndex) {
            case 1: return userSubscriptionsPageComponent
            case 2: return userInstallationsPageComponent
            case 3: return userNotificationsPageComponent
            default: break
            }
            return userProfilePageComponent
        }
        onPageContentItemChanged: {
            if(userProfilePageView.currentIndex !== 1)
                pageContentItem.height = availablePageContentHeight
        }
        cornerContent: Item {
            Image {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter

                width: parent.width-20

                source: "qrc:/images/scrite_discord_button.png"
                fillMode: Image.PreserveAspectFit
                enabled: visible
                mipmap: true

                MouseArea {
                    anchors.fill: parent

                    ToolTip.text: "Ask questions, post feedback, request features and connect with other Scrite users."
                    ToolTip.visible: containsMouse
                    ToolTip.delay: 1000

                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                    onClicked: Qt.openUrlExternally("https://www.scrite.io/forum/")
                }
            }
        }
    }

    Component {
        id: userProfilePageComponent

        Item {
            id: userProfilePage

            property var userInfo: Scrite.user.info
            property RestApiCallList callList : RestApiCallList {
                calls: [refreshUserCall, deactivateDeviceCall, saveUserCall]
            }

            TabSequenceManager {
                id: userInfoFields

                property bool needsSaving: false
            }

            Connections {
                target: Scrite.user

                function onBusyChanged() { userInfoFields.needsSaving = false }
            }

            ColumnLayout {
                id: layout

                anchors.fill: parent
                anchors.margins: 20
                anchors.leftMargin: 0

                spacing: 20
                opacity: enabled ? 1 : 0.5
                enabled: !userProfilePage.callList.busy

                VclLabel {
                    Layout.fillWidth: true

                    text: "You're logged in via <b>" + userProfilePage.userInfo.email + "</b>."
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                VclTextField {
                    id: nameField

                    Layout.fillWidth: true

                    TabSequenceItem.manager: userInfoFields
                    TabSequenceItem.sequence: 0

                    text: userProfilePage.userInfo.fullName
                    maximumLength: 128
                    placeholderText: "Name"
                    undoRedoEnabled: true

                    onTextEdited: userInfoFields.needsSaving = true
                }

                VclTextField {
                    id: experienceField

                    Layout.fillWidth: true

                    TabSequenceItem.manager: userInfoFields
                    TabSequenceItem.sequence: 1

                    text: userProfilePage.userInfo.experience
                    maximumLength: 128
                    maxVisibleItems: 6
                    placeholderText: "Experience"
                    undoRedoEnabled: true
                    completionStrings: [
                        "Hobby Writer",
                        "Actively Pursuing a Writing Career",
                        "Working Writer",
                        "Have Produced Credits"
                    ]
                    maxCompletionItems: -1
                    minimumCompletionPrefixLength: 0

                    onTextEdited: userInfoFields.needsSaving = true
                }

                RowLayout {
                    Layout.fillWidth: true

                    VclTextField {
                        id: cityField

                        Layout.fillWidth: true

                        TabSequenceItem.manager: userInfoFields
                        TabSequenceItem.sequence: 2

                        text: userProfilePage.userInfo.city
                        maximumLength: 128
                        placeholderText: "City"
                        undoRedoEnabled: true

                        onTextEdited: userInfoFields.needsSaving = true
                    }

                    VclTextField {
                        id: countryField

                        Layout.fillWidth: true

                        placeholderText: "Country"
                        text: userProfilePage.userInfo.country
                        readOnly: true
                    }
                }

                VclTextField {
                    id: wdyhasField

                    Layout.fillWidth: true

                    TabSequenceItem.manager: userInfoFields
                    TabSequenceItem.sequence: 3

                    text: userProfilePage.userInfo.wdyhas
                    placeholderText: "Where did you hear about Scrite?"
                    maximumLength: 128
                    completionStrings: [
                        "Facebook",
                        "Reddit",
                        "YouTube",
                        "Film School",
                        "Film Workshop",
                        "Instagram",
                        "Recommended by Friend",
                        "Existing Scrite User",
                        "LinkedIn",
                        "Twitter",
                        "Google Search"
                    ]
                    minimumCompletionPrefixLength: 0
                    maxCompletionItems: -1
                    maxVisibleItems: 6
                    undoRedoEnabled: true

                    onTextEdited: userInfoFields.needsSaving = true
                }

                RowLayout {
                    Layout.fillWidth: true

                    spacing: 25

                    VclCheckBox {
                        id: chkAnalyticsConsent

                        TabSequenceItem.manager: userInfoFields
                        TabSequenceItem.sequence: 4

                        text: "Send analytics data."
                        checked: userProfilePage.userInfo.consentToActivityLog
                        padding: 0

                        onToggled: userInfoFields.needsSaving = true
                    }

                    VclCheckBox {
                        id: chkEmailConsent

                        TabSequenceItem.manager: userInfoFields
                        TabSequenceItem.sequence: 5

                        text: "Send marketing email."
                        checked: userProfilePage.userInfo.consentToEmail
                        padding: 0

                        onToggled: userInfoFields.needsSaving = true
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                StackLayout {
                    currentIndex: userInfoFields.needsSaving ? 1 : 0

                    Layout.fillWidth: true

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: 20

                        VclButton {
                            text: "Refresh"
                            onClicked: refreshUserCall.call()

                            UserMeRestApiCall {
                                id: refreshUserCall
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        VclButton {
                            text: "Logout"

                            onClicked: deactivateDeviceCall.call()

                            InstallationDeactivateRestApiCall {
                                id: deactivateDeviceCall

                                onFinished: {
                                    if(!hasError)
                                        Announcement.shout(Runtime.announcementIds.userAccountDialogScreen, "AccountEmailScreen")
                                }
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        spacing: 20

                        Item {
                            Layout.fillWidth: true
                        }

                        VclButton {
                            text: "Save"

                            onClicked: {
                                var names = nameField.text.trim().split(' ')

                                const _lastName = names.length > 1 ? names[names.length-1] : ""
                                if(names.length > 1)
                                    names.pop()
                                const _firstName = names.join(" ")
                                const locale = Scrite.locale

                                const newInfo = {
                                    firstName: _firstName,
                                    lastName: _lastName,
                                    experience: experienceField.text.trim(),
                                    city: cityField.text.trim(),
                                    country: locale.country.name,
                                    currency: locale.currency.code,
                                    wdyhas: wdyhasField.text.trim(),
                                    consentToActivityLog: chkAnalyticsConsent.checked,
                                    consentToEmail: chkEmailConsent.checked,
                                }

                                saveUserCall.updatedFields = newInfo
                                saveUserCall.call()
                            }

                            UserMeRestApiCall {
                                id: saveUserCall
                                onFinished: {
                                    updatedFields = {}
                                    userInfoFields.needsSaving = false
                                }
                            }
                        }
                    }
                }
            }

            BusyIndicator {
                anchors.centerIn: parent

                running: userProfilePage.callList.busy
            }
        }
    }

    Component {
        id: userNotificationsPageComponent

        Item {
            id: userNotificationsPage

            height: userProfilePageView.availablePageContentHeight

            Component.onDestruction: Scrite.user.markMessagesAsRead()

            VclLabel {
                anchors.centerIn: parent

                visible: Scrite.user.totalMessageCount === 0

                text: "There are no notifications for you at the moment."
            }

            ListView {
                id: userMessagesView

                anchors.fill: parent

                ScrollBar.vertical: VclScrollBar { }
                FlickScrollSpeedControl.factor: Runtime.workspaceSettings.flickScrollSpeedFactor

                clip: true
                height: parent.height
                visible: Scrite.user.totalMessageCount > 0

                model: Scrite.user.messages
                spacing: 20
                boundsBehavior: Flickable.StopAtBounds

                header: VclLabel {
                    width: userMessagesView.width
                    padding: 10

                    font.bold: true
                    font.pointSize: Runtime.idealFontMetrics.font.pointSize + 2

                    text: {
                        const nrUnread = Scrite.user.unreadMessageCount
                        const nrMessages = Scrite.user.totalMessageCount

                        if(nrMessages === 0) {
                            return "You have no notifications right now."
                        }

                        if(nrUnread > 0) {
                            if(nrUnread === nrMessages)
                                return "You have " + nrUnread + " unread notification" + (nrUnread > 1 ? "s" : "") + "."
                            else
                                return "You have " + nrUnread + " of " + nrMessages + " unread notification" + (nrMessages > 1 ? "s" : "") + "."
                        }

                        return "You have " + nrMessages + " notification" + (nrMessages > 1 ? "s" : "") + "."
                    }

                    wrapMode: Text.WordWrap
                }

                footer: Item {
                    width: userMessagesView.width
                    height: 20
                }

                delegate: Item {
                    required property var modelData

                    width: userMessagesView.width
                    height: messageRect.height

                    Rectangle {
                        id: messageRect

                        anchors.centerIn: parent

                        width: 450
                        height: messageLayout.implicitHeight + 30
                        border {
                            width: modelData.read ? 1 : 2
                            color: Runtime.colors.primary.borderColor
                        }

                        color: Runtime.colors.primary.c200.background

                        ColumnLayout {
                            id: messageLayout

                            anchors.centerIn: parent

                            width: parent.width - 20
                            spacing: 10

                            VclLabel {
                                Layout.fillWidth: true

                                text: Utils.formatDateIncludingYear(modelData.timestamp)
                                color: Runtime.colors.primary.c200.text
                                opacity: 0.75
                                font.pointSize: Runtime.minimumFontMetrics.font.pointSize
                            }

                            VclLabel {
                                Layout.fillWidth: true

                                text: modelData.subject
                                color: Runtime.colors.primary.c200.text
                                wrapMode: Text.WordWrap
                                font.bold: true
                                font.pointSize: Runtime.idealFontMetrics.font.pointSize
                            }

                            Image {
                                Layout.fillWidth: true
                                Layout.preferredHeight: sourceSize.height * (width/sourceSize.width)

                                source: modelData.image
                                mipmap: true
                                visible: source !== ""
                                fillMode: Image.PreserveAspectFit

                                MouseArea {
                                    anchors.fill: parent

                                    enabled: buttonsRepeater.count === 1
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: buttonsRepeater.itemAt(0).handleClick()
                                }
                            }

                            VclLabel {
                                Layout.fillWidth: true

                                text: modelData.body
                                color: Runtime.colors.primary.c200.text
                                wrapMode: Text.WordWrap
                                font.pointSize: Runtime.idealFontMetrics.font.pointSize
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 1

                                color: Runtime.colors.primary.borderColor
                            }

                            Repeater {
                                id: buttonsRepeater
                                model: modelData.buttons

                                Link {
                                    required property var modelData

                                    Layout.fillWidth: true

                                    padding: 4
                                    text: modelData.text
                                    horizontalAlignment: Text.AlignHCenter

                                    function handleClick() {
                                        if(modelData.action === UserMessageButton.UrlAction) {
                                            Qt.openUrlExternally(modelData.endpoint)
                                            return
                                        }

                                        if(modelData.action === UserMessageButton.CommandAction) {
                                            switch(modelData.endpoint) {
                                            case "$subscribe":
                                                Announcement.shout(Runtime.announcementIds.userProfileScreenPage, "Subscriptions")
                                                return
                                            case "$profile":
                                                Announcement.shout(Runtime.announcementIds.userProfileScreenPage, "Profile")
                                                return
                                            case "$installations":
                                                Announcement.shout(Runtime.announcementIds.userProfileScreenPage, "Installations")
                                                return
                                            case "$homescreen":
                                                HomeScreen.launch()
                                                return
                                            }
                                        }

                                        // Implement API and Code in a future update
                                        enabled = false
                                    }

                                    onClicked: handleClick()
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: userInstallationsPageComponent

        Item {
            id: userInstallationsPage

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                anchors.leftMargin: 0

                spacing: 10

                VclLabel {
                    Layout.fillWidth: true

                    wrapMode: Text.WordWrap
                    text: "Installations of Scrite linked to your account:"
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    enabled: !deactivateOtherCall.busy && !Scrite.user.busy
                    opacity: enabled ? 1 : 0.5

                    color: Runtime.colors.primary.c10.background
                    border.width: 1
                    border.color: Runtime.colors.primary.borderColor

                    ListView {
                        id: installationsView

                        anchors.fill: parent
                        anchors.margins: 1

                        ScrollBar.vertical: VclScrollBar {
                            flickable: installationsView
                        }

                        clip: true
                        model: Scrite.user.info.installations
                        spacing: 20
                        currentIndex: -1

                        highlight: Rectangle {
                            color: Runtime.colors.primary.highlight.background
                        }
                        highlightMoveDuration: 0
                        highlightResizeDuration: 0

                        delegate: Item {
                            required property int index
                            required property var modelData

                            width: installationsView.width
                            height: installationsViewDelegateLayout.height + 20

                            MouseArea {
                                anchors.fill: parent
                                onClicked: installationsView.currentIndex = index
                            }

                            RowLayout {
                                id: installationsViewDelegateLayout

                                anchors.centerIn: parent

                                width: parent.width-10

                                ColumnLayout {
                                    Layout.fillWidth: true

                                    spacing: 5

                                    VclLabel {
                                        Layout.fillWidth: true

                                        font.bold: modelData.isCurrent
                                        text: modelData.platform + " " + modelData.platformVersion + " (" + modelData.platformType + ")"
                                        elide: Text.ElideRight
                                    }

                                    VclLabel {
                                        Layout.fillWidth: true

                                        text: "Runs Scrite " + modelData.appVersion
                                        elide: Text.ElideRight
                                    }

                                    VclLabel {
                                        Layout.fillWidth: true

                                        text: "Since: " + Scrite.app.relativeTime(new Date(modelData.creationDate))
                                        elide: Text.ElideRight
                                    }

                                    VclLabel {
                                        Layout.fillWidth: true

                                        text: "Last Login: " + Scrite.app.relativeTime(new Date(modelData.lastSessionDate))
                                        elide: Text.ElideRight
                                    }
                                }

                                FlatToolButton {
                                    id: logoutButton
                                    iconSource: "qrc:/icons/action/logout.png"
                                    enabled: modelData.activated && !modelData.isCurrent
                                    opacity: enabled ? 1 : 0.2
                                    onClicked: {
                                        deactivateOtherCall.installationId = modelData.id
                                        deactivateOtherCall.call()
                                    }
                                }
                            }
                        }
                    }

                    BusyIndicator {
                        anchors.centerIn: parent
                        running: deactivateOtherCall.busy || Scrite.user.busy
                    }
                }
            }

            InstallationDeactivateOtherRestApiCall {
                id: deactivateOtherCall
            }
        }
    }
}
