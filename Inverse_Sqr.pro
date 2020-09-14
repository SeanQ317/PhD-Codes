;restore, 'Time-Dist_bot.idl'

;restore, 'Time-Dist_bot.idl'

z1=make_array(150.0, /float)
p1=make_array(150.0, /float)
zz1=make_array(150.0, /float)

pix=42.92				;; 1 pixel=42.962km
f=14.962					;; i frame=14.92s

FOR x=0.0, 149.0 DO BEGIN	&$

	p=(0.835423+(0.146178*x)-(0.00000515441*x^2))		&$		;;Creates polynomial for Y=, coefficients found using Poly_Fit in idl
	p1[x]=p		&$				

	y=((x)^0.5)		&$				;;Inverse Square should match acceleration
	z=double(y)		&$		
	z1[x]=z			&$			;;Saves inverse square in array

	yy=(x*2.3)^0.5
	zz=double(yy)
	zz1[x]=zz

ENDFOR	&$
	
END
