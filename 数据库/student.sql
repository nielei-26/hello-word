CREATE DATABASE student
ON PRIMARY
(
NAME=student,
FILENAME='D:\DATA\student.mdf',
SIZE=10MB,
MAXSIZE=100MB,
FILEGROWTH=10%
)
LOG ON
(
NAME=student_log,
filename='d:\data\student_log.ldf',
size=8mb,
maxsize=100mb,
FILEGROWTH=10%
)