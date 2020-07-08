//按钮区
import QtQuick 2.0
import QtQuick.Controls 1.3
import Felgo 3.0
import com.Server 1.0
Rectangle{
     Loader{id:pageLoader}
   Timer {
        id:connect_time
        interval: 1
        running: false
        repeat: true
        onTriggered: {
            //console.log("xx")
            //console.log(global2.flag)
            global2.firstConnect(server.re());
            if(global2.b!=-1){
                //global2.firstConnect()
                //console.log(global2.flag)
                switch(global2.b)
                {
                case 0:
                    global2.createShape(global2.b,5,0)
                    break;
                case 1:
                    global2.createShape(global2.b,5,0)
                    break;
                case 2:
                    global2.createShape(global2.b,5,0)
                    //console.log("dsadasd");
                    break;
                case 3:
                   global2.createShape(global2.b,5,0)
                    break;
                case 4:
                    global2.createShape(global2.b,5,0)
                    break;
                case 5:
                    global2.createShape(global2.b,5,0)
                    break;
                case 6:
                    global2.createShape(global2.b,5,0)
                    break;
                case 7:
                   global2.createShape(global2.b,5,0)
                    break;
                case 8:
                   global2.createShape(global2.b,5,0)
                    break;
                case 9:
                    global2.createShape(global2.b,5,0)
                    break;
                case 10:
                   global2.createShape(global2.b,5,0)
                    break;
                case 11:
                   global2.createShape(global2.b,5,0)
                    break;
                case 12:
                   global2.createShape(global2.b,5,0)
                    break;
                case 13:
                   global2.createShape(global2.b,5,0)
                    break;
                case 14:
                   global2.createShape(global2.b,5,0)
                    break;
                case 15:
                    global2.createShape(global2.b,5,0)
                    break;
                case 16:
                    global2.createShape(global2.b,5,0)
                    break;
                case 17:
                   global2.createShape(global2.b,5,0)
                    break;
                case 18:
                   global2.createShape(global2.b,5,0)
                    break;
                case 19:
                   global2.moveLeft(global2.currentShape_index,global2.currentShape_leftCount,global2.currentShape_topCount);
                    //b = 19;
                    break;
                case 20:
                   global2.moveRight(global2.currentShape_index,global2.currentShape_leftCount,global2.currentShape_topCount);
                    //b = 20;
                    break;
                case 21:
                   global2.moveRotate(global2.currentShape_index,global2.currentShape_leftCount,global2.currentShape_topCount);
                    //b = 21;
                    break;
                case 22:
                    global2.moveDown(global2.currentShape_index,global2.currentShape_leftCount,global2.currentShape_topCount);
                    //b = 22;
                    break;
               default:
                   b = -1;
                }

              //  global2.createShape(global2.b,5,0)
                server.makelisten()

            }
        }

    }

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
                enabled: beginEnable
                onClicked: {
                    console.log("ss");
                   // global2.connfd=server.connect();
                   // server.getinfo(global2.connfd);
                    global.a=Math.round((Math.random(19)*18));
                    global2.firstConnect(server.connect(global.a));
                    //console.log("ss");
                    //global.a=Math.round((Math.random(19)*18));
                    //server.client(a);

                    global2.createShape(global2.b,5,0)
                    global2.b=-1;
                    global2.firstConnect(server.makelisten());
                    connect_time.running=true;
                    //server.makelisten();
                    console.log("yes")
                    //pageLoader.source = "Connect_page.qml"
                    //var first = global2.firstConnect();
                    //connect_time.running = true
                    //创建当前的形状并开始运行
                    //server.connect()
                    global.isJieShu = false;
                    global2.isJieShu = false;
                   // global.a=Math.round((Math.random(19)*18))
                    global.createShape(global.a,5,0);
                    //server.client(global.a);
                    //global2.createShape(global2.b,5,0);
                    //console.log("yes")
                    timer_whole2.running = true
                    //timer_whole3.running = true

                    //创建下一个形状，并显示预览
                    var rond_shape = Math.round((Math.random(19)*18));
                    global.createNewRandomShape(rond_shape,5,0);
                    global.getNewShapeInfo(rond_shape,5,0);
                   // global2.createNewRandomShape(rond_shape,5,0);
                   // global2.getNewShapeInfo(rond_shape,5,0);


                    beginEnable = false;
                    //global2.connfd=server.connect();
                    //server.getinfo(global2.connfd);
                    //server.getinfo(global2.connfd);

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
                        timer_whole2.running = false;
                        }
                    else
                    {
                        timer_whole2.restart();
                    }
                }
            }
            GameButton{
                text: "停止"
                onClicked: {


                    beginEnable = true; //此时可以点击开始
                    timer_whole2.running = false;
                    //timer_whole3.running = false;
                    global.clearAll();
                    global2.clearAll();

                }
            }
           GameButton{
                text: "返回主界面"
                onClicked: {
                    beginEnable = true;
                    timer_whole2.running = false;
                    // timer_whole3.running = false;
                    //connect_time.running = false;
                    global.clearAll();
                    global2.clearAll();
                   // main_root.visible = false
                    page.visible = true
                   // pageLoader.source = "Menu.qml"
                }
            }
        }

     /*   Row{
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
