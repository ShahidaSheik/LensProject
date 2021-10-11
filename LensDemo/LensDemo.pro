QT += quick widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        anterioraspheric.cpp \
        anteriorspherical.cpp \
        anteriortoric.cpp \
        lens.cpp \
        lensfile.cpp \
        lenspropmodel.cpp \
        main.cpp \
        posteriorasperical.cpp \
        posteriorspeheric.cpp \
        posteriortoric.cpp \
        sett.cpp

RESOURCES += qml.qrc \
    resource.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    anterioraspheric.h \
    anteriorspherical.h \
    anteriortoric.h \
    lens.h \
    lensfile.h \
    lenspropmodel.h \
    posteriorasperical.h \
    posteriorspeheric.h \
    posteriortoric.h \
    sett.h

DISTFILES +=
