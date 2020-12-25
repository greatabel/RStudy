library(rhdfs)
hdfs.init()
library(rmr2)

getwd()
# HDFS 
hdfs.mkdir("/data/taxi/taxi2020")
hdfs.ls("/data/taxi/taxi2020")

hdfs.put("/home/u20173208/tmp/info.csv",
         "/data/taxi/taxi2020/info.csv")

hdfs.put("/home/u20173208/tmp/sample_yellow_tripdata_2020-01.csv",
         "/data/taxi/taxi2020/sample_yellow_tripdata_2020-01.csv")
hdfs.put("/home/u20173208/tmp/sample_yellow_tripdata_2020-02.csv",
         "/data/taxi/taxi2020/sample_yellow_tripdata_2020-02.csv")
hdfs.put("/home/u20173208/tmp/sample_yellow_tripdata_2020-03.csv",
         "/data/taxi/taxi2020/sample_yellow_tripdata_2020-03.csv")
hdfs.put("/home/u20173208/tmp/sample_yellow_tripdata_2020-04.csv",
         "/data/taxi/taxi2020/sample_yellow_tripdata_2020-04.csv")
hdfs.put("/home/u20173208/tmp/sample_yellow_tripdata_2020-05.csv",
         "/data/taxi/taxi2020/sample_yellow_tripdata_2020-05.csv")
hdfs.put("/home/u20173208/tmp/sample_yellow_tripdata_2020-06.csv",
         "/data/taxi/taxi2020/sample_yellow_tripdata_2020-06.csv")
