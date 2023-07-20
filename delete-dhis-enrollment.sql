-- delete enrollment 
delete from programstageinstance where programinstanceid in(select programinstanceid from programinstance where uid in('HBMjr68ns2a'));
delete from programinstance where uid in('HBMjr68ns2a');