# Copyright 1994-2010 The MathWorks, Inc.
#
# File    : rtwsfcn_vcx64.tmf   $Revision: 1.1.6.14 $
#
# Abstract:
#       Template makefile for building a Windows-based, generated S-Function of 
#       Simulink model using generated C code and the
#          Microsoft Visual C/C++ compiler version 8.0 for x64
#
#       Note that this template is automatically customized by the build 
#       procedure to create "<model>.mk"
#
#       The following defines can be used to modify the behavior of the
#       build:
#
#         OPT_OPTS       - Optimization option. Specify OPT_OPTS=-g to
#                          create a mex file for debugging.
#         MEX_OPTS       - User specific mex options.
#         USER_SRCS      - Additional user sources, such as files needed by
#                          S-functions.
#         USER_INCLUDES  - Additional include paths
#                          (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#
#       This template makefile is designed to be used with a system target
#       file that contains 'rtwgensettings.BuildDirSuffix' see rtwsfcn.tlc

#------------------------ Macros read by make_rtw -----------------------------
#
# The following macros are read by the build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the build procedure (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = nmake
HOST            = PC
BUILD           = yes
SYS_TARGET_FILE = rtwsfcn.tlc
COMPILER_TOOL_CHAIN = vcx64

#---------------------- Tokens expanded by make_rtw ---------------------------
#
# The following tokens, when wrapped with "|>" and "<|" are expanded by the
# build procedure.
#
#  MODEL_NAME      - Name of the Simulink block diagram
#  MODEL_MODULES   - Any additional generated source modules
#  MAKEFILE_NAME   - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT     - Path to where MATLAB is installed.
#  MATLAB_BIN      - Path to MATLAB executable.
#  S_FUNCTIONS     - List of S-functions.
#  S_FUNCTIONS_LIB - List of S-functions libraries to link.
#  SOLVER          - Solver source file name
#  NUMST           - Number of sample times
#  TID01EQ         - yes (1) or no (0): Are sampling rates of continuous task
#                    (tid=0) and 1st discrete task equal.
#  NCSTATES        - Number of continuous states
#  MEXEXT          - extension that a mex file has. See the MATLAB mexext 
#                    command
#  BUILDARGS       - Options passed in at the command line.
#  CREATEMODEL     - 1 will cause a untitled model to be opened with the
#                    generated s-function block inside it.
#  USERMODULES     - passed along for later code generations of models that
#                    contain this S-Function. (Used by generated S-Function block)
#  USEPARAMVALUES  - 1 will cause the generated S-function block to have values
#                    instead of variable names.

MODEL              = DC
MODULES            = rtGetInf.c rtGetNaN.c 
MAKEFILE           = DC.mk
MATLAB_ROOT        = C:\Program Files\MATLAB\R2011a
ALT_MATLAB_ROOT    = C:\PROGRA~1\MATLAB\R2011a
MATLAB_BIN         = C:\Program Files\MATLAB\R2011a\bin
ALT_MATLAB_BIN     = C:\PROGRA~1\MATLAB\R2011a\bin
MASTER_ANCHOR_DIR  = 
START_DIR          = C:\Users\hp\mufb\DC_Motor_Battery
S_FUNCTIONS        = 
S_FUNCTIONS_LIB    = 
SOLVER             = ode45.c
NUMST              = 2
TID01EQ            = 0
NCSTATES           = 2
MEM_ALLOC          = RT_STATIC
MEXEXT             = mexw64
BUILDARGS          =  GENERATE_REPORT=0 MODELLIB=DClib.lib RELATIVE_PATH_TO_ANCHOR=.. MODELREF_TARGET_TYPE=NONE
CREATEMODEL        = 1
USERMODULES        =  
USEPARAMVALUES     = 0
MEX_OPT_FILE       = -f "$(MATLAB_BIN)\$(ML_ARCH)\mexopts\msvc100opts.bat"
COMPUTER           = PCWIN64
OPTIMIZATION_FLAGS = /Od /Oy-
ADDITIONAL_LDFLAGS = 

!if "$(MATLAB_ROOT)" != "$(ALT_MATLAB_ROOT)"
MATLAB_ROOT = $(ALT_MATLAB_ROOT)
!endif
!if "$(MATLAB_BIN)" != "$(ALT_MATLAB_BIN)"
MATLAB_BIN = $(ALT_MATLAB_BIN)
!endif

#--------------------------- Tool Specifications ------------------------------

CPU = AMD64
!include $(MATLAB_ROOT)\rtw\c\tools\vctools.mak
APPVER = 5.02

MEX    = $(MATLAB_BIN)\mex
CC     = $(MATLAB_BIN)\mex -c
CPP    = $(MATLAB_BIN)\mex -c
LIBCMD = lib
PERL   = $(MATLAB_ROOT)\sys\perl\win32\bin\perl

