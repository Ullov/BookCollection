#include "searchclient.h"
#include "KTools/src/cpp_h/curl.h"
#include "KTools/src/cpp_h/file.h"

SearchClient::SearchClient() {}

void SearchClient::init()
{
    /*QVector<QByteArray> chunk =
    {
        "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101 Firefox/96.0",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate, br",
        "Referer: https://www.novelupdates.com/series-finder/",
        "Origin: https://www.novelupdates.com"
    };*/
    QVector<QByteArray> chunk =
    {
        "Host: readnovelfull.com",
        "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101 Firefox/97.0",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate, br",
        "Connection: keep-alive",
        "Upgrade-Insecure-Requests: 1",
        "Sec-Fetch-Dest: document",
        "Sec-Fetch-Mode: navigate",
        "Sec-Fetch-Site: cross-site",
        "Pragma: no-cache",
        "Cache-Control: no-cache"
    };
    KTools::Curl cc;
    //cc.setErrFile("/tmp/test", "err.txt");
    //cc.setHeaderMode(KTools::Curl::HeaderMode::Custom);
    //cc.setHttpVersion(KTools::Curl::HttpVersion::Standart);
    //cc.setHeader(chunk);
    cc.setOptions();
    cc.setDebugFile("/tmp/test/debug");
    //KTools::File::writeFile(cc.request("google.com"), "~/test", "curlTest.txt");
    QByteArray data = cc.request("https://www.pixiv.net/en/artworks/89383245");
    //QByteArray data = cc.request("https://amiunique.org/fp");
    KTools::File::writeFile(data, "/tmp/test", "curlTest.html");
    QByteArray tmp;
}
