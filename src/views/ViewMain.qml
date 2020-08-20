import QtQuick 2.0
import QtQuick.Controls 2.15
import Mozilla.VPN 1.0

Item {
    Image {
        id: settingsImage
        height: 16
        width: 16
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 16
        anchors.rightMargin: 16
        source: "../resources/settings.svg"

        MouseArea {
            anchors.fill: parent
            onClicked: stackview.push("ViewSettings.qml")
        }
    }

    Image {
        id: logo
        x: 100
        y: 70
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../resources/logo.png"
    }

    Text {
        id: logoTitle
        x: 168
        text: qsTr("VPN is off")
        font.family: vpnFont.name
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 205
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: logo.horizontalCenter
        font.pixelSize: 18
    }

    Text {
        id: logoSubtitle
        x: 169
        y: 255
        text: qsTr("Turn on to protect your privacy")
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
        font.family: vpnFont.name
    }

    Switch {
        id: element
        x: 283
        y: 294
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: VPN.activate()
    }

    RoundButton {
        x: 130
        y: 347
        width: 282
        height: 40
        text: qsTr("Devices") + " "+ VPN.activeDevices + "/"+ VPN.user.maxDevices
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.weight: Font.ExtraLight
        enabled: true
        focusPolicy: Qt.NoFocus
        radius: 5
        onClicked: stackview.push("ViewDevices.qml")
    }

    RoundButton {
        x: 130
        y: 400
        width: 282
        height: 40
        text: qsTr("Servers")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.weight: Font.ExtraLight
        enabled: true
        focusPolicy: Qt.NoFocus
        radius: 5
        onClicked: stackview.push("ViewServers.qml")
    }
}
