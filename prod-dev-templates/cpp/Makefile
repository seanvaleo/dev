#
# Copyright (C) 2019 Sean Valeo <seanvaleo@outlook.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
CC = gcc
CFLAGS = $(DEBUG) -std=gnu17 -Wall -Wpedantic -Wextra -Wno-unused-parameter -Wno-unused-label -O2
LD = gcc
LDFLAGS = $(DEBUG) -lrt -lpthread -std=gnu17 -Wall -Wpedantic -Wextra -O2
AR = ar
ARFLAGS = rcs
BINPATH = ../../bin/

.PHONY: all
all: flextbl.a flextbl_test


.PHONY: debug
debug: DEBUG = -DDEBUG=1 -g
debug: all


#BUILD .o OBJECTS to .a STATIC LIBRARY
flextbl.a: $(BINPATH)flextbl.o
	$(AR) $(ARFLAGS) $(BINPATH)flextbl.a $(BINPATH)flextbl.o


#LINK .o OBJECTS to BINARY
flextbl_test: $(BINPATH)flextbl_test.o
	$(LD) $(LDFLAGS) $(BINPATH)flextbl_test.o $(BINPATH)flextbl.o -o $(BINPATH)flextbl_test


#COMPILE .c FILES to .o OBJECTS
$(BINPATH)flextbl_test.o: include/flextbl_test.c
	$(CC) $(CFLAGS) -c include/flextbl_test.c -o $(BINPATH)flextbl_test.o

$(BINPATH)flextbl.o: include/flextbl.c include/flextbl.h
	$(CC) $(CFLAGS) -c include/flextbl.c -o $(BINPATH)flextbl.o


