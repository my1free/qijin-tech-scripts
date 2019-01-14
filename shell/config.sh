#!/bin/bash

# Reference: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Color
# no color
NC='\033[0m'
# white color
WHITE='\033[1;37m'
# black color
BLACK='\033[0;30m'
# red color
RED='\033[0;31m'
# light red color
LIGHT_RED='\033[1;31m'
# green color
GREEN='\033[0;32m'
# light green color
LIGHT_GREEN='\033[1;32m'
# blue color
BLUE='\033[0;34m'
# light blue color
LIGHT_BLUE='\033[1;34m'
# purple color
PURPLE='\033[0;35m'
# light purple color
LIGHT_PURPLE='\033[1;35m'
# light gray color
LIGHT_GRAY='\033[0;37m'
# dark gray
DARK_GRAY='\033[1;30m'
# yellow color
YELLOW='\033[1;33m'


# bold
BOLD=$(tput bold)
# reset 
NORMAL=$(tput sgr0)
# add underline
UNDERLINE=$(tput smul)
# remove underline
REMOVE_UNDERLINE=$(tput rmul)


h1=${RED}${BOLD}

tab1="    "
tab2=$tab1$tab1
tab3=$tab2$tab1

