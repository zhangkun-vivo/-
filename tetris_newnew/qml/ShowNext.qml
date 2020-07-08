//显示下一个的区域
import QtQuick 2.0
import QtQuick.Controls 1.3
Rectangle{
    width: global.cellWidth*10
    height: global.cellHeight*6
    property var preViewShapeObj: null
    Text{
        text:"下一个方块:"
    }

    Canvas{

        id:frame_next_canvas;
        anchors.left: parent.left
        anchors.leftMargin: global.cellWidth*2
        anchors.bottom: parent.bottom
        width:global.cellWidth*4
        height: global.cellHeight*4
        contextType: "2d"
        onPaint: {

        }
    }

    function creatNextShape(cur)
    {

        if(preViewShapeObj)
        {
            for(var i =0; i< 4;i++)
            {
                if(preViewShapeObj[i] !== null)
                {
                    preViewShapeObj[i].destroy();//删除上次创建的组件
                }
            }
        }
        var objArr = new Array(4);//创建对象数组
        var num =0;
        for(var i =0;i<4;i++)
        {
            for(var j = 0;j<4;j++)
            {
                if(global.getSingleShapeFlag(cur,i,j))
                {
                    // console.log(i+"-"+j)
                    var com = Qt.createComponent("CellRect.qml");
                    if(Component.Ready === com.status)
                    {

                        objArr[num] = com.createObject(frame_next_canvas);
                        objArr[num].image_index =global.shapeColorArr[cur][1];
                        objArr[num].x = i*global.cellWidth
                        objArr[num].y = j*global.cellHeight
                        num++;
                    }
                    // console.log("jinlaila........")
                }
            }
        }

        preViewShapeObj = objArr;
    }
}
