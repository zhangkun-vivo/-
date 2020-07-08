import QtQuick 2.0
import com.Server 1.0
Image{
    Global{
        id:global
    }
    id:root
    property int image_index: -1
    width: global.cellWidth
    height: global.cellHeight
    source:getImage(image_index)
    property int cur_shape: -1

    function getImage(index)
    {
        var str= "";
        switch(index)
        {
        case 1:
            str = "./images/1.png" ;
            break;
        case 2:
            str = "./images/2.png" ;
            break;
        case 3:
            str = "./images/3.png" ;
            break;
        case 4:
            str = "./images/4.png" ;
            break;
        case 5:
            str = "./images/5.png" ;
            break;
        case 6:
            str = "./images/6.png";
            break;
        case 7:
            str = "./images/7.png";
            break;
        default:
            str = "" ;
            break;
        }
        return str;
    }
}
