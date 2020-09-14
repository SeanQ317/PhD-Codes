;;RUN VELOCITY.PRO 

;files=findfile('hmi*')
;aia_prep, files, -1, index, data

;restore, 'Full_LOS.sav'
;data=data[*,*,34:*]

radius = make_array(400,400, 160,/double)	;RADIUS OF BOX, FOR EACH FRAME (WILL BE THE SAME)
value = make_array(400,400, 160,/double)	;DIFFERENCE DOPPLERGRAM IN BOX, FOR EACH FRAME
td = make_array(200,/double)
tdtbl1 = make_array(200,160,/double)		
angl = make_array(400,400, 160,/double)		;ANGLE QUAKE IS INSIDE BOX, FROM CENTRE OF BOX, FOR EACH FRAME
box = make_array(400,400,160,/double)		;CREATES BOX AROUND DESIRED REGION, FOR ECH FRAME
box1= make_array(400,400,/double)			;CREATES A 2D BOX AROUND DESIRED REGION, FOR EACH FRAME, BUT NOT SAVING THEM

;xstart = 2729.0					;START OF BOX IN X-DIRECTION
;xend = 3129.0					;END OF BOX IN X-DIRECTION
;ystart = 1422.0					;START OF BOX IN Y-DIRECTION
;yend = 1822.0					;END OF BOX IN Y-DIRECTION

xstart = 2729.0					;START OF BOX IN X-DIRECTION
xend = 3129.0					;END OF BOX IN X-DIRECTION
ystart = 1461.0					;START OF BOX IN Y-DIRECTION
yend = 1861.0					;END OF BOX IN Y-DIRECTION



;dif=make_array(4096, 4096, 84)	;MAKES AN ARRAY TO BE FILLED BY FOR LOOP 

r=double(0)
savepath='./'

FOR t=0, 158 DO BEGIN &$		;MUST BE ONE LESS THAN MAX FRAME, AS CAN'T REMOVES NEXT FRAME AFTER IT

	;dif[*,*,t]=(data[*, *, t+1])-(data[*, *, t]) &$		;FOR EXAMPLE, FRAME 101-100 
	box[*,*,t]=dif[xstart:xend-1, ystart:yend-1, t]				;CREATES BOX AROUND DESIRED REGION 
	box1[*,*]=box[*,*,t]											;CREATES 2D BOX AROUND DESIRED REGION

	i=0

	;THIS LOOP CONVERTS IMAGE TO CYLINDRICAL COORDINATES

	FOR x=0, 399 do begin
		
		j=0
		
		FOR y=0, 399 do begin
			
			rect=[i-200,j-200, box1[x,y]]							;RECT REPRESENTS THE BOX IN CARTESIAN COORDINATES, FOR CENTRE OF ARRAY TO BE AT (0,0), 
																	;200 MUST BE TAKEN FROM BOTH X AND Y, OTHERWISE CENTRE WOULD BE (200,200)
																
			cyli=cv_coord(from_rect=rect, /to_cylin, /degrees)		;CV_COORD CONVERTS CARTESIAN POINT TO CYLINDRICAL, WHERE THE RESULTS ARE AN ARRAY[3], WHERE;
			angl[x,y,t]=cyli(0)										;CYLI[0] REPRESENTS ANGLE THE POINT IS FROM CENTER
			radius[x,y,t]=abs(cyli(1))								;CYLI[1] REPRESENTS THE RADIUS THE POINT IS FROM CENTER
			value[x,y,t]=cyli(2)									;CYLI[2] REPRESENTS THE VLUE OF THAT POINT IN TERMS OF THE DIFFERENCE DOPPLERGRAM 
			j=j+1
			r=r+1
			
			ENDFOR &$
		i=i+1
		
		ENDFOR &$
	
	print, t
	
	init=double(0.0)
	fini=double(1.0)
	
	WHILE init LE 199 DO BEGIN	&$																						;WHILE LOOP 1

		avgval=double(0.0)
		fini = init+1
		over=double(0.0)
		FOR x = 0, 399 DO BEGIN		&$
			FOR y=0, 399 DO BEGIN	 &$
				IF(radius[x,y,t] GE init AND radius[x,y,t] LT fini AND angl[x,y,t] GE -55.0 AND angl[x,y,t] LE -35.0) THEN BEGIN	&$			;IF LOOP 2
					avgval=avgval+value[x,y,t]
					over=over+1.0
				ENDIF	&$																									;END OF IF LOOP 2
			ENDFOR	&$
		ENDFOR	&$
		td[init] =(avgval/over)
		init=init+1
	ENDWHILE	&$																										;END OF WHILE LOOP 1
	
	tdtbl1(0:199,t) = td(0:199)	

	ENDFOR &$
	
save,tdtbl1,filename=savepath+'TD_1700.idl'

	
END