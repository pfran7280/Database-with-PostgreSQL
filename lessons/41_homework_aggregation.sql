
-- 1. How many users we have with @google.com accounts
-- Tip: count, like

    SELECT COUNT(email)
    FROM
        users
    WHERE
        email like '%@google.com'

-- 2. Which countries are users with @google.com accounts from?
-- Tip: distinct

    SELECT DISTINCT(country)
	FROM
        users
    WHERE
        email like '%@google.com'

-- 3. How many users are there per country?
-- Tip: Group by
    
    SELECT country,COUNT(country) as total
    FROM
        users
    GROUP BY
        country

-- 4. List of IP addresses of all users in Iceland
-- Required fields first_name, last_name, country, last_connection

    
    SELECT first_name,last_name,country,last_connection
    FROM
        users
    WHERE
        country = 'Iceland'

-- 5. How many of those users (previous query) have an IP address?
-- that starts at 112.XXX.XXX.XXX

    SELECT count(*)
    FROM 
        users
    WHERE 
        country = 'Iceland' AND last_connection LIKE '112.%'

-- 6. List of users from Iceland, have an IP address
-- starting at 112 or 28 or 188
-- Tip: Group conditions in parentheses

    SELECT first_name, last_name, country, last_connection
    FROM 
        users
    WHERE 
        country = 'Iceland' AND (
            last_connection LIKE '112.%' OR 
            last_connection LIKE '28.%' OR 
            last_connection LIKE '188.%'
        )

-- 7. Sort the previous result, by last_name ascending
-- and then the first_name ascending as well

    SELECT first_name, last_name, country, last_connection
    FROM 
        users
    WHERE 
        country = 'Iceland' AND (
            last_connection LIKE '112.%' OR 
            last_connection LIKE '28.%' OR 
            last_connection LIKE '188.%'
        )
    ORDER BY 
        first_name ASC,last_name ASC

-- 8. List of people whose country is on this list
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Sort results by Country asc, First name asc, Last name asc
-- Tip: Investigate IN
-- Tip2: See Comparison Operators in the shortcut sheet (first page)
        
    SELECT country,first_name, last_name
    FROM 
        users
    WHERE 
        country in ('Mexico', 'Honduras', 'Costa Rica')
    ORDER by 
        country asc, first_name asc, last_name asc


-- 9. From the previous query, count how many people there are per country
-- Order the results by Country asc

    SELECT count(country),country
    FROM 
        users
    WHERE 
        country in ('Mexico', 'Honduras', 'Costa Rica')
    GROUP BY 
        country
    ORDER by 
        country asc