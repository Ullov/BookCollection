import QtQuick 2.0
import "qrc:/qml/QmlIncludes" as KTools

Rectangle {
    id: root
    anchors.fill: parent
    color: "Gray"

    SearchSelectors {
        id: searchOptions
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
    Rectangle {
        id: searchRect
        anchors.left: searchOptions.right
        anchors.top: parent.top
        anchors.right: parent.right
        height: 130
        Rectangle {
            anchors.centerIn: parent
            height: textInput.height
            width: textInput.width + 5 + searchButton.width
            clip: true
            KTools.InputLine {
                id: textInput
                text: ""
                placeholderText: "Search keywords"
            }
            KTools.Button {
                id: searchButton
                anchors.left: textInput.right
                anchors.verticalCenter: textInput.verticalCenter
                anchors.margins: 5
                height: textInput.height
                text: "Search"
            }
        }
    }
}
