import QtQuick 2.0
import Felgo 3.0
Scene{
    property var tableArr: null
    Component.onCompleted: {

         tableArr = new Array(global.rowCount);
        for(var i =0;i<global.rowCount;i++)
        {
            tableArr[i] = new Array(global.colCount);
        }
        for(var i =0;i<global.rowCount;i++)
        {
            for(var j =0;j<global.colCount;j++)
            {
                tableArr[i][j] = null;
            }
        }
         }
}
