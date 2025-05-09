
# reasonable versioning rules:
#   - MAJOR++  -> API-incompatible
#   - MINOR++  -> API-compatible, but new functionality
#   - PATCH++  -> API untouched changes
MAJOR = 2
MINOR = 3
PATCH = 5



LIBRARY = muparser.so
LIBRARY_STATIC = $(LIBRARY:.so=.a)
LIBRARY_MAJOR = $(LIBRARY).$(MAJOR)
LIBRARY_MINOR = $(LIBRARY_MAJOR).$(MINOR)
LIBRARY_PATCH = $(LIBRARY_MINOR).$(PATCH)
VERSION = $(MAJOR).$(MINOR).$(PATCH)
URL = https://github.com/beltoforion/muparser






#/******************************************************************************
# * if you prefer verbose non-coloured build messages, remove the '@' here:
# *****************************************************************************/
#Q = @

CXX ?= g++
CXXFLAGS += -g -O3 -fPIC -Wall -Wextra -Werror=overloaded-virtual -Wfatal-errors
CXXFLAGS += -DVERSION=\"$(VERSION)\"
DEFINES   = -D_POSIX_C_SOURCE -DMUPARSERLIB_EXPORTS -DMUPARSER_DLL
# -D_UNICODE


#/******************************************************************************
# * if you are still running a distro, not beeing able to use all valid
# * standard ASCII Characters (32-126) for package names, and prefer to modify
# * packages instead of fixing your broken distro, you may overwrite the
# * package_name here.
# *****************************************************************************/
package_name ?= $(LIBRARY_PATCH)


