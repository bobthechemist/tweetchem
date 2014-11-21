BeginPackage["tweetchem`"]

initConnection::usage = "initConnection[] initialies the twitter\
  connection and returns the connection object."
initLearningObjectives::usage = "initLearningObjectives[<file>] loads\
  a list of tweetable objectives."
getTweets::usage = "getTweets[<conn>] returns a list of tweets."
tweetSchedule::usage = "tweetSchedule[<list>] sends the list of tweets\
  at a rate of every 2 minutes."
getNextTweet::usage = "hi"

Begin["`Private`"]
(* private variables *)
$locounter = 1; (* which LO are we tweeting? *)
$lolength = 0; (* Length of the LO list *)

(* initConnection *)
Clear[initConnection];
initConnection[]:=ServiceConnect["Twitter"]
(* initLearningObjectives *)
Clear[initLearningObjectives];
initLearningObjectives[file_]:=Module[{temp},
  temp = Import[file,"List"];
  $lolength = Length@temp;
  $locounter = 1;
  temp
  ]

(* getNextTweet *)
Clear[getNextTweet]
getNextTweet[list_]:=Module[{},
  If[$locounter++ <= $lolength,
    list[[$locounter]],
    ($locounter = 1; list[[$locounter]])]
  ]

(* tweetSchedule *)
Clear[tweetSchedule];
tweetSchedule[conn_, list_]:=Module[{temp},
  CreateScheduledTask[
    ServiceExecute[conn,"Tweet",
      "Message"->getNextTweet[list]
    ],{30, $lolength}
  ]
]
  
(* getTweets *)
Clear[getTweets];
getTweets[conn_]:=ServiceExecute[conn,"TweetList"]


End[]
EndPackage[]

