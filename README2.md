#DEUdacity

![song file](https://github.com/duskaan/DEUdacity/blob/master/Screenshot7.PNG)



The initial song data is in the json format and as above. The songfile is then read and it is turned into a panda DataFrame with then splitting the columns into the different tables: artists and songs which are visible in the following two pictures. 
![Songs_table](https://github.com/duskaan/DEUdacity/blob/master/songsTable.PNG)

![artist table](https://github.com/duskaan/DEUdacity/blob/master/artistTable.PNG)

For the below Event data, the approach was different.
![event](https://github.com/duskaan/DEUdacity/blob/master/Screenshot8.PNG)

It is originally also a json file, which is filtered on the next song as a page. The user data is then inserted into the below user table. To ensure that there is no duplicates, the primaryKey is unique. It is made sure that there is no errors in the Insert query with removing all userId=0.  

![Users table](https://github.com/duskaan/DEUdacity/blob/master/userTable.PNG)

The time from the event is in miliseconds and needs to be transformed into a table in a readable format. Additionally, in order to do analysis on this data, it is further transformed into the hours, day, weeks and other relevant metrics. For this Postgresql timestamp 'epoch' is utilized, which was found in Stackoverflow as a way to transform a bigInt into a timestamp. 

![time table](https://github.com/duskaan/DEUdacity/blob/master/timeTable.PNG)

Lastly the event itself is combining the song file to the specific event. For this, the song id and artist id are matched to the event files. 

The database has been designed with the songplays as the fact table and the other tables mainly as dimensions. As there is multiple levels of relationships across the dimensions, it is a Snowflake schema design. This is very efficient for analysis of data. 

The data is read from the different json files in order to combine the two data sources and unify them in the fact table songplays.

With the created database, the startup Sparkify is able to understand the user behavior in regards to what Artists they listen to and at what times. This Data could then be used to further recommend music other users listen to, who also listen to the same artist. 

The main concern as of now is, that there seems to be no matching data between the artists and songs with the logs from the events, which might be as it is a subset of a bigger dataset with no matching IDs. 


There are 666 different records matched in the songplay tables. The below query is used to analyse if the tables have been copied and transformed successfully.
![queryrequest](https://github.com/duskaan/DEUdacity/blob/master/Songplays_detailsQueryRequest.PNG)

And the result clearly illustrates a success. 
![queryresult](https://github.com/duskaan/DEUdacity/blob/master/Songplays_detailsQuery.PNG)
