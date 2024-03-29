---
layout: post
title:  "Are 60 Games Enough for MLB Trends to 'Regress to the Mean'?"
author: drew
categories: [ mlb, baseball, dataviz ]
image: "https://malteranalytics.github.io/assets/images/2020-07-23-mlb-playoff-predictions/image11.PNG"
tags: [mlb, dataviz, analytics, moneyball, rstats]
featured: false
---
  
  
Every year after MLB's first month, there seems to be one or two players who are on pace to break Barry Bonds' homerun record, or a team that is on pace to have the best record of all time.  Of course, we all know that these are unlikely outcomes because of the statistics phenomenon of 'Regression Towards the Mean'.   The law of Regression Towards the Mean asserts that as a sample size gets larger (number of games), variables (player and team statistics) will move closer towards their true average.  



This MLB season, which will comprise of just 60 games (seasons are typically 162 games) will be especially exciting because we're not sure if 60 games is a large enough sample size for all statistics to regress towards the mean.  Hence, we may see a much greater variation of team records and individual player statistics than we normally observe in a full season.  In this article, we'll analyze the regression of 2019 player and team stats to better predict what we might see in the 2020 season, followed by the results of my 2020 division win probability model. 




Batting Average and Home Runs are a baseball fan's two favorite stats to track at the individual player level.   The below charts take the 2019 season leaders for each respective category and plot their cumulative stats over the course of the season.  Against the player's regressing lines are the all-time leaders for those categories.  (Rogers Hornsby is the all time Batting Average leader of the last 100 years).   Tim Anderson of the White Sox, who finished the season with the best batting average, jumped off to an incredible start, but only maintained a higher average than Hornsby for about 3 weeks, and by 60 games was well under.  It took around 40 games for each of these players to reach within a very close margin of their final season batting average. 



![plot of chunk unnamed-chunk-1](/assets/images/2020-07-23-mlb-playoff-predictions/image1.png)





Christian Yelich of the Brewers and Cody Bellinger of the Dodgers were able to maintain pace above Barry Bonds' all-time home run record for about 40 games as well, but soon dropped below and never again came close. Pete Alonso of the Mets, who finished the season as the leader, was always far below Bonds' pace and did not jump to the top until the final month of the season. 





![plot of chunk unnamed-chunk-2](/assets/images/2020-07-23-mlb-playoff-predictions/image2.png)


At the team level, statistics will converge to their true average far before the individuals due to the team having a greater sample size.  The below charts look at On Base Percentage (OBP) for each team, showing that it took just about 30 games for teams to be within close range of their final season On Base Percentage. 





![plot of chunk unnamed-chunk-3](/assets/images/2020-07-23-mlb-playoff-predictions/image3.png)

![plot of chunk unnamed-chunk-4](/assets/images/2020-07-23-mlb-playoff-predictions/image4.png)



From the above charts, it might be a reasonable inference that team standings were also mostly solidified after around 30 to 40 games, however that was not the case.  The following 6 charts show the cumulative team wins over the course of the 2019 season.  The Braves and Cardinals, who eventually went on to win their divisions, would have come up short in a 60 game season.   Even among the teams that finished both the 60 and 162 game markers in first place, there were swaps in the standings along the way. 



  
  
![plot of chunk unnamed-chunk-5](/assets/images/2020-07-23-mlb-playoff-predictions/image5.png)
  
![plot of chunk unnamed-chunk-6](/assets/images/2020-07-23-mlb-playoff-predictions/image6.png)
  
![plot of chunk unnamed-chunk-7](/assets/images/2020-07-23-mlb-playoff-predictions/image7.png)
  
![plot of chunk unnamed-chunk-8](/assets/images/2020-07-23-mlb-playoff-predictions/image8.png)
  
![plot of chunk unnamed-chunk-9](/assets/images/2020-07-23-mlb-playoff-predictions/image9.png)
  
![plot of chunk unnamed-chunk-10](/assets/images/2020-07-23-mlb-playoff-predictions/image10.png)




Last year on MLB Opening Day, I posted [playoff probability predictions](https://malteranalytics.github.io/mlb-probabilities/){:target="_blank"} and the method I used to obtain those predictions.  This year, I've used the same method, but I adjusted the standard deviations for a 60-game season, to get the 2020 playoff probabilities.  In the charts below, I've also included what each team's chances would have been if there was a full season.  The glaring takeaway is that a 60-game season is very beneficial to underdogs.  In the American League, the Red Sox, Athletics, and Angels probabilities have been tripled, doubled, and tripled respectively.  In the National League, we see similar improvements for the Phillies, Padres, and Diamondbacks.  On the contrary, teams that would have incredibly high playoff chances in a full season such as the Yankees, Astros, and Dodgers, now are no better than a coin flip.      
  
  
  
  
  
  
  
![plot of chunk unnamed-chunk-11](/assets/images/2020-07-23-mlb-playoff-predictions/image11.PNG)

![plot of chunk unnamed-chunk-12](/assets/images/2020-07-23-mlb-playoff-predictions/image12.PNG)



