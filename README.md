# Simple [Selenium Grid UI test](https://github.com/naz1719/Simple-grid-test) managed by Docker

Related to [medium post](https://medium.com/@nazarkhimin/selenium-grid-and-docker-25a79f0b9007)

How to use:
* Clone repo
* cd CI
* Start Jenkins `docker-compose -f jenkins-docker-compose.yml up --build`
    * Click on create new jobs
    *Enter the project name (e.g. docker-compose-test ), select Freestyle project and click OK
    * On Source Code Management, select Git and enter https://github.com/naz1719/Simple-grid-test.git as Repository URL
    * On the configuration page, click Add build step, then Execute shell
    * In the command box enter `sudo docker-compose -f docker-compose.yml up --build --abort-on-container-exit --scale chrome=3 --scale firefox=3`
    * Click Save and Build Now
    * Finally, click the job console output
    
# Simple [Selenium Grid UI test](https://github.com/naz1719/Simple-grid-test) managed by Selenoid
Steps to run Selenoid ([All availible commands](https://github.com/aerokube/cm/blob/master/docs/selenoid-commands.adoc))
* Download exe file from https://github.com/aerokube/cm/releases
* **_cm_windows_amd64.exe selenoid start --vnc --port 4444 --args "-limit 10"_** - Run Selenoid
After launching you can check status and configs: http://localhost:4444/status
* **_cm_windows_amd64.exe selenoid-ui start --port 8085_** - Run Selenoid UI


Before you run Selenoid by default download last two version of docker images for each browsers, but you can config browser versions by yourself.
You shoud navigate to **_C:\Users\khimin\\.aerokube\selenoid\browsers.json_** and config by example
```
{
  "firefox": {
    "default": "72.0",
    "versions": {
      "latest": {
        "image": "vnc_firefox:72.0",
        "port": "4444",
        "path": "/wd/hub",
        "tmpfs": {"/tmp":"size=512m"}
      }
    }
  },
  "chrome": {
    "default": "79.0",
    "versions": {
      "latest": {
        "image": "selenoid/vnc_chrome:79.0",
        "port": "4444",
        "tmpfs": {"/tmp":"size=512m"}
      }
    }
  }
}
```

