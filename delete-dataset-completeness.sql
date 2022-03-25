-- dx ndo datase uid 
DELETE FROM analytics_completeness_2021 WHERE dx='' AND uidlevel4='Yu6xMuIT0pG'

-- Procedure flow 

-- Get all datasets
-- Pass on each dataset and get all orgunits not assigned
-- Perform query of deleting orgunits not assigned to dataset on analytics completeness table 