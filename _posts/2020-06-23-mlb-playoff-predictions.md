---
  layout: post
title:  "Are 60 Games Enough for Averages to 'Regress to the Mean?'"
author: drew
categories: [ mlb, dataviz ]
image: "https://malteranalytics.github.io/assets/images/2020-07-23-mlb-playoff-predictions/image11.png"
tags: [mlb, dataviz, analytics, moneyball, rstats]
featured: true
---
  
  
Every year after MLB's first month, there seems to be one or two players who are on pace to break Barry Bonds' homerun record, or a team that is on pace to have the best record of all time.  Of course, we all know that these are unlikely outcomes because of the statistics phenomenon of 'Regression Towards the Mean'.   The law of Regression Towards the Mean asserts that as a sample size gets larger (number of games), variables (player and team statistics) will move closer towards their true average.  



This MLB season, which will compose of just 60 games (seasons are typically 162 games) will be especially exciting because we're not sure if 60 games is a large enough sample size for all statistics to regress towards the mean.  Hence, we may see a much greater variation of team records and individual player statistics than we normally observe in a full season.  In this article, we'll analyze the regression of 2019 player and team stats to better predict what we might see in the 2020 season, followed by the results of my 2020 division win probability model. 




Batting Average and Home Runs are a baseball fan's two favorite stats to track at the individual player level.   The below charts take the 2019 season leaders for each respective category and plot their cumulative stats over the course of the season.  Against the player's regressing lines are the all-time leaders for those categories.  (Rogers Hornsby is the all time Batting Average leader of the last 100 years).   Tim Anderson of the White Sox, who finished the season with the best batting average, jumped off to an incredible start, but only maintained a higher average than Hornsby for about 3 weeks, and by 60 games was well under.  It took around 40 games for each of these players to reach within a very close margin of their final season batting average. 



![plot of chunk unnamed-chunk-1](/assets/images/2020-07-23-mlb-playoff-predictions/image1.PNG)  




