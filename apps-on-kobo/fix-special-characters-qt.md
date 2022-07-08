**1.** add `"LC_ALL=en_US"` before launching the binary

**2.** `#include <QTextCodec>` in `main.cpp` and ***after*** creating a QApplication (`QApplication a(argc, argv);`) use this: `QTextCodec::setCodecForLocale(QTextCodec::codecForName("utf8"));`

**3.** If something breaks anyway, use this function:
```cpp
    inline QString SpecialChFix(QString string)
    {
        // Use this if the code below doesn't work
        //QTextCodec *codec = QTextCodec::codecForName("ISO 8859-1");
        //QString repair = codec->fromUnicode(string.toStdU16String());
        
        QString returning = string.toLocal8Bit();
        return returning;
    }
```

Congratulations, now if saturn alligns with mars in a specific 15 cm angle between moon your fonts will be working

._.
