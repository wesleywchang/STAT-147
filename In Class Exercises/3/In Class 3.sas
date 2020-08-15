/* Set up format of the output */
  options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';
  
DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;

data alldogs;
	
	infile '/folders/myshortcuts/STAT_147_(Session_A)/In Class Exercises/3/DOGRACES.DAT' firstobs = 3;
	
	do rows = 1 to 10;
		do team = 1 to 3;
			if 		team = 1 then 	leader = 'Trusty Dusty';
			else if team = 2 then 	leader = 'White Shadow';
			else  					leader = 'Lakota Dakota';
			
				input time @@;
				output;
		end;
	end;
run;

proc print data = alldogs;
	title1 'Statistics 147 In Class Exercise #3';
	title2 'Summer 2020';
	title3 'Wesley Chang';
	title4 'SAS Question 1';
run;

/* Sort by leader */
proc sort;
	by leader;
run;
proc print;
	/* Revise title5 */
	title5 'Part (ii)';
run;

proc means mean stddev var;
	/* Revise title5 */
	title5 'Part(iii)';
	by leader;
	var time;
run;

quit;