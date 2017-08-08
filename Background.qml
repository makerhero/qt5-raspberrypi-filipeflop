/*  Background.qml
    arquivo resposavel por carregar o fudo de tela
    com os logos da Filipeflop, Raspberry e Qt
*/

import QtQuick 2.0

Item {
    id: backgroundContainer
    anchors.fill: parent
    Image {
        id: background
        source: "images/background.png"
        anchors.fill: parent
    }
}
