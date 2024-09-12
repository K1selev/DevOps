## Part 1. Готовый докер  
#### 1) Взять официальный докер образ с nginx и выкачать его при помощи docker pull  
* используем команду `sudo docker pull nginx`  
![1.1.png](screen/1.1.png)  

#### 2) Проверить наличие докер образа через docker images  
* используем команду `sudo docker images`  
![1.2.png](screen/1.2.png)  

#### 3-4) Запустить докер образ через `docker run -d [image_id|repository]` и проверить что образ запустился через `docker ps`  
* используем команду `sudo docker run -d nginx` и проверяем, что образ запустился с помощью команды `sudo docker ps`  
![1.3.png](screen/1.3.png) 

#### 5) Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`  
* используем команду `sudo docker inspect sad_napier`  
![1.4.png](screen/1.4.png) 

#### 6) По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера  
* найдём размер контейнера командой `sudo docker inspect sad_napier --size | grep -i SizeRw`  
![1.5.png](screen/1.5.png)  


* найдём в выводе команды `sudo docker inspect sad_napier` список портов  
![1.6.png](screen/1.6.png) 


* найдём ip контейнера командой `sudo docker inspect sad_napier | grep -i ip`  
![1.61.png](screen/1.61.png)  

#### 7-8) Остановить докер образ через `docker stop [container_id|container_name]` и проверить, что образ остановился через `docker ps`  
* используем команду `sudo docker stop sad_napier` и проверяем остановку командой `sudo docker ps`  
![1.7.png](screen/1.7.png) 

#### 9) Запустить докер с замапленными портами 80 и 443 на локальную машину через команду `run`  
* используем команду `sudo docker run -d -p 80:80 -p 443:443 nginx` и сразу проверим запуск и порты командой `sudo docker ps`  
![1.9.png](screen/1.9.png) 

#### 10) Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx  
* Открываем любой браузер и в адресной строке пишем localhost:80  
![1.10.png](screen/1.10.png) 


## Part 2. Операции с контейнером  
#### 1) Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду `exec`  
* используем команду `sudo docker exec determined_cohen cat /etc/nginx/nginx.conf`  
![2.1.png](screen/2.1.png)  

#### 2) Создать на локальной машине файл nginx.conf  
* создаём файл  
![2.2.png](screen/2.2.png) 

#### 3) Настроить в нем по пути /status отдачу страницы статуса сервера nginx  
* дописываем блок http  
![2.0.png](screen/2.0.png)   

#### 4-5) Скопировать созданный файл nginx.conf внутрь докер образа через команду `docker cp` и Перезапустить nginx внутри докер образа через команду `exec`  
* копируем файл командой `sudo docker cp nginx.conf determined_cohen:etc/nginx/` и перезапускаем nginx командой `sudo docker exec determined_cohen nginx -s reload`  
![2.3.png](screen/2.3.png)  

#### 6) Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx  
* открываем браузер и проверяем  
![2.4.png](screen/2.4.png) 

#### 7) Экспортировать контейнер в файл container.tar через команду export  
* экспортируем контейнер командой `sudo docker export -o container.tar compassionate_hofstadter  `
![2.5.png](screen/2.5.png)  

#### 8) Остановить контейнер  
* останавливаем контейнер командой `sudo docker stop compassionate_hofstadter`  
![2.6.png](screen/2.6.png)  

#### 9-10) Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры  
* удаляем образ командой `sudo docker rmi -f nginx`  
* удаляем контейнер командой `sudo docker rm compassionate_hofstadter` 
![2.7.png](screen/2.7.png)  

#### 11) Импортировать контейнер обратно через команду import  
* используем команду `sudo docker import -c 'CMD ["nginx", "-g", "daemon off;"]' container.tar part_2`  
![2.8.png](screen/2.8.png)   

#### 12) Запустить импортированный контейнер  
* запускаем контейнер командой `sudo docker run -d -p 80:80 -p 443:443 part_2`  
![2.9.png](screen/2.9.png)   

#### 13) Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx  
* открываем браузер и смотрим  
![2.10.png](screen/2.10.png) 
## Part 3. Мини веб-сервер  
* Пишем мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью `Hello World!`  
![3.1.png](screen/3.1.png)


* Пишем свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080  
![3.2.png](screen/3.2.png) 


* Качаем образ nginx, запускаем контейнер, копируем c файл сервера и conf файл nginx  
![3.3.png](screen/3.3.png)  


* Заходим в контейнер командой `docker exec -it ecstatic_kare bash`, обновляем репозитории, устанавливаем gcc, spawn-fcgi и libfcgi-dev  
![3.4.png](screen/3.4.png)
![3.41.png](screen/3.41.png) 


* Компилируем и запускаем сервер  
![3.5.png](screen/3.5.png) 


* проверяем нашу страничку  
![3.6.png](screen/3.6.png) 

## Part 4. Свой докер  
* Создаём докерфайл  
![4.1.png](screen/4.1.png)


* Создаём скрипт, выполняющий роль entrypoint  
![4.2.png](screen/4.2.png) 


* Собираем образ через `docker build` при этом указав имя и тег  
![4.3.png](screen/4.3.png)


* проверяем через `docker images`, что все собралось корректно  
![4.4.png](screen/4.4.png)


* прежде чем запускать вытащим из образа папку nginx для последующего маппинга  
![4.5.png](screen/4.5.png)
  


* Запускаем собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а  
![4.6.png](screen/4.6.png) 


* проверяем в браузере  
![4.7.png](screen/4.7.png)  


* Дописываем в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx  
![4.10.png](screen/4.10.png) 


* Перезапускаем докер образ и проверяем 
![4.9.png](screen/4.9.png)   
![4.8.png](screen/4.8.png)   

## Part 5. Dockle  
* сперва установим доклю  
![5.1.png](screen/5.1.png)


* потом проверим образ  
![5.2.png](screen/5.2.png) 


* C ошибкой CIS-DI-0010 можно было разобраться только сменой образа на Alpine  
* переписываем докерфайл  
![5.4.png](screen/5.4.png) 

* Ошибки устранены  
![5.3.png](screen/5.3.png)

## Part 6. Базовый Docker Compose  
* Перепишем скрипт entrypoint для второго контейнера, иначе он будет завершать работу после `docker-compose up`  
![6.1.png](screen/6.1.png)


* Перепишем _**nginx.conf**_ для проксирования  
![6.2.png](screen/6.2.png) 


* напишем **_docker-compose.yml_**  
![6.3.png](screen/6.3.png) 


* билдим командой `sudo docker-compose build`  
![6.4.png](screen/6.4.png) 


* запускаем командой `sudo docker-compose up`  
![6.5.png](screen/6.5.png) 


* проверяем в браузере  
![6.7.png](screen/6.7.png)  
![6.6.png](screen/6.6.png)  