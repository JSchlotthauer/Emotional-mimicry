##########################################################################
# HEADER: Establishment of parameters for the program
##########################################################################

# Name of the scenario
scenario = "IMS synchron";

#1 - Number of active buttons
#2 - I am not sure of what it does
#3 - Set TRUE to use different codes for different events 
#4 - Lenght of the pulse send as output (10 ms)
#5 - Set default font for every text shown
#6 - Set FALSE to write a log file
active_buttons = 1;
response_matching = simple_matching;
write_codes = true;
pulse_width = 10; 
default_font = "Arial";
no_logfile = false;

# Beginning of SDL and ending of HEADER
begin;

##########################################################################
# SDL: Establishment of objects
##########################################################################

# Presentation of experiment
trial {
  trial_duration = 3000;  # Duration of the presentation
  picture {
		  text { 
					caption = "EMOTIONAL MIMICRY"; # Text to be shown
					font_color = 255,215,0; # Color
					font_size = 70; # Size
						};
			x = 0; # X axis orientation
			y = 0; # Y axis orientation
		  text { 
					caption = "___________________";
					font_color = 255,215,0;
					background_color = 0,0,0,0; # Set transparent so it does not overlap
					font_size = 70;
						}; 
	      x = 0;
			y = 100;
		  text { 
					caption = "___________________";
					font_color = 255,215,0;
					background_color = 0,0,0,0;
					font_size = 70;
						}; 
	      x = 0;
			y = -10;
				};
} presentation_exp; # Name of the object

# Presentation of instructions
trial {
	trial_type = first_response; # Awaits for response
	trial_duration = forever; # Lasts until a response is given
  picture {
		  text { 
					caption = "* instructions *"; # Text
					font_color = 255,215,0; # Color
					font_size = 50; # Size
						};
			x = 0; # X axis orientation
			y = 0; # Y axis orientation
				};
	code = "INS. I";
} instructions_exp; # Name of the object

# Fixation point
trial {
  trial_duration = 1000;  # Duration --- Based on Minio-Paluello
  picture {
		  text { 
					caption = "+"; # Text
					font_color = 255,255,255; # Color
					font_size = 50; # Size
					};
	      x = 0; # X axis orientation
			y = 0; # Y axis orientation
				};
} fixation; # Name of the object

# IMS video
trial {
   video { 
		filename = "tube_feather_no_touch_x.avi"; # Video file to be presented
			};
	picture {};
	port_code = 40; # Port code sent to the EEG recorder
	code = "IMS synchron"; # Code in the Analysis Window
} IMS_syn;

# Stimuli
array {
   video { filename = "arm_brush_no_touch.avi"; description = "20";} happy; # Video file to be presented + port code sent to the EEG recorder
   video { filename = "tube_brush_no_touch.avi"; description = "30";} sad; # Video file to be presented + port code sent to the EEG recorder
} videos;

trial {
  trial_duration = 3000;  # Duration --- Based on Minio-Paluello
	stimulus_event {
		video happy;
				} stim1;
} main;

# EEG-Output OFF
trial {
	trial_duration = 1; # Duration
	picture {
			text { 
					caption = ""; # No text
					background_color = 0,0,0; # Black background
					};
			x = 0;
			y = 0;
				};
	port_code = 99; # Port code sent to the EEG recorder (indicating finalization of previous video)
	code = "END"; # Code in the Analysis Window
} tri_off;

# Inter Trial Interval
trial {
  trial_duration = 2000; # Duration
  picture {
		  text { 
					caption = ""; # Text
					font_color = 255,255,255; # Color
					font_size = 60; # Size
					};
	      x = 0;
			y = 0;
				};
} iti; # Name of the object

##########################################################################
# In order to call the video files (or any other file), the folder where 
# they are stored must be selected in "Stimulus directory", in the 
# "Scenarios" section
##########################################################################

# Presentation of instructions II
trial {
	trial_type = first_response; # Awaits for response
	trial_duration = forever; # Lasts until a response is given
  picture {
		  text { 
					caption = "* instructions *"; # Text
					font_color = 255,215,0; # Color
					font_size = 50; # Size
						};
			x = 0; # X axis orientation
			y = 0; # Y axis orientation
				};
	code = "INS. II";
} instructions_exp2; # Name of the object

# Presentation of instructions III
trial {
	trial_type = first_response; # Awaits for response
	trial_duration = forever; # Lasts until a response is given
  picture {
		  text { 
					caption = "* instructions *"; # Text
					font_color = 255,215,0; # Color
					font_size = 50; # Size
						};
			x = 0; # X axis orientation
			y = 0; # Y axis orientation
				};
	code = "INS. III";
} instructions_exp3; # Name of the object

