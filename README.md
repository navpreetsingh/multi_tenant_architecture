# Install ROR (FOR WINDOWS USERS)
[To install in Windows](https://github.com/navpreetsingh/install_ROR/wiki/Install-ROR-in-Windows)

# Install_ROR (FOR LINUX USERS)
Please Install **Ruby on Rails** on your machines using **RVM**. Below commands work in Ubuntu O.S.

## Requirements

* [RVM](https://rvm.io/rvm/install)
* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](http://rubyonrails.org/)

## Installing Ruby on Rails using RVM

```sh
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ sudo apt-get install curl
$ \curl -sSL https://get.rvm.io | bash -s stable --rails
```

## Check Ruby & Rails Version

```sh
$ ruby --version
$ rails --version
```

# HOW TO CLONE THE PROJECT ON YOUR MACHINE
**NOTE:** Make Sure MySQL is there on your system

**Run the below commands (LINUX USERS)
```sh
$ git clone git@github.com:navpreetsingh/multi_tenant_architecture.git
$ cd multi_tenant_architecture
$ gem install bundler
$ bundle install
```

**Run the below commands (WINDOWS USERS)
```sh
C:\users> git clone git@github.com:navpreetsingh/multi_tenant_architecture.git
C:\users> cd multi_tenant_architecture
C:\users> gem install bundler
C:\users> bundle install
```

## DOING MIGRATIONS TO MULTIPLE DB's

**NOTE:** Change the password in file **/config/database.yml** with your local mysql password.

## Create a Dummy DB (WINDOWS USERS - Don't copy '$' sign to run command)
```sh
$ rake db:create
```
This will create a db in MySQL with name **'dummy'**.

## Create a Table USERS in DB (WINDOWS USERS - Don't copy '$' sign to run command)
```sh
$ rake db:migrate
```
This will create a table **'users'** in db **'dummy'**

## Lets create a multiple dummy DB's (WINDOWS USERS - Don't copy '$' sign to run command)
```sh
$ RAILS_ENV=dev_server_1 rake db:create
$ RAILS_ENV=dev_server_2 rake db:create
$ RAILS_ENV=dev_server_3 rake db:create
```
This will create a 3 db's in MySQL with name **'dummy_1', 'dummy_2' & 'dummy_3'**.

## Migrate a Table USERS to multiple DB's (WINDOWS USERS - Don't copy '$' sign to run command)
```sh
$ RAILS_ENV=dev rake db:mass_migration
```
This will create a table **'users'** in all db's

## Create a new Table ADDRESSES in Dummy DB (WINDOWS USERS - Don't copy '$' sign to run command)
**NOTE:** Copy a file in folder **'/db'** with name **'20161017055930_add_address_table.rb'** to folder **'/db/migrate'**
```sh
$ rake db:migrate
```
This will create a table **'addresses'** in db **'dummy'**

## Migrate a Table ADDRESSES to multiple DB's (WINDOWS USERS - Don't copy **'$'** sign to run command)
```sh
$ RAILS_ENV=dev rake db:mass_migration
```
This will create a table **'addresses'** in all db's

## Let's create 1 more DB with name 'dummy_4'
**NOTE:** Change a line in file **'/config/database.yml'**
```sh
dev_count: 3
```
**TO**
```sh
dev_count: 4
```
This change will identify 1 more db in mass_migration. You can see the key 'dev_server_4' having details of the db. You can **add more db's** in same format and changing the **dev_count** in given file above.

Run Below commands to create new db
```sh
$ RAILS_ENV=dev_server_4 rake db:create
```
New DB has been created with name **'dummy_4'**

## Let's populate the new DB with tables
```sh
$ RAILS_ENV=dev rake db:mass_migration
```
New DB has been populated with tables **'users'** & **'addresses'**