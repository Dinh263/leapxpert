import platform
import os
import subprocess
import time

def terminate_all_current_session():
    """ This keywword is used for terming the current appium process
        First it will try to find which os, because for each different os we have different commands to terminate appium
        then we will use command to terminate
    """
    os_name = platform.system().lower()
    if os_name.startswith('win'):
        os.system('cmd /c "taskkill /F /IM node.exe"')
    else:
        os.system('killall node')

def input_key_using_adb_command(text):
    for char in text:
        if char.isspace():
            subprocess.call(f'adb shell input text "%s"', shell=True)
        else:
            subprocess.call(f'adb shell input text "{char}"', shell=True)
        time.sleep(1)