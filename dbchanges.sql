ALTER TABLE applicant CHANGE `Level of education` Level VARCHAR(255);

ALTER TABLE applicant DROP FOREIGN KEY applicant_ibfk_1;

ALTER TABLE applicant DROP COLUMN Parent_id;

ALTER TABLE parent
ADD COLUMN applicant_id INT,
ADD
    FOREIGN KEY (applicant_id) REFERENCES applicant(id);


CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subjectName VARCHAR(60) NOT NULL
);

CREATE TABLE timetable (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class VARCHAR(255),
    day VARCHAR(255),
    period VARCHAR(20),
    teacher VARCHAR(255),
    subject VARCHAR(255)
);

CREATE TABLE teacher_subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    subject_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);