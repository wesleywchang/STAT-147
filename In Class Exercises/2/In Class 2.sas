options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';

DM log "odsresults; clear; out; clear; log; clear;";

ods graphics off;

goptions reset = all colors = (blue,red,green,purple)
	ftitle = swissb ftext=swissb htitle=3;
	
title1 'Statistics 147 SAS Practice 2';
title2 'My First DO Loop';
title3 'Wesley Chang';

data tryloop1;
	/* Set up the loop
		format: do start to stop by increment */
	do x = 1 to 9 by 2;
		/* calculate y
			exp function raises e to the indicated e raised to a power */
		y = 0.5 * x * exp(0.5*x);
		
		/* Output the information each time throught the loop */
		output;
	end;
run;

/* print results */
proc print noobs data = tryloop1;
	/* Create titles */
	title4 'SAS Question 1';
run;

quit;
