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
restore, 'Crest_T2_4.sav'
i=lc
restore, 'Crest_T2_5.sav'
j=lc
restore, 'Crest_T2_6.sav'
k=lc



window, xsize=1000, ysize=900

totc_t1=a[*,0,80]+b[*,0,80]+c[*,0,80]+d[*,0,80]+e[*,0,80]
totc_t2=f[*,0,84]+g[*,0,84]+h[*,0,84]+i[*,0,84]+j[*,0,84]+k[*,0,84]  
averagec_t1=totc_t1/5
averagec_t2=totc_t2/6

tott_t1=a[*,0,83]+b[*,0,83]+c[*,0,83]+d[*,0,83]+e[*,0,83]
tott_t2=f[*,0,88]+g[*,0,88]+h[*,0,88]+i[*,0,88]+j[*,0,88]+k[*,0,88]  
averaget_t1=tott_t1/5
averaget_t2=tott_t2/6

wav=[-0.7,-0.5,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.5,0.7]


xw=10							
yw=10								


xc1=559
yc1=591

xc2=579
yc2=586

xc3=599
yc3=583

xc4=619
yc4=583

xc5=639
yc5=583

;;;;;;;;;;;;;;;;;;;;;;;;

xc6=546
yc6=609

xc7=566
yc7=613

xc8=617
yc8=612

xc9=637
yc9=608

xc10=657
yc10=599

xc11=677
yc11=587


mult,3,1

loadct,0												;;Begins FOR loop (for each frame)
im=x[*,*,80]															;;a=Image
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

imm=x[*,*,84]															;;a=Image
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

plots,[xc10-xw,xc10+xw],[yc10-yw,yc10-yw], color=250			;;Makes box on image	
plots,[xc10-xw,xc10-xw],[yc10-yw,yc10+yw], color=250
plots,[xc10-xw,xc10+xw],[yc10+yw,yc10+yw], color=250
plots,[xc10+xw,xc10+xw],[yc10+yw,yc10-yw], color=250

plots,[xc11-xw,xc11+xw],[yc11-yw,yc11-yw], color=250			;;Makes box on image	
plots,[xc11-xw,xc11-xw],[yc11-yw,yc11+yw], color=250
plots,[xc11-xw,xc11+xw],[yc11+yw,yc11+yw], color=250
plots,[xc11+xw,xc11+xw],[yc11+yw,yc11-yw], color=250

loadct,0

plot,wav,average1_t1, title="First Crest is Black, Second is Red", xstyle=1, xtitle='Wavelength (Å)', ytitle='Intensity' ;;Plots current difference lightcurve
loadct,13

oplot, wav, average1_t2, color=250
loadct,0
wait,0.3							;;Waits before starting new FOR loop


end						;;Ends program
