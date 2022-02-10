import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "Scripts.js" as Scripts

ApplicationWindow {
	property string applicationTitle: "Corona Info App"
	property int marginWidth: 4
	property int titleSize: 20

	id: window
	width: 360
	height: 520
	visible: true
	title: applicationTitle
	color: "#000000"
	
	Component.onCompleted: Scripts.loadData()
		
	header: ToolBar {
		background: Rectangle { color: "#1f1f1f" }
		
        RowLayout {
            anchors.fill: parent
            
            Label {
                text: applicationTitle
                font.pointSize: titleSize
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                color: "#ffffff"
            }
            
            ToolButton {
				id: javaScriptRefreshButton
                text: "Aktualisieren"
                font.pointSize: titleSize
                
                contentItem: Text {
					text: javaScriptRefreshButton.text
					font: javaScriptRefreshButton.font
					opacity: enabled ? 1.0 : 0.3
					color: javaScriptRefreshButton.down ? "#1f1f1f" : "#ffffff"
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					elide: Text.ElideRight
				}
				
				onClicked: {
					console.log("START");
					Scripts.loadData();
				}
            }
        }
    }
	
	Popup {
		id: errorPopup
		modal: true
		focus: true
		closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
		visible: false
		anchors.centerIn: parent
		
		padding: 10
		
		contentItem: Text {
			text: "Daten konnten nicht geladen werden."
		}
		
		enter: Transition {
			NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
		}
		
		exit: Transition {
			NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
		}
	}
		
	ScrollView {
		id: mainScrollView
		anchors.fill: parent
		anchors.margins: marginWidth
		clip: true
		ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
		ScrollBar.vertical.policy: ScrollBar.AlwaysOff
		
		ColumnLayout {
			id: mainColumn
			spacing: 3
			width: mainScrollView.width
			
			InfoRectangle {
				id: lastUpdatedInfo
			}
			
			HeadlineInfoRectangle {
				id: weekIncidenceInfo
				descriptionString: "Inzidenz"
			}

			HeadlineInfoRectangle {
				id: deltaCasesInfo
				descriptionString: "COVID-19-Fälle: Aktuell"
			}
			
			HeadlineInfoRectangle {
				id: casesInfo
				descriptionString: "COVID-19-Fälle: Gesamt"
			}
			
			HeadlineInfoRectangle {
				id: deltaDeathsInfo
				descriptionString: "COVID-19-Tote: Aktuell"
			}
			
			HeadlineInfoRectangle {
				id: deathsInfo
				descriptionString: "COVID-19-Tote: Gesamt"
			}
			
			HeadlineInfoRectangle {
				id: deltaRecoveredInfo
				descriptionString: "COVID-19-Genesen: Aktuell"
			}
			
			HeadlineInfoRectangle {
				id: recoveredInfo
				descriptionString: "COVID-19-Genesen: Gesamt"
			}
			
			HeadlineInfoRectangle {
				id: casesPer100kInfo
				descriptionString: "COVID-19-Fälle pro 100.000"
			}
			
			HeadlineInfoRectangle {
				id: casesPerWeekInfo
				descriptionString: "COVID-19-Fälle pro Woche"
			}
			
			HeadlineInfoRectangle {
				id: rValueInfo
				descriptionString: "R-Wert"
			}
			
			HeadlineInfoRectangle {
				id: rLastUpdateInfo
				descriptionString: "R-Wert-Datum"
			}
			
			HeadlineInfoRectangle {
				id: rValue4DaysValueInfo
				descriptionString: "R-Wert: 4 Tage"
			}
			
			HeadlineInfoRectangle {
				id: rValue4DaysDateInfo
				descriptionString: "R-Wert-Datum: 4 Tage"
			}
			
			HeadlineInfoRectangle {
				id: rValue7DaysValueInfo
				descriptionString: "R-Wert: 7 Tage"
			}
			
			HeadlineInfoRectangle {
				id: rValue7DaysDateInfo
				descriptionString: "R-Wert-Datum: 7 Tage"
			}
			
			HeadlineInfoRectangle {
				id: metaSourceInfo
				descriptionString: "Quelle"
			}
			
			HeadlineInfoRectangle {
				id: metaContactInfo
				descriptionString: "Kontakt"
			}
			
			HeadlineInfoRectangle {
				id: metaInfoInfo
				descriptionString: "Info"
			}
			
			HeadlineInfoRectangle {
				id: metaLastUpdateInfo
				descriptionString: "Letzte Aktualisierung"
			}
			
			HeadlineInfoRectangle {
				id: metaLastCheckedForUpdateInfo
				descriptionString: "Letzte Prüfung Aktualisierung"
			}
			
			TextInfoRectangle {
			}
		}
	}
}
