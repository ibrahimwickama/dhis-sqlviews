
-- eIDSR Zanzibar Sql Queries
xqKqwYeEZLB |      1381 | IDSR_MoHZ Immediate Notification Disease (Tracker) | 2024-02-13 12:08:35.271
Y1Arb55WBGM |    251097 | Immediate Disease Notification                     | 2024-03-01 11:48:16.499

select tea.trackedentityattributeid,tea.code,tea.uid,tea.name 
from program_attributes pa
inner join trackedentityattribute tea on tea.trackedentityattributeid = pa.trackedentityattributeid
where pa.programid=251097
EXCEPT
select tea.trackedentityattributeid,tea.code,tea.uid,tea.name 
from program_attributes pa
inner join trackedentityattribute tea on tea.trackedentityattributeid = pa.trackedentityattributeid
where pa.programid=1381;


 trackedentityattributeid |     code     |     uid     |                    name                    
--------------------------+--------------+-------------+--------------------------------------------
                    23239 |              | O3qLN1qthuD | Abdominal pain
                    23242 |              | daprT6CsvwA | Other signs and symptoms (comma separated)
                    23240 |              | U55rdZ6lmSR | Diarrhea
                     7332 |              | PiMCnF44w9a | Neck weakness
                     1323 | patient_name | fKmImM7B5xo | Patient Name(3 Names)
                    23231 |              | k16nK386Z1v | Nausea/vomiting
                    23195 |              | CfFQ0TiM21o | Headache
                    23233 |              | J3pTh2nlgqn | Chest pain
                     7329 |              | L4HmmzuVzQj | Paralysis arm or legs or both
                    23194 |              | DwXQKRDm3fp | Fever/chills
                     7331 |              | ntecDzQtmHd | Cough
                     1529 |              | b5kzUDVfnU0 | Age type
                    23237 |              | MohsX3XoW8h | Loss of smell
                    23235 |              | PGW7NvbK4qf | Sore throat
                    23547 |              | J7OpRBNl0Ac | Unusual Bleeding
                    23236 |              | NS5wbj3urkh | Runny nose
                     7335 |              | OK63J2IpvIP | Difficulty swallowing
                    23548 |              | Bubnll9Ax3P | Skin Rush
                    23238 |              | wbZswkbmnX2 | Loss of taste
                    23234 |              | oyR4of23qxJ | General Body Weakness
                     7333 |              | YgKAED28fqO | Drooping eyelid
(21 rows)

dhis=# select tea.trackedentityattributeid,tea.code,tea.uid,tea.name 
dhis-# from program_attributes pa
dhis-# inner join trackedentityattribute tea on tea.trackedentityattributeid = pa.trackedentityattributeid
dhis-# where pa.programid=251097
dhis-# EXCEPT
dhis-# select tea.trackedentityattributeid,tea.code,tea.uid,tea.name 
dhis-# from program_attributes pa
dhis-# inner join trackedentityattribute tea on tea.trackedentityattributeid = pa.trackedentityattributeid
dhis-# where pa.programid=1381;
 trackedentityattributeid |           code            |     uid     |                name                 
--------------------------+---------------------------+-------------+-------------------------------------
                   251043 | EBS_REFERENCE_ID          | mMHbZFMz88R | EBS_Reference ID
                     3533 | EVENT_REF_ID              | Vsu5tbCoNFl | Event Reference ID
                   247963 | DETECTION_DATE            | Pg6JkfpWmuB | Date of Detection
                   251046 | SIGNSYMP_BLOOD_EYE        | lSACFGfcBWx | Sign/Symptoms Bleeding in the eyes
                   247957 | OTHER_OCCUPATION          | UUb8rQYhHjH | Other Occupation
                   244802 | MIDDLE_NAME               | eYBjzFP1LPd | Middle name
                   251047 | SIGNSYMP_TEMPERATURE      | znNwmTPKkrS | Sign/Symptoms Temperature
                   244784 | PATIENT_AGE_TYPE          | HqazINzzsEZ | Age Type
                   244796 | LAST_NAME                 | qEUF9OgZqMM | Last name
                   251049 | SIGNSYMP_HEADACHE         | lLFFYmaFuoK | Sign/Symptoms headache
                     6795 | DATE_OF_DEATH             | vzFzhxmH35x | Date of death
                   251044 | CONTACT_ID_REFERENCE      | Gme2w3U562z | Contact ID Reference
                   251041 | SIGNSYMP_COUGH            | BDUaRXcq8S0 | Sign/Symptoms Cough
                   251050 | SIGNSYMP_NAUSEA           | rCPfjrqF8NT | Sign/Symptoms Nausea
                   244795 | CONTACT_PATH              | WK7nh2RaTJP | Contact path
                   247956 | SEVERITY                  | frJBkoWRXwc | Severity
                     1363 | DATE_OF_ONSET_OF_SYMPTOMS | BBPoN8bU9i3 | Date of onset of the first symptoms
                   251042 | SIGNSYMP_BLOOD_NOSE       | eUojlIFXYip | Sign/Symptoms Blood from Nose
                   244801 | FIRST_NAME                | rVy1STQGA5Q | First name
                   251048 | SIGNSYMP_SKIN_RASH        | wDkPEg4hqNI | Sign/Symptoms skin rash
                   251045 | SIGNSYMP_VOMITTING        | PQw0MI9kDtm | Sign/Symptoms vomitting
