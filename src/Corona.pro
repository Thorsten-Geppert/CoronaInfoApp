QT       += core gui network qml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    MainGUI.cpp \
    main.cpp

HEADERS += \
	MainGUI.h

FORMS +=

RC_ICONS = Icon.ico

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
	Resources.qrc

DISTFILES += \
	Icon.ico \
	android/AndroidManifest.xml \
	android/AndroidManifest.xml \
	android/build.gradle \
	android/build.gradle \
	android/gradle.properties \
	android/gradle.properties \
	android/gradle/wrapper/gradle-wrapper.jar \
	android/gradle/wrapper/gradle-wrapper.jar \
	android/gradle/wrapper/gradle-wrapper.properties \
	android/gradle/wrapper/gradle-wrapper.properties \
	android/gradlew \
	android/gradlew \
	android/gradlew.bat \
	android/gradlew.bat \
	android/res/values/libs.xml \
	android/res/values/libs.xml

#include(android/android.pri)
ANDROID_ABIS = armeabi-v7a
android: include(/Users/thorsten/Library/Android/sdk/android_openssl/openssl.pri)

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
	ANDROID_EXTRA_LIBS = \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/arm/libcrypto_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/arm/libssl_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/arm64/libcrypto_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/arm64/libssl_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/x86/libcrypto_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/x86/libssl_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/x86_64/libcrypto_1_1.so \
		/Users/thorsten/Library/Android/sdk/android_openssl/no-asm/latest/x86_64/libssl_1_1.so
}
