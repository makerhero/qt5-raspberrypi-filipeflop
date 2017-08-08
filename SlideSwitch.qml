/*  SlideSwitch.qml
    arquivo responsvel por montar a chave liga/desliga
    carrega as imagens necessarias e executa as animaçoes da chave
    comunica com o BackEnd C++ para ligar/desligar o LED
*/

import QtQuick 2.0
import BackEnd 1.0

Item {
    id: btnContainer
    scale: 0.20
    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: 125
    anchors.horizontalCenter: parent.horizontalCenter

    // declara componente para comunicacao com C++
    BackEnd {
        id: backend
    }

    // carrega a imagem do estado da chave desligada
    Image {
        id: btnOffState
        source: "images/off-state.png"
        anchors.centerIn: parent
        opacity: 1
        // estados e transicao da chave em estado OFF mudando a opacidade de 1 para 0 quando a chave e ligada
        states : State {
            name: "off";
            PropertyChanges { target: btnOffState; opacity: 0 }
        }
        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 250 }
        }
        // carrega a imagem com texto "OFF"
        Image {
            id: offtext
            source: "images/off-text.png"
            anchors.verticalCenter: btnOffState.verticalCenter
            anchors.horizontalCenter: btnOffState.horizontalCenter
            anchors.horizontalCenterOffset: 275
        }
    }
    // carrega a imagem do estado da chave ligada
    Image {
        id: btnOnState
        source: "images/on-state.png"
        anchors.centerIn: parent
        opacity: 0
        // estados e transicao da chave em estado ON mudando a opacidade de 0 para 1 quando a chave e desligada
        states : State {
            name: "on";
            PropertyChanges { target: btnOnState; opacity: 1 }
        }
        transitions: Transition {
            NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 250 }
        }
        // carrega a imagem com texto ON
        Image {
            id: onText
            source: "images/on-text.png"
            anchors.verticalCenter: btnOnState.verticalCenter
            anchors.horizontalCenter: btnOnState.horizontalCenter
            anchors.horizontalCenterOffset: -275
        }
    }

    // carrega a imagem do circulo da chave
    Image {
        id: btnHandle
        source: "images/switch-handle.png"
        anchors.verticalCenter: btnContainer.verticalCenter
        anchors.horizontalCenter: btnContainer.horizontalCenter
        anchors.horizontalCenterOffset: -325
        // estados e transiçao com animacao do circulo da chave de um lado para outro
        states : State {
            name: "right";
            PropertyChanges { target: btnHandle; anchors.horizontalCenterOffset: 325 }
        }
        transitions: Transition {
            NumberAnimation { properties: "anchors.horizontalCenterOffset"; easing.type: Easing.InOutQuad; duration: 225 }
        }
        // area de interacao com o mouse para detectar cliques no circulo da chave
        MouseArea {
            anchors.fill: parent
            onClicked: {
                // se estado da chave e default(desligado), mudar estado para ON, mover o circulo para direita e enviar sinal para sistema ligando LED
                if (btnOnState.state == '') {
                    btnOnState.state = "on"
                    btnHandle.state = "right"
                    backend.btnStatus = 1
                    console.log("chave ligada (ON)")
                }
                // se nao, se estado e ON, colocar a chave em estado default(desligado), retornar o circulo da chave para esquerda, enviar sinal para sistema desligar LED
                else {
                    btnOnState.state = ''
                    btnHandle.state = ''
                    backend.btnStatus = 0
                    console.log("chave desligada (OFF)")
                }
                if (btnOffState.state == '') {
                    btnOffState.state = "off"
                }
                else btnOffState.state = ''
            }
        }
    }
}
