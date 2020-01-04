# Simple [Selenium Grid UI test](https://github.com/naz1719/Simple-grid-test) managed by Doc

Related to [medium post](https://medium.com/@nazarkhimin/selenium-grid-and-docker-25a79f0b9007)

How to use:
* Clone repo
* cd CI
* Start Jenkins `docker-compose -f jenkins-docker-compose.yml up --build`
    * Click on create new jobs
    *Enter the project name (e.g. docker-compose-test ), select Freestyle project and click OK
    * On Source Code Management, select Git and enter https://github.com/naz1719/Simple-grid-test.git as Repository URL
    * On the configuration page, click Add build step, then Execute shell
    * In the command box enter
    * `sudo docker-compose -f docker-compose.yml up --build --abort-on-container-exit --scale chrome=3 --scale firefox=3`
    * Click Save and Build Now
    * Finally, click the job console output
    
