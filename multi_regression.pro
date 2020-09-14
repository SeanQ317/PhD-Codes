;multi-regression.pro

window,xsize=1200,ysize=900
mult,6, 5 


restore, 'Chi_Squared_Pick_2011_02_15.idl'
restore, 'Chi_Squared_Pick_AIA_2011_02_15.idl'
restore, 'Time_Distance_1600_2011_02_15.idl'
restore, 'Time_Distance_1700_2011_02_15.idl'
restore, 'Time_Distance_HMI_2011_02_15.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, ppcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2011_07_30.idl'
restore, 'Chi_Squared_Pick_AIA_2011_07_30.idl'
restore, 'Time_Distance_1600_2011_07_30.idl'
restore, 'Time_Distance_1700_2011_07_30.idl'
restore, 'Time_Distance_HMI_2011_07_30.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2012_07_04.idl'
restore, 'Chi_Squared_Pick_AIA_2012_07_04.idl'
restore, 'Time_Distance_1600_2012_07_04.idl'
restore, 'Time_Distance_1700_2012_07_04.idl'
restore, 'Time_Distance_HMI_2012_07_04.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2012_07_06.idl'
restore, 'Chi_Squared_Pick_AIA_2012_07_06.idl'
restore, 'Time_Distance_1600_2012_07_06.idl'
restore, 'Time_Distance_1700_2012_07_06.idl'
restore, 'Time_Distance_HMI_2012_07_06.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2012_10_23.idl'
restore, 'Chi_Squared_Pick_AIA_2012_10_23.idl'
restore, 'Time_Distance_1600_2012_101_23.idl'
restore, 'Time_Distance_1700_2012_10_23.idl'
restore, 'Time_Distance_HMI_2012_10_23.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2013_11_05.idl'
restore, 'Chi_Squared_Pick_AIA_2013_11_05.idl'
restore, 'Time_Distance_1600_2013-11_05.idl'
restore, 'Time_Distance_1700_2013_11_05.idl'
restore, 'Time_Distance_HMI_2013_11_05.idl'

tvim, TD_HMI, title='HMI Time-Distance';, /noaxis, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2014_02_04.idl'
restore, 'Chi_Squared_Pick_AIA_2014_02_04.idl'
restore, 'Time_Distance_1600_2014_02_04.idl'
restore, 'Time_Distance_1700_2014_02_04.idl'
restore, 'Time_Distance_HMI_2014_02_04.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2015_08_22.idl'
restore, 'Chi_Squared_Pick_AIA_2015_08_22.idl'
restore, 'Time_Distance_1600_2015_08_22.idl'
restore, 'Time_Distance_1700_2015_08_22.idl'
restore, 'Time_Distance_HMI_2015_08_22.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance',/noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5


restore, 'Chi_Squared_Pick_2017_09_06.idl'
restore, 'Chi_Squared_Pick_AIA_2017_09_06.idl'
restore, 'Time_Distance_1600_2017_09_06.idl'
restore, 'Time_Distance_1700_2017_09_06.idl'
restore, 'Time_Distance_HMI_2017_09_06.idl'

tvim, TD_HMI, title='HMI Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=6,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=5,yrange=(!Y.CRANGE*0.75), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60], ystyle=1;, pcharsize=2.5

tvim, TD_1700, title='AIA 1700 Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5

tvim, TD_1600, title='AIA 1600 Time-Distance', /noaxis;, pcharsize=2
axis,xaxis=0,xticks=5,xrange=(!X.CRANGE*0.6), xtitle='Distance (Mm)', xtickv=[0,15,30,45,60] ,xstyle=1;, pcharsize=2.5
axis,yaxis=0,yticks=6,yrange=(!Y.CRANGE*0.4), ytitle='Time (Minutes)', ytickv=[0,15,30,45,60,75], ystyle=1;, pcharsize=2.5