#/******************************************************************************
# * color definitions, RST=reset, CY=cyan, MG=magenta, BL=blue, (..)
# *****************************************************************************/
RST=\e[0m
CY=\e[1;36m
MG=\e[1;35m
BL=\e[1;34m
YE=\e[1;33m
RD=\e[1;31m
GN=\e[1;32m

#/******************************************************************************
# * programs, override if on different paths.
# *****************************************************************************/
AR              ?= ar
CD              ?= cd
CP              ?= cp
CHMOD           ?= chmod
CPPCHECK        ?= cppcheck
GIT             ?= git
INSTALL         ?= install
INSTALL_PROGRAM ?= $(INSTALL) -m 755
INSTALL_DATA    ?= $(INSTALL) -m 644
LN              ?= ln
LN_S            ?= $(LN) -s
LN_SF           ?= $(LN) -sf
LN_SFR          ?= $(LN) -sfr
MAKE            ?= make
MKDIR           ?= mkdir
MKDIR_P         ?= ${MKDIR} -p
PKG_CONFIG      ?= pkg-config
RANLIB          ?= @ranlib
RM              ?= rm
SED             ?= sed
SHELL            = /bin/sh
STRIP           ?= strip
TAR             ?= tar
WGET            ?= wget


#/******************************************************************************
# * directories
# *****************************************************************************/
srcdir           = $(shell pwd)/src
tmpdir          ?= /tmp
prefix          ?= /usr
sysconfdir       = $(prefix)/etc
includedir       = $(prefix)/include
sharedstatedir   = $(prefix)/com
localstatedir    = $(prefix)/var
datarootdir      = $(prefix)/share
exec_prefix     ?= $(prefix)
bindir           = $(exec_prefix)/bin
sbindir          = $(exec_prefix)/sbin
libexecdir       = $(exec_prefix)/libexec
libdir           = $(exec_prefix)/lib
datadir          = $(datarootdir)
docdir           = $(datarootdir)/doc/$(package_name)
infodir          = $(datarootdir)/info
localedir        = $(datarootdir)/locale
mandir           = $(datarootdir)/man
man1dir          = $(mandir)/man1
man2dir          = $(mandir)/man2
man3dir          = $(mandir)/man3
man4dir          = $(mandir)/man4
man5dir          = $(mandir)/man5
pkgconfigdir     = /usr/lib/pkgconfig

SOURCES  := $(sort $(wildcard $(srcdir)/*.cpp))
OBJS      = $(SOURCES:.cpp=.o)
LIBS      =
INCLUDES  = -I$(shell pwd)/include
LDFLAGS  += -shared -pthread
DLL       = $(LIBRARY:.so=.dll)

define PKG_DATA
prefix=$(prefix)
exec_prefix=$${prefix}
includedir=$${prefix}/include
libdir=$${exec_prefix}/lib

Name: muparser
Description: muparser - fast math parser library
URL: $(URL)
Version: $(VERSION)
Libs: -L$${libdir} -lmuparser
Cflags: -I$${includedir}
endef

%.o: %.cpp
ifeq ($(Q),@)
	@echo -e "${BL} CXX $@${RST}"
endif
	$(Q)$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $(DEFINES) $(INCLUDES) -o $@ $<

$(LIBRARY_PATCH): $(OBJS)
ifeq ($(Q),@)
	@echo -e "${GN} LINK $(LIBRARY_PATCH)${RST}"
endif
	$(Q)$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) -Wl,-soname,$(LIBRARY_MAJOR) $(OBJS) $(LIBS) -o $(LIBRARY_PATCH)

$(LIBRARY_STATIC): $(OBJS)
ifeq ($(Q),@)
	@echo -e "${GN} CREATE $(LIBRARY_STATIC)${RST}"
endif
	$(Q)$(AR) -r -c $(LIBRARY_STATIC) $(OBJS)
ifeq ($(Q),@)
	@echo -e "${GN} RANLIB $(LIBRARY_STATIC)${RST}"
endif
	$(Q)$(RANLIB) $(LIBRARY_STATIC)

dll: $(DLL)

$(DLL): $(OBJS)
ifeq ($(Q),@)
	@echo -e "${GN} LINK $(DLL)${RST}"
endif
	$(Q)$(CXX) $(CXXFLAGS) $(LDFLAGS) -Wl,--subsystem,windows,--out-implib,$(DLL).a $(OBJS) $(LIBS) -o $(DLL) 

.PHONY: clean Version.h
clean:
	@$(RM) -f $(OBJS) $(LIBRARY)* $(LIBRARY_STATIC) $(DLL) $(DLL).a muparser.pc

install: $(LIBRARY_PATCH)
	$(file >muparser.pc,$(PKG_DATA))
	$(MKDIR_P) $(DESTDIR)$(libdir)
	$(MKDIR_P) $(DESTDIR)$(includedir)
	$(MKDIR_P) $(DESTDIR)$(docdir)
	$(MKDIR_P) $(DESTDIR)$(man1dir)
	$(MKDIR_P) $(DESTDIR)$(pkgconfigdir)
	$(INSTALL_PROGRAM) $(LIBRARY_PATCH) $(DESTDIR)$(libdir)
	$(INSTALL_DATA) muParserDLL.h $(DESTDIR)$(includedir)
	$(LN_SFR) $(DESTDIR)$(libdir)/$(LIBRARY_PATCH) $(DESTDIR)$(libdir)/$(LIBRARY_MINOR)
	$(LN_SFR) $(DESTDIR)$(libdir)/$(LIBRARY_MINOR) $(DESTDIR)$(libdir)/$(LIBRARY_MAJOR)
	$(LN_SFR) $(DESTDIR)$(libdir)/$(LIBRARY_MAJOR) $(DESTDIR)$(libdir)/$(LIBRARY)
	$(INSTALL_DATA) CONTRIBUTORS COPYING README $(DESTDIR)$(docdir)
	$(INSTALL_DATA) muparser.pc $(DESTDIR)$(pkgconfigdir)

install-static: $(LIBRARY_STATIC)
	$(file >muparser.pc,$(PKG_DATA))
	$(MKDIR_P) $(DESTDIR)$(libdir)
	$(MKDIR_P) $(DESTDIR)$(includedir)
	$(MKDIR_P) $(DESTDIR)$(docdir)
	$(MKDIR_P) $(DESTDIR)$(man1dir)
	$(MKDIR_P) $(DESTDIR)$(pkgconfigdir)
	$(INSTALL_DATA) $(LIBRARY_STATIC) $(DESTDIR)$(libdir)
	$(INSTALL_DATA) muParserDLL.h $(DESTDIR)$(includedir)
	$(INSTALL_DATA) CONTRIBUTORS COPYING README $(DESTDIR)$(docdir)
	$(INSTALL_DATA) muparser.pc $(DESTDIR)$(pkgconfigdir)


uninstall:
	$(RM) -f $(DESTDIR)$(libdir)/$(LIBRARY_PATCH)
	$(RM) -f $(DESTDIR)$(libdir)/$(LIBRARY_MINOR)
	$(RM) -f $(DESTDIR)$(libdir)/$(LIBRARY_MAJOR)
	$(RM) -f $(DESTDIR)$(libdir)/$(LIBRARY)
	$(RM) -f $(DESTDIR)$(libdir)/$(LIBRARY_STATIC)
	$(RM) -f $(DESTDIR)$(includedir)/muParser*
	$(RM) -f $(DESTDIR)$(docdir)/CONTRIBUTORS
	$(RM) -f $(DESTDIR)$(docdir)/COPYING
	$(RM) -f $(DESTDIR)$(docdir)/README
	$(RM) -rf $(DESTDIR)$(docdir)
	$(RM) -f $(DESTDIR)$(man1dir)/muparser.1
	$(RM) -f $(DESTDIR)$(pkgconfigdir)/muparser.pc

dist: clean
	@-$(RM) -rf $(LIBRARY_STATIC)
	@-$(RM) -rf muparser.so*
	@-$(RM) -rf muparser.dll*
	@-$(RM) -rf *.tar.bz2
	@-$(RM) -rf $(tmpdir)/$(LIBRARY_PATCH)
	@$(MKDIR_P) $(tmpdir)/$(LIBRARY_PATCH)
	@$(CP) -a * $(tmpdir)/$(LIBRARY_PATCH)
	@$(TAR) cfj $(LIBRARY_PATCH).tar.bz2 -C $(tmpdir) $(LIBRARY_PATCH)
	@-$(RM) -rf $(tmpdir)/$(LIBRARY_PATCH)
	@echo Distribution package created as $(LIBRARY_PATCH).tar.bz2

SUPPRESS_CHECK = --suppress=missingIncludeSystem --suppress=unusedFunction --suppress=passedByValue --suppress=constParameterReference


#/******************************************************************************
# * debug
# *****************************************************************************/
printvars:
	@echo "VERSION            = $(VERSION)"
	@echo "LIBRARY            = $(LIBRARY)"
	@echo "CXX                = $(CXX)"
	@echo "CXXFLAGS           = $(CXXFLAGS)"
	@echo "DEFINES            = $(DEFINES)"
	@echo "INCLUDES           = $(INCLUDES)"
	@echo "SOURCES            = $(SOURCES)"
	@echo "OBJS               = $(OBJS)"
	@echo "LIBS               = $(LIBS)"
	@echo "LDFLAGS            = $(LDFLAGS)"
	@echo "AR                 = $(AR)"
	@echo "RANLIB             = $(RANLIB)"
