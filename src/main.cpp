#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "MainGUI.h"

int main(int argc, char *argv[]) {
	QGuiApplication app(argc, argv);
	
	QQmlApplicationEngine engine;
	
	engine.load(QUrl("qrc:/MainGUI.qml"));
	if(engine.rootObjects().isEmpty())
		return -1;
		
	return app.exec();
}
