# install liburary
# install.packages(c("tm", "SnowballC"), repos='http://cran.us.r-project.org')
# install.packages(c("cluster", "factoextra"), repos='http://cran.us.r-project.org')
# install.packages("fpc", repos='http://cran.us.r-project.org')
# install.packages("igraph", repos='http://cran.us.r-project.org')

library(tm)
library(SnowballC)
library(fpc)
library(igraph)

print('------------- step 3 -------- ')

# define corpus
corpusSource <- DirSource(directory = "docs")


corpus <- Corpus(corpusSource)


corpus <- tm_map(corpus, content_transformer(tolower)) 
corpus <- tm_map(corpus, removeNumbers) 
corpus <- tm_map(corpus, removePunctuation) 
corpus <- tm_map(corpus, removeWords, stopwords("english")) 
corpus <- tm_map(corpus, stripWhitespace) 
corpus <- tm_map(corpus, stemDocument) 


dtm <- DocumentTermMatrix(corpus)


dtm <- removeSparseTerms(dtm, 0.6)


freq_terms <- findFreqTerms(dtm, lowfreq = 2)


print(freq_terms)

# show DTM
inspect(dtm[1:15, 1:15])



print('------------- step 4 -------- ')

library(cluster)
library(factoextra)


dtm_matrix <- as.matrix(dtm)


dist_matrix <- dist(dtm_matrix, method = "euclidean")


hc <- hclust(dist_matrix)

# tree graph
fviz_dend(hc, show_labels = TRUE, cex = 0.5)

ggsave("i4dendrogram.png")



cluster_stats <- cluster.stats(dist_matrix, cutree(hc, k = 7))


print('cluster_stats')
print(cluster_stats$avg.silwidth)

# The value of the silhouette coefficient is 0.1295736. 
# By definition of the silhouette coefficient, this means that the clusters are of low quality 
# and the separation between samples is relatively low.

# To correctly interpret the value of the silhouette coefficient, 
# it needs to be compared with other clustering results. 
# A higher silhouette coefficient usually indicates better clustering results, 
# but the specific threshold depends on the characteristics of the dataset and the goal of the clustering


print('------------- step 5 -------- ')

# Create Term-Document Matrix
tdm = t(dtm)

# Convert the term-document matrix to a regular matrix
tdm_matrix = as.matrix(tdm)

# Compute cross products of the term-document matrix
crossprod_matrix = crossprod(tdm_matrix)

# Load the igraph library
library(igraph)

# Create the graph
g = graph_from_adjacency_matrix(crossprod_matrix, mode = "undirected", weighted = TRUE, diag = FALSE)

# Save the first plot
png("i5graph.png")
plot(g)
dev.off()

# Identify communities
communities = cluster_louvain(g)

# Save the second plot
png("i5communities.png")
plot(communities, g)
dev.off()

# Calculate centrality measures to identify the most central nodes
degree = degree(g)

# Improve the graph

## Assign colors to nodes based on their community membership
V(g)$color = communities$membership

## Assign size to nodes based on their degree centrality
V(g)$size = degree

## Assign width to edges based on the number of shared terms
E(g)$width = E(g)$weight

## Create a layout for the graph
layout = layout_with_fr(g)

# Save the improved plot
png("i5improved_graph.png")
plot(g, layout = layout)
dev.off()




print('------------- step 6 -------- ')
# Convert Document-Term Matrix to a regular matrix
dtm_matrix = as.matrix(dtm)

# Compute cross products of the document-term matrix to get word co-occurrences
crossprod_matrix = crossprod(dtm_matrix)

# Load the igraph library
if (!require("igraph")) install.packages("igraph")
library(igraph)

# Create the graph from adjacency matrix
g = graph_from_adjacency_matrix(crossprod_matrix, mode = "undirected", weighted = TRUE, diag = FALSE)

# Save the first plot
png("i6graph.png")
plot(g)
dev.off()

# Identify communities
communities = cluster_louvain(g)

# Save the second plot
png("i6communities.png")
plot(communities, g)
dev.off()

# Calculate centrality measures to identify the most central nodes
degree = degree(g)

# Improve the graph

## Assign colors to nodes based on their community membership
V(g)$color = communities$membership

## Assign size to nodes based on their degree centrality
V(g)$size = degree

## Assign width to edges based on the number of shared terms
E(g)$width = E(g)$weight

## Create a layout for the graph
layout = layout_with_fr(g)

# Save the improved plot
png("i6improved_graph.png")
plot(g, layout = layout)
dev.off()



print('------------- step 7 -------- ')


# Convert the dtm to a matrix
dtm_matrix <- as.matrix(dtm)

# Print the dimensions of dtm_matrix
print(dim(dtm_matrix))

# Print the sum of all elements in dtm_matrix
print(sum(dtm_matrix))


# Find the nonzero elements (word-document pairs)
doc_word_pairs <- which(dtm_matrix != 0, arr.ind = TRUE)

# Print doc_word_pairs
# print(doc_word_pairs)


# Get the document and word names
documents <- rownames(dtm_matrix)[doc_word_pairs[, "Docs"]]
words <- colnames(dtm_matrix)[doc_word_pairs[, "Terms"]]

# Create the bipartite graph
g <- graph_from_data_frame(data.frame(documents, words), directed = FALSE)

# Assign the 'type' attribute for each node
V(g)$type <- bipartite_mapping(g)$type

# Plot the bipartite graph
png("i7bipartite_graph.png")
plot(g)
dev.off()

# Identifying communities
communities <- cluster_louvain(g)

# Save the communities plot
png("i7bipartite_communities.png")
plot(communities, g)
dev.off()

# Calculate centrality measures
degree <- degree(g)

# Improve the graph

## Assign colors to nodes based on their community membership
V(g)$color <- communities$membership

## Assign size to nodes based on their degree centrality
V(g)$size <- degree

## Create a layout for the graph
layout <- layout_as_bipartite(g)

# Save the improved plot
png("i7bipartite_improved_graph.png")
plot(g, layout = layout)
dev.off()







