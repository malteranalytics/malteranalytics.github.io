---
layout: post
title:  "Using OpenPose with MLB Players"
author: danny
categories: [ MLB, baseball, openpose, R ]
image: "https://malteranalytics.github.io/assets/images/2021-02-17-mlb-openpose/trout.png"
tags: [MLB, baseball, R]
featured: false
---
  
This post gives an example of how to use OpenPose for tracking pitcher and hitter mechanics in Major League Baseball. In the first example, we see a video of Walker Beuhler pitching in slow motion and in the second, a video of Mike Trout swinging through a home run. OpenPose is a real-time multi-person system developed by MIT to detect human body, hand, facial, and foot keypoints.  

Technology like this can be used for various reasons, some of which include the use of player scouting, tracking mechanics and detecting injuries ahead of time. 

- Player Scouting:
  - OpenPose can be used to measure how closely one player's pitching or hitting mechanics are relative to another known player.  By collecting data like angles of body parts, movement, etc. clustering algorithms can be used to measure the similarity between two player's pitches or swings.

<br>

- Tacking Mechanics:
  - Rather than a player or coach going through video one by one, OpenPose technology can be used to better align hundreds of videos all at once. If a pitcher is tweaking their mechanics, data from OpenPose can be overlayed to determine how much of a change is occurring and where specifically the change is.

<br>

- Injury Prevention:
  - By using player movement tracking data, potential models like outlier detection algorithms can be used to detect if a pitcher's mechanics are differing too much from the norm.  In this case, some type of alert system can be programmed to allow a pitcher to know that their mechanics have changed.  This type of data can also be used to measure a given pitcher's mechanics to those that have previously suffered from pitching related injuries.


<br>

<b>Walker Beuhler</b>
<video width="520" controls>
<source src="/assets/images/2021-02-17-mlb-openpose/walker_beuhler.mp4">
</video>

<br>

<b>Mike Trout</b>
<video width="520" controls>
<source src="/assets/images/2021-02-17-mlb-openpose/trout.mp4">
</video>

<br>


There are many other use cases as well, but I think the above points are very feasible with current technology if team's are willing to commit to the resources. Player injury prevention is a hot topic in sports and especially in a sport like baseball with lots of repetitive movements, algorithms like OpenPose can make great impacts to help prevent injuries.


Example code to run the above examples can be seen [here](https://github.com/malteranalytics/malteranalytics.github.io/blob/master/research/OpenPose.ipynb){:target="_blank"}.
