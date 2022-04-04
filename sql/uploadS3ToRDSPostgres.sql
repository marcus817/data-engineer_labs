CREATE EXTENSION aws_s3 CASCADE;

CREATE TABLE CTTU2020v2
(ind text,datainfracao text, horainfracao text, dataimplantacao text, agenteequipamento text, infracao text, descricaoinfracao text, amparolegal text, localcometimento text);


SELECT aws_s3.table_import_from_s3(
   'cttu2020v2',
   'ind, datainfracao, horainfracao, dataimplantacao, agenteequipamento, infracao, descricaoinfracao, amparolegal, localcometimento',
   '(FORMAT CSV, DELIMITER ''|'', HEADER true)',
   aws_commons.create_s3_uri('bu-igti-edc', 'data/CTTU2020v2.csv', 'us-east-2')
);

select * from cttu2020v2 cv limit 100