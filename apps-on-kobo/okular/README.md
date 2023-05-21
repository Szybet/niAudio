Attempt to launch okular on kobos, InkBox OS

https://github.com/Szybet/niAudio/assets/53944559/46cc12a5-c4d4-4cd3-9f4f-5d9a0010e58d

![image](https://github.com/Szybet/niAudio/assets/53944559/232cb5c2-6b12-47ad-b5c1-7220ee9660e9)

![image](https://github.com/Szybet/niAudio/assets/53944559/44d21e0b-4619-4cbd-90ff-9554b1f8e217)

sources: https://github.com/Szybet/okular-crosscompilation-hell

The current problem is in `Document::OpenResultTextDocumentGenerator::loadDocumentWithPassword` where the first call to `d->mDocument->pageCount();` freezes the app for x ammount of time, depending the size because it's propably calculating the number of pages. Small files work pretty fine, but not that I care.

Okular devs didn't helped, there is propably no sollution to this

And it requires dbus to be compiled with it, otherwise it crashes on opening a file.
