QT += quick

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++17 object_parallel_to_source

SOURCES += \
    cpp_h/main.cpp \
    cpp_h/searchclient.cpp

HEADERS += \
    cpp_h/searchclient.h

RESOURCES += qml.qrc \
    KTools/src/resource.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/KTools/src/release/ -lKTools
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/KTools/src/debug/ -lKTools
else:unix: LIBS += -L$$OUT_PWD/KTools/src/ -lKTools

LIBS += -lcurl

INCLUDEPATH += $$PWD/KTools/src/cpp_h
DEPENDPATH += $$PWD/KTools/src/cpp_h