# Picture to be presented with all its elements
stimulus_event {
	picture {

# Rating scale	
		box {
			height = 50;
			width = 10;
			color = 255,215,0;
			} cursor;
		x = 0;
		y = 0;
		
		box {
			height = 10;
			width = 800;
			color = 255,215,0;
			} scale;
		x = 0;
		y = 0;
		
		text {
			caption = "0      ";
			font = "Arial bold";
			font_size = 48;
			font_color = 255,215,0;
			background_color = 0,0,0,0;
			} scale_text;
		x = -400;
		y = 0;
		
		text {
		caption = "          100";
		font = "Arial bold";
		font_size = 48;
		font_color = 255,215,0;
		background_color = 0,0,0,0;
			} scale_text2;
		x = 400;
		y = 0;

# Statements format
		text {
		caption = "* statement 1 *";
		font = "Arial bold";
		font_color = 255,215,0;
		background_color = 0,0,0,0;
			} statement_text;
		x = 0;
		y = 200;
		
	} my_pic;
} main_trial;

# Statements (in "caption" goes the text to be shown)
text { caption = "* statement 1 *"; description = "A"; font_size = 48; } A;
text { caption = "* statement 2 *"; description = "B"; font_size = 48;} B;
text { caption = "* statement 3 *"; description = "C"; font_size = 48;} C;
text { caption = "* statement 4 *"; description = "D"; font_size = 48;} D;
text { caption = "* statement 5 *"; description = "E"; font_size = 48;} E;
text { caption = "* statement 6 *"; description = "F"; font_size = 48; } F;
text { caption = "* statement 7 *"; description = "G"; font_size = 48;} G;
text { caption = "* statement 8 *"; description = "H"; font_size = 48;} H;
text { caption = "* statement 9 *"; description = "I"; font_size = 48;} I;
text { caption = "* statement 10 *"; description = "J"; font_size = 48;} J;

# Loop for the statements
array {
   LOOP $i 3;
   text A; text B; text C; text D; text E; text F; text G; text H; text I; text J;
   ENDLOOP;
} letters;

# Beginning of PCL and ending of SDL
begin_pcl;

##########################################################################
# Beginning of the program itself, using the established objects
##########################################################################

# Presentation of experiment
presentation_exp.present();

# Presentation of instructions
instructions_exp.present();

# Fixation point
fixation.present();

# IMS video
IMS_syn.present();

# EEG-Output OFF
tri_off.present(); 

# Inter-Trial-Interval
iti.present(); 

# Presentation of instructions II
instructions_exp2.present();

# EMOTIONAL VIDEOS
# Coding to present each video 8 times, randomly
sub bool seq_ok(array <int, 1> & seq, int max_inarow)
begin
	loop int i = 1; int last = 0; int inarow = 0; until i > seq.count()
	begin		

	if inarow > max_inarow then
		return false;
	end;
	last = seq[i];
	i = i + 1;
end;

return true;
end;

# Limit for each stimuli to be presented (8 each => 16 in total)
int num_repeats = 8; 

array <int> which_stim[0];

loop int i = 1 until i > num_repeats
begin
	loop int j = 1 until j > videos.count()
	begin
		which_stim.add(j);
		j = j + 1;
	end;
	i = i + 1;
end;

loop which_stim.shuffle() until seq_ok(which_stim, 1)
begin
	which_stim.shuffle();
end;

# Presentation of the fixation point, the stimuli, and the code indicating the end of the video presented
loop int i = 1 until i > which_stim.count()
begin
	stim1.set_stimulus(videos[which_stim[i]]); # Selection of video
	stim1.set_event_code(videos[which_stim[i]].description()); # Set code for the analysis window, based on description
	stim1.set_port_code(int(videos[which_stim[i]].description()));  # Set output for the port, based on description
	fixation.present(); # Fixation point
	main.present(); # Stimuli
	tri_off.present(); # EEG-Output OFF
	iti.present(); # Inter-Trial-Interval
	i = i + 1;
end;

# Presentation of instructions III
instructions_exp3.present();

# ILLUSION RATINGS
# Scale properties
int scale_steps = 400;
int scale_width = 800;
double scale_factor = double( scale_steps ) / double ( scale_width ); # 0,50
int resp_button = 1;
int cursor_part = 1;

# Set up mouse
mouse mse = response_manager.get_mouse( 1 );
mse.set_min_max(1, -scale_width/2, scale_width/2);

# Create variable to store the resp
int resp = 0;

# Loop for presenting the statements
loop 
	int i = 1; 
until 
	i > 10  # Number of statements to be shown (10)
begin
   my_pic.set_part( 5, letters[i] );
   i = i + 1;
	mse.set_xy(-scale_width/2, 0); # Orientation of the mouse at the beggining (0)
	# Loop for the awaiting of the response
	loop
		int resp_ct = response_manager.total_response_count( resp_button )
	until
		response_manager.total_response_count( resp_button ) > resp_ct
	begin
		# Poll the mouse and get the X position
		mse.poll();
		double x = mse.x_position();
		
		# Convert that to a response on the scale
		resp = int(((( x * scale_factor ) + 200) / (200 - (-200))) * 100);
		
		# Update the cursor position and response value text
		my_pic.set_part_x( cursor_part, x );
		
		# Shows value in the scale
		#scale_text.set_caption(string(resp), true);
		
		# Present values at both ends of the scale
		scale_text.ALIGN_LEFT; # 0
		scale_text2.ALIGN_RIGHT; # 100
		
		# Present the full picture
		my_pic.present();
	end;
	
	# Save the values of "resp" in the logfile
	logfile.add_event_entry(string(resp));
	
end;