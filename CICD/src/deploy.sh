#!/bin/bash

scp ~/builds/uHspRa-1/0/students/DO6_CICD.ID_356283/rygerlin_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat rygerlin@10.10.0.2:/usr/local/bin/
scp ~/builds/uHspRa-1/0/students/DO6_CICD.ID_356283/rygerlin_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep rygerlin@10.10.0.2:/usr/local/bin/
ssh rygerlin@10.10.0.2 ls /usr/local/bin
 