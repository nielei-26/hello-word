CREATE DATABASE book
ON PRIMARY
(
NAME=book,
FILENAME='D:\DATA\book.mdf',
SIZE=10MB,
FILEGROWTH=5%
)
LOG ON
(
NAME=book_log,
filename='d:\data\book_log.ldf',
size=3mb,
FILEGROWTH=5%
)