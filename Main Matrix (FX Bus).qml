import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
Window {
    visible: true
    width: 360
    height: 640
    color: "black"

    property int columns: Math.floor(width / 20)

  
    ListModel {
        id: dropsModel
        Component.onCompleted: {
            for (var i = 0; i < columns; i++) {
                append({"position": Math.random() * height, "width": 20, "char": String.fromCharCode(Math.floor(Math.random() * 94) + 33)});
            }
        }
    }

    Timer {
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            for (var i = 0; i < dropsModel.count; i++) {
                var drop = dropsModel.get(i);
                drop.position += 20; // скорость падения
                if (drop.position > height) {
                    drop.position = 0; // сброс в начало
                    drop.char = String.fromCharCode(Math.floor(Math.random() * 94) + 33); // р
                }
                dropsModel.set(i, drop);
            }
        }
    }

   
    Repeater {
        model: dropsModel
        Rectangle {
            width: model.width
            height: model.width * 1.5
            color: "transparent"
            Text {
                text: model.char
                font.pixelSize: model.width
                color: "green"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                opacity: 0.8
            }
            anchors.verticalOffset: model.position
        }
    }
}
