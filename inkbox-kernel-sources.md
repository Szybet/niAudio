So new kernel sources just dropped at kobo labs github and you want to port them to Inkbox and you have already the kernel running and working on stock nickel, yes?

How do you do that? is there a guide?...

![image](https://github.com/Szybet/niAudio/assets/53944559/7236f8e6-fca4-4399-b126-28bd3e32b6a4)

Hell no, I will not wait.

How do I do that then?
I will waste my time by comparing original nia A sources to the one used in InkBox <3
so from here
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6ull-nia/kernel.tar.bz2

Ok thanks god we only need to modify the config
so the commit is here:

https://github.com/Szybet/kernel/commit/d2521ed13f92df5eb60b21673241857f5eb493c0#diff-0a56070a00b6f31ec8c1cf09320c63f56756789d76ca1d7a433b3ee765c09313

And a short description from nicolas:
- you modify kernel config to force cmdline that is embedded in kernel (i think it's called CONFIG_CMDLINE_FORCE)
- you point it to embed a ramdisk, compress it with lzma and embed it in kernel (this ramdisk can be the same as Nia A if it works)
- you enable various config options i don't remember about
