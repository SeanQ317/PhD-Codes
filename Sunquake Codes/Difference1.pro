;files=findfile('hmi*')
;aia_prep, files, -1, index, data

dif=make_array(4096, 4096, 375)	;MAKES AN ARRAY TO BE FILLED BY FOR LOOP 

FOR i=0, 373 DO BEGIN &$		;MUST BE ONE LESS THAN MAX FRAME, AS CANT REMOVES NECT FRAME AFTER IT

	dif[*,*,i]=(x[*, *, i+1])-(x[*,*,i]) &$		;FOR EXAMPLE, FRAME 101-100 

ENDFOR &$

END