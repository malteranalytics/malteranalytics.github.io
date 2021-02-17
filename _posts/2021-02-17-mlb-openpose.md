---
layout: post
title:  "Using OpenPose with MLB Players"
author: danny
categories: [ MLB, baseball, openpose, R ]
image: "https://malteranalytics.github.io/assets/images/2021-02-17-mlb-openpose/trout.png"
tags: [MLB, baseball, R]
featured: false
---
  
This post gives an example of how to use OpenPose for tracking pitcher and batter mechanics in Major League Baseball. In the first example, we see a video of Walker Beuhler. OpenPose is an open-source algorithm developed by MIT to detect real-time multi-person system to jointly detect human body, hand, facial, and foot keypoints.  

Technology like this can be used for various reasons, some of which include the use of player scouting, tracking mechanics and detecting potential injuries. 

- Player Scouting:
  - OpenPose can be used to measure how close one player's pitching mechanics or swing are relative to another known player.

- Tacking Mechanics:
  - Rather than a player or coach going through video one by one, OpenPose technology can be used to better align hundreds of videos all at once. If a pitcher is tweaking their mechanics, data from OpenPose can be overlayed to determine how much of a change is occuring. 


- Injury Prevention:
  - By using the player movement tracking data, potential models like outlier detection can be used to detect if a pitchers mechanics are differing too much from the norm.


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

Code to run the above examples can be seen [here](https://github.com/malteranalytics/malteranalytics.github.io/blob/master/research/OpenPose.ipynb){:target="_blank"}.
