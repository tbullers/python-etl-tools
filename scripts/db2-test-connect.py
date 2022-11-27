#! /usr/bin/env python

# Test script to confirm connectivity to a database and basic pandas dataframe functionality

import json
import pandas
from sqlalchemy import create_engine

DSN_FILE = 'dsn-data.json'

# open and read database connection secrets and parameters
try:
  f = open(DSN_FILE, 'r')
except:
  print("\n*** Can't find file "+DSN_FILE+". Run 'make-dsn-data.sh' to create a new one.\n")
  exit(1)

dsn = json.load(f)

# create connection string with loaded dictionary data elements
dsn = f"ibm_db_sa://{dsn['uid']}:{dsn['pwd']}@{dsn['hostname']}:{dsn['port']}/{dsn['database']}"
#print ("\nThe connection string is:\n"+dsn+"\n")

engine = create_engine(dsn)
sql = 'select * from STAFF'

# load data into pandas dataframe
df = pandas.read_sql(sql, engine)

print(df)
