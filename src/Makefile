
ifdef ComSpec
    RM=del /F /Q
    COPY=copy
else
    RM=rm -rf
    COPY=cp
endif

all: pm 

pm: pm.tpl 
	@admb -f pm.tpl 

clean:
	@$(RM) pm.cpp
	@$(RM) pm.htp
	@$(RM) pm.obj
