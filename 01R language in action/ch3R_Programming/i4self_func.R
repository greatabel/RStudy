library(jpeg)

imgshow <- function(file) {
    img = readJPEG(file)
    plot(
         c(0, dim(img)[1]),
         c(0, dim(img)[1]),
         type = "n",
         xlab = "",
         ylab = ""
        )
    rasterImage(img, 0, 0, dim(img)[1], dim(img)[1])
}

imgshow("./Z.jpg")