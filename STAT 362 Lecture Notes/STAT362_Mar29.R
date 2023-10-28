###############################
# 17: Hierarchical Clustering #
###############################

library(ISLR2)

set.seed(2)
X = matrix(rnorm(5 * 2), nrow = 50, ncol = 2)

# some mean shift for the first 25 observations
X[1:25, ] <- X[1:25, ] + 3 

dist(X)

hc_complete <- hclust(dist(X), method = "complete")

plot(hc_complete, main = "Complete Linkage", xlab ="", sub = "", cex = 0.6)


# Example for hierarchical clustering
nci_data <- NCI60$data
nci_labs <- NCI60$labs

# Cancer types for the cell lines:
table(nci_labs)

# Scale the data
nci_data_scale <- scale(nci_data)

# Dendrogram
hc_complete <- hclust(dist(nci_data_scale), method = "complete")
plot(hc_complete, labels = nci_labs, xlab = "", sub = "", ylab = "", cex = 0.6)

# Cell lines within a single cancer type do tend 
# to cluster together.

# Cut the dendrogram to obtain, say, 4 clusters 
# and compare with the true cancer types:
hc_cluster <- cutree(hc_complete, k = 4)
table(hc_cluster, nci_labs)

#Some patterns:
# All the leukemia cell lines fall in cluster 3
# Breast cancer cell lines are spread out over 3 different clusters

# Comparing with k-means:
set.seed(1)
km_cluster <- kmeans(nci_data_scale, 4, nstart = 50)$cluster
table(km_cluster, hc_cluster)