(21 rows)

UPDATE trackedentityattributevalue SET trackedentityattributeid=251050 WHERE trackedentityattributeid=23231;
UPDATE trackedentityattributevalue SET trackedentityattributeid=251049 WHERE trackedentityattributeid=23195;
UPDATE trackedentityattributevalue SET trackedentityattributeid=251041 WHERE trackedentityattributeid=7331;
UPDATE trackedentityattributevalue SET trackedentityattributeid=244784 WHERE trackedentityattributeid=1529;
UPDATE trackedentityattributevalue SET trackedentityattributeid=251048 WHERE trackedentityattributeid=23548;

UPDATE trackedentityprogramowner SET programid=251097 WHERE programid=1381;


UPDATE programinstance SET programid=251097 WHERE programid | Yt7tn6R9HaU | DIAGNOSIS_OF_CONCERN             | Diagnosis of concern


[
  { oldCode: 'Blood Diarrhoea', newCode: undefined },
  { oldCode: 'Unknown', newCode: undefined },
  { oldCode: 'Animal bite', newCode: 'W53/X29' },
  { oldCode: 'Dengue fever', newCode: 'A97' },
  { oldCode: 'Yellow Fever', newCode: 'A95' },
  { oldCode: 'Human Influenza/SARI', newCode: 'J10.8' },
  { oldCode: 'Measles', newCode: 'B05' },
  { oldCode: 'Viral Haemorrhagic Fevers (VHF)', newCode: 'A99' },
  { oldCode: 'Covid-19', newCode: 'U07.2' },
  { oldCode: 'Monkey pox', newCode: undefined },
  { oldCode: 'Chikungunya ', newCode: 'A92.0' },
  { oldCode: 'Rabies', newCode: 'A82' },
  { oldCode: 'Cholera', newCode: 'A00' },
  { oldCode: 'Anthrax', newCode: 'A22' },
  { oldCode: 'Cerebral Spinal Meningitis (CSM)', newCode: undefined },
  { oldCode: 'Acute Flaccid Paralysis (AFP)', newCode: 'A80' },
  { oldCode: 'monkeypox', newCode: undefined },
  { oldCode: 'Small Pox', newCode: 'B03' },
  { oldCode: 'Aflatoxin ', newCode: 'T64' },
  { oldCode: 'Malaria', newCode: 'B54' },
  { oldCode: 'Keratoconjuctivitis', newCode: undefined },
  { oldCode: 'Neonatal Tetanus  (NNT)', newCode: 'A33' },
  { oldCode: 'Plague', newCode: 'A20' }
]

UPDATE trackedentityattributevalue SET value='W53/X29' WHERE value='Animal bite';
UPDATE trackedentityattributevalue SET value='A97' WHERE value='Dengue fever';
UPDATE trackedentityattributevalue SET value='A95' WHERE value='Yellow Fever';
UPDATE trackedentityattributevalue SET value='J10.8' WHERE value='Human Influenza/SARI';
UPDATE trackedentityattributevalue SET value='B05' WHERE value='Measles';
UPDATE trackedentityattributevalue SET value='A99' WHERE value='Viral Haemorrhagic Fevers (VHF)';
UPDATE trackedentityattributevalue SET value='U07.2' WHERE value='Covid-19';
UPDATE trackedentityattributevalue SET value='A92.0' WHERE value='Chikungunya ';
UPDATE trackedentityattributevalue SET value='A82' WHERE value='Rabies';
UPDATE trackedentityattributevalue SET value='A00' WHERE value='Cholera';
UPDATE trackedentityattributevalue SET value='A22' WHERE value='Anthrax';
UPDATE trackedentityattributevalue SET value='A80' WHERE value='Acute Flaccid Paralysis (AFP)';
UPDATE trackedentityattributevalue SET value='B03' WHERE value='Small Pox';
UPDATE trackedentityattributevalue SET value='T64' WHERE value='Aflatoxin ';
UPDATE trackedentityattributevalue SET value='B54' WHERE value='Malaria';
UPDATE trackedentityattributevalue SET value='A33' WHERE value='Neonatal Tetanus  (NNT)';
UPDATE trackedentityattributevalue SET value='A20' WHERE value='Plague';

COPY(select trackedentityinstanceid, split_part(value, ' ',1) as firstname, split_part(value, ' ',2) as middlename, split_part(value, ' ', 3) as lastname, value,storedby from trackedentityattributevalue where trackedentityattributeid = 1323) to '/tmp/patientnames.csv' with csv header;

INSERT INTO trackedentityprogramowner VALUES((select nextval('hibernate_sequence')),522043014,521914217,now()::timestamp,now()::timestamp,2788,'system');

INSERT INTO trackedentityattributevalue VALUES()
="INSERT INTO trackedentityattributevalue VALUES("&A2&",244796,now()::timestamp,now()::timestamp,'"&D2&"',null,'"&F2&"');"