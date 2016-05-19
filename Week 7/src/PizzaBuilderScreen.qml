import QtQuick 2.5
import QtQuick.Particles 2.0

Rectangle {
    color:"magenta"
    Rectangle{
        id: banner
        anchors.left:parent.left
        anchors.top:parent.top
        color:"red"
        width:parent.width/5
        height:parent.height/16
        border.width:2

        Text{
            anchors.fill: parent
            anchors.leftMargin: 4
            text:"Pizza Builder"
            font.pixelSize: 26
            font.bold: true
            color:"white"
            verticalAlignment: Text.AlignVCenter
        }
    }
    // Connect PizzaBuilder C++ class to livePizzaImage source reset
    Image{
        id:livePizzaImage
        source:""
        asynchronous: true
        cache:false
        anchors.verticalCenter: parent.verticalCenter
        anchors.right:availableContainer.left
        anchors.rightMargin: 20
        width:523
        height:528
    }
    // pepperoni
    Image{
        id:pepperoniImage
        source:"/images/Pepperoni.png"
        asynchronous: true
        cache:false
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: livePizzaImage.horizontalCenter
        width:350
        height:350
    }
    // onion rings
    Image{
        id:onionringsImage
        source:""
        asynchronous: true
        cache:false
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: livePizzaImage.horizontalCenter
        width:350
        height:350
    }
    // pineapple
    Image{
        id:pineappleImage
        source:""
        asynchronous: true
        cache:false
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: livePizzaImage.horizontalCenter
        width:350
        height:350
    }
    // anchovies
    Image{
        id:anchovieImage
        source:""
        asynchronous: true
        cache:false
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: livePizzaImage.horizontalCenter
        width:350
        height:350
    }
    // tomatoes
    Image{
        id:tomatoesImage
        source:""
        asynchronous: true
        cache:false
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: livePizzaImage.horizontalCenter
        width:350
        height:350
    }
    // list the available toppings
    ListContainer{
        id: availableContainer
        anchors.right: parent.right
        anchors.top: parent.top
        height:parent.height/3
        width:parent.width/4
        border.width: 2
        radius:4
        titleText:"Available Toppings"

        onClickedItem: {
            console.log("Clicked ", listData.get(index).name);
            chosenContainer.listData.append({"name":listData.get(index).name});

            // display the images
            switch(listData.get(index).name)
            {
            case "Anchovies":
                anchovieImage.source = "/images/Anchovies.png";
                break;
            case "Tomatoes":
                tomatoesImage.source = "/images/Tomatoes.png";
                break;
            case "Pineapple":
                pineappleImage.source = "/images/Pineapple.png";
                break;
            case "OnionRings":
                onionringsImage.source = "/images/OnionRings.png";
                break;
            }
            //remove from first list
            availableContainer.listData.remove(index);
        }
        Component.onCompleted: {
            listData.append({"name":"Anchovies"})
            listData.append({"name":"Tomatoes"})
            listData.append({"name":"Pineapple"})
            listData.append({"name":"OnionRings"})
        }
    }

    // list the chosen toppings
    ListContainer{
        id: chosenContainer
        anchors.right: parent.right
        anchors.top: availableContainer.bottom
        anchors.topMargin:4
        height:parent.height/3
        width:parent.width/4
        border.width: 2
        radius:4
        //z: 10
        titleText:"Chosen Toppings"
        onClickedItem: {
            console.log("Clicked ", listData.get(index).name);
        }
        Component.onCompleted: {
            listData.append({"name":"Pepperoni"})
        }
    }
    Component.onCompleted: {
        livePizzaImage.source = "image://live/pizza"; // Request the pixmap on load
    }

}
