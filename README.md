# showcasing bug in Keynote where we can't select the last character through the AX API

we're supposed to be able to select any character. works in any other app including Pages and Numbers, but not in Keynote. makes [kindaVim](https://kindavim.app) unusable.

# instructions for the Apple people

1. download the source
2. build the app
3. give it Accessibility Permissions
4. you have three buttons that you can try, one that selects the first character of a the focused element, one that selects the one to last, one that selects the last
5. press a button, you have then 3 seconds to click and make the app/window/text that you wanna check frontmost
6. see that for Keynote, it is not possible to select the last character, for example. the APIs with selectedTextRange return success, but nothing happens, the last character is not selected

# wonderful video
