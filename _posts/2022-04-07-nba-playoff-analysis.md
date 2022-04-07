---
layout: post
title:  "An Application of Unsupervised Machine Learning: What Each Team Should Focus on Heading into the NBA Playoffs"
author: drew
categories: [ NBA, Basketball ]
image: "https://malteranalytics.github.io/assets/images/2022-04-07-nba-playoff-analysis/image29.PNG"
tags: [NBA, sports, basketball, rstats, dataviz]
featured: false
---




The 20 NBA teams that will compete in the playoffs and play-in games have been set, each with their own unique abilities and vulnerabilities.  A game style that works for one team could very well be the demise of another.  Aside from the obvious (i.e. - shooting better, defending better), I've dug into NBA Advanced Tracking data to identify coachable and manageable actions that each team can take to improve their chances of heading into the off-season as champions. 

The first plot introduces many of the data features that may end up being focus points for playoff teams.  Other than points and assists, these are all metrics that don't show up in a box score, yet metrics that coaches and scouts care about.   The data is measured on a per-game basis and the purpose of the matrix is to understand the correlation between how teams fair for each metric with scoring and winning.  For example, there is a positive correlation of 0.38 between how well a team boxes out and winning games.  Conversely, and perhaps counter intuitively, the cumulative distance traveled by the players on a team is inversely correlated to winning.  Do winning teams reduce movement to save energy?  Do losing teams find themselves running around more because they're struggling to run offensive plays or keep up with their opponents?  There's a lot to the story that this correlation plot doesn't share with us, so we'll dig deeper into the data to learn more. 





  

![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image1.png) 

Below is the first look at how some teams succeed by doing something intuitively good, in this case passing more, yet other teams are doing just fine without passing much.  The teams on the x-axis are ranked in order of record as of April 5.  The Suns have the best record in the NBA, yet they pass less than just about every team as well.  We also see two of the highest passing teams, the Warriors and Pacers, falling on opposite sides of the win spectrum. 


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image2.png) 

Looking at the next chart, we see that there's a variation across the league of about a half dribble per player touch, which is significant when you extrapolate the number of touches throughout a game (Around 400 touches per game is standard).  We see both good and bad teams that do a lot of dribbling, and visa versa.  While a lot of dribbling and little passing fits the Suns system well, perhaps a team like the Trailblazers could benefit from dribbling less and passing more. 


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image3.png) 

Moving forward, there does seem to be at least a small connection between good teams and posting up, despite some of the best teams not using the post up often.  To no surprise, the Nuggets and 76ers dominate this area of basketball with Nikola Jokic and Joel Embiid on the court.  On the contrary, the Grizzlies have shown that there are other ways to be effective on offense. 


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image4.png) 



In the case of the Grizzlies with the following chart, it turns out that they still get the ball in the paint almost as much as any other team, with the driving abilities of Ja Morant leading the way for them.   In almost completely opposite fashion, the 76ers rarely drive and therefor have fewer paint touches than the rest of the league, despite Embiid's amazing post-up ability. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image5.png) 


Another key offensive strategy for some teams is getting the ball to the elbow.  Like the previous metrics, this strategy is very dependent on player personnel, and hence varies across the spectrum of good and bad teams. 


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image6.png) 



As the below chart shows, the cumulative distance traveled among each team's players per game is another interesting metric.  The Hornets and Spurs move more than any other team yet are playing play-in games.  The Celtics are the most successful team that minimizes movement.  Later, we'll see a breakdown for teams' movement between offense and defense which will provide more insight. 




![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image7.png) 


Finally, we'll look at the breakdown of boxing out by team.  Good teams don't necessarily box out more than bad teams, but as it not surprisingly turns out, when teams box out more often with respect to themselves, they win more games as well.   


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image8.png) 



Having a better understanding of the data behind the box score, let's now look at each playoff team to look for patterns when they are winning games compared to losing games.   While the tables may not give the complete story as to why the trend is apparent, some useful insights can be determined by supplementing this information with what we know about the team's personnel and strategies. 


***Western Conference:***

**Phoenix Suns:**

The Suns have a small sample size of losses, but from those 16 games we can see that their defensive movement is down by almost half a mile per game and they're getting the ball in the paint 4 times less per game.  From what we saw last year in their run as the Western Conference champions, I would expect the same high intensity defense to show up for them again in this year's playoffs. 




