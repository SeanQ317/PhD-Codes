;files=findfile('hmi*')
;hmi_prep, files, -1, index, data


;vel=data[2600:3400, 1250:2050, *]
x=readfits('AIA_1600.fits')



dif=make_array(800, 800, 112)	;MAKES AN ARRAY TO BE FILLED BY FOR LOOP 

FOR i=0, 111 DO BEGIN &$		;MUST BE ONE LESS THAN MAX FRAME, AS CANT REMOVES NECT FRAME AFTER IT

	dif[*,*,i]=(x[*, *, i+1])-(x[*,*,i]) &$		;FOR EXAMPLE, FRAME 101-100 

ENDFOR &$




END