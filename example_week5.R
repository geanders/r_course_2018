library(faraway)
library(dplyr)
library(ggplot2)
library(lubridate)
library(RColorBrewer)
library(viridis)
data("worldcup")

pdf("figures/WorldCup.pdf", width = 8, height = 6)
ggplot(worldcup, aes(x = Time, y = Passes,
                     color = Passes)) + 
  geom_point(alpha = 0.5) + 
  scale_x_continuous(name = "Time played\n(minutes)",
                     breaks = 2 * 90 * 1:3,
                     minor_breaks = 90 * c(1, 3, 5)) +
  scale_color_viridis(option = "B")
ggplot(worldcup, aes(x = Time, y = Passes,
                     color = Position)) + 
  geom_point(alpha = 0.5) + 
  scale_x_continuous(name = "Time played\n(minutes)",
                     breaks = 2 * 90 * 1:3,
                     minor_breaks = 90 * c(1, 3, 5)) +
  scale_color_viridis(option = "B", discrete = TRUE)
dev.off()

library(dlnm)
data("chicagoNMMAPS")
chic_july <- chicagoNMMAPS %>% 
  tbl_df() %>% 
  mutate(date = ymd(date)) %>% 
  filter(year(date) == "1995" & 
           month(date) == "7")




