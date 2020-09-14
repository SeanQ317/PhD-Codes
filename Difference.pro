s=size(x)
tt=s[3]
xx=s[1]
yy=s[2]

diff=make_array(xx, yy, tt-1)

	FOR i=0, tt-2 DO BEGIN 			&$

		diff[*,*,i]=x[*,*,i+1]-x[*,*,i] 	&$

	ENDFOR								&$

print, 'DONE'


END