The map above is outlined by modern-day Europe with pre-World War II labels.  Each point represents the target location of a unique aerial mission, whether it be by bomber, fighter, glider, or other type of aircraft.  [The data](https://www.kaggle.com/usaf/world-war-ii){:target="_blank"} comes from the Theater History of Operations Reports and consists mostly of the United States Air Force and the Royal Air Force of Great Britain with minimal records from the Royal Australian Air Force and the Royal New Zealand Air Force, however data is missing from both nations' campaigns in Europe.  Additionally, there was no data provided for several other key Allied powers such as Canada, the Soviet Union, and Poland.  Also, given that the data was collected from 1939-1945, there are surely cases of inaccuracies and missing records, notably data from Great Britain (Battle of Britain), Australia, and New Zealand.  


Among the astounding number of European, North African, and Mediterranean countries impacted by battle, the locations of highly concentrated aerial action can be associated with territories of strongest Nazi control.  Vichy (Southern) France along with neutral Switzerland, Spain, and Portugal were the only countries in Western Europe that avoided complete bombardment.  Had USSR data been available, Poland and many other Eastern European nations would more closely resemble the destruction seen in Western Europe. 



![plot of chunk unnamed-chunk-2](/assets/images/2020-07-23-mlb-playoff-predictions/image2-pto_map.PNG)


In the Pacific Theater, we can similarly see that the devastation of war was unavoidable across the map as Japan's Emperor Hirohito sought to expand Japanese influence across the resource rich Pacific Islands; many of which were colonized by Western Powers.  The Imperial Japanese Empire capitalized on the vulnerability of Nazi-occupied France and Netherlands, and the tied-up British, by invading their respective colonies and ruthlessly killing civilians and prisoners of war that stood in their way.  The Philippines (at the time an American territory) and Pearl Harbor were key military targets for Japan, who took a gamble that a crippled U.S. Navy would buy the Japanese enough time to pursue expansion without a full-strength opposition.  The U.S. suffered overwhelming losses in the surprise invasions of both islands with the attack of the Philippines occurring just 10 hours after the attack on Pearl Harbor.<sup>(1)</sup> The Japanese proceeded to imprison and murder thousands of American and Filipino soldiers, however three years later the island was ultimately freed after American General Douglas MacArthur commanded the victorious Battle of Leyte, leading to eventual Philippines independence.<sup>(2)</sup>





![plot of chunk unnamed-chunk-3](/assets/images/2020-07-23-mlb-playoff-predictions/image3-timeline.PNG)

![plot of chunk unnamed-chunk-4](/assets/images/2020-07-23-mlb-playoff-predictions/image4-timeline_map.PNG)




It took 6 years for the Allies to declare victory in WWII from the moment the war began with the Nazi's Blitzkrieg (Lightning War) invasion of Poland.  The first major turning point in favor of the Allies in Europe (where the graph begins to slope upwards) wasn't until 1943 when the Soviet Union's Red Army prevailed in what became the deadliest battle in war history, the battle of Stalingrad.<sup>(3)</sup>  Following the Red Army's victory in defending their iconic city, named after their dictator, they launched a counter offensive to the west with newfound confidence.<sup>(4)</sup> Meanwhile, the other Allied Powers were advancing up the boot of Italy and preparing for a large-scale invasion of France.  A year later the Americans, British, and Canadians did just that when they stormed the beaches of Normandy on D-Day, completely changing the tide of war, and combat in Europe spiked for 11 months as the Allies pushed the Nazis towards their inevitable surrender.  The map below the timeline represents the locations of Allied aerial attacks over the course of the war, implying the path the Allies took (light to dark) through France and Southern Italy as they closed in on the heart of Nazi territory. 







Having seen where and when the aerial missions took place, we'll next look at which types of aircrafts were leading these missions.  Among the U.S. Air Force, the B-24 Liberator Bomber was the most used aircraft throughout the war.  The bomber generally carried 8-10 men, including two pilots, several gunners, and an imperative, highly skilled bombardier responsible for hitting the precise target while accounting for aircraft speed, altitude, wind speed, air density, weather conditions, and bomb ballistics.<sup>(5)</sup>  At roughly 200 mph and up to 25,000 feet in the air, often only the lead aircraft in a group required a bombardier while the others would follow suit.<sup>(6)</sup>
  
  
  
  ![plot of chunk unnamed-chunk-5](/assets/images/2020-07-23-mlb-playoff-predictions/image5-aircrafts.png)


The second most common type of aircraft was the fighter jet, and among those the A-20 Havoc led the most missions.  A much smaller, faster, and more agile plane than the bomber, the fighter jets were used for aerial combat, often shooting down the enemy and protecting their own bombers.<sup>(7)</sup>
  
  
  
  
  
  
  
  
  ![plot of chunk unnamed-chunk-6](/assets/images/2020-07-23-mlb-playoff-predictions/image6-aircraft_barchart.png)


![plot of chunk unnamed-chunk-7](/assets/images/2020-07-23-mlb-playoff-predictions/image7_aircraft_timeline.png)






For the Americans and their Allies, the war could not have been won without the continuous improvement of science and technology.  In the case of aerial bombing, the force of explosive bombs that were being rained on Europe and the Pacific was rapidly increasing until the war began to die down late in 1944.  By the peak of the war, a typical bomb had a force akin to 20 tons of TNT, more than 5 times the force of what was being dropped by US bombers at the beginning of the war.   By comparison, the atomic bombs, named Little Boy and Fat Man, that USA dropped over the Japanese cities of Hiroshima and Nagasaki respectively, had TNT equivalents of 15 *thousand* and 20 *thousand* tons. 


![plot of chunk unnamed-chunk-8](/assets/images/2020-07-23-mlb-playoff-predictions/image8_explosives_barchart.png)





There were four main categories of explosives used by the Americans, most commonly a *General Purpose Bomb*.  The chart below is a sample of several hundred bombs that the U.S. Air Force dropped, mapping the bombs to the type of target that they hit.  




![plot of chunk unnamed-chunk-9](/assets/images/2020-07-23-mlb-playoff-predictions/image9_explosive_targets.png)





We can further understand the Allies' brilliant chess-like strategy by plotting the mission targets on a map.  For example, the Nazi's placed several gun emplacements along the most heavily fortified section of the western coast of Europe in Northern France.  Once the Allies broke through Hitler's coastal fortress on D-Day, June 6, 1944, they heavily bombed highways, bridges and river crossings to make it difficult for the Nazis to send additional support.  Moreover, much of the genius of General Eisenhower's D-Day Operation Overlord came from the deception that the Allies played on Hitler and the Nazis, who were sure that the Allies intended to break into Northwest Europe through Pas de Calais, the point in Northern France nearest to Great Britain.  Toying with the Nazi's imagination, the Allies stationed an army under high profile American General George Patton on the British side of the English Channel and sent recurrent decoy missions to Calais before and after June 6th.  False intelligence sent to Nazi high command 'confirmed' their phantom beliefs, and by the time the Nazis fully understood that the bloody Normandy landings were not a diversion, hundreds of thousands of Allied soldiers had landed in France and were well on their way to liberating Paris.<sup>(8)</sup>





![plot of chunk unnamed-chunk-10](/assets/images/2020-07-23-mlb-playoff-predictions/image10_target_map.png)




In the south of Europe, Italy endured as severe an aerial assault as any other country, especially in their northern territory which was under Nazi occupation after the Italians surrendered to the Allies and arrested their Fascist dictator, Benito Mussolini.<sup>(9)</sup> With the help of the Italian partisans waging a guerilla resistance, a key objective for the Allies was to dismantle Nazi transportation since they relied on railroads, highways, and bridges to ship food and supplies stolen from the Italians back to their homeland.  Most of these goods were shipped by railway through the German-annexed Austrian territory, accounting for the plethora of green there on the map above. 



As this analysis goes to show, many key events in World War II can be better understood by supplementing the accounts of surviviors and historians with data.  Although this data has flaws and is specific to aerial missions, it's a reflection of the combat that unfolded from all branches of all armed forces that fought in the war.  If you're as interested in World War II as I am and would like to learn more, I've included below several related articles, books, and movies that I found enjoyable.  If you would like to share your thoughts or suggestions, reach out to me at <abmalter12@gmail.com>.


