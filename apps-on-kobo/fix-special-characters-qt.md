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

UPDATE: Actually, `LC_ALL=en_US` sometimes breaks things

UPDATE: LC_ALL needs to match other arguments, feathernotes for example:
```sh
#!/system-bin/sh
echo 2 > /sys/class/graphics/fb0/rotate
echo 2 > /sys/class/graphics/fb0/rotate
echo 2 > /sys/class/graphics/fb0/rotate
sleep 1

mkdir -p /app-data/configuration

if [ ! -e /app-data/configuration/keymap ]; then
    echo "us" > /app-data/configuration/keymap
fi

# Remember not to env -i, it messes up with DEVICE_CODENAME for example
# Debug
# env PATH="/app-bin:/system-bin" LD_LIBRARY_PATH="/system-lib/lib:/system-lib/qt/lib:/app-lib" QT_QPA_PLATFORM="kobo:debug:keyboard:mouse" QT_PLUGIN_PATH="/system-lib/qt/plugins/" QT_LOGGING_RULES=qt.qpa.input=true /system-lib/lib/ld-linux-armhf.so.3 /app-bin/feathernotes.bin

keymap=$(cat /app-data/configuration/keymap)
the_lang="${keymap}_$(echo $keymap | tr '[:lower:]' '[:upper:]').UTF-8"

echo $the_lang

# Normal
env PATH="/app-bin:/system-bin" LD_LIBRARY_PATH="/system-lib/lib:/system-lib/qt/lib:/app-lib" QT_QPA_PLATFORM="kobo:keyboard:mouse" QT_PLUGIN_PATH="/system-lib/qt/plugins/" XDG_CONFIG_HOME="/app-data/configuration/" XKB_DEFAULT_LAYOUT="${keymap}" LC_ALL="${the_lang}" /system-lib/lib/ld-linux-armhf.so.3 /app-bin/feathernotes.bin
```
