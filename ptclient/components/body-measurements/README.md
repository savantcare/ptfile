Q) A user adds a new weight should existing row be edited or a new row is inserted? 
(In both cases system verisoning table is used)

Data row options -> A (Add), D (Discontinue)
D is used when a wrong data has been entered.
If user chooses D then run the "delete query". When delete query is run the temporal DB of mariadb does not delete the data. MariaDB only enters the current timestamp in ROW_END

Option 1: Edit of same row
    Positives:
        "as of" query is easier. So -> select weight from weight where paitentUUID='asdasd' as of 1st Jan 2020
        "as of" is a new sql term introduced with temporal DB https://mariadb.com/kb/en/temporal-data-tables/#querying-historical-data
    Negatives:
        Make a time series graph.
        Some data needs to be ignored. Doctor entered it by mistake.
        This cannot be done.

Option 2: Each weight is a new row
    Negatives:
        To get data "as of" a particular day the query is a bit complicated.
        Suppose I want to know the weight on 1st Jan 2020.
        So the query has to be "select weight from weight where ROW_START < 1st Jan 2020 and ROW_START is max"


# Q)What is the common principle to apply?
At any point T 
    only 1 weight is valid.
    More then 1 dx is possible.

Hence,   
    For each new weight keep editing the same row
    For each new dx use different row.

## How to deal with assessment given the common principle?
    At a given point T
        Below a DX only 1 asssemment is possible
        Hence each assessment is edit of an existing row.

## How to deal with appearence section of MSE given the common principle?
    At a given point T
        Only one apperence is possible.
        Hence each appearence is edit of an existing row.

## How to deal with email address given the common principle?
    At a given point T
        A person can have many email addresses.
        Hence each email address is a new row.

# Q) How is single row vs multiple row distinguoished in UI?

Single row is called "C (Change)". 
    Weight does not have a add. Weight only has change.
    Assessment does not have add. Assessment only has change.
    Existing RX has change.

Multi row is called "A (Add a new row)"
    Dx has add.
        DX does not have change since DX has child data of assessment.
    Rx has add.