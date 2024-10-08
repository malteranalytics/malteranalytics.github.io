library(ggplot2)
library(dplyr)
library(tidyr)
library(ggthemes)
library(reshape2)
library(sf)
library(data.table)
library(ggsn) # for scale bar `scalebar`
library(ggrepel) # if need to repel labels 
library(ggplot2)


df <- read.csv('~/Documents/Personal/MLB/data/league_playoffs.csv')


#drop nfl pre 1970
df <- df %>%
  filter(league != 'nfl' | year >= 1970)


#drop nba pre 1978
df <- df %>%
  filter(league != 'nba' | year >= 1978)

#drop mlb 7 and 8 seed series from 2020
df <- df %>%
  filter(league != 'mlb' | seed_a != 7 | seed_b != 7 | seed_a != 8 | seed_b != 8)


head(df)




#win championship
df %>%
  drop_na() %>%
  filter(is_champ == 1) %>%
  group_by(league) %>%
  summarise('championships' = sum(is_champ)
            ,'8 seed'=mean(X8_seed), '7 seed'=mean(X7_seed),
            '6 seed'=mean(X6_seed), '5 seed'=mean(X5_seed),
            '4 seed'=mean(X4_seed), '3 seed'=mean(X3_seed),
            '2 seed'=mean(X2_seed), '1 seed'=mean(X1_seed)) %>%
  gather(series_winner, championships, c('8 seed':'7 seed':'6 seed':'5 seed':'4 seed':'3 seed':'2 seed':'1 seed')) %>%
  mutate(series_winner = factor(series_winner, levels = (c('8 seed', '7 seed', '6 seed', '5 seed', '4 seed', '3 seed', '2 seed', '1 seed')))) %>%
  ggplot(aes(x=reorder(league, league), y=championships)) + 
  geom_bar(aes(fill=series_winner), stat="identity") +
  scale_fill_manual(values = c('red3', 'orange2', 'yellow2', 'chartreuse', 'green4', 'turquoise3', 'dodgerblue2', 'dodgerblue4')) +
  labs(title="Frequency of Playoff Seeds Winning Championships", x="League", y = "% of Championships", fill = 'Playoff Seed')  +
  theme(legend.position="right",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5)) +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25),
        legend.text = element_text(size = 30),
        legend.title = element_text(size = 35),
        legend.key=element_rect(fill="white", colour="white")) +
  theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 25, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "black"),
        plot.background = element_rect(fill = "#f0f0f0")) +
  scale_x_discrete(labels=c("MLB", "MLS", "NBA", "NFL", "NHL", "NWSL", "WNBA")) +
  scale_y_continuous(labels = scales::percent_format(), breaks = seq(0, 1, by = 0.25))






#make championship
df %>%
  drop_na() %>%
  filter(is_semifinal == 1) %>%
  group_by(league) %>%
  summarise('make_champ' = sum(is_semifinal)
            ,'8 seed'=2*mean(X8_seed), '7 seed'=2*mean(X7_seed),
            '6 seed'=2*mean(X6_seed), '5 seed'=2*mean(X5_seed),
            '4 seed'=2*mean(X4_seed), '3 seed'=2*mean(X3_seed),
            '2 seed'=2*mean(X2_seed), '1 seed'=2*mean(X1_seed)) %>%
  gather(series_winner, make_champ, c('8 seed':'7 seed':'6 seed':'5 seed':'4 seed':'3 seed':'2 seed':'1 seed')) %>%
  mutate(series_winner = factor(series_winner, levels = (c('8 seed', '7 seed', '6 seed', '5 seed', '4 seed', '3 seed', '2 seed', '1 seed')))) %>%
  ggplot(aes(x=reorder(league, league), y=make_champ)) + 
  geom_bar(aes(fill=series_winner), stat="identity") +
  scale_fill_manual(values = c('red3', 'orange2', 'yellow2', 'chartreuse', 'green4', 'turquoise3', 'dodgerblue2', 'dodgerblue4')) +
  labs(title="Frequency of Playoff Seeds Making Championship", x="League", y = "% Make Championship", fill = 'Playoff Seed')  +
  theme(legend.position="right",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5)) +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25),
        legend.text = element_text(size = 30),
        legend.title = element_text(size = 35),
        legend.key=element_rect(fill="white", colour="white")) +
  theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 25, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "black"),
        plot.background = element_rect(fill = "#f0f0f0")) +
  scale_x_discrete(labels=c("MLB", "MLS", "NBA", "NFL", "NHL", "NWSL", "WNBA")) +
  scale_y_continuous(labels = scales::percent_format(), breaks = seq(0, 2, by = 0.5))















