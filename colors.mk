# Color and Style definitions for usage in Makefiles
# To import colors, use: include colors.mk
# Usage: @echo "$(RED)Hello$(NC)"
#
# For custom styling, use the color-with-style function:
#   @echo "$(call color-with-style,RED,BOLD)Hello$(call color-with-style,NONE)"
#   @echo "$(call color-with-style,PURPLE,BOLD_UNDERLINE)Hello$(call color-with-style,NONE)"

# Color code mappings
COLOR_RED := 31
COLOR_GREEN := 32
COLOR_YELLOW := 33
COLOR_BLUE := 34
COLOR_PURPLE := 35
COLOR_CYAN := 36
COLOR_WHITE := 37
COLOR_NONE := 0

# Style code mappings
STYLE_BOLD := 1
STYLE_UNDERLINE := 4
STYLE_BOLD_UNDERLINE := 1;4

# Function to get color combinations (Make function)
define get-color-code
$(COLOR_$(1))
endef

define get-style-code
$(if $(2),$(STYLE_$(2)),0)
endef

define color-with-style
\033[$(call get-style-code,$(2));$(call get-color-code,$(1))m
endef

# Basic colors
RED := $(call color-with-style,RED)
GREEN := $(call color-with-style,GREEN)
CYAN := $(call color-with-style,CYAN)
BLUE := $(call color-with-style,BLUE)
YELLOW := $(call color-with-style,YELLOW)
PURPLE := $(call color-with-style,PURPLE)
WHITE := $(call color-with-style,WHITE)
NC := $(call color-with-style,NONE)
