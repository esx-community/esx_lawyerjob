INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('lawyer',0,'recruit','Lawyer Trainee',500,'{}','{}'),
('lawyer',1,'lawyer','Lawyer',1000,'{}','{}'),
('lawyer',2,'ada','ADA',5000,'{}','{}'),
('lawyer',3,'boss',"Chef Judge,10000,'{}','{}')
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('lawyer', 'Lawyer', 1);

INSERT INTO `addon_account` (name, label, shared) VALUES 
('society_lawyer','Lawyer',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
('society_lawyer','Lawyer',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
('society_lawyer', 'Lawyer', 1)
;
