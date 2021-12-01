import QtQuick 2.12
import QtQuick 2.3
import QtQuick.Window 2.12

Window {
    width: 1300
    height: 1300
    visible: true
    title: qsTr("Hello World")

//    Rectangle {
//        width: 400
//        height: 400

//        Canvas {
//            anchors.fill: parent
//            onPaint: {
//                var ctx = getContext("2d");
//                ctx.reset();

//                var centreX = width / 2;
//                var centreY = height / 2;

//                ctx.beginPath();
//                //ctx.fillStyle = "light gray";
//                ctx.moveTo(centreX, centreY);
//                ctx.arc(centreX, centreY, width / 4, 0, Math.PI * 0.5, false);
//                ctx.lineTo(centreX, centreY);
//                ctx.fill();

////                ctx.beginPath();
////                ctx.fillStyle = "red";
////                ctx.moveTo(centreX, centreY);
////                ctx.arc(centreX, centreY, width / 4, Math.PI * 0.5, Math.PI * 2, false);
////                ctx.lineTo(centreX, centreY);
////                ctx.fill();
//            }
//        }
//    }

    // Simple example of QML Canvas element


//    Canvas {
//        width: 400
//        height: 400

//        onPaint: {
//            // Get drawing context
//            var context = getContext("2d");

//            // Make canvas all white
//            context.beginPath();
//            context.clearRect(0, 0, width, height);
//            context.fill();

//            // Fill inside with blue, leaving 10 pixel border
//            context.beginPath();
//            context.fillStyle = "blue"
//            context.fillRect(10, 10, width - 20, height - 20);
//            context.fill();

//            // Draw a line
//            context.beginPath();
//            context.lineWidth = 2;
//            context.moveTo(30, 30);
//            context.strokeStyle = "red"
//            context.lineTo(width-30, height-30);
//            context.stroke();

//            // Draw a circle
//            context.beginPath();
//            context.fillStyle = "orange"
//            context.strokeStyle = "red"
//            context.moveTo(width/2+60, height/2);
//            context.arc(width/2, height/2, 60, 0, 2*Math.PI, true)
//            context.fill();
//            context.stroke();

//            // Draw some text
//            context.beginPath();
//            context.strokeStyle = "lime green"
//            context.font = "20px sans-serif";
//            context.text("Hello, world!", width/2, 50);
//            context.stroke();
//        }
//    }
    /*
    Lines are drawn from x1,y1 to x2,y2 in four "phases" as below:

    From     To    Phase
    x1 y1   x2 y2  Number
     0,0     w,0    1
     w,0     w,h    2
     w,h     0,h    3
     0,h     0,0    4
         done       5
    */
//    Canvas {
//        id: canvas
//        width: 400
//        height: 400

//        onPaint: {
//            var ctx = getContext("2d");
//            var w = canvas.width;
//            var h = canvas.height;
//            var delta = 4; // Spacing between lines
//            var phase = 1;
//            var x1 = 0;
//            var y1 = 0;
//            var x2 = w;
//            var y2 = 0;

//            while (true) {
//                ctx.moveTo(x1, y1);
//                ctx.lineTo(x2, y2);
//                ctx.stroke();

//                switch (phase) {
//                case 1:
//                    x1 += delta; y2 += delta;
//                    if (x1 >= w || y2 >= h) {
//                        x1 = w; y2 = h;
//                        phase = 2;
//                    }
//                    break;
//                case 2:
//                    y1 += delta; x2 -= delta;
//                    if (y1 >= w || x2 <= 0) {
//                        y1 = h; x2 = 0;
//                        phase = 3;
//                    }
//                    break;
//                case 3:
//                    x1 -= delta; y2 -= delta;
//                    if (x1 <= 0 || y2 <= 0) {
//                        x1 = 0; x2 = 0;
//                        phase = 4;
//                    }
//                    break;
//                case 4:
//                    y1 -= delta; x2 += delta;
//                    if (y1 <= 0 || x2 >= w) {
//                        y1 = 0; x2 = w;
//                        phase = 5;
//                    }
//                    break;
//                case 5:
//                    return;
//                }
//            }
//        }
//    }
//    Path {
//        startX: 0; startY: 100

//        PathArc {
//            relativeX: 50; y: 100
//            radiusX: 25; radiusY: 15
//        }
//        PathArc {
//            relativeX: 50; y: 100
//            radiusX: 25; radiusY: 25
//        }
//        PathArc {
//            relativeX: 50; y: 100
//            radiusX: 25; radiusY: 50
//        }
//        PathArc {
//            relativeX: 50; y: 100
//            radiusX: 50; radiusY: 100
//        }
//    }

//    Canvas {

//            anchors.fill: parent

//            onPaint: {

//                var ctx = getContext("2d");
//                ctx.fillStyle = "lightslategray"

////                ctx.beginPath();
////                ctx.fillRect(10, 10, 80, 50);

////                ctx.beginPath();
////                ctx.fillRect(120, 10, 70, 70);

////                ctx.beginPath();
////                ctx.ellipse(230, 10, 90, 70);
////                ctx.fill();

////                ctx.beginPath();
////                ctx.ellipse(10, 110, 70, 70);
////                ctx.fill();

////                ctx.beginPath();
////                ctx.roundedRect(120, 110, 70, 70, 10, 10);
////                ctx.fill();

//                ctx.beginPath();
//                ctx.moveTo(230, 110);
//                ctx.arc(230, 110, 70, 0, Math.PI * 0.7, false);
//                ctx.fill();

//            }
//        }

//     Canvas {
//        id: root
//        // canvas size
//        width: 500; height: 200
//        // handler to override for drawing
//        onPaint: {
//            // get context to draw with
//            var ctx = getContext("2d")
////            ctx.strokeStyle = "blue"
////            ctx.fillStyle = "steelblue"
////            ctx.beginPath()
////            ctx.moveTo(150,100)
////            ctx.arcTo(150,100,350,100,200)
////            ctx.closePath()
////            ctx.fill()
////            ctx.stroke();

//            ctx.beginPath();
//            ctx.lineWidth = 2;
//            ctx.strokeStyle = "red"
//            ctx.moveTo(300,50);
//            ctx.lineTo(300,51.1500*2);
//            //ctx.lineTo(300,65.1500);
//           //ctx.arc(width/2, height/2, 20, 0, 2*Math.PI, true)
//            //ctx.arcTo(300,51.1500*2,299.7157*2,55.55*2,18.7000*2);
//            ctx.bezierCurveTo(-10, 90, 210, 90, 180, 0);
//             ctx.arcTo(300,51.1500*2,500,55.55*2);
//            ctx.stroke();




//            // setup the stroke
////            ctx.lineWidth = 4
////            ctx.strokeStyle = "blue"
////            // setup the fill
////            ctx.fillStyle = "steelblue"
////            // begin a new path to draw
////            ctx.beginPath()
////            // top-left start point
////            ctx.moveTo(150,100)
////            // upper line
////            ctx.lineTo(152,100)
////            // right line
////            ctx.lineTo(152,300)
////            // bottom line
////            ctx.lineTo(150,300)
////            // left line through path closing
////            ctx.closePath()
////            // fill using fill style
////            ctx.fill()
////            // stroke using line width and stroke style
////            ctx.stroke()
//        }
//    }

    Canvas {
        width: 1000; height: 1200
        contextType: "2d"

//        Path {
//            id: myPath
//            startX: 0; startY: 100

//            PathCurve { x: 75; y: 75 }
//            PathCurve { x: 200; y: 150 }
//            PathCurve { x: 325; y: 25 }
//            PathCurve { x: 400; y: 100 }
//        }

        Path {
            id: myPath
            startX: 300; startY: 100

            PathLine{
                id: pl1
                x: myPath.startX
                y: myPath.startY + 100
            }

            PathArc {
                id: pa1
                x: pl1.x
                y: pl1.y + 100
                radiusX: 75; radiusY: 180
                direction: PathArc.Clockwise
            }

            PathArc {
                id: pa2
                x: pa1.x
                y: pa1.y + 190
                radiusX: 200; radiusY: 280
                direction: PathArc.Counterclockwise
            }
            PathArc {
                id: pa3
                x: pa2.x
                y: pa2.y + 100
                radiusX: 100; radiusY: 180
                direction: PathArc.Clockwise
            }
            PathLine{
                id: pa4
                x: pa3.x
                y: pa3.y + 100
            }

//            PathArc {
//                relativeX: 30; y: 20
//                radiusX: 35; radiusY: 35
//            }
//            PathArc {
//                relativeX: 50; y: 100
//                radiusX: 25; radiusY: 50
//            }
//            PathArc {
//                relativeX: 50; y: 100
//                radiusX: 50; radiusY: 100
//            }
        }

        onPaint: {
            context.strokeStyle = Qt.rgba(.4,.6,.8);
            context.path = myPath;
            context.stroke();
        }

    }

//    Canvas
//    {
//        id: canvas
//        property real degree: 180
//        anchors.fill: parent
//        onPaint:
//        {
//            var ctx = getContext("2d")
//            var x = 90
//            var y = 90
//            var radius = 85
//            var startAngle = (Math.PI / 180) * 270
//            var fullAngle = (Math.PI / 180) * (270 + 360)
//            var progressAngle = (Math.PI / 180) * (270 + degree)
//            ctx.lineWidth = 5
//            ctx.beginPath()
//            ctx.arc(x, y, radius, startAngle, progressAngle)
//            ctx.strokeStyle = "red"
//            ctx.stroke()
//            ctx.strokeStyle = 'blue';
//            ctx.lineWidth = 5;
//            ctx.beginPath();
//            ctx.moveTo(100, 100);
//            ctx.lineTo(200, 200);
//            ctx.moveTo(300, 200);
//            ctx.lineTo(400, 100);
//            ctx.stroke();

//            ctx.beginPath();
//            ctx.strokeStyle = 'green';
//            ctx.moveTo(200, 200);
//            ctx.arcTo(200, 200, 300, 200, 100);
//            ctx.stroke();
//            ctx.beginPath();
//            ctx.moveTo(20, 20);           // Create a starting point
//            ctx.lineTo(100, 20);          // Create a horizontal line
//            ctx.arcTo(150, 20, 150, 70, 50); // Create an arc
//            ctx.lineTo(150, 120);         // Continue with vertical line
//            ctx.stroke();                // Draw it


//            ctx.beginPath();
//            ctx.moveTo(70, 70);           // Create a starting point
//            ctx.lineTo(70, 100);          // Create a horizontal line
//            ctx.arcTo(100, 100, 100, 160, 50); // Create an arc
//            ctx.lineTo(100, 200);         // Continue with vertical line
//            ctx.stroke();
//        }
//    }

}
