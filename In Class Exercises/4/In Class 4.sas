title1 'Statistics 147 In Class Exercise #4';
title2 'Wesley Chang';

options nocenter ps = 55 nocenter ls = 78 nodate nonumber formdlim='*';

DM log "odsresults; clear; out; clear; log; clear;";
ods graphics off;


title3 'Part i';

data inclass4;
	infile 'C:\Users\wesle\iCloudDrive\Summer 2020 (UCR)\STAT 147 (Session A)\In Class Exercises\4\DOGRACES.DAT' firstobs = 3;

	do row = 1 to 10;
		do column = 1 to 3;
			if			column = 1 	then leader = 'Dusty';
			else if 	column = 2	then leader = 'Shadow';
			else						 leader = 'Lakota';
		
		   input score @@;
		   output;
		end;
	end;
run;

proc print noobs data = inclass4;
run;

title3 'Part ii';

proc sort data = inclass4;
	by leader;
run;

proc print noobs data = inclass4;
	var leader score;
run;

title3 'Part iii';

proc means mean stddev var data = inclass4;
	by leader;
	var score;
run;

title3 'Part iv';

data onlyDusty;
	set inclass4;

	if leader = 'Dusty';
run;

proc print noobs data = onlyDusty;
	var leader score;
run;

title3 'Part v';

data bothShadCody;
	set inclass4;

	if leader = 'Lakot' or leader = 'Shado';
run;

proc print noobs data = bothShadCody;
	var leader score;
run;

title3 'Part vi';

proc means n mean stddev clm alpha = 0.02;
	var score;
run;

title3 'Part vii';

proc ttest h0 = 60 sides = lower data = onlyDusty;
	var score;
run;