#underdog seed wins
df %>%
  drop_na() %>%
  filter(seed_a != seed_b) %>%
  #filter(is_semifinal == 1) %>%
  group_by(league) %>%
  summarise('underdog' = 1 - mean(higher_seed_win)) %>%
  ggplot(aes(x=reorder(league, league), y=underdog)) + 
  geom_bar(stat = "identity", fill = "dodgerblue2") + 
  labs(title="Frequency of Underdog Seed Winning Series", x="League", y = "% Lower Seed Wins")  +
  theme(
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5)) +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
     #   legend.text = element_text(size = 30),
    #    legend.title = element_text(size = 35),
    #    legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 25, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
       # legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "black"),
        plot.background = element_rect(fill = "#f0f0f0")) +
  scale_x_discrete(labels=c("MLB", "MLS", "NBA", "NFL", "NHL", "NWSL", "WNBA")) +
  scale_y_continuous(labels = scales::percent_format(), breaks = seq(0, .6, by = 0.05))




#underdog seed wins championship
df %>%
  drop_na() %>%
  filter(seed_a != seed_b) %>%
  filter(is_champ == 1) %>%
  group_by(league) %>%
  summarise('underdog' = 1 - mean(higher_seed_win)) %>%
  ggplot(aes(x=reorder(league, league), y=underdog)) + 
  geom_bar(stat = "identity", fill = "dodgerblue2") + 
  labs(title="Frequency of Underdog Seed Winning Champ Series", x="League", y = "% Lower Seed Wins")  +
  theme(
    axis.text.x=element_text(angle=45, hjust=1),
    plot.title=element_text(hjust=0.5)) +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  #   legend.text = element_text(size = 30),
  #    legend.title = element_text(size = 35),
  #    legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 25, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        # legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "black"),
        plot.background = element_rect(fill = "#f0f0f0")) +
  scale_x_discrete(labels=c("MLB", "MLS", "NBA", "NFL", "NHL", "NWSL", "WNBA")) +
  scale_y_continuous(labels = scales::percent_format(), breaks = seq(0, .7, by = 0.1))




df_heat <- df %>%
 # filter(seed_a != seed_b) %>%
  mutate(min_a = pmin(seed_a, seed_b),  # Get the minimum of a and b
         max_b = pmax(seed_a, seed_b))  # Get the maximum of a and b



#Make heat maps fro each league
# Count the total matchups between each pair of a and b
total_matchups <- df_heat %>%
  group_by(league, min_a, max_b) %>%
  summarise(total = n())

# Count the number of wins for `b` in each matchup
b_wins <- df_heat %>%
  filter(series_winner == max_b) %>%
  group_by(league, min_a, max_b) %>%
  summarise(b_wins = n())

# Merge the total matchups and b_wins data
win_percentages <- total_matchups %>%
  left_join(b_wins, by = c("league", "min_a", "max_b")) %>%
  mutate(b_wins = ifelse(is.na(b_wins), 0, b_wins), # Handle cases where b never wins
         ,b_win_percentage = b_wins / total
         ,a_win_percentage = 1 - b_win_percentage
         ,a_win_percentage = ifelse(min_a == max_b, .50, a_win_percentage)
         ,b_win_percentage = ifelse(min_a == max_b, .50, b_win_percentage))

# Pivot the data to create a matrix suitable for a heatmap
win_matrix <- win_percentages %>%
  select(league, min_a, max_b, a_win_percentage) %>%
  pivot_wider(names_from = max_b, values_from = a_win_percentage)



