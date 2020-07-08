import QtQuick 2.0
Canvas{

    id:frame_canvas;
    width:global2.cellWidth*global2.colCount
    height: global2.cellHeight*global2.rowCount
    contextType: "2d"
    onPaint: {



        var ctx = getContext("2d");


        ctx.lineWidth = global2.tableFrameInnerLineWidth;
        ctx.strokeStyle = global2.tableFrameInnerLineColor;
        ctx.fillStyle = global2.tableFrameFillColor;

        ctx.beginPath();

        ctx.rect(0,0,frame2.width,frame2.height);

        ctx.fill();
        ctx.stroke();

        //绘制内线
        ctx.lineWidth = global2.tableFrameInnerLineWidth;
        ctx.strokeStyle = global2.tableFrameInnerLineColor;
        ctx.beginPath();
        for(var i =0;i<=global2.rowCount;i++)
        {
            //            ctx.moveTo(0,i*global.cellHeight);
            //            ctx.lineTo(frame.width,i*global.cellHeight);

            ctx.moveTo(0,i*global2.cellHeight);
            ctx.lineTo(frame2.width,i*global2.cellHeight);
        }
        for(var j =0;j<=global2.colCount;j++)
        {
            ctx.moveTo(j*global2.cellWidth,0);
            ctx.lineTo(j*global2.cellWidth,frame2
                       .height);
        }
        ctx.stroke();
        if(!global2.isGrid)
        {
            ctx.clearRect(0,0,frame_canvas.width,frame_canvas.height)

        }
    }

    //   Component.onCompleted:
    //    {
    //        frame_canvas.clearRect(0,0,frame_canvas.width,frame_canvas.height)
    //        frame_canvas.requestPaint();
    //    }


}
