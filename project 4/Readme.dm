# Project 4
## Introduction 

With the created database, the startup Sparkify is able to understand the user behavior in regards to what Artists they listen to and at what times. This Data could then be used to further recommend music other users listen to, who also listen to the same artist. This solution is very scalable, as the different files are stored on a "simple" s3 bucket as parquet files. These files are extremely efficient storage wise. 


## Database schema design and ETL process
The songfile is read and it is turned into a pyspark DataFrame with then splitting the columns into the different tables: artists and songs which are visible in the following two pictures. 
![Songs_table](https://github.com/duskaan/DEUdacity/blob/master/songsTable.PNG)

![artist table](https://github.com/duskaan/DEUdacity/blob/master/artistTable.PNG)

The event data is read and filtered on the next song as a page. The user data is then inserted into the below user table. To ensure that there is no duplicates, the primaryKey is unique. It is made sure that there is no errors in the Insert query with removing all userId=0.  

![Users table](https://github.com/duskaan/DEUdacity/blob/master/userTable.PNG)

The time from the event is in miliseconds and needs to be transformed into a table in a readable format. Additionally, in order to do analysis on this data, it is further transformed into the hours, day, weeks and other relevant metrics. For this an user defined function (udf) is utilized. 

![time table](https://github.com/duskaan/DEUdacity/blob/master/timeTable.PNG)

Lastly the event itself is combining the song file to the specific event. For this, the song id and artist id are matched to the event files. 

The final database schema design can be seen in the Entity relation Diagram below
![song_ERD](https://udacity-reviews-uploads.s3.us-west-2.amazonaws.com/_attachments/339318/1586016120/Song_ERD.png)

The database has been designed with the songplays as the fact table and the other tables mainly as dimensions. As there is multiple levels of relationships across the dimensions, it is a Snowflake schema design. This is very efficient for analysis of data. This data is then ran on a spark session in order to provide distributed computing and data to be transformed directly in memory. Spark reads the required data into memory, but does this lazily (like the underlying RDDs), which means that they first load it as soon as there is an actual action and not just a function. 

The data is read from the different json files in order to combine the two data sources and unify them in the fact table songplays.

## Files in repository

![song file](https://github.com/duskaan/DEUdacity/blob/master/Screenshot7.PNG)
![event](https://github.com/duskaan/DEUdacity/blob/master/Screenshot8.PNG)

The initial song data and event data are both in json format. The attributes can be seen in the screenshot above.  


## How to run the python scripts

In order to execute the file, an EMR cluster is created with a Spark setup. It then is connected to with SHH through Putty with the private key. After this the etl.py file can be uploaded through filezilla, which is connected to the cluster through SSH as well. and lastly, through putty the file is executed as a spark job with Spark-submit.









