#DEUdacity

![song file](https://github.com/duskaan/DEUdacity/blob/master/Screenshot7.PNG)



The initial song data is in the json format and as above. The songfile is then read and it is turned into a panda DataFrame with then splitting the columns into the different tables: artists and songs which are visible in the following two pictures. 
![Songs_table](https://github.com/duskaan/DEUdacity/blob/master/Screenshot4.PNG)

![artist table](https://github.com/duskaan/DEUdacity/blob/master/Screenshot5.PNG)

For the below Event data, the approach was different.
![event](https://github.com/duskaan/DEUdacity/blob/master/Screenshot8.PNG)

It is originally also a json file, which is read into a df. Only the next song is relevant for the assignment as of now, therefore it is filtered to only included events of that type. The user data is then inserted into the below user table. To ensure that there is no duplicates, the primaryKey is unique. Additionally,if there is a change in the subscription level, that this is updated in the table with --ON CONFLICT ON CONSTRAINT users_pkey DO update set level = excluded.level--. 

![Users table](https://github.com/duskaan/DEUdacity/blob/master/Screenshot3.PNG)

The time from the event is in miliseconds and needs to be transformed into a table in a readable format. Additionally, in order to do analysis on this data, it is further transformed into the hours, day, weeks and other relevant metrics.

![time table](https://github.com/duskaan/DEUdacity/blob/master/Screenshot6.PNG)

Lastly the event itself is combining the song file to the specific event. For this, the song name and artist are matched to the song files, which are namely the artist and song table. 

The different tables have a primary key and if there is a conflict on a duplicate ID, which happens due to incremental inserting, nothing is updated. The only ID which is automatically generated is of the songplays_id, as there is no matching data in the dataset.

The database has been designed with the songplays as the fact table and the other tables mainly as dimensions. As there is multiple levels of relationships across the dimensions, it is a Snowflake schema design. This is very efficient for analysis of data. 

The data is read from the different json files in order to combine the two data sources and unify them in the fact table songplays.

With the created database, the startup Sparkify is able to understand the user behavior in regards to what Artists they listen to and at what times. This Data could then be used to further recommend music other users listen to, who also listen to the same artist. 

The main concern as of now is, that there seems to be no matching data between the artists and songs with the logs from the events, which might be as it is a subset of a bigger dataset with no matching IDs. 

There has been some issues with matching the artists and songs to the events, as the duration seems to be rounded differently depending on the dataset. as visibl in the following two images. 
![Duration 270](https://github.com/duskaan/DEUdacity/blob/master/image.png)

![Duration 269.58](https://github.com/duskaan/DEUdacity/blob/master/screenshot2.PNG)

Nevertheless, after adjusting the SQL select query accordingly, the following result could be matched in the songplays table as the only not null artist_id and song_id. 
![Songplays Result](https://github.com/duskaan/DEUdacity/blob/master/Screenshot.PNG)





