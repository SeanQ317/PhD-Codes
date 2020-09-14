restore, 'v_cog 2.idl'			;RESTORES DATA

v_cog_new=v_cog*(-1)			;SWAPS THE INTENSITIES ROUND SO THEY MAKE SENSE 
dif=make_array(969, 975, 225)	;MAKES AN ARRAY TO BE FILLED BY FOR LOOP 

FOR i=0, 224 DO BEGIN &$		;MUST BE ONE LESS THAN MAX FRAME, AS CANT REMOVES NECT FRAME AFTER IT

	dif[*,*,i]=(v_cog_new[*, *, i+1])-(v_cog_new[*,*,i]) &$		;FOR EXAMPLE, FRAME 101-100 

ENDFOR &$

END