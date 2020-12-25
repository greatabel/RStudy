

'''
month  size      count
4    21.7m     237994

average 10967 records/m

1~6 month of 2020, we pick:
10967 * 593 * 0.05 = 325171 
10967 * 584          320236
10967 * 278          152441
10967 * 21            11515
10967 * 31            16999
10967 * 50            27417

use bash as:
shuf -n 325171 yellow_tripdata_2020-01.csv > sample_yellow_tripdata_2020-01.csv
shuf -n 320236 yellow_tripdata_2020-02.csv > sample_yellow_tripdata_2020-02.csv
shuf -n 152441 yellow_tripdata_2020-03.csv > sample_yellow_tripdata_2020-03.csv
shuf -n 11515  yellow_tripdata_2020-04.csv > sample_yellow_tripdata_2020-04.csv
shuf -n 16999  yellow_tripdata_2020-05.csv > sample_yellow_tripdata_2020-05.csv
shuf -n 27417  yellow_tripdata_2020-06.csv > sample_yellow_tripdata_2020-06.csv


'''



