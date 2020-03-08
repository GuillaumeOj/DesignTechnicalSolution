# Contents page
- [I. What is this project?](#i-what-is-this-project)
- [II. How to create and seed the database?](#ii-how-to-create-and-seed-the-database)

# I. What is this project? 
[⇧ *Top*](#contents-page)

The aim of this project is to design a technical for a customer (OC pizza).
This project is made for the project 6 from [OpenClassrooms'](https://openclassrooms.com/fr/projects/126/assignment) Python course.

# II. How to create and seed the database?
[⇧ *Top*](#contents-page)

Be sure MySQL is installed and works.

Create a user with all privileges:
```SQL
CREATE USER 'ocpizza'@'host' IDENTIFIED BY 'ocpizza' -- Replace 'host' by the host name on your server
GRANT ALL ON *.* TO 'ocpizza'@'ocpizza';            -- Don't forget to replace 'host'
```

Clone this current repository on your computer. Run :
```
git clone git@github.com:GuillaumeOj/DesignTechnicalSolution.git
or
git https://github.com/GuillaumeOj/DesignTechnicalSolution.git
```

Create a virtual environement in your directory:
```
virtualenv -p python3 env
```
or for PowerShell:
```powershell
virtualenv -p $env:python3 env
```

Activate your virtual environement:
```
source env/bin/activate
```
or for PowerShell:
```powershell
.env/scripts/activate.ps1
```

Install `requirements.txt`:
```
pip install -r requirements.txt
```

Run `seed.py` with the argument `--structure` (or `-s`):
```
python seed.py --structure
```

Run `seed.py` with the argument `--data` (or `-d`):
```
python seed.py --data
```

Your database is seeded.
