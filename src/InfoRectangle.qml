import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

Rectangle {
	property string infoString: "<Bitte aktualisieren>"
	
	height: mainLayout.implicitHeight
	Layout.fillWidth: true

	color: "#1f1f1f"
	
	border {
		color: "#2f2f2f"
		width: 2
	}
    
	ColumnLayout {
		id: mainLayout
		spacing: 10
		width: parent.width
				
		Label {
			Layout.alignment: Qt.AlignCenter
			wrapMode: Label.WordWrap
			
			color: "#ffffff"
			text: infoString
			padding: 20
			
			font {
				pointSize: 25
				bold: true
			}
		}
	}
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
