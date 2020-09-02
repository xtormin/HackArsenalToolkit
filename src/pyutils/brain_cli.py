import sys
import argparse

parser = argparse.ArgumentParser(add_help = True, description = '%(prog)s is a simple wordlist merger.')

parser.add_argument('-r','--reset', 
                    help = 'Delete folders created and files downloaded', 
                    nargs = '+', default = None)
parser.add_argument('-f','--forgot-me', 
                    help = 'Delete and remove all - This is so dangerour', 
                    default = None)

def get():
    return parser.parse_args()

def help():
    return parser.print_help(sys.stderr)