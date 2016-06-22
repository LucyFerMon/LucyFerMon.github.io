# The packages we will use today
# (use install.packages('raster') if you don't have it yet)
library(raster)

# Read in fake census data
# (you will need to change the path to wherever you 
# saved the file)
census <- read.csv('census.csv')

# Get a map of mozambique and call it moz
moz <- getData('GADM', country = 'MOZ', level = 3)

################################
# 1. How many people (rows) are in census
################################


################################
# 2. How many columns are there in census?
################################


################################
# 3. What are the names of the columns in census?
################################

################################
# 4. What is the average household head age in census?
################################

################################
# 5. What is the youngest household head age in census?
################################

################################
# 6. Make a histogram of household head age
################################

################################
# 7. How many household heads are female and male?
################################

################################
# 8. Create a table called sex_table with the number of 
#    females and males
################################

################################
# 9. Create a barplot of the table of males and females.
#    Give it a title and color
################################

################################
# 10. Create a histogram of the number of chickens per house.
################################

################################
# 11. What are the names of the geographic coordinates in census?
################################

################################
# 12. Plot the geographic coordinates in census
################################



################################
# 13. Plot the object called "moz"
################################



################################
# 14. Create an object called mag, 
#     which will just be the Magude district
################################



################################
# 15. Plot moz, and then plot mag on top of it.
################################



################################
# 16. Just plot mag
################################



################################
# 17. Use the "points" function to add the coordinates
#     from the census to mag. Make them an interesting color
################################


################################
# 18. Create a column called proportion_children
################################


################################
# 19. Plot mag again. This time make the color grey
#     and the borders white
################################



################################
# 20. Add points in which the size (cex) reflects
#     the proportion_children
################################



################################
# 21. Create an object of only those houses
#     where the head of house is female. Call it females.
################################



################################
# 22. Create an object of only those houses
#     where the head of house is male. Call it males.
################################



################################
# 23. Plot mag and then add points for both
#     females (one color) and males (a different color).
#     Make the size (cex) reflect the proportion_children
################################



################################
# 24. Add a title
################################

################################
# 25. Add a legend
################################

