#!/bin/bash

# Color and Style definitions for usage on bash scripts.
# Usage: source colors.sh && printf "${RED}Hello${NC}\n"
#
# If you want custom styling, you can use the color-with-style function.
# For example: 
#   printf "$(color-with-style RED BOLD)Hello$(color-with-style NONE)\n"
#   printf "$(color-with-style PURPLE BOLD_UNDERLINE)Hello$(color-with-style NONE)\n"
#   printf "$(color-with-style GREEN UNDERLINE)Hello$(color-with-style NONE)\n"

# Color code mappings
COLOR_RED=31
COLOR_GREEN=32
COLOR_YELLOW=33
COLOR_BLUE=34
COLOR_PURPLE=35
COLOR_CYAN=36
COLOR_WHITE=37
COLOR_NONE=0

# Style code mappings
STYLE_BOLD=1
STYLE_UNDERLINE=4
STYLE_BOLD_UNDERLINE='1;4'

# Function to get color combinations
color-with-style() {
  local color=$1
  local style=$2
  local color_code=${!COLOR_${color}}

  local style_code=0
  if [ -n "$style" ]; then
    style_code=${!STYLE_${style}}
  fi

  echo "\033[${style_code};${color_code}m"
}

# Basic colors
export GREEN=$(color-with-style GREEN)
export BLUE=$(color-with-style BLUE)
export CYAN=$(color-with-style CYAN)
export PURPLE=$(color-with-style PURPLE)
export WHITE=$(color-with-style WHITE)
export YELLOW=$(color-with-style YELLOW)
export RED=$(color-with-style RED)
export NC=$(color-with-style NONE)
export RESET_COLOR=$(color-with-style NONE)