##MLB

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:6)
win_percentages %>%
  filter(league == 'mlb') %>%
ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "MLB Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (1995-2023)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
       # legend.text = element_text(size = 30),
        #legend.title = element_text(size = 35),
        #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:6)
win_percentages %>%
  filter(league == 'mlb') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "MLB Playoff Series Occurances", subtitle = "Total Series Played (1995-2023)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()




















##NFL

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:7)
win_percentages %>%
  filter(league == 'nfl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NFL Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (1970-2023)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:7)
win_percentages %>%
  filter(league == 'nfl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NFL Playoff Series Occurances", subtitle = "Total Series Played (1970-2023)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()
















##NBA

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'nba') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NBA Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (1978-2024)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'nba') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NBA Playoff Series Occurances", subtitle = "Total Series Played (1978-2024)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()











##WNBA

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'wnba') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "WNBA Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (2000-2023)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'wnba') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "WNBA Playoff Series Occurances", subtitle = "Total Series Played (2000-2023)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()















##NHL

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'nhl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NHL Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (1994-2024)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'nhl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NHL Playoff Series Occurances", subtitle = "Total Series Played (1994-2024)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()













##NHL

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'nhl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NHL Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (1994-2024)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'nhl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NHL Playoff Series Occurances", subtitle = "Total Series Played (1994-2024)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()





















##MLS

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'mls') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "MLS Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (1996-2024)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 30, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:8)
win_percentages %>%
  filter(league == 'mls') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "MLS Playoff Series Occurances", subtitle = "Total Series Played (1996-2024)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()




















##NWSL

# Plot the heatmap of win percentage
# Define the range of seed values
seed_values <- as.factor(1:6)
win_percentages %>%
  filter(league == 'nwsl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = a_win_percentage)) +
  geom_tile() +
  geom_text(aes(label = paste0(100*round(a_win_percentage, 2), "%")), color = "black", size = 6) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NWSL Playoff Series Outcomes", subtitle = '% of Outcomes Higher Seed Wins Series (2013-2023)',
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 30),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


# Plot the heatmap of total series
# Define the range of seed values
seed_values <- as.factor(1:6)
win_percentages %>%
  filter(league == 'nwsl') %>%
  ggplot(aes(x = factor(min_a), y = factor(max_b), fill = total)) +
  geom_tile() +
  geom_text(aes(label = paste0(total)), color = "black", size = 7) +  # Add text labels
  scale_fill_gradient(low = "skyblue", high = "dodgerblue3", na.value = "gray") +
  labs(title = "NWSL Playoff Series Occurances", subtitle = "Total Series Played (2013-2023)",
       x = "Higher Seed", y = "Lower Seed", fill = "Win %") +
  theme(legend.position="none",
        axis.text.x=element_text(angle=45, hjust=1),
        plot.title=element_text(hjust=0.5),
        plot.subtitle=element_text(hjust=0.5, size = 18)) +
  scale_x_discrete(limits = seed_values) +  # Set x-axis limits
  scale_y_discrete(limits = seed_values) +  # Set y-axis limits
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 25, hjust = 0.5, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 25),
        axis.text.y=element_text(colour="black", size = 25)) +
  # legend.text = element_text(size = 30),
  #legend.title = element_text(size = 35),
  #legend.key=element_rect(fill="white", colour="white")) +
  #theme(legend.position="right") +
  theme(axis.text.x=element_text(size = 20, angle=55, hjust=1),
        plot.title=element_text(size = 29, hjust=0.5),
        axis.title.x = element_text(size = 29),
        axis.title.y = element_text(size = 25),
        panel.background = element_rect(fill = "#f0f0f0"),
        #legend.background = element_rect(fill = "#f0f0f0"),
        panel.grid.major.y = element_line(colour = "#f0f0f0"),
        panel.grid.major.x = element_line(colour = "#f0f0f0"),
        plot.background = element_rect(fill = "#f0f0f0"))  +
  coord_fixed()


