# The following code creates a scatterplot of 'votes' and 'rating' from the
# movies dataset in the ggplot2 package. After loading the ggplot2 package with
# the library() function, I can run

qplot(votes, rating, data = movies)

# How can I modify the the code above to add a smoother to the scatterplot?

qplot(votes, rating, data = movies) + geom_smooth()
