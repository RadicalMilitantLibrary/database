Status: draft – still to be figured out how to handle this, so it may not be 100% correct
Note: our system is a GNU/Linux, distribution Debian (usually stable) with PostgreSQL for the database.


## Installation of PostgreSQL

first we will just install what is needed to deal with the database

```
sudo apt-get install postgresql
```

now just ensure the service is running

```
systemctl status postgresql.service
```

and if it is not, start it

```
systemctl start postgresql.service
```

after that have a look for the port is running on

```
netstat -tulpn | grep -i postgres
```

note in case it is different from the standard port `5432` and replace that number later.
for the hostname we use localhost here as we are logged in the machine that runs the database.


## Basic access to PostgreSQL

after installation by default there will be a user `postgres`, that is the database administrator (superuser).
this account also exists on the system, there without superuser privileges.

to use the system for user `postgres` account we utilize the command `sudo`

```
sudo -u postgres -i
```

and for running any commands on the database we can use the tool `psql`

```
psql -U postgres
```

e.g. we should set the password for the database superuser `postgres`

```
\password postgres
```

then you may list the databases `\l` or tables `\dt`.
to leave that command line use `\q`

## Setup user

as the `postgres` user is admin we will not run the command on a webserver with it.
so we better create a new one (still logged in with system account `postgres`).
we will call him `webuser` and again set a password.
this data you should update in `settings.php` on your copy of the [www repository].

```
createuser -h localhost -p 5432 --interactive webuser
psql -c "\password webuser"
```

this will ask for the new password 2 times and a third time for the one of postgres user.


## Setup empty database

note: there have been alteration to the database, so the empty example might still bear problems.

we create a database for it, the example from `settings.php` is called `InfoCOM`, so we will stick to that.

```
psql -c 'CREATE DATABASE "InfoCOM";'
```

we download the empty schema file

```
get -c -O sample.sql https://raw.githubusercontent.com/RadicalMilitantLibrary/database/master/empty.sql
```

and then the SQL file can be executed (still by database superuser `postgres`)

```
psql -h localhost -p 5432 -d InfoCOM < sample.sql
```

now the database should be ready to use with the rml.

<!-- links -->

[www repository]: https://github.com/RadicalMilitantLibrary/www
