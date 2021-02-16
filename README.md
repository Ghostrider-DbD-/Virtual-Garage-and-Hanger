# Virtual-Garage-and-Hanger
Adds the ability to save invetory, and adds a public virtual hanger


             
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
	
Credits: Based on the virtual garage released by Shix

Description: modified to add ability to store inventory, skins, and a nickname
             Capacity to have virtual hangers for aircraft added as well.
	     
Requires: you must run a 64 bit Exile server using extDB3.

https://github.com/BrettNordin/Exile

Difficulty: significant expertise with scripting required.

Installation:

[This one is a bit complicated, be sure to make backups before starting]

Mission:

Merge the contents of the addons folder with your mission.pbo.

Merge the contents of config.h with your config.cpp

Merge the contents of description.ext with your description.ext

Merge the contents of init.sqf into your current init.sqf.

Copy the folder with overwrites of ExileServer files into your mission folder.

An example of virtual hanger terminals and spawn points I use is included.

Server:

pack the virtual_garage folder and put virtual_garage.pbo in @exileserver\addons

Run \database\virtual_garage.sql to add the virtual garage table to the database for your server AFTER making a backup.
Run \database\exileDBupdate to add a field for weapons loadouts to the vehicles table AFTER making a backup.
Merge @ExileServer\extDB\sql_custom_v2\exile.ini with your existing extDB3 exile.ini (be sure to make a backup first).

SPECIAL NOTES.

The virtual garage / hanger / boatrack does require one set of functions from my rearm / repair / refuel scripts.
If you have already installed that set of scripts you do not need to include the code listed in init.sqf to make virtualGarage run.



  
  
          

