import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.12
import Qt.labs.platform 1.1

GameWindow {
    id: root
  //  activeScene: page
    Loader{id:pageLoader}

   MessageDialog{
        id:about
        buttons: MessageDialog.Ok
        title:"about"
        text: "Author: Group 13.\n This is a simple tetris game.\n Verson:1.0 \n"
    }
    Audio {
      id: music;
     // source: "./music/L'Orchestra Cinematique - Tetris Theme.mp3";
      autoLoad: true;
      loops: 10000;
      Component.onCompleted: music.play();
     }



   Page{
        id:page

            GameButton{

                Item {

                    id: item

                }
                x:page.width/2 - page.width/8
                y:page.height/9 *1
                text: "<h1>1 Player<font size = 6></h1>"
                height:page.height/9
                width:page.width/4
                MouseArea{
                anchors.fill: parent
                onClicked:{
                page.visible = false
                pageLoader.source = "Main.qml"
                }
                }
            }

            GameButton{
                text: "<h1>2 Player<font size = 6></h1>"
                x:page.width/2 - page.width/8
                y:page.height /9 *3
                height:page.height/9
                width:page.width/4
                MouseArea{
                anchors.fill: parent
                onClicked:{
                page.visible = false
                    pageLoader.source = "MultiPlay.qml"
                }
                }
            }
            GameButton{
                text:"<h1>About<font size = 6></h1>"
                x:page.width/2 - page.width/8
                y:page.height /9 *5
                height:page.height/9
                width:page.width/4
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        about.open()
                    }
                }
                }
            GameButton{
                text:"<h1>Exit<font size = 6></h1>"
                x:page.width/2 - page.width/8
                y:page.height/9*7
                height:page.height/9
                width:page.width/4
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        Qt.quit()
                    }
                 }
            }
            BackgroundImage {
                  id: cover
                  z:-1
                 anchors.fill:parent
                 source: "/root/新建文件夹/1.jpg"
              }

     }


}

