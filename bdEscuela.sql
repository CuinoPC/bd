-- Creación de la base de datos
CREATE DATABASE escuela;

USE escuela;

-- Tabla para usuarios (estudiantes, profesores, administradores)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  matricula VARCHAR(20) UNIQUE,
  password VARCHAR(255),
  role ENUM('admin', 'profesor', 'alumno')
);

-- Tabla para asignaturas
CREATE TABLE subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

-- Relación entre profesores y asignaturas
CREATE TABLE professor_subjects (
  professor_id INT NOT NULL,
  subject_id INT NOT NULL,
  FOREIGN KEY (professor_id) REFERENCES users(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id),
  PRIMARY KEY (professor_id, subject_id)
);

-- Tabla de calificaciones
CREATE TABLE grades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  grade DECIMAL(5,2) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES users(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

-- Nueva tabla para asignación de materias a estudiantes
CREATE TABLE student_subjects (
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  PRIMARY KEY (student_id, subject_id),
  FOREIGN KEY (student_id) REFERENCES users(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

INSERT INTO subjects (name) VALUES 
('Inglés Básico'),
('Inglés Intermedio'),
('Inglés Avanzado'),
('Francés Básico'),
('Francés Intermedio'),
('Francés Avanzado'),
('Alemán Básico'),
('Alemán Intermedio'),
('Alemán Avanzado'),
('Italiano Básico');
