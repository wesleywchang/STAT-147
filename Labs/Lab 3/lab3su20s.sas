title1 'Summer 2020';
title2 'Lab 2 SAS';
title3 'Wesley Chang';

title4 'Question 1';

options nocenter ps = 55 nocenter ;s = 78 nodate nonumber formdlim='*';

DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

data lab3su20;
	infile '\\apporto.com\dfs\UCR\Users\wchan061_ucr\Desktop\plant.dat' firstobs =2;

	do row = 1 to 10;
		do plant = 1 to 4;
			if		plant = 1 then name = 'Plant A';
			else if plant = 2 then name = 'Plant B';
			else if plant = 3 then name = 'Plant C';
			else				   name = 'Plant D';

			input dischrg @@;

			output;
		end;
	end;
run;

proc print noobs data = lab3su20;
	title5 'Part i';
run;
quit;


title5 'Part ii';
proc sort data = lab3su20;
	by plant;
run;

proc means n mean var data = lab3su20;
	by plant;
	var dischrg;
data onlyB;
	set lab3su20;

	if plant = 2;
run;

proc print noobs data = onlyB;
run;

proc means n mean stddev data = onlyB;
	var dischrg;
run;

title5 'Part iii';


title5 'Part iv';

data bothAB;
	set lab3su20;
	if plant = 1 or plant = 2;
run;

proc print data = bothAB;
run;

proc means n mean stddev data = bothAB;
	by plant;
	var dischrg;
run;


title4 'Problem 2';
title5;

data looptry;
	do x = 1 to 2;
		do t = 3 to 9 by 3;
			y = 2*x**2*(t**(1.0/3.0));

			output;
		end;
	end;
run;

proc print noobs data = looptry;
	var x t y;
run;


