import hashlib
import easygui
import pyperclip

msg = easygui.passwordbox()

msg = hashlib.sha512((msg + 'sugar').encode()).hexdigest()
msg = hashlib.md5((msg + 'vinegar').encode()).hexdigest()
msg = hashlib.sha512((msg + 'msg').encode()).hexdigest()
msg = msg[0:18]
msg = 'A_' + msg

pyperclip.copy(msg)



