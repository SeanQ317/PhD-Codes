
;;READ IN DESIRED FITS FILE, CALLING IT DIFF
;;GUESS ANGLE THAT WILL PROPOGATE OVER, CALLING IT "angle_s" AND "angle_b"

;;CREATE XSTART, XEND, YSTART AND YEND

s=size(diff)
time=s[3]

xsize=s[1]
ysize=s[1]


radius = make_array(xsize/2,ysize/2, time,/double)	;RADIUS OF BOX, FOR EACH FRAME (WILL BE THE SAME)
value = make_array(xsize/2,ysize/2, time,/double)	;DIFFERENCE DOPPLERGRAM IN BOX, FOR EACH FRAME
td = make_array(xsize/4,/double)
tdtbl1 = make_array(xsize/4,time,/double)		
angl = make_array(xsize/2,ysize/2, time,/double)		;ANGLE QUAKE IS INSIDE BOX, FROM CENTRE OF BOX, FOR EACH FRAME
box = make_array(xsize/2,ysize/2,time,/double)		;CREATES BOX AROUND DESIRED REGION, FOR ECH FRAME
box1= make_array(xsize/2,ysize/2,/double)			;CREATES A 2D BOX AROUND DESIRED REGION, FOR EACH FRAME, BUT NOT SAVING THEM

;xstart = 84.0					;START OF BOX IN X-DIRECTION
;xend = 284.0					;END OF BOX IN X-DIRECTION
;ystart = 89.0					;START OF BOX IN Y-DIRECTION
;yend = 289.0					;END OF BOX IN Y-DIRECTION


r=double(0)
savepath='./'

FOR t=0, time-1 DO BEGIN &$		;MUST BE ONE LESS THAN MAX FRAME, AS CAN'T REMOVES NEXT FRAME AFTER IT

	box[*,*,t]=diff[xstart:xend-1, ystart:yend-1, t]				;CREATES BOX AROUND DESIRED REGION 
	box1[*,*]=box[*,*,t]											;CREATES 2D BOX AROUND DESIRED REGION

	i=0

	;THIS LOOP CONVERTS IMAGE TO CYLINDRICAL COORDINATES

	FOR x=0, (xsize/2)-1 do begin
		
		j=0
		
		FOR y=0, (ysize/2)-1 do begin
			
			rect=[i-(xsize/4),j-(ysize/4), box1[x,y]]							;RECT REPRESENTS THE BOX IN CARTESIAN COORDINATES, FOR CENTRE OF ARRAY TO BE AT (0,0), 
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
	
	WHILE init LE (ysize/4)-1 DO BEGIN	&$																						;WHILE LOOP 1

		avgval=double(0.0)
		fini = init+1
		over=double(0.0)
		FOR x = 0, (xsize/2)-1 DO BEGIN		&$
			FOR y=0, (ysize/2)-1 DO BEGIN	 &$
				IF(radius[x,y,t] GE init AND radius[x,y,t] LT fini AND angl[x,y,t] GE angle_s AND angl[x,y,t] LE angle_b) THEN BEGIN	&$			;IF LOOP 2
					avgval=avgval+value[x,y,t]
					over=over+1.0
				ENDIF	&$																									;END OF IF LOOP 2
			ENDFOR	&$
		ENDFOR	&$
		td[init] =(avgval/over)
		init=init+1
	ENDWHILE	&$																										;END OF WHILE LOOP 1
	
	tdtbl1(0:(xsize/4)-1,t) = td(0:(xsize/4)-1)	

	ENDFOR &$
	
save,tdtbl1,filename=savepath+'Time-Dist.idl'

	
END
