---
layout: post
title:  "Analyzing Success in the 2021 Olympics"
author: drew
categories: [ Olympics, Tokyo ]
image: "https://malteranalytics.github.io/assets/images/2021-08-17-olympics/image2.png"
tags: [olympics, sports, rstats, dataviz]
featured: false
---




The Tokyo Olympics featured 339 events across 50 disciplines, with 93 different nations bringing home medals.  Using data can allow us to dissect the several factors that correlate with Olympic success, such as population, GDP, geography, and more.  The below series of charts show many insights such as which regions of the world succeed in which types of sports, which countries are exceptional in women's sports, and to what extent population and GDP predict a nation's success.  

The first chart below shows the top 12 medaling countries with a break down of each medal.  The United States led the world in gold, silver, and bronze; and with a total of 113 medals, medaled in roughly one-third of all events.


  
  

![plot of chunk unnamed-chunk-1](/assets/images/2021-08-17-olympics/image1.png) 


The map below represents the number of medals won across the world.  While each continent had podium representation, we'll later look at specific types of sports that different regions of the world succeed in. 

![plot of chunk unnamed-chunk-2](/assets/images/2021-08-17-olympics/image2.png) 

The plot below explains the effect that a nation's population has on their success in the Olympics.  Outliers removed, the correlation of the below plot is 0.6 (R<sup>2</sup> = 0.35), which means about one-third of the variance of medal counts can be explained by population, leaving two-thirds up to other possible variables.  


![plot of chunk unnamed-chunk-3](/assets/images/2021-08-17-olympics/image3.png) 

If Olympic success is measured on a per capita basis, the top nations would be San Marino, Bermuda, and Grenada.  The below chart shows the ratio of the number of medals per 1 million population of each country.   Among the 15 nations with at least 20 medals, New Zealand has by far the lowest population at under 5 million. 

![plot of chunk unnamed-chunk-4](/assets/images/2021-08-17-olympics/image4.png) 

The next chart below shows that GDP is an even greater predictor of Olympic success than population.  Outliers removed, the correlation of this plot is .8 (R<sup>2</sup> = 0.62), demonstrating a very strong connection between medal count and GDP.   Countries that vastly outperformed their GDP are Kenya, Cuba, and Ukraine. 


![plot of chunk unnamed-chunk-5](/assets/images/2021-08-17-olympics/image5.png)

The next chart looks at the percent of a country's medals that were won in women sports, among countries that won at least 4 medals.  While a small sample size of medals for several countries leave us unable to draw a definitive conclusion, these percentages potentially give indication into what counties could be leading the way in encouraging in and or investing in women's sports.  Bulgaria won 6 medals, all in women's events.  The United States also ranks near the top of the list with 63% of 113 medals going to female athletes.  As expected, most counties fall within a few percentage points up or down from 50%.



![plot of chunk unnamed-chunk-6](/assets/images/2021-08-17-olympics/image6.png) 


The last series of maps breaks down the medal count across the world among specific Olympic sport categories.  This gives some insight into which geographic regions tend to excel in which types of sports.  The categories that sports are broken into are Artistic Exercise, Boat, Combat, Endurance, Cycling, Extreme Sports, Horse, Martial Arts, Precision Sports, Racket Sports, Speed and Athletics, Strength Sports, Swimming, and Team Sports.  The individual sports that fall into each category are laid out with each chart.  



**Artistic Exercise:** Gymnastics, Rhythmic Gymnastics, Diving, and Trampolining
![plot of chunk unnamed-chunk-7](/assets/images/2021-08-17-olympics/image7.png) 

**Boat Sports:** Canoe Slalom, Canoe Sprint, Rowing, and Sailing
![plot of chunk unnamed-chunk-8](/assets/images/2021-08-17-olympics/image8.png) 

**Combat Sports:** Boxing, Wrestling
![plot of chunk unnamed-chunk-9](/assets/images/2021-08-17-olympics/image9.png) 

**Endurance Sports:** Track (>= 800 meters), Marathon, Triathlon
![plot of chunk unnamed-chunk-10](/assets/images/2021-08-17-olympics/image10.png) 


**Cycling:** Cycling Road, Cycling Track
![plot of chunk unnamed-chunk-11](/assets/images/2021-08-17-olympics/image11.png) 

**Extreme Sports:** BMX freestyle, BMX racing, Mountain Biking, Skateboarding, Climbing, Surfing
![plot of chunk unnamed-chunk-12](/assets/images/2021-08-17-olympics/image12.png) 

**Horse Sports:** Equestrian Dressage, Equestrian Eventing
![plot of chunk unnamed-chunk-13](/assets/images/2021-08-17-olympics/image13.png) 

**Martial Arts:** Fencing, Judo, Karate, Taekwondo
![plot of chunk unnamed-chunk-14](/assets/images/2021-08-17-olympics/image14.png) 

**Precision Sports:** Archery, Shooting, Golf
![plot of chunk unnamed-chunk-15](/assets/images/2021-08-17-olympics/image15.png) 

**Racket Sports:** Tennis, Badminton, Table Tennis
![plot of chunk unnamed-chunk-16](/assets/images/2021-08-17-olympics/image16.png) 


**Speed and Athletics:** Track (<=400 meters), Decathlon, High Jump, Triple Jump, Long Jump, Pole Vault, Heptathlon 
![plot of chunk unnamed-chunk-17](/assets/images/2021-08-17-olympics/image17.png) 

**Strength Sports:** Weightlifting, Discus Throw, Hammer Throw, Shotput, Javelin Throw
![plot of chunk unnamed-chunk-18](/assets/images/2021-08-17-olympics/image18.png) 

**Swimming:** All indoor swimming events, open water long distance swimming

![plot of chunk unnamed-chunk-19](/assets/images/2021-08-17-olympics/image19.png) 

**Team Sports:** Basketball, Field Hockey, Soccer, Volleyball, Beach Volleyball, Softball, Baseball, Rugby Sevens, Handball, Water Polo
![plot of chunk unnamed-chunk-20](/assets/images/2021-08-17-olympics/image20.png) 


