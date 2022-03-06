import os
from time import sleep

_ = input('Remove device if connected, and press any key to continue...')

_dev = os.listdir('/dev')

print('Connect device.')

while True:
    dev = os.listdir('/dev')
    n   = [i for i in dev if i not in _dev]
    p   = [i for i in n if i.startswith('tty')]
    if p:
        print('Device found at path: ' + '/dev/' + p[0])
        break
    sleep(0.05)


