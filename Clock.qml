import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 2.15

ApplicationWindow {
  visible: true
  width: 400
  height: 400
  title: "Analog Clock"

  function updateTime() {
    var now = new Date()
    var hours = now.getHours() % 12
    var minutes = now.getMinutes()
    var seconds = now.getSeconds()

    // Update clock hands' angles
    hourHand.rotation = (hours * 360 / 12) + (minutes * 360 / 60 / 12)
    minuteHand.rotation = (minutes * 360 / 60) + (seconds * 360 / 60 / 60)
    secondHand.rotation = (seconds * 360 / 60)
  }

  Rectangle {
    id: clockFace
    width: parent.width
    height: parent.height
    color: "lightgray"

    Timer {
      interval: 1000 // Update every second
      running: true
      repeat: true
      onTriggered: updateTime()
    }

    Rectangle {
      id: hourHand
      width: 8
      height: parent.width / 2
      color: "black"
      transformOrigin: Item.Top
      anchors.centerIn: parent

      Rectangle {
        width: 4
        height: parent.width / 2 - 20
        color: "black"
        anchors.centerIn: parent
      }
    }

    Rectangle {
      id: minuteHand
      width: 4
      height: parent.width / 2
      color: "black"
      transformOrigin: Item.Top
      anchors.centerIn: parent

      Rectangle {
        width: 2
        height: parent.width / 2 - 20
        color: "black"
        anchors.centerIn: parent
      }
    }

    Rectangle {
      id: secondHand
      width: 2
      height: parent.width / 2 - 20
      color: "red"
      transformOrigin: Item.Top
      rotation: 0
      anchors.centerIn: parent
    }
  }
}
