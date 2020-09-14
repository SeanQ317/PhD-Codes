;;Freqs

restore, 'hh.sav'


nx=967.0
ny=972.0


;;hh is full area, in Fourier Space (967,972,226)
;;Must be clipped temporally, to change frequencies


4hh=congrid(hh, 967, 972, 17)		;;3.93mHz
5hh=congrid(hh, 967, 972, 13)		;;5.14mHz
6hh=congrid(hh, 967, 972, 11)		;;6.07mHz		;;THESE LINES SCALE TEMPORALY, TO GIVE CORRECT FREQUENCIES
7hh=congrid(hh, 967, 972, 10)		;;6.68mHz
8hh=congrid(hh, 967, 972, 8)		;;8.4mHz	


d4=(fft(hh4, 1))								;;CONVERTS FROM FREQUENCY SPACE BACK INTO REAL SPACE
d4=abs(d4)										;;ABSOLUTE VALUES
d4=shift(round(d4, nx/2, ny/2, 17.0/2))			;;SHIFTS THE IMAGE BACK TO CORRECT SPACE AND ORDER
d4(300:480,420:550,*)=0							;;REMOVES SATURATED PIXELS

d5=(fft(hh5, 1))
d5=abs(d5)
d5=shift(round((d5, nx/2, ny/2, 13.0/2))
d5(300:480,420:550,*)=0

d6=(fft(hh6, 1))
d6=abs(d6)
d6=shift(round(d6, nx/2, ny/2, 11.0/2))
d6(300:480,420:550,*)=0								 	

d7=(fft(hh7, 1))
d7=abs(d7)
d7=shift(round(d7, nx/2, ny/2, 10.0/2))
d7(300:480,420:550,*)=0

d8=(fft(hh8, 1))
d8=abs(d8)
d8=shift(round(d8, nx/2, ny/2, 8.0/2))
d8(300:480,420:550,*)=0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;RUN THIS FAR THEN DETERMINE WHAT FRAME EACH EGRESSION POINT SEEMS TO APPEAR, AND CLIP TEMPORALLY;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;dd4=d4(*,*,?????)
;dd5=d5(*,*,?????)
;dd6=d6(*,*,?????)					;;ONCE TIME AT WHICH POWER FIRST FORMS, INPUT TIME RANGE HERE
;dd7=d7(*,*,?????)
;dd8=d8(*,*,?????)


;ap4=total(dd4*dd4, 3)/??????				
;ap5=total(dd5*dd5, 3)/??????
;ap6=total(dd6*dd6, 3)/??????					;;GIVES POWER EGRESSION MAPS FOR EACH FREQUENCY
;ap7=total(dd7*dd7, 3)/??????
;ap8=total(dd8*dd8, 3)/??????

END