-- For ETL TB instance facilities with level 5 
SELECT ou.uid,ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name,ARRAY_TO_STRING(ARRAY_AGG(oug.name),',') grps FROM organisationunit ou
INNER JOIN orgunitgroupmembers ougm ON(ougm.organisationunitid=ou.organisationunitid)
INNER JOIN orgunitgroup oug ON(ougm.orgunitgroupid=oug.orgunitgroupid)
INNER JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ou.hierarchylevel=5 AND oug.uid IN('m16TP0k7LVw','ZGhwSwcXKla')
GROUP BY ou.uid,ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name
HAVING COUNT(ougm.*) > 1
ORDER BY ous.namelevel2,ous.namelevel3,ous.namelevel4,ou.name;


-- for HMIS instane with facilities level 4
SELECT ou.uid,ous.namelevel2,ous.namelevel3,ou.name,ARRAY_TO_STRING(ARRAY_AGG(oug.name),',') grps FROM organisationunit ou
INNER JOIN orgunitgroupmembers ougm ON(ougm.organisationunitid=ou.organisationunitid)
INNER JOIN orgunitgroup oug ON(ougm.orgunitgroupid=oug.orgunitgroupid)
INNER JOIN _orgunitstructure ous ON(ous.organisationunitid=ou.organisationunitid)
WHERE ou.hierarchylevel=4 AND oug.uid IN('m16TP0k7LVw','ZGhwSwcXKla')
GROUP BY ou.uid,ous.namelevel2,ous.namelevel3,ou.name
HAVING COUNT(ougm.*) > 1
ORDER BY ous.namelevel2,ous.namelevel3,ou.name;
