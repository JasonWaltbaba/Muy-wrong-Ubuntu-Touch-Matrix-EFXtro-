import QtQuick 2.2
import QtQuick.Controls 2.2


ApplicationWindow {
visible: true
width: 640
height: 480
title: "Matrix Effect"


Rectangle {
anchors.fill: parent
color: "black"


property int numColumns: Math.floor(width / 20)


property var drops: []


Component.onCompleted: {
for (var i = 0; i < numColumns; i++) {
drops.push({y: Math.random() * height, symbol: String.fromCharCode(0x30A0 + Math.random() * 96)});
}
startAnimation();
}


function startAnimation() {
Timer { 100
interval: 100
running: true
repeat: true
onTriggered: {
for (var i = 0; i < drops.length; i++) {
drops[i].y += 20; // Двигаем символ вниз
if (drops[i].y > height) {
drops[i].y = 0; // 
drops[i].symbol = String.fromCharCode(0x30A0 + Math.random() * 96);
}
}
}
}



Canvas {
anchors.fill: parent


onPaint: {
var ctx = getContext("2d");
ctx.fillStyle = "rgba(0, 0, 0, 0.9)";
ctx.fillRect(0, 0, width, height); // Черный фон


ctx.fillStyle = "green"; // Цвет символов
ctx.font = "20px monospace";


for (var i = 0; i < drops.length; i++) {
ctx.fillText(drops[i].symbol, i * 20, drops[i].y);
}
}
