import sys, os

clear = lambda: os.system('cls' if os.name=='nt' else 'clear')

def check_version(version):
    assert sys.version_info >= version, "This script requires at least Python {0}.{1}".format(version[0],version[1])