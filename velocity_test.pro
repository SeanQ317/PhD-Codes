function dispsc,im,win,scale
      tam=size(im)
      window,win,retain=2,xsize=tam[1]/scale,ysize=tam[2]/scale      
      dispim=congrid(im,tam[1]/scale,tam[2]/scale)    
      tvscl,dispim
end

;RESTORE SPECTRAL POSITION GIVEN IN CRISPEX!!!!!!!

PRO cog_vel, spect_pos
bmpwrite='./'   ; things will end here

fcube, f		;LETS LP_GET BE USED

lande=double(1.33333) ; from uitenbroek 2003 or 2.5 for 6302..
l0=8542.000d-10			;FROM PETER VAN HOOF ATOMIC LINE LIST..
c=double(299792000.)
e=-1.6021766d-19
me=9.10938d-31


t=226			;NUMBER OF FRAMES
nt=long(t)		;MAXIMUM TIME (FRAME NUMBER)

l=11			;NUMBER OF SPECTRAL POSITIONS
nl=long(l)		;MAXIMUM SPECTRAL POSITION (WAVELENGTH)

box1=40									;CREATES SIZE OF 'GOOD' AREA (CHANGE DEPENDING ON CRISPEX)
box2=727								;CREATES SIZE OF 'GOOD' AREA (CHANGE DEPENDING ON CRISPEX)
caii8542=8542.0							;Caii8542 wavelength (CHNAGE DEPENDING ON SPECTRA)


np=lp_get(f[2], 4*((6*11)+0)+0)		;GIVES ARRAY OF [X,Y] AT TIME 6 (Best frame to start with), FOR 0 SPECTRAL POSITION (CHANGE 6 DEPENDING O CASE)
np1=lp_get(f[2], 4*((6*11)+0)+5)	;GIVES ARRAY OF [X,Y] AT TIME (Best frame to start with), FOR MIDDLE SPECTRAL POSITION (CHANGE 6 DEPENDING ON CASE)
wav=caii8542-spect_pos				;GIVES ARRAY OF [CHANGES IN WAVELENGTH FROM 8542] 

factor= (4*!pi*c*me/(lande*e*l0^2.)) * 1d4			;TURNS TESLA INTO GAUSS (1 TESLA = 10000 GAUSS)
savepath='./'
path='./'

  dim=size(np)				;SIZE OF ARRAY, WHATS IN IT, AND HOW MANY DATA POINTS
  midl=round(nl/2)			;MIDDLE SPECTRAL POSITION, ROUNDED	(5)
  pre_filt=1./(1.-(mean(np[box1:dim[1]-box2,box1:dim[2]-box1]) - mean(np1[box1:dim[1]-box2,box1:dim[2]-box1]))/mean(np[box1:dim[1]-box2,box1:dim[2]-box1]))	;'SMOOTHS OUT' IMAGE
  
  intcorr=dblarr(nl)
  
  FOR i=0, nl-1 DO BEGIN  														;FOR SPECTRAL POSITION 0 TO 10
     k=i ;replace with i
     intcorr[i]=1+(pre_filt-1)*(wav[nl-1]-wav[i])/(wav[nl-1]-wav[midl])			;CORRECTION FACTOR
  ENDFOR

  v_cog1=dblarr(dim[1],dim[2],nt)			;cog=Center of Gravity (VELOCITY)
  v_cog2=dblarr(dim[1],dim[2],nt)								;  (MAGNETIC)

FOR sc=0, 5 DO BEGIN   		;FOR FRAME 0 TO 225 		
  ;sc=226
  print,sc						;WILL PRINT OUT FRAME NUMBER THAT IS BEINNG WORKED ON


  FOR ii=0, dim[1]-1 DO BEGIN			;FOR X-PIXEL 0 TO 966
     FOR jj=0, dim[2]-1 DO BEGIN		;FOR Y-PIXEL 0 TO 971
	  
	l_cog_num=double(0)
	l_cog_den=double(0)
	l_plus_num=double(0)			;DECLARATION OF VARIABLES
	l_plus_den=double(0)
	l_minus_num=double(0)
	l_minus_den=double(0)	
	
	nx=lp_get(f[3], 4.0*((jj*967.0)+ii)+0)		;GIVES AN ARRAY OF [SPECTRAL POSITION, FRAME NUMBER] TO MOVE ALONG EACH PIXEL VIA II AND JJ


        FOR i=0, nl-1 DO BEGIN			;FOR SPECTRAL POSITION 0 - 10
	  k=i


;	  l_plus_num = l_plus_num + (l0+wav[i]*1d-10 - cmap[ii,jj,sc]*1d-13) * (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,k+waveImin]*intcorr[i] - (cube[ii,jj,k+(waveVmin)]))  
;	  l_minus_num = l_minus_num + (l0+wav[i]*1d-10 - cmap[ii,jj,sc]*1d-13)  * (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,k+waveImin]*intcorr[i] + (cube[ii,jj,k+(waveVmin)]))         
			  
;	  l_plus_den = l_plus_den +  (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,i+waveImin]*intcorr[i] - cube[ii,jj,i+(waveVmin)])
;	  l_minus_den = l_minus_den + (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,i+waveImin]*intcorr[i] + cube[ii,jj,i+(waveVmin)]) 

	  l_cog_num = l_cog_num + (l0+wav[i]*1d-10) * ((max(nx[0:nl-1, sc])*intcorr[i]) -(nx[i, sc]*intcorr[i])) 	
	  l_cog_den = l_cog_den + ((max(nx[0:nl-1, sc])*intcorr[i]) -(nx[i, sc]*intcorr[i]))
	  
	  
	ENDFOR 
		
;	lplus = l_plus_num /l_plus_den
;	lminus = l_minus_num /l_minus_den
	if l_cog_den gt 0 then l_cog = (l_cog_num / l_cog_den)  ;IF TRUE, USE INTENSITY FOR COG_VELOCITY
	if l_cog_den eq 0 then l_cog = l0						;IF THIS IS TRUE, SOMETHING HAS GONE WRONG WITH PIXEL SO MAKE EQUAL TO l0
	v_cog1[ii,jj,sc] = (c * (l0 - l_cog)) / l0 
	v_cog2[ii,jj,sc] = (c * (l0 + l_cog)) / l0 

     endfor

     endfor
endfor

  save,v_cog1,v_cog2,filename=savepath+'v_cog_test.idl'			;SAVES B_COG AND V_COG IN SAME DIRECTORY AS START POINT


stop
END
