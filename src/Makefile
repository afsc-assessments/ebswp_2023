
ifdef ComSpec
    RM=del /F /Q
    COPY=copy
else
    RM=rm -rf
    COPY=cp
endif

all: pm pm_p 

pm: pm.tpl 
	@admb -f pm.tpl 


pm_p: pm_p.tpl 
	@admb  pm_p.tpl 

clean:
	@$(RM) pm.cpp
	@$(RM) pm.htp
	@$(RM) pm.obj
