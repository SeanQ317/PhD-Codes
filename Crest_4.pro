x=readfits('Ca8542.fits')			;;Reads fits file that displays image



restore, 'Crest_T1_1.sav'			;;Restores lighcurves created after running 'sst_lightcurves_region_stokes.pro' MUST BE DONE!!
a=lc
restore, 'Crest_T1_2.sav'
b=lc
restore, 'Crest_T1_3.sav'
c=lc
restore, 'Crest_T1_4.sav'
d=lc
restore, 'Crest_T1_5.sav'
e=lc

restore, 'Crest_T2_1.sav'
f=lc
restore, 'Crest_T2_2.sav'
g=lc
restore, 'Crest_T2_3.sav'
h=lc


window, xsize=1000, ysize=900

totc_t1=a[*,0,103]+b[*,0,103]+c[*,0,103]+d[*,0,103]+e[*,0,103]
totc_t2=f[*,0,107]+g[*,0,107]+h[*,0,107]   
averagec_t1=totc_t1/5
averagec_t2=totc_t2/3

tott_t1=a[*,0,107]+b[*,0,107]+c[*,0,107]+d[*,0,107]+e[*,0,107]
tott_t2=f[*,0,112]+g[*,0,112]+h[*,0,112]   
averaget_t1=tott_t1/5
averaget_t2=tott_t2/3

wav=[-0.7,-0.5,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.5,0.7]

xw=10							
yw=10								


xc1=579
yc1=644

xc2=599
yc2=645

xc3=619
yc3=641

xc4=639
yc4=635

xc5=659
yc5=621

;;;;;;;;;;;;;;;;;;;;;;;;

xc6=616
yc6=649

xc7=636
yc7=647

xc8=656
yc8=640


mult,3,1

loadct,0												;;Begins FOR loop (for each frame)
im=x[*,*,103]															;;a=Image
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

plots,[xc4-xw,xc4+xw],[yc4-yw,yc4-yw], color=50			;;Makes box on image	
plots,[xc4-xw,xc4-xw],[yc4-yw,yc4+yw], color=50
plots,[xc4-xw,xc4+xw],[yc4+yw,yc4+yw], color=50
plots,[xc4+xw,xc4+xw],[yc4+yw,yc4-yw], color=50

plots,[xc5-xw,xc5+xw],[yc5-yw,yc5-yw], color=50			;;Makes box on image	
plots,[xc5-xw,xc5-xw],[yc5-yw,yc5+yw], color=50
plots,[xc5-xw,xc5+xw],[yc5+yw,yc5+yw], color=50
plots,[xc5+xw,xc5+xw],[yc5+yw,yc5-yw], color=50

loadct,0

imm=x[*,*,107]															;;a=Image
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


plot,wav,average4_t1, title="First Crest is Black, Second is Red", xstyle=1, xtitle='Wavelength (Å)', ytitle='Intensity' ;;Plots current difference lightcurve
loadct,13

oplot, wav, average4_t2, color=250
loadct,0
wait,0.3							;;Waits before starting new FOR loop


end						;;Ends program
