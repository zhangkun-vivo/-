import QtQuick 2.0
import Felgo 3.0
Scene{
    id:root
    property int a: -1
    property int cellWidth: 25
    property int cellHeight: 25
    property int rowCount: 22
    property int colCount: 12
    property color tableFrameBorderColor: "#666666"
    property color tableFrameFillColor: "#32999999"
    property real  tableFrameBorderWidth: 3
    property color tableFrameInnerLineColor: "#666666"
    property real  tableFrameInnerLineWidth: 1

    property real  shapeMaxCount: 19

    property int   currentShape_index: -1;
    property int   currentShape_topCount: 0
    property int   currentShape_leftCount: 0
    property var preShapeObj: null

    property var nextShapeObj: null
    property int   nextShape_index: -1;
    property int   nextShape_topCount: 0
    property int   nextShape_leftCount: 0


    property int score: scroe_num

    property int scroe_num: 0

    property int max_score_num: 0

    property bool isGrid: true

    property bool isZhanWei: false

    property bool isJieShu: false //游戏是否结束

    signal getScore(int num);


    signal getNewShapeInfo(int cur,int left,int top);
    // property var tableArr: new Array(global.rowCount)(global.colCount)
    property var shapeArr:
        [
        [0x88,0xc0,0],[0xe8,0x00,1],[0xc4,0x40,2],[0x2e,0x0,3],
        [0x44,0xc0,4],[0x8e,0x0,5],[0xc8,0x80,6],[0xe2,0x0,7],
        [0x8c,0x40,8],[0x6c,0x0,9],
        [0x4c,0x80,10],[0xc6,0x0,11],
        [0x4e,0x0,12],[0x8c,0x80,13],[0xe4,0x0,14],[0x4c,0x40,15],
        [0x88,0x88,16],[0xf0,0x0,17],
        [0xcc,0x0,18]];

    property var shapeColorArr:
        [[0,1],[1,1],[2,1],[3,1],
        [4,2],[5,2],[6,2],[7,2],
        [8,3],[9,3],
        [10,4],[11,4],
        [12,5],[13,5],[14,5],[15,5],
        [16,6],[17,6],
        [18,7]];
    property var rotate_index:[[0,0,4],[1,4,4],[2,8,2],[3,10,2],[4,12,4],[5,16,2],[6,18,1]];


    /*返回相对于4x4方格是否是1或0的标记，是1返回true,是0返回0*/
    function getSingleShapeFlag(currentShape,x,y)
    {
        var mask = 0x80;
        var resultArr = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
        for(var i =0;i<2;i++)
        {
            mask = 0x80;
            for(var j =0;j<8;j++)
            {
                if(i === 0&&j<4)
                {
                    resultArr[0][j] = (shapeArr[currentShape][i]&mask)? 1: 0
                                }
                else if(i ===0 && j >=4)
                {
                    resultArr[1][j-4] =(shapeArr[currentShape][i]&mask)? 1: 0
                                   }
                else if(i === 1&&j<4)
                {
                    resultArr[2][j] = (shapeArr[currentShape][i]&mask)? 1: 0
                }
                else if(i ===1 && j >=4)
                {
                    resultArr[3][j-4] = (shapeArr[currentShape][i]&mask)? 1: 0
                                   }


                mask = mask/2;
            }

        }
            return resultArr[y][x] ? true :false;
    }


    function getRotateAfterIndex(currentShape) //获取变换后的索引号
    {
        var after_index = 0;
        if(currentShape >=0 && currentShape <=3)
        {
            after_index = (currentShape+1)%4;
        }
        else if(currentShape >=4 && currentShape<=7)
        {
            if(currentShape === 7)
            {
                after_index = 4;
            }
            else
            {
                after_index = (currentShape+1)%8;
            }
        }
        else if(currentShape >=8 && currentShape<=9)
        {
            if(currentShape === 8)
            {
                after_index = 9;
            }
            else
            {
                after_index = 8;
            }
        }
        else if(currentShape >=10 && currentShape<=11)
        {
            if(currentShape === 10)
            {
                after_index = 11;
            }
            else
            {
                after_index = 10;
            }
        }
        else if(currentShape >=12 && currentShape<=15)
        {
            if(currentShape === 15)
            {
                after_index = 12;
            }
            else
            {
                after_index = (currentShape+1)%16;
            }
        }
        else if(currentShape >=16 && currentShape<=17)
        {
            if(currentShape === 16)
            {
                after_index = 17;
            }
            else
            {
                after_index = 16;
            }
        }
        else if(currentShape >=18 && currentShape<=18)
        {
            after_index = 18;
        }

        return after_index;
    }

    function createShape(currentShape,leftCount,topCount)
    {

        if(preShapeObj)
        {
            for(var i =0; i< 4;i++)
            {
                if(preShapeObj[i] !== null)
                {
                    preShapeObj[i].destroy();//删除上次创建的组件
                }
            }
        }
               currentShape_index = currentShape;
        currentShape_leftCount = leftCount;
        currentShape_topCount = topCount;
        var objArr = new Array(4);//创建对象数组
        var num =0;

        for(var i =0;i<4;i++)
        {
            for(var j = 0;j<4;j++)
            {
                if(global.getSingleShapeFlag(currentShape,i,j))
                {
                     var com = Qt.createComponent("CellRect.qml");
                    if(Component.Ready === com.status)
                    {

                        objArr[num] = com.createObject(frame);
                        objArr[num].image_index =shapeColorArr[currentShape][1];
                        objArr[num].x = leftCount*cellWidth+i*cellWidth
                        objArr[num].y = topCount*cellHeight+j*cellHeight
                        num++;
                    }
                                    }
            }
        }
        preShapeObj = objArr;
    }

    //向下
    function moveDown(currentShape,leftCount,topCount)
    {

        topCount++;

        if(isBjOrZA(currentShape,leftCount,topCount))
        {


            currentShape_index = currentShape;
            currentShape_leftCount = leftCount;
            currentShape_topCount = topCount;
            createShape(currentShape,leftCount,topCount);
        }
        else
        {

            var s = currentShape_topCount;

            if(isGameJieshu())
            {
                return;
            }
            createShapeInTable(currentShape,currentShape_leftCount,s--);//把该方块固定在游戏盘中



            deleteFullLines();//删除满行



            installNextShape();



                    return;
        }

    }


    //当到底后把形状绘制在游戏盘中
    function createShapeInTable(currentShape,leftCount,topCount)
    {
        for(var i =0;i<4;i++)
        {
            for(var j = 0;j<4;j++)
            {
                if(getSingleShapeFlag(currentShape,i,j))
                {
                    createSqureInTable(currentShape,leftCount+i,topCount+j);
                    }
            }
        }
    }

    //在游戏盘的指定的坐标出创建指定的方块

    function createSqureInTable(currentShape,x,y)
    {
        var com = Qt.createComponent("CellRect.qml");
        if(Component.Ready === com.status)
        {

            wholeTableArray.tableArr[y][x] = com.createObject(frame);
            wholeTableArray.tableArr[y][x].image_index =shapeColorArr[currentShape][1];
            wholeTableArray.tableArr[y][x].cur_shape = currentShape;
            wholeTableArray.tableArr[y][x].x = x*global.cellWidth;
            wholeTableArray.tableArr[y][x].y = y*global.cellHeight;
                    }
    }


    //向左
    function moveLeft(currentShape,leftCount,topCount)
    {
        leftCount--;
        if(isBjOrZA(currentShape,leftCount,topCount))
        {
            currentShape_index = currentShape;
            currentShape_leftCount = leftCount;
            currentShape_topCount = topCount;
            createShape(currentShape,leftCount,topCount);
        }
        else
        {
            return;
        }

    }


    //向右
    function moveRight(currentShape,leftCount,topCount)
    {
        leftCount++;
        if(isBjOrZA(currentShape,leftCount,topCount))
        {
            currentShape_index = currentShape;
            currentShape_leftCount = leftCount;
            currentShape_topCount = topCount;
            createShape(currentShape,leftCount,topCount);
        }
        else
        {
            return;
        }

    }
    //旋转
    function moveRotate(currentShape,leftCount,topCount)
    {

        currentShape = getRotateAfterIndex(currentShape);//得到旋转之后的形状
        if(isBjOrZA(currentShape,leftCount,topCount))
        {
            currentShape_index = currentShape;
            currentShape_leftCount = leftCount;
            currentShape_topCount = topCount;
            createShape(currentShape,leftCount,topCount);
        }
        else
        {
            return;
        }

    }



    //判断是否到达边界或碰到障碍
    function isBjOrZA(currentShape,leftCount,topCount)
    {
        var pass = true;
        //如果超出边界
        for(var i =0;i<4;i++)
        {
            for(var j =0;j<4;j++)
            {
                if(global.getSingleShapeFlag(currentShape,i,j))
                {

                    if((i+leftCount) >= global.colCount || (i+leftCount) < 0 || (j+topCount) >= global.rowCount || (j+topCount) <0 )
                    {
                        pass = false;
                        return pass;
                    }
                }
            }
        }
        //若碰到其他障碍物
        for(var ii =0;ii<4;ii++)
        {
            for(var jj =0;jj<4;jj++)
            {
                if(global.getSingleShapeFlag(currentShape,ii,jj))
                {
                    var s = ii+ii+leftCount;
                    var t = jj+topCount;
                   if(wholeTableArray.tableArr[jj+topCount][ii+leftCount])
                    {
                        pass = false;
                        return pass;
                    }
                }
            }
        }

        return pass;
    }


    function createNewRandomShape_test()
    {
        createShape(Math.round((Math.random(19)*18)),5,0);
    }
    //当落地后产生新的随机块
    function createNewRandomShape(currentShape,leftCount,topCount)
    {
        var objArr = new Array(4);//创建对象数组
        var num =0;

        for(var i =0;i<4;i++)
        {
            for(var j = 0;j<4;j++)
            {
                if(global.getSingleShapeFlag(currentShape,i,j))
                {
                    var com = Qt.createComponent("CellRect.qml");
                    if(Component.Ready === com.status)
                    {

                        objArr[num] = com.createObject(frame);
                        objArr[num].image_index =shapeColorArr[currentShape][1];
                        objArr[num].visible = false;
                        objArr[num].x = leftCount*cellWidth+i*cellWidth
                        objArr[num].y = topCount*cellHeight+j*cellHeight
                        num++;
                    }
                }
            }
        }

        nextShape_index = currentShape;
        nextShape_leftCount = leftCount;
        nextShape_topCount = topCount;

        nextShapeObj = objArr; //把创建的下一个图形存储到下一个数组中
    }

    //当下落完成时，安装下一个随机快
    function installNextShape()
    {

        if(preShapeObj)
        {
            for(var i =0; i< 4;i++)
            {
                if(preShapeObj[i] !== null)
                {
                    preShapeObj[i].destroy();//删除上次创建的组件
                }
            }
        }
        preShapeObj = nextShapeObj;

        for(var i =0;i<4;i++)
        {
            preShapeObj[i].visible = true;
        }

        currentShape_index = nextShape_index;
        currentShape_leftCount = nextShape_leftCount;
        currentShape_topCount = nextShape_topCount;
       // server.client(currentShape_index)

        var rond_shape = Math.round((Math.random(19)*18));

        createNewRandomShape(rond_shape,5,0);
        //server.client(rond_shape)

        root.getNewShapeInfo(rond_shape,5,0);
    }

    //当行满时消行
    function deleteFullLines()
    {

        var deleteLinesNum = 0;
        for(var i =0;i<global.rowCount;i++)
        {
            if(isFull(i))//加入改行时满行，则消除
            {
                deleteLine(i);
                deleteLinesNum++;
            }
        }
        switch(deleteLinesNum)
        {
        case 1://一次删除一行
            scroe_num += 10;
            break;
        case 2://一次删除二行
            scroe_num += 30;
            break;
        case 3://一次删除三行
            scroe_num += 50;
            break;
        case 4://一次删除四行
            scroe_num += 100;
            break;
        default:
            break;
        }
        showinfo.text_num = scroe_num;
    }

    //判断一行是否是满的
    function isFull(row_index)
    {
        var falg = true;
        for(var i =0;i<global.colCount;i++)
        {
            if(wholeTableArray.tableArr[row_index][i]===null)
            {
                falg = false;
            }
        }
        return falg;
    }
    //删除满杭
    function deleteLine(row_index)
    {
        for(var i =0;i<global.colCount;i++)
        {
            wholeTableArray.tableArr[row_index][i].destroy(); //依次删除每个方块
            wholeTableArray.tableArr[row_index][i].update();
            wholeTableArray.tableArr[row_index][i] = null;
        }
        //把上方的方块下移
        for(var j = row_index;j>=0;j--)
        {
            for(var h = 0;h<global.colCount;h++)
            {

                if(j === 0)
                {
                    wholeTableArray.tableArr[j][h] = null;
                }
                else
                {
                    wholeTableArray.tableArr[j][h] = wholeTableArray.tableArr[j-1][h];
                    if(wholeTableArray.tableArr[j][h])
                        wholeTableArray.tableArr[j][h].y = wholeTableArray.tableArr[j][h].y+global.cellHeight
                }
            }
        }
    }

    //删除行后更新表格
    function updateTable()
    {
        for(var i =0;i<global.rowCount;i++)
        {
            for(var j =0;j<global.colCount;j++)
            {
                if(wholeTableArray.tableArr[i][j])
                {
                }
            }
        }
    }

    //清空游戏盘
    function clearAll()
    {


        for(var i =0;i<global.rowCount;i++)
        {
            for(var j =0;j<global.colCount;j++)
            {
                if(wholeTableArray.tableArr[i][j] !== null)
                {
                    wholeTableArray.tableArr[i][j].destroy();
                    wholeTableArray.tableArr[i][j]  = null;
                }
            }
        }
        //情况当前快
        if(preShapeObj)
        {
            for(var i =0; i< 4;i++)
            {
                if(preShapeObj[i] !== null)
                {
                    preShapeObj[i].destroy();//删除上次创建的组件
                    preShapeObj[i] = null;
                }
            }
        }
        //情况下一个预览块
        if(nextShapeObj)
        {
            for(var i =0; i< 4;i++)
            {
                if(nextShapeObj[i] !== null)
                {
                    nextShapeObj[i].destroy();//删除上次创建的组件
                    nextShapeObj[i] = null;
                }
            }
        }
        //清楚预览框中的按钮

        if(showNext.preViewShapeObj)
        {
            for(var i =0; i< 4;i++)
            {
                if(showNext.preViewShapeObj[i] !== null)
                {
                    showNext.preViewShapeObj[i].destroy();//删除上次创建的组件
                    showNext.preViewShapeObj[i] = null;
                }
            }
        }
        showinfo.text_num = 0;//当前分清零
    }

    //判断游戏是否可以结束，即方块是否触顶, 若第一行有方块，则游戏结束
    function isGameJieshu()
    {
        var jieshu = false;

        for(var j =0;j<global.colCount;j++)
        {
            if(wholeTableArray.tableArr[0][j])
            {
                jieshu = true;
            }
        }

        if(jieshu)
        {
            isJieShu = true;
            timer_whole.running = false;
            //timer_whole2.running=false;
         //   timer_whole2.running = false;
            controlButtons.beginEnable = true;
            clearAll();
            return jieshu;
        }


    }
}
