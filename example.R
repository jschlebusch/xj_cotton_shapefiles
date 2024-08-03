library(sf)
library(ggplot2)
library(ggspatial)
library(ggthemes)
library(tidyverse)
library(mapchina)


target_crs <- st_crs(4326)

df_china_sf <- china%>%
  filter(Name_Province=="新疆维吾尔自治区")%>%
  mutate(Status = as.factor("Status"))%>%
  rename(Code_Prefecture=Code_Perfecture)

xinjiang_boundaries <- st_transform(df_china_sf, crs = target_crs)

cotton_sf <- read_sf("xj_cotton_shapefiles/xj_cotton.shp")

st_crs(xinjiang_boundaries)
st_crs(cotton_sf)

overlaps <- st_intersects(df_china_sf, cotton_sf, sparse = FALSE)

df_china_sf$overlap_dummy <- apply(overlaps, 1, function(x) ifelse(any(x), 1, 0))

plot <- ggplot() +
  geom_sf(data = df_china_sf, aes(fill = as.factor(overlap_dummy)), color = "black") +
  geom_sf(data = cotton_sf, fill = "darkgreen", color = "darkgreen",
          alpha = 0.8) +
  scale_fill_manual(values = c("0" = "lightgray", "1" = "darkgray"), guide = FALSE) +
  labs(
    title = "Cotton fields in cotton producing counties in Xinjiang"
  ) +
  theme(legend.position = "bottom") +
  theme_void()

ggsave("plot.png", plot = plot, width = 10, height = 8)
