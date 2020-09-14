;;THIS CODE WILL OVERPLOT A REGRESSION TREND ON A TIME-DISTANCE DIAGRAM
;;IT MAY REQUIRE SOME TRIAL AND ERROR TO GET A GOOD FIT
;;THE FIT CAN ALWAYS BE CHECKED AGAINST A CHI-SQUARED FIT
;;CREATE THE TIME-DISANCE DIAGRAMS USING "Time_Distance_Diagram.pro"

;restore, 'Time_Distance_HMI_2011_02_15.idl'
;restore, 'Time_Distance_1600_2011_02_15.idl'                       ;;RESTORES THE ALREADY MADE TIME-DISTANCE DIAGRAMS
;restore, 'Time_Distance_1700_2011_02_15.idl'

s_hmi=size(TD_HMI)
s_17=size(TD_1700)                                                      ;;GIVES THE DIMENSIONS OF EACH OF THE TIME-DISTANCE DIA
s_16=size(TD_1600)

hmi_x=s_hmi[1]
aia17_x=s_17[1]                                                         ;;GIVES THE X-DIMENSION OF THE TIME-DISTANCE DIAGRAMS
aia16_x=s_16[1]

undefine, s_hmi
undefine, s_17                                                          ;;UNDEFINES OLD VARIABLES
undefine, s_16


hmi_r=make_array(hmi_x, /float)
hmi_r1=make_array(hmi_x, /float)
aia17_r=make_array(aia17_x, /float)                     ;;CREATES THE ARRAYS TO BE FILLED BY EACH
aia17_r1=make_array(aia17_x, /float)
aia16_r=make_array(aia16_x, /float)
aia16_r1=make_array(aia16_x, /float)


window, xsize=1200,ysize=900
mult,3,1
loadct,0, /silent
plot_image, TD_HMI, title='HMI Time-Distance', charsize=2
plot_image, TD_1700, title='AIA 1700 Time-Distance', charsize=2                                                 ;;PLOTS THE TIM
plot_image, TD_1600, title='AIA 1600 Time-Distance', charsize=2

print, 'Make a good guess for the start of the ridge for each Time-Distance Diagram'

read, hmi_start, PROMPT='Insert approximate start time for HMI Ridge: '                                 ;;ASKS FOR A STARTING V
read, aia17_start, PROMPT='Insert approximate start time for AIA 1700 Ridge: '                  ;;ASKS FOR A STARTING VALUE IN 
read, aia16_start, PROMPT='Insert approximate start time for AIA 1600 Ridge: '                  ;;ASKS FOR A STARTING VALUE IN 

print, 'Make an estimate for constant value of regression trend'

read, hmi_constant, PROMPT='Insert approximate constant for HMI Ridge: '                                ;;ASKS FOR THE INPUT OF
read, aia17_constant, PROMPT='Insert approximate constant for AIA 1700 Ridge: '                 ;;ASKS FOR THE INPUT OF CONSTAN
read, aia16_constant, PROMPT='Insert approximate constant for AIA 1600 Ridge: '                 ;;ASKS FOR THE INPUT OF CONSTAN


;;FOR LOOP FOR THE HMI REGRESSION TRENDS
        FOR x=0.0, (hmi_x)-1  DO BEGIN                          &$

                hmi_r=(hmi_start+sqrt(x*hmi_constant))          &$                                              ;;THE FIRST NUM
                hmi_r1[x]=hmi_r                         &$                                                                     

        ENDFOR                                                  &$


;;FOR LOOP FOR THE AIA_1700 REGRESSION TRENDS

 FOR x=0.0, (aia17_x)-1  DO BEGIN                                &$

                aia17_r=(aia17_start+sqrt(x*aia17_constant))            &$                              ;;THE FIRST NUMBER IS T
                aia17_r1[x]=aia17_r                             &$                                                             

        ENDFOR                                                  &$


;;FOR LOOP FOR THE AIA_1600 REGRESSION TRENDS
        FOR x=0.0, (aia16_x)-1  DO BEGIN                                &$

                aia16_r=(aia16_start+sqrt(x*aia16_constant))            &$                              ;;THE FIRST NUMBER IS T
                aia16_r1[x]=aia16_r                             &$                                                             

        ENDFOR                                                  &$


mult,3,2
plot_image, TD_HMI, title='HMI Time-Distance', charsize=2
plot_image, TD_1700, title='AIA 1700 Time-Distance', charsize=2                                                 ;;PLOTS THE TIM
plot_image, TD_1600, title='AIA 1600 Time-Distance', charsize=2


plot_image, TD_HMI, title='HMI Time-Distance', charsize=2
loadct,13, /silent
oplot,hmi_r1,color=50,thick=3

loadct,0, /silent
plot_image, TD_1700, title='AIA 1700 Time-Distance', charsize=2
loadct,13, /silent                                                                                                             
oplot, aia17_r1,color=150,thick=3                                                                                       ;;USING

loadct,0, /silent
plot_image, TD_1600, title='AIA 1600 Time-Distance', charsize=2
loadct,13, /silent
oplot, aia16_r1,color=250,thick=3
loadct,0, /silent

print, 'Are these a good fit? If not, try again with new variables!'
mult,1,1
end