#------------------------------ Include/Lib Path ------------------------------
MATLAB_INCLUDES =                    $(MATLAB_ROOT)\simulink\include
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(MATLAB_ROOT)\extern\include
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(MATLAB_ROOT)\rtw\c\src

# Additional file include paths

MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(START_DIR)\DC_sfcn_rtw
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(START_DIR)

INCLUDE = .;..;$(MATLAB_INCLUDES);$(INCLUDE)

#------------------------ C and MEX optimization options ----------------------

DEFAULT_OPT_OPTS = -O

MEX_OPTS = 
OPT_OPTS = $(DEFAULT_OPT_OPTS)

!if "$(OPTIMIZATION_FLAGS)" != ""
MEX_OPT_OPTS = OPTIMFLAGS="$(OPTIMIZATION_FLAGS)"    # passed to 'mex -c'
!else
MEX_OPT_OPTS = $(OPT_OPTS)    # passed to 'mex -c'
!endif

!if "$(MEX_OPTS)" == "-g"
MEX_OPT_OPTS =
!endif

!if "$(ADDITIONAL_LDFLAGS)" != ""
MEX_LDFLAGS = LINKFLAGS="$$LINKFLAGS $(ADDITIONAL_LDFLAGS)"
!else
MEX_LDFLAGS =
!endif


#-------------------------------- Mex Options  --------------------------------

MEX_FLAGS = $(MEX_ARCH) $(MEX_OPTS) $(MEX_OPT_OPTS) $(MEX_LDFLAGS) $(MEX_OPT_FILE)

#----------------------------- Source Files -----------------------------------
USER_SRCS =


SRCS = $(MODULES) $(USER_SRCS)

OBJS_CPP_UPPER = $(SRCS:.CPP=.obj)
OBJS_CPP_LOWER = $(OBJS_CPP_UPPER:.cpp=.obj)
OBJS_C_UPPER = $(OBJS_CPP_LOWER:.C=.obj)
OBJS_C_LOWER = $(OBJS_C_UPPER:.c=.obj)
OBJS = $(MODEL)_sf.obj $(OBJS_C_LOWER)

#-------------------------- Additional Libraries ------------------------------

LIBS = 



LIBUT    = $(MATLAB_ROOT)\extern\lib\win64\microsoft\libut.lib
LIBFIXPT = $(MATLAB_ROOT)\extern\lib\win64\microsoft\libfixedpoint.lib
LIBS     = $(LIBS) $(LIBUT) $(LIBFIXPT)

CMD_FILE = $(MODEL).lnk
GEN_LNK_SCRIPT = $(MATLAB_ROOT)\rtw\c\tools\mkvc_lnk.pl

#--------------------------------- Rules --------------------------------------
all: set_environment_variables ..\$(MODEL)_sf.$(MEXEXT)

..\$(MODEL)_sf.$(MEXEXT) : $(OBJS) $(LIBS)
	@cmd /C "echo ### Linking ..."
	$(PERL) $(GEN_LNK_SCRIPT) $(CMD_FILE) $(OBJS)
	$(MEX) $(MEX_FLAGS) @$(CMD_FILE) $(LIBS) $(S_FUNCTIONS_LIB) -outdir .. 
	@cmd /C "echo ### Created MEX-file $(MODEL)_sf.$(MEXEXT)"

# Look in simulink/src helper files

{$(MATLAB_ROOT)\simulink\src}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(MEX_FLAGS) $<

{$(MATLAB_ROOT)\simulink\src}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CPP) $(MEX_FLAGS) $<

# Additional sources

{$(MATLAB_ROOT)\rtw\c\src}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(MEX_FLAGS) $<



{$(MATLAB_ROOT)\rtw\c\src}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CPP) $(MEX_FLAGS) $<



# Put these rules last, otherwise nmake will check toolboxes first

{..}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(MEX_FLAGS) $(USER_INCLUDES) $<

{..}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CPP) $(MEX_FLAGS) $(USER_INCLUDES) $<

.c.obj :
	@cmd /C "echo ### Compiling $<"
	@if exist $*.pdb del $*.pdb
	@if exist ..\$(MODEL)_sf.pdb del ..\$(MODEL)_sf.pdb
	$(CC) $(MEX_FLAGS) $(USER_INCLUDES) $<

.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	@if exist $*.pdb del $*.pdb
	@if exist ..\$(MODEL)_sf.pdb del ..\$(MODEL)_sf.pdb
	$(CPP) $(MEX_FLAGS) $(USER_INCLUDES) $<

set_environment_variables:
	@set INCLUDE=$(INCLUDE)
	@set LIB=$(LIB)
	@set MATLAB=$(MATLAB_ROOT)

# Libraries





#----------------------------- Dependencies -----------------------------------

$(OBJS) : $(MAKEFILE) rtw_proj.tmw

