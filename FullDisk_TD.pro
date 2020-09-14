files=findfile('hmi*')

;There are some unsued variables that I left in the code and are not used, I can't remember of the top of my head which they are, but if you have problems let me know and I will email you a cleaned up version

;here, the first image is read to get the reference box coordinates and  time
read_sdo, files(1), index, data

;this is the box size centered on the flare, you could use acoustic holography to get the accurate value, or just determine it manually from other images
xcenp = (2780+3079)/2.0			;2929.5
ycenp = (1511+1810)/2.0			;1660.5
xsize = 3079-2780				;299
ysize = 1810-1511				;299
xcena = (xcenp - index.crpix1)*index.cdelt1
ycena = (ycenp - index.crpix2)*index.cdelt2
tref = index.date_obs


;these next lines define all the arrays that the program is going to use
;dif calculates the difference images from the dopplergrams, for some reason its faster to do it realtime than to get it from stored data
;rect, angl, radius and value are all the coordinate values needed for the cartesian>cylindrical conversion
;td is a temporary array to store the pixel values into, theres probably a better way of doing it but this one works well
;tdtbl1 is the actual time-distance array, here I made 4 arrays for different arcs of the image

dif=make_array(4024,4024,/double)
rect = make_array(300,300,/DOUBLE)
angl = make_array(90000,/double)
radius = make_array(90000,/double)
value = make_array(90000,/double)
td = make_array(151,/double)
tdtbl1 = make_array(150,60,/double)
date=0

for imageno = 1, 60 do begin

	;the next 3 paragrams calculate the new location of the box using rot_xy to track the active region

	read_sdo, files(imageno), newindex, newdata
	treq = newindex.date_obs
	npos = rot_xy(xcena, ycena, tstart=tref, tend=treq)

	;new centre of box is converted into pixels from arcseconds
	xcenp2 = npos(0)/newindex.cdelt1 + newindex.crpix1
	ycenp2 = npos(1)/newindex.cdelt2 + newindex.crpix2

	;the corners of the new box are calculated
	xstart = 2825		
	xend = 3125
	ystart = 1405
	yend = 1705

	i=0
	r=0

	;this if loop gets the difference images from the dopplergrams and stores them in "dif" array 

	if imageno GT 1 then begin
		
		for i = 0, 4023 do begin
			for j = 0, 4023 do begin
				
				dif(i,j)=newdata(i,j)-olddata(i,j)
			endfor
		endfor
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	i = 0
	
	;this is the loop that converts each image to cylindrical coordinates

	for x = xstart, xend do begin

		j=0

		for y = ystart, yend do begin
			
			;since the size of the box is 300 pixels, rect is a respresentation of the box in "real" cartesian coordinates
			;for the centre of the array to be at (0,0), 150 must be taken away from both x and y values of the box (the centre is at (150,150) in the box otherwise)
			;cv_coord converts a cartesian (rect) point to cylindrical, here in degree form
			;the result of cv_coord is an array, (0) represents the angle, (1) the radius and (2) the z-value (here the Z represents the pixel velocity from the difference image)
			
			rect = [i-150,j-150,dif(x,y)]
			cyli = cv_coord(from_rect=rect, /to_cylin, /degrees)
			angl(r)=cyli(0)
			radius(r)=abs(cyli(1))
			value(r)=cyli(2)
			j=j+1
			r=r+1
			
			endfor
		i=i+1
		
	endfor

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	init=0.0
	fini=1

	;the next loop calculates the values for the time-distance array
	;the only IF command specifies the program to get a ring (or arc) between radius values of init and fini, which I defined to be 1 pixel wide (smaller pixels would not make sense)
	;the IF command also has an argument for the angle to calculate over, so that specific arcs can be specified
	;the velocity values are totalled in avgval and then averaged using over (total number of pixels in ring)
	
	while init LE 150 do begin

		avgval=0.0
		fini = init+1
		over=0.0
		for r = 0, 89999 do begin
			if(radius(r) GE init AND radius(r) LT fini AND angl(r) GE -90.0 AND angl(r) LE 0.0) THEN begin
				avgval=avgval+value(r)
				over=over+1.0
			endif
		endfor
		td[init] = (avgval/over)
		init=init+1
	endwhile

	;when "td" array has all the integrated values stored, it needs to be put into the actual time-distance array that will also hold the time values
	;"data" is an integer that's used to generate the array, since each image has 45 seconds cadence, one value of "data" corresponds to 45 seconds

	tdtbl1(0:149,date) = td(0:149)

	endif

	date=date+1

	;the current dopplergram image is stored into olddata to be used in the difference image calculation on the next loop

	olddata=newdata
endfor
free_lun, file
end
