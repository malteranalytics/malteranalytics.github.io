---
layout: post
title:  "Analysis of the Allies' WWII Strategy"
author: drew
categories: [ ww2, Allies, D-Day ]
image: "https://malteranalytics.github.io/assets/images/2020-04-01-ww2-strategy/image1-eto_map.PNG"
tags: [ww2, Allies, D-Day]
featured: true
---
  
  
Next month, May 8<sup>th</sup>, will mark the 75th anniversary of Victory in Europe (VE) Day, when Winston Churchill announced Nazi Germany's unconditional surrender from World War II, officially bringing an end to the Holocaust and to the war in Europe.  Defeating Fascism required a well-planned, well-executed war strategy along with the sacrifices of millions of people who contributed to the Allies' efforts.  To better understand their strategy, I've created a visual analysis from over 175 thousand records of documented Allied aerial missions by the United States, Great Britain, Australia, and New Zealand, across all theaters of operation from the 6-year war.   



![plot of chunk unnamed-chunk-1](/assets/images/2020-04-01-ww2-strategy/image1-eto_map.PNG)  




The map above is outlined by modern-day Europe with pre-World War II labels.  Each point represents the target location of a unique aerial mission, whether it be by bomber, fighter, glider, or other type of aircraft.  [The data](https://www.kaggle.com/usaf/world-war-ii){:target="_blank"} mostly comes from the United States Air Force and the Royal Air Force of Great Britain with minimal records from the Royal Australian Air Force and the Royal New Zealand Air Force, however data is missing from both nations' campaigns in Europe.  Additionally, there was no data provided for several other key Allied powers such as Canada, the Soviet Union, and Poland.  Also, given that the data was collected from 1939-1945, there are surely cases of inaccuracies and missing records, notably data from Great Britain (Battle of Britain), Australia, and New Zealand.  


Among the astounding number of European, North African, and Mediterranean countries impacted by battle, the locations of highly concentrated aerial action can be associated with territories of strongest Nazi control.  Vichy (Southern) France along with neutral Switzerland, Spain, and Portugal were the only countries in Western Europe that avoided complete bombardment.  Had USSR data been available, Poland and many other Eastern European nations would more closely resemble the destruction seen in Western Europe. 



In the Pacific Theatre, we can similarly see that the devastation of war was unavoidable across the map as Japan's Emperor Hirohito sought to expand Japanese influence across the resource rich Pacific Islands; many of which were colonized by Western Powers.  The Imperial Japanese Empire capitalized on the vulnerability of Nazi-occupied France and Netherlands, and the tied-up British, by invading their respective colonies and ruthlessly killing civilians and prisoners of war that stood in their way.  The Philippines (at the time an American territory) and Pearl Harbor were key military targets for Japan, who took a gamble that a crippled U.S. Navy would buy the Japanese enough time to pursue expansion without a full-strength opposition.  The U.S. suffered overwhelming losses in the surprise invasions of both islands with the attack of the Philippines occurring just 10 hours after the attack on Pearl Harbor.<sup>(1)</sup> The Japanese proceeded to imprison and murder thousands of American and Filipino soldiers, however three years later the island was ultimately freed after American General Douglas MacArthur commanded the victorious Battle of Leyte, leading to eventual Philippines independence.<sup>(2)</sup>




![plot of chunk unnamed-chunk-2](/assets/images/2020-04-01-ww2-strategy/image2-pto_map.PNG)




It took 6 years for the Allies to declare victory in WWII from the moment the war began with the Nazi's Blitzkrieg (Lightning War) invasion of Poland.  The first major turning point in favor of the Allies in Europe (where the graph begins to slope upwards) wasn't until 1943 when the Soviet Union's Red Army prevailed in what became the deadliest battle in war history, the battle of Stalingrad.<sup>(3)</sup>  Following the Red Army's victory in defending their iconic city, named after their dictator, they launched a counter offensive to the west with newfound confidence.<sup>(4)</sup> Meanwhile, the other Allied Powers were advancing up the boot of Italy and preparing for a large-scale invasion of France.  A year later the Americans, British, and Canadians did just that when they stormed the beaches of Normandy on D-Day, completely changing the tide of war, and combat in Europe spiked for 11 months as the Allies pushed the Nazis towards their inevitable surrender.  The map below represents the locations of Allied aerial attacks over the course of the war, implying the path the Allies took (light to dark) through France and Southern Italy as they closed in on the heart of Nazi territory. 





![plot of chunk unnamed-chunk-3](/assets/images/2020-04-01-ww2-strategy/image3-timeline.PNG)

![plot of chunk unnamed-chunk-4](/assets/images/2020-04-01-ww2-strategy/image4-timeline_map.PNG)




Having seen where and when the aerial missions took place, we'll next look at which types of aircraft were leading these missions.  Among the U.S. Air Force, the B-24 Liberator Bomber was the most used aircraft throughout the war.  The bomber generally carried 8-10 men, including two pilots, several gunners, and an imperative, highly skilled bombardier responsible for hitting the precise target while accounting for aircraft speed, altitude, wind speed, air density, weather conditions, and bomb ballistics.<sup>(5)</sup>  At roughly 200 mph and up to 25,000 feet in the air, often only the lead aircraft in a group required a bombardier while the others would follow suit.<sup>(6)</sup>



The second most common type of aircraft was the fighter jet, and among those the A-20 Havoc led the most missions.  A much smaller, faster, and more agile plane than the bomber, the fighter jets were used for aerial combat, often shooting down the enemy and protecting their own bombers.<sup>(7)</sup>






![plot of chunk unnamed-chunk-5](/assets/images/2020-04-01-ww2-strategy/image5-aircrafts.png)


![plot of chunk unnamed-chunk-6](/assets/images/2020-04-01-ww2-strategy/image6-aircraft_barchart.png)


![plot of chunk unnamed-chunk-7](/assets/images/2020-04-01-ww2-strategy/image7_aircraft_timeline.png)






For the Americans and their Allies, the war could not have been won without the continuous improvement of science and technology.  In the case of aerial bombing, the force of explosive bombs that were being rained on Europe and the Pacific was rapidly increasing until the war began to die down late in 1944.  By the peak of the war, a typical bomb had a force akin to 20 tons of TNT, more than 5 times the force of what was being dropped by US bombers at the beginning of the war.   By comparison, the atomic bombs, named Little Boy and Fat Man, that USA dropped over the Japanese cities of Hiroshima and Nagasaki respectively, had TNT equivalents of 15 *thousand* and 20 *thousand* tons. 


![plot of chunk unnamed-chunk-8](/assets/images/2020-04-01-ww2-strategy/image8_explosives_barchart.png)





There were four main categories of explosives used by the Americans, most commonly a *General Purpose Bomb*.  The chart below is a sample of several hundred bombs that the U.S. Air Force dropped, mapping the bombs to the type of target that they hit.  




![plot of chunk unnamed-chunk-9](/assets/images/2020-04-01-ww2-strategy/image9_explosive_targets.png)





We can further understand the Allies' brilliant chess-like strategy by plotting the mission targets on a map.  For example, the Nazi's placed several gun emplacements along the most heavily fortified section of the western coast of Europe in Northern France.  Once the Allies broke through Hitler's coastal fortress on D-Day, June 6, 1944, they heavily bombed highways, bridges and river crossings to make it difficult for the Nazis to send additional support.  Moreover, much of the genius of General Eisenhower's D-Day Operation Overlord came from the deception that the Allies played on Hitler and the Nazis, who were sure that the Allies intended to break into Northwest Europe through Pas de Calais, the point in Northern France nearest to Great Britain.  Toying with the Nazi's imagination, the Allies stationed an army under high profile American General George Patton on the British side of the English Channel and sent recurrent decoy missions to Calais before and after June 6th.  False intelligence sent to Nazi high command 'confirmed' their phantom beliefs, and by the time the Nazis fully understood that the bloody Normandy landings were not a diversion, hundreds of thousands of Allied soldiers had landed in France and were well on their way to liberating Paris.<sup>(8)</sup>





![plot of chunk unnamed-chunk-10](/assets/images/2020-04-01-ww2-strategy/image10_target_map.png)




In the south of Europe, Italy endured as severe an aerial assault as any other country, especially in their northern territory which was under Nazi occupation after the Italians surrendered to the Allies and arrested their Fascist dictator, Benito Mussolini.<sup>(9)</sup> With the help of the Italian partisans waging a guerilla resistance, a key objective for the Allies was to dismantle Nazi transportation since they relied on railroads, highways, and bridges to ship food and supplies stolen from the Italians back to their homeland.  Most of these goods were shipped by railway through the German-annexed Austrian territory, accounting for the plethora of green there on the map above. 



As this analysis goes to show, many key events in World War II can be better understood by supplementing the accounts of surviviors and historians with data.  Although this data has flaws and is specific to aerial missions, it's a reflection of the combat that unfolded from all branches of all armed forces that fought in the war.  If you're as interested in World War II as I am and would like to learn more, I've included below several related articles, books, and movies that I found enjoyable.  If you would like to share your thoughts or suggestions, reach out to me at <abmalter12@gmail.com>.



**Web Sources:**


1. [Why Did Japan Attack Pearl Harbor?](https://www.history.com/news/why-did-japan-attack-pearl-harbor){:target="_blank"}

2. [Bataan Death March](https://www.history.com/topics/world-war-ii/bataan-death-march){:target="_blank"}

3. [Battle of Stalingrad](https://www.history.com/topics/world-war-ii/battle-of-stalingrad){:target="_blank"}

4. [Eastern European Front ](https://www.nationalww2museum.org/war/articles/eastern-front){:target="_blank"}

5. [B-24 Liberator](http://freepages.rootsweb.com/~webermd1/family/Liberator-Info.html){:target="_blank"}

6. [Aircraft Details](https://www.militaryfactory.com/aircraft/detail.asp?aircraft_id=80){:target="_blank"}

7. [Daylight Precision Bombing](https://www.airforcemag.com/article/1008daylight/){:target="_blank"}

8. [The Elaborate Ruse Behind D-Day](https://www.history.com/news/fooling-hitler-the-elaborate-ruse-behind-d-day){:target="_blank"}

9. [Italy Declares Way on Germany](https://www.history.com/this-day-in-history/italy-declares-war-on-germany){:target="_blank"}


**Books:**

*	Beneath a Scarlett Sky - Mark Sullivan

*	Unbroken - Laura Hillenbrand

*	We Were the Lucky Ones - Georgia Hunter

*	City of Thieves - David Benioff

*	The Nightingale - Kristen Hannah

*	The Tattooist of Auschwitz - Heather Morris

*	Operation Garbo: The Personal Story of the Most Successful Spy of World War II - Juan Pujol Garcia


**Movies/Documentaries:**

* Band of Brothers

* Saving Private Ryan

*	Inglorious Bastards

*	Unbroken

*	World War II in Colour - Netflix

*	Schindler's List

*	Dunkirk

*	Patton

*	The Pianist 
