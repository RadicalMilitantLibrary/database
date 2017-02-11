![ReadersAgainstDRM](https://github.com/RadicalMilitantLibrary/manual/blob/master/img/rad-logo.png "Readers Against DRM")

# Radical Militant Databases

The role "webuser" is expected by the [reference code](https://github.com/RadicalMilitantLibrary/www/) to exist and have access to a SQL database. 

The folder "1077" contains a complete database (without the user accounts and comments). The file "1077.sql" is the rest of the database, you should run that AFTER you restore the folder. After that you should register the admin account and change the ownership of all the documents to that account (UPDATE document SET handle='admin';). Do the same with "subject" and "lists".

The folders "1077.covers", "1077.authors" and "1077.pictures" should be in the www folder (without the 1077).

Contact Jotunbane if you run into problems.



## License Terms

Every contributor accepts that his code will be available to the public under the terms of at least one of the following licenses:

* [GNU GPLv2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
* [GNU GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html) or later
* [GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html) or later

The contributor can propose other licenses that do not guarantee fewer freedom.
