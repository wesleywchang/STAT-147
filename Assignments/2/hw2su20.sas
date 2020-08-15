title1 'Statistics 147 Assignment #2';
title2 'Summer 2020';
title3 'Wesley Chang';

options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

title4 'Question 1';


/* pdf of Y~Bin(n=25,p=0.65) */
/* P(X=15) */

data question1;
	/* Create variables using pdf, cdf and sdf functions
		Format: 
				P(X = x) = pdf('Binom',x,p,n)
				P(X <= x) = cdf('Binom',x,p,n)
				P(X > x) = sdf(’Binom’,x,p,n)	*/

		/* 	Part (i) 
			p1 = P(X = 15) */
		p1 = pdf('Binom',15,.65,25);

		/* 	Part (ii
		 	p2 = P(X <= 15) */
		p2 = cdf('Binom',15,.65,25);

		/*	Part (iii) 
			p3 	= P(16 < X < 19) = 
				= P( X <= 19) - P( X > 16)	*/
		p3 = cdf('Binom',19,.65,25) - sdf('Binom',19,.65,25);

		/*Part (iv)
			Find average number of dog owners
			mu = n * p */
		p4 = 25 * 0.65;

run;
/* Print the results */
proc print noobs data = question1;
/* Revise title4 and title5 */
title5 'Subpart (i) P(X = 15)';
var p1;
run;

proc print noobs data = question1;
title5 'Subpart (ii) P(X <= 15)';
var p2;
run;

proc print noobs data = question1;
title5 'Subpart (iii) P(X 16 < X <= 19)';
var p3;
run;

proc print noobs data = question1;
/* Modify title5 */
title5 'Subpart (iv) Average number of dog owners that prefer a male dog';
var p4;
run;


title4 'Question 2';

/* 	cdf of normal distribution, mean = 13.25, std dev = 0.10
	appropriate level is between 13.15 and 13.35
	*/

data question2;

	/* Subpart (i) find probability that the can is underfilled
		X~N, P( X <= 13.15)*/
	p1 = cdf('Normal',13.15,13.25,.1);

	/* Subpart (ii) find probability that can is not underfilled
		X~N, P(X > 13.15) */
	p2 = 1 - cdf('Normal',13.15,13.25,.1);

	/*Subpart (iii) find probability that can meets specification
		X~N, P( 13.15 < X < 13.35)
					= P(x <= 13.35) - P(X <= 13.15) */
	p3 = cdf('Normal',13.35,13.25,.1) - cdf('Normal',13.15,13.25,.1);

	/* Subpart (iv) find probability that can is overfilled or underfilled
		X~N, P(X < 13.15) + P(X > 13.35)
					= P(X <= 13.15) + 1 - P(X <= 13.35) */
	p4 = cdf('Normal',13.15,13.25,.1) + 1 - cdf('Normal',13.15,13.25,.1);

	/* Subpart (v) find the 97th percentile */
	p5 = quantile('Normal',.97,13.25,.1);
run;

proc print noobs data = question2;
	title5 'Subpart (i)';
	var p1;
run;

proc print noobs data = question2;
	title5 'Subpart (ii)';
	var p2;
run;

proc print noobs data = question2;
	title5 'Subpart (iii)';
	var p3;
run;

proc print noobs data = question2;
	title5 'Subpart (iv)';
	var p4;
run;

proc print noobs data = question2;
	title5 'Subpart (v)';
	var p5;
run;
quit;

title5;

title4 'Question 3';

/* y = 3n + sqrt(4.5m^-0.5n), for n=1,3,5 and m = 2,5,8 */

data question3;
	/* do loop for n */
	do n = 1 to 5 by 2;
		/* nest m loop */
		do m = 2 to 8 by 3;
			/* calculate equation given n and m and store in y */
			y = 3 * n + sqrt(4.5*m**(-0.5*n));
			output;
		end;
	end;
run;

/* print results */
proc print noobs data = question3;
run;
quit;


title4 'Question 4';

title5 'Subpart (i)';
data question4;

	/* read file */
	infile '\\apporto.com\dfs\UCR\Users\wchan061_ucr\Desktop\agility.dat' firstobs = 3;
	
	/* do loop for 8 rows of data */
	do rows = 1 to 8;
		/* do loop for 3 columns of data, assigned by owner */
		do column = 1 to 3;
			if		column = 1 then owner = 'Cody';
			else if column = 2 then owner = 'Dusty';
			else				 	owner = 'Shadow';
				/* input statement to read observations */
				input time @@;

				/* output */
				output;

		end;
	end;
run;

/* print data */
proc print noobs data = question4;
	var owner time;
run;

/* Subpart (iii) */
title5 'Subpart (iii)';
proc sort;
	by owner;
run;
proc print;
	var owner time;

/* Subpart (iv) */
title5 'Subpart (iv)';
proc means mean stddev median;
	by owner;
	var time;
quit;

/* Subpart (v) */
title5 'Subpart (v)';
data onlyC;
	set question4;

	if owner = 'Cody';
run;

proc print data = onlyC;
run;
	
/* Subpart (vi) */
title5 'Subpart (vi)';
data bothDS;
	set question4;

	if owner = 'Dust' or owner = 'Shad';
run;
proc print data = bothDS;
run;
quit;
