INCLUDE_PATH =  -I"$(ISE_LIBRARY)/library/time/spec/include"
SHELL = /bin/sh
CC = cc
CPP = c++
CFLAGS = -O0 -pipe -fno-common -fPIC -DEIF_THREADS -DEIF_POSIX_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"/Applications/MacPorts/Eiffel_18.07/EiffelStudio.app/Contents/MacOS/../Resources/../../../studio/spec/macosx-x86-64/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0 -pipe -fno-common -fPIC -DEIF_THREADS -DEIF_POSIX_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"/Applications/MacPorts/Eiffel_18.07/EiffelStudio.app/Contents/MacOS/../Resources/../../../studio/spec/macosx-x86-64/include" -I. $(INCLUDE_PATH)
LDFLAGS = 
CCLDFLAGS =   
LDSHAREDFLAGS =   -dynamiclib -flat_namespace -undefined suppress -o
EIFLIB = "/Applications/MacPorts/Eiffel_18.07/EiffelStudio.app/Contents/MacOS/../Resources/../../../studio/spec/macosx-x86-64/lib/libmtwkbench.a"
EIFTEMPLATES = /Applications/MacPorts/Eiffel_18.07/EiffelStudio.app/Contents/MacOS/../Resources/../../../studio/config/macosx-x86-64/templates
LIBS = -lm -lpthread
MAKE = make
AR = ar
LD = ld
MKDEP = \$(EIFFEL_SRC)/C/mkdep $(DPFLAGS) --
MV = /bin/mv
CP = /bin/cp
RANLIB = :
RM = /bin/rm -f
FILE_EXIST = 
RMDIR = 
X2C = "/Applications/MacPorts/Eiffel_18.07/EiffelStudio.app/Contents/MacOS/../Resources/../../../studio/spec/macosx-x86-64/bin/x2c"
SHAREDLINK = cc
SHAREDLIBS = -lm
SHARED_SUFFIX = .dylib
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = touch finished 
SYSTEM_IN_DYNAMIC_LIB = dictionary.dylib 

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C1_c.o 

OLDOBJECTS =  te968.o te968d.o ex966.o ex966d.o es967.o es967d.o es965.o es965d.o \
	es963.o es963d.o es964.o es964d.o es978.o es978d.o es980.o es980d.o \
	es979.o es979d.o es962.o es962d.o da984.o da984d.o da989.o da989d.o \
	c_958.o c_958d.o ab985.o ab985d.o da986.o da986d.o ti983.o ti983d.o \
	ti973.o ti973d.o da982.o da982d.o da976.o da976d.o du981.o du981d.o \
	da974.o da974d.o da977.o da977d.o da987.o da987d.o fi988.o fi988d.o \
	ti972.o ti972d.o ti971.o ti971d.o da975.o da975d.o gr961.o gr961d.o \
	ti970.o ti970d.o co969.o co969d.o da960.o da960d.o da959.o da959d.o 

all: Cobj1.o

Cobj1.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj1.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

