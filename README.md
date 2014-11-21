tweetchem
=========

Mathematica package for setting up a twitter-based chemical fact distributor

#Version information#

Nothing here is ready for prime time. You have been warned.  I have no idea how you even came to stop by in the first place.

#Notes#

This section contains miscellaneous notes on this project

Here's the process so far:
* load tweetchem
* initialize the twitter connection with initConnection
* initialize the messages to send with initLearningObjectives
* Create a scheduled task with tweetSchedule
* Start the task with StartScheduledTask[<>]

I am sending 10 tweets over five minutes at the moment.  I would like to be able to delete old tweets so that I don't run in to duplicate problems.  Also, I'd like to eventually add content to each of the learning objectives.  Ultimately a link to a youtube video or an activity that students can do.  Depending on time, I will start with adding recommended end-of-chapter problems.

Perhaps we can organize the learning objectives.  A message gets sent out that we are going to study Acids and Bases over the next hour and then push the information.  Once all of that is out there for a bit, it gets erased and the next set of learning objectives gets tweeted.


##To do:##

* Stage 1 objectives - Inorganic chemistry learning objectives
** Create a textfile containing hints and suggestions
** Schedule facts to go out once per hour, not including sleep time
** Include a couple pictures
* Stage 2 objectives - General Chemistry fun facts
** Create the Unicode conversion functions
* Stage 3 objective - Create a Periodic Table fun fact tweeter
** Create the Unicode conversion script