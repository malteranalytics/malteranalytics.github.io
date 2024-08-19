---
layout: post
title:  "Paris Olympics Recapped in Data"
author: drew
categories: [ Olympics, Paris ]
image: "https://malteranalytics.github.io/assets/images/2024-08-19-paris-olympics/image18.png"
tags: [olympics, sports, rstats, dataviz]
featured: false
---




The Paris Olympics featured 328 events across 45 disciplines, with 92 different nations bringing home medals.  Here, we will use data to recap the games and to analyze the several factors that correlate with Olympic success, such as population, GDP, geography, and more.  We'll also explore insights about which regions of the world succeed in each type of sports and which countries are exceptional in womens' sport.

The first chart below shows the top 12 countries in medals with a break down of each medal.  The United States led the world in gold, silver, and bronze; and with a total of 123 medals, and earned medals in roughly one-third of all events.


  
  

![plot of chunk unnamed-chunk-1](/assets/images/2024-08-19-paris-olympics/image1.png) 


The map below represents the number of medals won across the world.  While each continent had podium representation, we'll later look at specific types of sports that different regions of the world succeed in. 

![plot of chunk unnamed-chunk-2](/assets/images/2024-08-19-paris-olympics/image2.png) 

The next plot explains the effect that a nation's population has on their success in the Olympics.  Outliers removed, the correlation of the below plot is 0.6 (R<sup>2</sup> = 0.35), which means about one-third of the variance of medal counts can be explained by population, leaving two-thirds up to other possible variables.  


![plot of chunk unnamed-chunk-3](/assets/images/2024-08-19-paris-olympics/image3.png) 

If Olympic success is measured on a per capita basis, the top nations would be Grenada, Dominica, and Saint Lucia.  The below chart shows the ratio of the number of medals per 1 million population of each country.   Among the 13 nations with at least 20 medals, New Zealand has by far the lowest population at about 5 million. 

![plot of chunk unnamed-chunk-4](/assets/images/2024-08-19-paris-olympics/image4.png) 

The next graph demonstrates that GDP is an even greater predictor of Olympic success than population.  Outliers removed, the correlation of this plot is .8 (R<sup>2</sup> = 0.62), confirming a very strong connection between medal count and GDP.   Countries that vastly outperformed their GDP are Kenya, Cuba, and Ukraine, and Uzbekistan. 


![plot of chunk unnamed-chunk-5](/assets/images/2024-08-19-paris-olympics/image5.png)

The next chart looks at the percent of a country's medals that were won in women sports, among countries that won at least 7 medals.  While a small sample size of medals for several countries leave us unable to draw a definitive conclusion, these percentages possibly give indication into what counties could be leading the way in encouraging in and or investing in womens' sports.  Bulgaria won 10 medals, 8 of which in women's events.  The United States also ranks near the top of the list with 59% of 123 medals going to female athletes.



![plot of chunk unnamed-chunk-6](/assets/images/2024-08-19-paris-olympics/image6.png) 


Finally, the last series of maps breaks down the medal count across the world among specific Olympic sport categories.  This gives some insight into which geographic regions tend to excel in which types of sports.  The categories that sports are broken into are Artistic Exercise, Boat, Martial Arts and Combat, Endurance and Exercise, Extreme Sports, Horse, Precision Sports, Racket Sports, Speed and Athletics, Strength Sports, Swimming, and Team Sports.  The individual sports that fall into each category are laid out with each chart.  



**Artistic Exercise:** Gymnastics, Rhythmic Gymnastics, Diving, Trampolining, and Break Dancing
![plot of chunk unnamed-chunk-7](/assets/images/2024-08-19-olympics/paris-olympics/image7.png) 

**Boat Sports:** Canoe Slalom, Canoe Sprint, Rowing, and Sailing
![plot of chunk unnamed-chunk-8](/assets/images/2024-08-19/paris-olympics/image8.png) 

**Martial Arts & Combat Sports:** Fencing, Judo, Karate, Taekwondo, Boxing, Wrestling
![plot of chunk unnamed-chunk-9](/assets/images/2024-08-19/paris-olympics/image9.png) 

**Endurance and Exercise Sports:** Track (>= 800 meters), Marathon, Triathlon, Cycling
![plot of chunk unnamed-chunk-10](/assets/images/2024-08-19/paris-olympics/image10.png) 

**Extreme Sports:** BMX freestyle, BMX racing, Mountain Biking, Skateboarding, Climbing, Surfing, Wing Surfing
![plot of chunk unnamed-chunk-12](/assets/images/2024-08-19/paris-olympics/image11.png) 

**Horse Sports:** Equestrian Dressage, Equestrian Eventing
![plot of chunk unnamed-chunk-13](/assets/images/2024-08-19/paris-olympics/image12.png) 

**Precision Sports:** Archery, Shooting, Golf
![plot of chunk unnamed-chunk-15](/assets/images/2024-08-19/paris-olympics/image13.png) 

**Racket Sports:** Tennis, Badminton, Table Tennis
![plot of chunk unnamed-chunk-16](/assets/images/2024-08-19/paris-olympics/image14.png) 

**Speed and Athletics:** Track (<=400 meters), Decathlon, High Jump, Triple Jump, Long Jump, Pole Vault, Heptathlon 
![plot of chunk unnamed-chunk-17](/assets/images/2024-08-19/paris-olympics/image15.png) 

**Strength Sports:** Weightlifting, Discus Throw, Hammer Throw, Shotput, Javelin Throw
![plot of chunk unnamed-chunk-18](/assets/images/2024-08-19/paris-olympics/image16.png) 

**Swimming:** All indoor swimming events, open water long distance swimming

![plot of chunk unnamed-chunk-19](/assets/images/2024-08-19/paris-olympics/image17.png) 

**Team Sports:** Basketball, Field Hockey, Soccer, Volleyball, Beach Volleyball, Rugby Sevens, Handball, Water Polo
![plot of chunk unnamed-chunk-20](/assets/images/2024-08-19/paris-olympics/image18.png) 


