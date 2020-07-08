import QtQuick 2.0
import Felgo 3.0
Scene{
    id:main_root
    width: global.cellWidth*24
    height: table.height+global.cellHeight*2
    Global{
        id:global
        onGetNewShapeInfo:  {

            showNext.creatNextShape(cur,left,top);
        }
    }
    Global2{
        id:global2
    }

    WholeArray{
        id:wholeTableArray
    }
    WholeArray2{
        id:wholeTableArray2
    }

    Rectangle{
        id:table
        width: frame.width*2+global.tableFrameBorderWidth*4
        height: frame.height+global.tableFrameBorderWidth*2
        border.width: global.tableFrameBorderWidth
        border.color: global.tableFrameBorderColor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: global.cellHeight
        anchors.leftMargin: global.cellWidth
        color: "transparent"
        Rectangle{
            width:global.cellWidth*global.colCount
            height: global.cellHeight*global.rowCount
            color: global.tableFrameFillColor
            anchors.centerIn: parent
            visible: global.isZhanWei
        }

        InnerTable{
            id:frame
            x:0
            focus: true
            Keys.enabled: true
          /*  Keys.onPressed: {
                switch(event.key)
                {
                case Qt.Key_Down:
                    if(!global.isJieShu)
                    global.moveDown(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                case Qt.Key_Left:
                    if(!global.isJieShu)
                    global.moveLeft(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                case Qt.Key_Right:
                    if(!global.isJieShu)
                    global.moveRight(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                case Qt.Key_Up:
                    if(!global.isJieShu)
                    global.moveRotate(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                }
            } */
            MouseArea{
                anchors.fill:parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    if(mouse.button === Qt.LeftButton)
                    {
                        if(!global.isJieShu)
                            server.client(19);
                    global.moveLeft(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    } else if(mouse.button === Qt.RightButton)
                    {
                         if(!global.isJieShu)
                        global.moveRight(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                         server.client(20);
                    }
                }
                onWheel: {
                    var datl = wheel.angleDelta.y/120
                    if(datl>0)
                    {
                         if(!global.isJieShu)
                         global.moveRotate(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                         server.client(21);
                    }
                    else
                    {
                         if(!global.isJieShu)
                        global.moveDown(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                         server.client(22);
                    }
                }

            }
        }
        InnerTable2{
            id:frame2
            x:table.width/2
        }
    }

    MultiButtons{
        id:controlButtons

        anchors.left: table.right
        anchors.leftMargin: global.cellWidth
        anchors.top:  table.top
    }
    ShowNext{
        id:showNext
        anchors.top: controlButtons.bottom
        anchors.left: table.right
        anchors.leftMargin: global.cellWidth
        anchors.topMargin: global.cellHeight
    }

    ShowInfo{
        id:showinfo
        anchors.bottom: table.bottom
        anchors.left: table.right
        anchors.leftMargin: global.cellWidth
    }





    Timer {
        id:timer_whole2
        interval: 500; running: false; repeat: true
        onTriggered:{

            global.moveDown(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount);
            global2.moveDown(global2.currentShape_index,global2.currentShape_leftCount,global2.currentShape_topCount);
        }
    }
 /*   Timer {
        id:timer_whole3
        interval: 500; running: false; repeat: true
        onTriggered:{

           // global.moveDown(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount);
            global2.moveDown(global2.currentShape_index,global2.currentShape_leftCount,global2.currentShape_topCount);
        }
    } */
}
