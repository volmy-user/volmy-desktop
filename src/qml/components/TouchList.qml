// Copyright (c) 2013 Artem Andreenko <mio@volmy.com>

// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import QtQuick 2.1

Rectangle {
    color: "#eee"
    function addItem(name, desc, url)
    {
        model.append({"name":name, "description":desc, "url":url})
    }
    function hideItem()
    {
        ei.visible = false;
    }

    ListView {
        clip: true
        delegate: TouchListDelegate{item: ei}
        model: ListModel {id: model}
        anchors.fill: parent
    }

    Item {
        id: ei
        visible: false
        clip: true
        property url url
        onUrlChanged: visible = (url == '' ? false : true);
        anchors.fill: parent
        anchors.topMargin: 40
        Rectangle {
            id: bg
            anchors.fill: parent
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            enabled: ei.visible
        }
        Loader{
            focus: true
            source: ei.url
            anchors.fill: parent
        }
    }
    Rectangle {
        id: bar
        visible: ei.visible
        anchors.top : parent.top
        width: parent.width
        height: 40

        Rectangle {
            height: 1
            color: "#ccc"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Rectangle {
            height: 1
            color: "#fff"
            anchors.top: parent.top
            anchors.topMargin: 1
            anchors.left: parent.left
            anchors.right: parent.right
        }

        gradient: Gradient {
            GradientStop { position: 0 ; color: "#eee" }
            GradientStop { position: 1 ; color: "#ccc" }
        }

        MouseArea{
            anchors.fill: parent
            enabled: ei.visible
        }

        Image {
            id: back
            source: "images/back.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 2
            anchors.left: parent.left
            anchors.leftMargin: 16

            MouseArea {
                id: mouse
                hoverEnabled: true
                anchors.centerIn: parent
                width: 38
                height: 31
                anchors.verticalCenterOffset: -1
                onClicked: ei.url = ""
                Rectangle {
                    anchors.fill: parent
                    opacity: mouse.pressed ? 1 : 0
                    Behavior on opacity { NumberAnimation{ duration: 100 }}
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: "#22000000" }
                        GradientStop { position: 0.2 ; color: "#11000000" }
                    }
                    border.color: "darkgray"
                    antialiasing: true
                    radius: 4
                }
            }
        }
    }
}
