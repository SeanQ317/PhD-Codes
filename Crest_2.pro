x=readfits('Ca8542.fits')			;;Reads fits file that displays image



restore, 'Crest_T1_1.sav'			;;Restores lighcurves created after running 'sst_lightcurves_region_stokes.pro' MUST BE DONE!!
a=lc
restore, 'Crest_T1_2.sav'
b=lc
restore, 'Crest_T1_3.sav'
c=lc


restore, 'Crest_T2_1.sav'
f=lc
restore, 'Crest_T2_2.sav'
g=lc
restore, 'Crest_T2_3.sav'
h=lc
restore, 'Crest_T2_4.sav'
i=lc




window, xsize=1000, ysize=900

totc_t1=a[*,0,89]+b[*,0,89]+c[*,0,89]
totc_t2=f[*,0,94]+g[*,0,94]+h[*,0,94]+i[*,0,94]
averagec_t1=totc_t1/3 
averagec_t2=totc_t2/4

tott_t1=a[*,0,94]+b[*,0,94]+c[*,0,94]
tott_t2=f[*,0,98]+g[*,0,98]+h[*,0,98]+i[*,0,98]
averaget_t1=tott_t1/3 
averaget_t2=tott_t2/4


wav=[-0.7,-0.5,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.5,0.7]

xw=10							
yw=10								


xc1=635
yc1=581

xc2=653
yc2=569

xc3=671
yc3=555


;;;;;;;;;;;;;;;;;;;;;;;;

xc6=656
yc6=601

xc7=676
yc7=592

xc8=696
yc8=580

xc9=716
yc9=559




mult,3,1

loadct,0												;;Begins FOR loop (for each frame)
im=x[*,*,89]															;;a=Image
im1=cgscalevector(im,0,255,max=500,min=-100)
plot_image,im1, title="Initial Crest"			;;plots image with title 'Frame Number'

loadct,13															;;Changes colour to red-blue


plots,[xc1-xw,xc1+xw],[yc1-yw,yc1-yw], color=50			;;Makes box on image	
plots,[xc1-xw,xc1-xw],[yc1-yw,yc1+yw], color=50
plots,[xc1-xw,xc1+xw],[yc1+yw,yc1+yw], color=50
plots,[xc1+xw,xc1+xw],[yc1+yw,yc1-yw], color=50

plots,[xc2-xw,xc2+xw],[yc2-yw,yc2-yw], color=50			;;Makes box on image	
plots,[xc2-xw,xc2-xw],[yc2-yw,yc2+yw], color=50
plots,[xc2-xw,xc2+xw],[yc2+yw,yc2+yw], color=50
plots,[xc2+xw,xc2+xw],[yc2+yw,yc2-yw], color=50

plots,[xc3-xw,xc3+xw],[yc3-yw,yc3-yw], color=50			;;Makes box on image	
plots,[xc3-xw,xc3-xw],[yc3-yw,yc3+yw], color=50
plots,[xc3-xw,xc3+xw],[yc3+yw,yc3+yw], color=50
plots,[xc3+xw,xc3+xw],[yc3+yw,yc3-yw], color=50


loadct,0

imm=x[*,*,94]															;;a=Image
im2=cgscalevector(imm,0,255,max=500,min=-100)	
plot_image,im1, title="Evolved Crest"

loadct,13

plots,[xc6-xw,xc6+xw],[yc6-yw,yc6-yw], color=250			;;Makes box on image	
plots,[xc6-xw,xc6-xw],[yc6-yw,yc6+yw], color=250
plots,[xc6-xw,xc6+xw],[yc6+yw,yc6+yw], color=250
plots,[xc6+xw,xc6+xw],[yc6+yw,yc6-yw], color=250

plots,[xc7-xw,xc7+xw],[yc7-yw,yc7-yw], color=250			;;Makes box on image	
plots,[xc7-xw,xc7-xw],[yc7-yw,yc7+yw], color=250
plots,[xc7-xw,xc7+xw],[yc7+yw,yc7+yw], color=250
plots,[xc7+xw,xc7+xw],[yc7+yw,yc7-yw], color=250

plots,[xc8-xw,xc8+xw],[yc8-yw,yc8-yw], color=250			;;Makes box on image	
plots,[xc8-xw,xc8-xw],[yc8-yw,yc8+yw], color=250
plots,[xc8-xw,xc8+xw],[yc8+yw,yc8+yw], color=250
plots,[xc8+xw,xc8+xw],[yc8+yw,yc8-yw], color=250

plots,[xc9-xw,xc9+xw],[yc9-yw,yc9-yw], color=250		;;Makes box on image	
plots,[xc9-xw,xc9-xw],[yc9-yw,yc9+yw], color=250
plots,[xc9-xw,xc9+xw],[yc9+yw,yc9+yw], color=250
plots,[xc9+xw,xc9+xw],[yc9+yw,yc9-yw], color=250


plot,wav,average2_t1, title="First Crest is Black, Second is Red", xstyle=1, xtitle='Wavelength (Å)', ytitle='Intensity' ;;Plots current difference lightcurve
;plot,wav,average1_t1, title="Average Line Profile=Solid", xstyle=1, xtitle='Wavelength (Å)', ytitle='Intensity' ;;Plots current difference lightcurve
loadct,13

oplot, wav, average2_t2, color=250
loadct,0
wait,0.3							;;Waits before starting new FOR loop


end						;;Ends program
