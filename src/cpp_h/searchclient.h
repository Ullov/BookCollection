#ifndef SEARCHCLIENT_H
#define SEARCHCLIENT_H

#include <QObject>

class SearchClient : public QObject
{
    Q_OBJECT
public:
    SearchClient();

    void init();
};

#endif // SEARCHCLIENT_H
