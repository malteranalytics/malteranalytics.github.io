---
layout: post
title:  "NFL 2024 Forecast Model"
author: drew
categories: [ NFL, football ]
image: "https://malteranalytics.github.io/assets/images/2024-09-03-nfl-odds-2024/image5.png"
tags: [nfl, sports, football, odds]
featured: true
---

Updated Tuesday mornings following the conclusion of each NFL week.


***Forecast Entering Week 4***


![plot 2](/assets/images/2024-09-03-nfl-odds-2024/image5.png) 



***Forecast Entering Week 3***


![plot 2](/assets/images/2024-09-03-nfl-odds-2024/image4.png) 



***Forecast Entering Week 2***


![plot 2](/assets/images/2024-09-03-nfl-odds-2024/image3.png) 




***Forecast Entering Week 1***


![plot 2](/assets/images/2024-09-03-nfl-odds-2024/image2.png) 





**Methodology** - The probabilities are determined from the results of running 1 million simulations of the 2024 season.  Inputs into the simulation are derived from up-to-date Vegas odds, team schedules, historic and current NFL data, and the NFL playoff format. For each team, our model calculates expectations and a variance factor (the likelihood that they sway up or down from expectations).  We then let the simulation run, and odds are generated as the number of occurrences for each team divided by 1 million (total simulation runs).  We leverage the following Python open source libraries: numpy, scipy.stats, skewnorm, random, nfl_data_py.  Following each week, the full simulation runs for refreshed odds.  

For questions, comments, suggestions, or access to the data, please reach out to Drew or Danny.
