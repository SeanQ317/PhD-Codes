;regression_mult.pro

s_hmi=size(TD_HMI)
s_17=size(TD_1700)                                                      ;;GIVES THE DIMENSIONS OF EACH OF THE TIME-DISTANCE DIAG$
s_16=size(TD_1600)

hmi_x=s_hmi[1]
aia17_x=s_17[1]                                                         ;;GIVES THE X-DIMENSION OF THE TIME-DISTANCE DIAGRAMS
aia16_x=s_16[1]

undefine, s_hmi
undefine, s_17                                                          ;;UNDEFINES OLD VARIABLES
undefine, s_16

hmi_r1=make_array(hmi_x, /float)
aia17_r=make_array(aia17_x, /float)                     ;;CREATES THE ARRAYS TO BE FILLED BY EACH
aia17_r1=make_array(aia17_x, /float)
aia16_r=make_array(aia16_x, /float)
aia16_r1=make_array(aia16_x, /float)



hmi_start=20 			;19                               
aia17_start=38		;35.625
aia16_start=38		;35.625
hmi_constant=22
aia17_constant=79
aia16_constant=79


;;FOR LOOP FOR THE HMI REGRESSION TRENDS
        FOR x=0.0, (hmi_x)-1  DO BEGIN                          &$

                hmi_r=(hmi_start+sqrt(x*hmi_constant))          &$                                             
                hmi_r1[x]=hmi_r                         &$                                                                      

        ENDFOR                                                  &$

;;FOR LOOP FOR THE AIA_1700 REGRESSION TRENDS
        FOR x=0.0, (aia17_x)-1  DO BEGIN                                &$

                aia17_r=(aia17_start+sqrt(x*aia17_constant))            &$                              
                aia17_r1[x]=aia17_r                             &$                                                              

        ENDFOR                                                  &$
;;FOR LOOP FOR THE AIA_1600 REGRESSION TRENDS
        FOR x=0.0, (aia16_x)-1  DO BEGIN                                &$

                aia16_r=(aia16_start+sqrt(x*aia16_constant))            &$                              
                aia16_r1[x]=aia16_r                             &$                                                              

        ENDFOR                                                  &$


;restore, 'Chi_Squared_Pick.idl'
aa=a1[*,0]
bb=a1[*,1]

;restore, 'Chi_Squared_Pick_AIA.idl'
cc=a2[*,0]
dd=a2[*,1]

;mult,3,2
;plot_image, TD_HMI, title='HMI Time-Distance', charsize=2
;plot_image, TD_1700, title='AIA 1700 Time-Distance', charsize=2                                                 
;plot_image, TD_1600, title='AIA 1600 Time-Distance', charsize=2

;plot_image, TD_HMI, title='HMI Time-Distance', charsize=2
;loadct,13, /silent
;oplot,hmi_r1,color=50,thick=3

;loadct,0, /silent
;plot_image, TD_1700, title='AIA 1700 Time-Distance', charsize=2
;loadct,13, /silent                                                                                                              
;oplot, aia17_r1,color=150,thick=3                                                                                       

;loadct,0, /silent
;plot_image, TD_1600, title='AIA 1600 Time-Distance', charsize=2
;loadct,13, /silent
;oplot, aia16_r1,color=250,thick=3
;loadct,0, /silent

;print, 'Are these a good fit? If not, try again with new variables!'
;mult,1,1
end
