/* main.qml
 * arquivo principal responsavel por posicionar os elementos na tela e montar a parte grafica da aplicaçao
 */

import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 800; height: 480
    // descomente a seguinte linha se quiser a aplicaço em tela cheia
    visibility: "FullScreen"

    // adiciona o fundo com os logos da Filipeflop, Qt e Raspberry
    Background {}

    // adiciona o SlideSwitch
    SlideSwitch {}

    // MouseArea para esconder o cursor do mouse
    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: Qt.BlankCursor
    }
}