![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image9.png) 

**Memphis Grizzlies:**

Simply put, the Grizzlies are extremely tough to beat when they're possessing the ball, getting more touches and dribbling (allowing Ja Morant to take over games).  They're most vulnerable when they rush and aren't passing well.  There can be plenty of theories of cause and effect, but it's interesting to see that when they win, they generally have much less offensive movement. 


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image10.png) 

**Golden State Warriors:**

The Warriors just need to stay true to themselves.  They didn't win championships by playing big and the post up game hasn't been what's driving their success this year either. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image11.png) 

**Dallas Mavericks:**

While one of the West's best teams, there's not much statistically significant insight here for Dallas.  On a small scale, their wins come from games in which they move the ball around more and get the ball into the paint. 




![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image12.png) 

**Denver Nuggets:**

For the best post up team in the NBA, it's essential for the Nuggets to be getting Jokic the ball down low.  The Nuggets also utilize the ball well from the elbow and have slightly more defensive movement for their wins. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image13.png) 


**Utah Jazz:**

The Jazz 46 wins look almost identical to their 32 losses, with slightly more paint and elbow touches when they're winning games. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image14.png) 


**Minnesota Timberwolves:**

Passing, possessing, and getting more touches hasn't correlated to Timberwolves success, but offensive movement has a slightly positive correlation with winning games for them. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image15.png) 

**LA Clippers:**

Like the Timberwolves, passing and possessing more hasn't been the answer for the Clippers, and their only positive distinction here would be with post ups. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image16.png) 


**New Orleans Pelicans:**

While the Pelicans have a larger sample size of losses than wins, their wins are coming from games where they're passing more and getting some more touches both at the elbow and in the paint. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image17.png) 


**San Antonio Spurs:**

The final play-in team in the West will give themselves the best shot to compete if they can get the ball down low, both from the post up game and allowing their guards to drive. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image18.png) 


***Eastern Conference:***

**Miami Heat:**

For the best regular season team in the East, the Heat play better when they're not overpassing.  They also are at their best when they're getting the ball down low and are possessing on offense. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image19.png) 


**Boston Celtics:**

One of the hottest teams in the NBA, the Celtics move significantly less than most teams.  Yet their losses often come when they're not moving well, even for their own standards. 




![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image20.png) 


**Milwaukee Bucks:**

Not surprisingly, the Bucks are one of the best teams in the NBA when they can get the ball in the paint.  Otherwise, their wins and losses don't have a ton of variation among the other metrics. 




![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image21.png) 


**Philadelphia 76ers:**

Like the Nuggets, the unsurprising key to victory for the 76ers is using their MVP big man to their advantage.  When they get Embiid the ball down low, they're in great shape. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image22.png) 


**Toronto Raptors:**

The Raptors are significantly better when they are passing more and possessing more.  For them, it's not about working the ball low or to the elbow, if they are moving the ball around well on offense. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image23.png) 

**Chicago Bulls:**

There's no glaring stand out for the Bulls here, but they do have almost half a mile more in movement on average when they win versus when they lose.  They average an extra paint touch per game when they win, yet fewer passes and touches for their wins as well and their time of possession doesn't change for wins or losses. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image24.png) 


**Cleveland Cavaliers:**

The Cavaliers can look like two completely different teams between their wins and losses.  Winning for them means getting the ball down low significantly more often and passing more, getting each player more touches. 



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image25.png) 


**Brooklyn Nets:**

As a scary play-in team that can make some noise, the Nets are great working the ball to the elbow and are passing the ball almost 15 times more per game when they win vs when they lose.  If they're possessing on offense and sharing the ball, they can be tough to beat. 




![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image26.png) 


**Atlanta Hawks:**

Another team that struggles when they aren't passing, ball movement and possession are two key factors for the Hawks to focus on heading into the playoffs.  They also play well from the elbow, and their down low game doesn't change much between wins and losses.  



![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image27.png)


**Charlotte Hornets:**

A team that moves a ton both on offense and defense, they can tire opponents out and win games when they're moving well, even by their own standards.  They can also slightly benefit from holding onto the ball longer and not rushing their decision making on offense. 


![plot of chunk unnamed-chunk-1](/assets/images/2022-04-07-nba-playoff-analysis/image28.png) 



For any recommendations for enhancements or future analysis, please reach out to me at abmalter12@gmail.com
