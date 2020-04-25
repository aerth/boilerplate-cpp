# edit below this line
CXXFLAGS := -g -Wall -pipe -std=c++11 -pedantic -Werror
LDFLAGS := 
TARGET  := app
SOURCES := *.cpp
ifneq (${debug},)
  $(info Debug build...no optimizations.)
  CXXFLAGS += -O0
  TARGET := ${TARGET}-debug
else
  $(info Release build...with optimizations.)
  CXXFLAGS += -O3
endif

ifneq (${static},)
  CXXFLAGS += -static
  TARGET := ${TARGET}-static
else
  LDFLAGS += -static
endif

MAINMK := Makefile

# dont edit below here
ifeq ($(ADD_CLEAN_RULE),)
ifeq ($(shell ls boiler.mk),)
$(info boiler.mk does not exist, downloading.)
boiler.mk:
	wget -O $@ https://github.com/aerth/boilermake/raw/boiler.mk/Makefile
	@echo bootstrapped. re-run 'make' command.
else
$(info boiler.mk exists, running.)
include boiler.mk
endif #boiler.mk 
endif #ADD_CLEAN_RULE
