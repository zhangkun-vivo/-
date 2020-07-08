//按钮区
import QtQuick 2.0
import QtQuick.Controls 1.3
import Felgo 3.0
Rectangle{
    width: global.cellWidth*10
    height: global.cellHeight*4
    property bool beginEnable: true
    property bool pauseEnable: !beginEnable
    Column{
        spacing: 20;
        Row{
            spacing: 20
            GameButton{
                id:beginButton
                text: "开始"
                    onClicked: {
                    //创建当前的形状并开始运行
                    global.isJieShu = false;
                    global.createShape(Math.round((Math.random(19)*18)),5,0);
                   timer_whole.running = true

                    //创建下一个形状，并显示预览
                    var rond_shape = Math.round((Math.random(19)*18));
                    global.createNewRandomShape(rond_shape,5,0);
                    global.getNewShapeInfo(rond_shape,5,0);
                   beginEnable = false;
                }
            }
           GameButton{
                id:zanting
                enabled: pauseEnable
                text:zanting.checked ?  "暂停" : "继续"
                checked: true
                onClicked: {
                    zanting.checked = !zanting.checked
                    if(!checked)
                    {
                        timer_whole.running = false;
                    }
                    else
                    {
                        timer_whole.restart();
                    }
                }
            }
           GameButton{
                text: "停止"
                onClicked: {


                    beginEnable = true; //此时可以点击开始
                    timer_whole.running = false;

                    global.clearAll();

                }
            }
        }
        Loader{id:pageLoader}
        GameButton{
            text: "返回主界面"
            onClicked: {
                beginEnable = true;
                timer_whole.running = false;
                global.clearAll();
                page.visible = true

            }
        }

  /*      Row{
            CheckBox{
                text: "网格"
                checked: true
                onClicked: {
                    if(checked)
                    {

                        global.isGrid = true;
                         frame.requestPaint();

                        global.isZhanWei = false;

                    }
                    else
                    {

//                        global.tableFrameInnerLineColor="green"
//                        global.tableFrameBorderWidth = 10;

                       // var ctx = frame.getContext("2d");
                       global.isGrid = false;
                console.log("llllllllllllllllll.......")
                        //frame.context.clearRect(0,0,frame.width,frame.height);
                       // frame.paint(0,0,global.cellWidth*12,global.cellHeight*22)
                        frame.requestPaint();

                        global.isZhanWei = true;


                    }
                }
            }
        }*/
}
    }
