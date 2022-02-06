import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "qrc:/qml/QmlIncludes" as KTools
import "Search"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image Collection")
    color: "Gray"
    visibility: "Maximized"

    SearchWindow {

    }
}
