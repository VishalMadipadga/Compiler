# CS3377.501
# Vishal Madipadga 
# vrm160030@utdallas.edu

#
# Flags for the C++ implicit rules
CXX = gcc
CXXFLAGS =
CPPFLAGS = -Wall

# Flags for the Lex implicit rules
#implicit Makefile rule to make scan.c from scan.l
LEX = /bin/flex
LFLAGS =

#Flags for the Yacc implicit rules
#implicit Makefile  rule to make parse.c from parse.y
YACC = /bin/bison
YFLAGS = -dy

PROJECTNAME = CS3377.Program4

#name of executable file 
EXECFILE =	program4

#all object files
OBJS = parse.o scan.o myproject.o 


.PRECIOUS: scan.c parse.c

.PHONY: clean backup

all: $(EXECFILE) 

clean:
	rm -f $(OBJS) $(EXECFILE)  *~ \* scanner scan.c parse.tab.c parse.c parser y.tab.h
$(EXECFILE):    $(OBJS)
	$(CXX) -o $@ $(OBJS)
	ln -fs ./$@ scanner
	ln -fs ./$@ parser
	
 

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!
                                        
