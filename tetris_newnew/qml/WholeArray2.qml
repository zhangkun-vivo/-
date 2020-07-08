import QtQuick 2.0
import Felgo 3.0
Scene{
    property var tableArr: null
    Component.onCompleted: {

        tableArr = new Array(global2.rowCount);
        for(var i =0;i<global2.rowCount;i++)
        {
            tableArr[i] = new Array(global2.colCount);
        }
        for(var i =0;i<global2.rowCount;i++)
        {
            for(var j =0;j<global2.colCount;j++)
            {
                tableArr[i][j] = null;
            }
        }
    }
}
