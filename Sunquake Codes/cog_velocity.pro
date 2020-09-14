function dispsc,im,win,scale
      tam=size(im)
      window,win,retain=2,xsize=tam[1]/scale,ysize=tam[2]/scale      
  ;   dispim=congrid(im,tam[1]/scale,tam[2]/scale,/int,cubic=-0.5)
      dispim=congrid(im,tam[1]/scale,tam[2]/scale)    
      tvscl,dispim
end


PRO cog_vel, cube, wav
bmpwrite='./'   ; things will end here

lande=double(1.33333) ; from uitenbroek 2003 or 2.5 for 6302..
;l0=6301.5d-10            ; This is  at DC, remember to do the Final Doppler average shift calibration at the end, match the whole cube to -307 m/s at 6301, something else for 6302
l0=8542.000d-10			;FROM PETER VAN HOOF ATOMIC LINE LIST..
c=double(299792000.)
e=-1.6021766d-19
me=9.10938d-31


nt=n_elements(cube[0,0,0,*])		;TIME AT POSITION 0,0 AND SPECTRAL POSITION 0
nl=n_elements(cube[0,0,*,0])		;SPECTRAL POSITION 0,0 AND TIME 0
box=300									;SIZE OF BOX AROUND INTERESTED REGION or STARTING PIXEL?


factor= (4*!pi*c*me/(lande*e*l0^2.)) * 1d4			;TURNS TESLA INTO GAUSS (1 TESLA = 10000 GAUSS)
savepath='./'

path='./'

  dim=size(cube)			;DIMENSIONS OF 'VIDEO'?
  midl=round(nl/2)			;MIDDLE SPECTRAL POSITION
  pre_filt=1./(1.-(mean(cube[box:dim[1]-box,box:dim[2]-box,0,0]) - mean(cube[box:dim[1]-box,box:dim[2]-box,midl, 0]))/mean(cube[box:dim[1]-box,box:dim[2]-box,0,0]))		;ENCLOSES REGION OF INTEREST??
  intcorr=dblarr(nl)
  
  FOR i=0, nl-1 DO BEGIN  
     k=i
     intcorr[i]=1+(pre_filt-1)*(wav[nl-1]-wav[k])/(wav[nl-1]-wav[midl])
  ENDFOR

  v_cog=dblarr(dim[1],dim[2],nt)			;cog=Center of Gravity
  b_cog=dblarr(dim[1],dim[2],nt)

FOR sc=0,nt-1 DO BEGIN    		
  ;sc=13
  print,sc


  FOR ii=0, dim[1]-1 DO BEGIN
     FOR jj=0, dim[2]-1 DO BEGIN
	  
        l_cog_num=double(0)
	l_cog_den=double(0)
	l_plus_num=double(0)
	l_plus_den=double(0)
	l_minus_num=double(0)
	l_minus_den=double(0)	



        FOR i=0, nl-1 DO BEGIN		
	  k=i

;          	    waveImin=sc*nl*4
;	   waveImax=((sc)*nl*4)+(nl-1)
;	    waveVmin=sc*nl*4+(3*nl)
;            waveVmax=sc*nl*4+(4*nl)-1
;	  l_plus_num = l_plus_num + (l0+wav[k]*1d-10 - cmap[ii,jj,sc]*1d-13) * (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,k+waveImin]*intcorr[i] - (cube[ii,jj,k+(waveVmin)]))  
;	  l_minus_num = l_minus_num + (l0+wav[k]*1d-10 - cmap[ii,jj,sc]*1d-13)  * (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,k+waveImin]*intcorr[i] + (cube[ii,jj,k+(waveVmin)]))         
			  
;	  l_plus_den = l_plus_den +  (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,k+waveImin]*intcorr[i] - cube[ii,jj,k+(waveVmin)])
;	  l_minus_den = l_minus_den + (max(cube[ii,jj,waveImin:waveImax]) - cube[ii,jj,k+waveImin]*intcorr[i] + cube[ii,jj,k+(waveVmin)]) 

	  
	  l_cog_num = l_cog_num + (l0+wav[k]*1d-10) * ((max(cube[ii,jj,0:nl-1, sc])*intcorr[i]) -(cube[ii,jj,k, sc]*intcorr[i])) 
	  l_cog_den = l_cog_den + ((max(cube[ii,jj,0:nl-1, sc])*intcorr[i]) -(cube[ii,jj,k, sc]*intcorr[i]))	   
						      
	ENDFOR 
		
;	lplus = l_plus_num /l_plus_den
;	lminus = l_minus_num /l_minus_den
	if l_cog_den gt 0 then l_cog = (l_cog_num / l_cog_den) 
	if l_cog_den eq 0 then l_cog = l0
;	b_cog[ii,jj,sc] = ((lplus - lminus) / 2.) * factor   
	v_cog[ii,jj,sc] = (c * (l0 - l_cog)) / l0 
     endfor

     endfor
endfor

  save,b_cog,v_cog,filename=savepath+'cog.idl'


stop
END
