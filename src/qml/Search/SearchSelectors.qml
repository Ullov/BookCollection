import QtQuick 2.0
import QtQuick.Controls 2.15
import "qrc:/qml/QmlIncludes" as KTools

Rectangle {
    id: base
    height: 800
    width: 300
    KTools.Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Options"
        font.pixelSize: 20
    }

    KTools.Text {
        id: typeSection
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.margins: 5
        text: "Type"
        font.pixelSize: 16
    }
    KTools.InputCheckbox {
        id: checkLn
        anchors.margins: 5
        anchors.top: typeSection.bottom
        anchors.left: parent.left
        text: "Light Novel"
    }
    KTools.InputCheckbox {
        id: checkPn
        anchors.margins: 5
        anchors.top: checkLn.bottom
        anchors.left: parent.left
        text: "Published Novel"
    }
    KTools.InputCheckbox {
        id: checkWn
        anchors.margins: 5
        anchors.top: checkPn.bottom
        anchors.left: parent.left
        text: "Web Novel"
    }

    KTools.Text {
        id: languageSection
        anchors.left: parent.left
        anchors.top: checkWn.bottom
        anchors.margins: 5
        text: "Language"
        font.pixelSize: 16
    }
    KTools.InputCheckbox {
        id: checkChinese
        anchors.margins: 5
        anchors.top: languageSection.bottom
        anchors.left: parent.left
        text: "Chinese"
    }
    KTools.InputCheckbox {
        id: checkJapanese
        anchors.margins: 5
        anchors.top: checkChinese.bottom
        anchors.left: parent.left
        text: "Japanese"
    }
    KTools.InputCheckbox {
        id: checkKorean
        anchors.margins: 5
        anchors.top: checkJapanese.bottom
        anchors.left: parent.left
        text: "Korean"
    }
    KTools.InputCheckbox {
        id: checkOther
        anchors.margins: 5
        anchors.top: checkKorean.bottom
        anchors.left: parent.left
        text: "Other"
    }

    KTools.Text {
        id: statusSection
        anchors.left: parent.left
        anchors.top: checkOther.bottom
        anchors.margins: 5
        text: "Story status"
        font.pixelSize: 16
    }
    KTools.LabelComboBoxCombination {
        id: statusChBox
        anchors.left: parent.left
        anchors.top: statusSection.bottom
        anchors.margins: 5
        label.text: ""
        comboBox.textRole: "text"
        Component.onCompleted: {
            model.append({"text": "All", "value": "A"});
            model.append({"text": "Completed", "value": "C"});
            model.append({"text": "Ongoing", "value": "O"});
            model.append({"text": "Hiatus", "value": "H"});
            comboBox.currentIndex = 0
        }
    }

    KTools.Text {
        id: sortingSection
        anchors.left: parent.left
        anchors.top: statusChBox.bottom
        anchors.margins: 5
        text: "Sort type"
        font.pixelSize: 16
    }
    KTools.LabelComboBoxCombination {
        id: sortingChBox
        anchors.left: parent.left
        anchors.top: sortingSection.bottom
        anchors.margins: 5
        label.text: ""
        comboBox.textRole: "text"
        Component.onCompleted: {
            model.append({"text": "Last updated", "value": "L"});
            model.append({"text": "Title", "value": "T"});
            model.append({"text": "Reviews", "value": "R"});
            model.append({"text": "Rating", "value": "Ra"});
            model.append({"text": "Readers", "value": "Re"});
            model.append({"text": "Rank", "value": "Ran"});
            model.append({"text": "Frequency", "value": "F"});
            model.append({"text": "Chapters", "value": "C"});
            comboBox.currentIndex = 0
        }
    }

    KTools.Text {
        id: genresSection
        anchors.left: parent.left
        anchors.top: sortingChBox.bottom
        anchors.margins: 5
        text: "Genres"
        font.pixelSize: 16
    }
    Rectangle {
        id: genresRect
        anchors.left: parent.left
        anchors.top: genresSection.bottom
        anchors.right: parent.right
        anchors.margins: 5
        height: 120
        border.color: "Black"
        clip: true
        MouseArea {
            anchors.fill: parent
            drag.target: list
            drag.axis: Drag.YAxis
            drag.maximumY: 0
            drag.minimumY: (list.height - 110) * -1
            onWheel: {
                if (wheel.angleDelta.y < 0 && list.y > drag.minimumY)
                {
                    list.y -= 10
                }
                else if (wheel.angleDelta.y > 0 && list.y < 0)
                {
                    list.y += 10
                }
            }
        }
        Rectangle {
            anchors.fill: parent
            anchors.margins: 4
            clip: true
            Rectangle {
                id: list
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1060
                border.color: "Black"
                KTools.InputCheckbox {
                    id: checkGAction
                    anchors.margins: 5
                    anchors.top: parent.top
                    anchors.left: parent.left
                    text: "Action"
                }
                KTools.InputCheckbox {
                    id: checkGAdult
                    anchors.margins: 5
                    anchors.top: checkGAction.bottom
                    anchors.left: parent.left
                    text: "Adult"
                }
                KTools.InputCheckbox {
                    id: checkGAdventure
                    anchors.margins: 5
                    anchors.top: checkGAdult.bottom
                    anchors.left: parent.left
                    text: "Adventure"
                }
                KTools.InputCheckbox {
                    id: checkGComedy
                    anchors.margins: 5
                    anchors.top: checkGAdventure.bottom
                    anchors.left: parent.left
                    text: "Comedy"
                }
                KTools.InputCheckbox {
                    id: checkGDrama
                    anchors.margins: 5
                    anchors.top: checkGComedy.bottom
                    anchors.left: parent.left
                    text: "Drama"
                }
                KTools.InputCheckbox {
                    id: checkGEcchi
                    anchors.margins: 5
                    anchors.top: checkGDrama.bottom
                    anchors.left: parent.left
                    text: "Ecchi"
                }
                KTools.InputCheckbox {
                    id: checkGFantasy
                    anchors.margins: 5
                    anchors.top: checkGEcchi.bottom
                    anchors.left: parent.left
                    text: "Fantasy"
                }
                KTools.InputCheckbox {
                    id: checkGGenderBender
                    anchors.margins: 5
                    anchors.top: checkGFantasy.bottom
                    anchors.left: parent.left
                    text: "Gender bender"
                }
                KTools.InputCheckbox {
                    id: checkGHarem
                    anchors.margins: 5
                    anchors.top: checkGGenderBender.bottom
                    anchors.left: parent.left
                    text: "Harem"
                }
                KTools.InputCheckbox {
                    id: checkGHistorical
                    anchors.margins: 5
                    anchors.top: checkGHarem.bottom
                    anchors.left: parent.left
                    text: "Historical"
                }
                KTools.InputCheckbox {
                    id: checkGHorror
                    anchors.margins: 5
                    anchors.top: checkGHistorical.bottom
                    anchors.left: parent.left
                    text: "Horror"
                }
                KTools.InputCheckbox {
                    id: checkGJosei
                    anchors.margins: 5
                    anchors.top: checkGHorror.bottom
                    anchors.left: parent.left
                    text: "Josei"
                }
                KTools.InputCheckbox {
                    id: checkGMartialArts
                    anchors.margins: 5
                    anchors.top: checkGJosei.bottom
                    anchors.left: parent.left
                    text: "Martial arts"
                }
                KTools.InputCheckbox {
                    id: checkGMature
                    anchors.margins: 5
                    anchors.top: checkGMartialArts.bottom
                    anchors.left: parent.left
                    text: "Mature"
                }
                KTools.InputCheckbox {
                    id: checkGMecha
                    anchors.margins: 5
                    anchors.top: checkGMature.bottom
                    anchors.left: parent.left
                    text: "Mecha"
                }
                KTools.InputCheckbox {
                    id: checkGMystery
                    anchors.margins: 5
                    anchors.top: checkGMecha.bottom
                    anchors.left: parent.left
                    text: "Mystery"
                }
                KTools.InputCheckbox {
                    id: checkGPsychological
                    anchors.margins: 5
                    anchors.top: checkGMystery.bottom
                    anchors.left: parent.left
                    text: "Psychological"
                }
                KTools.InputCheckbox {
                    id: checkGRomance
                    anchors.margins: 5
                    anchors.top: checkGPsychological.bottom
                    anchors.left: parent.left
                    text: "Romance"
                }
                KTools.InputCheckbox {
                    id: checkGSchoolLife
                    anchors.margins: 5
                    anchors.top: checkGRomance.bottom
                    anchors.left: parent.left
                    text: "School life"
                }
                KTools.InputCheckbox {
                    id: checkGSciFi
                    anchors.margins: 5
                    anchors.top: checkGSchoolLife.bottom
                    anchors.left: parent.left
                    text: "Sci-fi"
                }
                KTools.InputCheckbox {
                    id: checkGSeinen
                    anchors.margins: 5
                    anchors.top: checkGSciFi.bottom
                    anchors.left: parent.left
                    text: "Seinen"
                }
                KTools.InputCheckbox {
                    id: checkGShoujo
                    anchors.margins: 5
                    anchors.top: checkGSeinen.bottom
                    anchors.left: parent.left
                    text: "Shoujo"
                }
                KTools.InputCheckbox {
                    id: checkGShoujoAi
                    anchors.margins: 5
                    anchors.top: checkGShoujo.bottom
                    anchors.left: parent.left
                    text: "Shoujo ai"
                }
                KTools.InputCheckbox {
                    id: checkGShounen
                    anchors.margins: 5
                    anchors.top: checkGShoujoAi.bottom
                    anchors.left: parent.left
                    text: "Shounen"
                }
                KTools.InputCheckbox {
                    id: checkGShounenAi
                    anchors.margins: 5
                    anchors.top: checkGShounen.bottom
                    anchors.left: parent.left
                    text: "Shounen ai"
                }
                KTools.InputCheckbox {
                    id: checkGSliceOfLife
                    anchors.margins: 5
                    anchors.top: checkGShounenAi.bottom
                    anchors.left: parent.left
                    text: "Slice of life"
                }
                KTools.InputCheckbox {
                    id: checkGSmut
                    anchors.margins: 5
                    anchors.top: checkGSliceOfLife.bottom
                    anchors.left: parent.left
                    text: "Smut"
                }
                KTools.InputCheckbox {
                    id: checkGSports
                    anchors.margins: 5
                    anchors.top: checkGSmut.bottom
                    anchors.left: parent.left
                    text: "Sports"
                }
                KTools.InputCheckbox {
                    id: checkGSupernatural
                    anchors.margins: 5
                    anchors.top: checkGSports.bottom
                    anchors.left: parent.left
                    text: "Supernatural"
                }
                KTools.InputCheckbox {
                    id: checkGTragedy
                    anchors.margins: 5
                    anchors.top: checkGSupernatural.bottom
                    anchors.left: parent.left
                    text: "Tragedy"
                }
                KTools.InputCheckbox {
                    id: checkGWuxia
                    anchors.margins: 5
                    anchors.top: checkGTragedy.bottom
                    anchors.left: parent.left
                    text: "Wuxia"
                }
                KTools.InputCheckbox {
                    id: checkGXianxia
                    anchors.margins: 5
                    anchors.top: checkGWuxia.bottom
                    anchors.left: parent.left
                    text: "Xianxia"
                }
                KTools.InputCheckbox {
                    id: checkGXuanhuan
                    anchors.margins: 5
                    anchors.top: checkGXianxia.bottom
                    anchors.left: parent.left
                    text: "Xuanhuan"
                }
                KTools.InputCheckbox {
                    id: checkGYaoi
                    anchors.margins: 5
                    anchors.top: checkGXuanhuan.bottom
                    anchors.left: parent.left
                    text: "Yaoi"
                }
                KTools.InputCheckbox {
                    id: checkGYuri
                    anchors.margins: 5
                    anchors.top: checkGYaoi.bottom
                    anchors.left: parent.left
                    text: "Yuri"
                }
            }
        }
    }
}
