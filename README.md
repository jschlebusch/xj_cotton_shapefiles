# xj_cotton_shapefiles

China is one of the largest producers of cotton in the world. Whereas production was historically concentrated in the provinces of the central and northern plains, in recent decades, production shifted to Xinjiang. [^1]

Remote sensing applications allow to map cotton production with high accuracy. Imagery of high resolution is available now. However, while processing fine-grained raster data is computationally demanding and potentially challenging, the detailed mapping is not always required for social science purposes.

Based on the XJ_COTTON_10 data set,[^2] which provides a set of thirty TIFF files for the years covered, a set of shapefiles, representing the approximated cotton production area as of 2018 is created. Raster data was processed in QGIS, the thirty files associated with the year 2018 were merged into one raster layer which was subsequently vectorised. The multipolygons were manually corrected. 
As cotton production location changes only slowly, this can serve as an approximation of the cotton production area in the Xinjiang Uyghur Autonomous region. Using the `sf` package, the files can easily be processed in e.g., R/RStudio. When visualised, it shows that there are basically two cotton production belts. As such, it can be determined whether a place or a geo-referenced event - intances for which the exact extent and demarcation is of less relevance than the approximate location within an area shaped by cotton production - is located within the cotton producing area.

It is to be noted that CRS congruence is to be ensure before using (crs = WGS84/ EPSG:4326).





[^1]: Yang, Z.; Tang, J.; Yu, X. Xinjiang Cotton Industry Present Situation and Countermeasure Research. Res. Agric. Mod. 2013, 34, 298–302. 

[^2]: Kang, X. et al. (2023). The 10-m cotton maps in Xinjiang, China during 2018–2021. Scientific Data, 10(1), 688.

