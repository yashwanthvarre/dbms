- Eclipse is a Java-based application and it requires a Java runtime environment (JRE) to be installed in order to run
sudo apt install default-jre

- Download and install the Eclipse snap package on your system, by typing:
```sh
sudo snap install --classic eclipse
```

- After installation type “eclipse” In the command line and run it or search in the menu.

- Select the workspace where you want to store the code.


- Click on launch and start your new java project.




# Steps for connecting it to a database in your local PC.
- Go to this web page: http://www.mysql.com/downloads/connector/j/
- Press the download button next to the “Platform Independent (Architecture Independent), ZIP Archive” version. (Or the TAR version if you prefer; it doesn’t really matter.)
- The next page will ask you to create an account. Instead, click the little blue link on the bottom that says “No thanks, just start my download.”
- Open the .zip file you just downloaded, and look for a file inside named something like mysql-connector-java-xxxx-bin.jar. Copy this file into your project directory (from the Location box in step 3 of the last section).
- Now that we have the driver, we need to tell your project about it. Go back to Eclipse, right click on the project, and select Build Path → Add External Archive
- Select mysql-connector-java-xxxx-bin.jar and press Open
- Now we’re ready to configure the project for your copy of MySQL and run it!

# Creating a new java class and running it in eclipse:
- Right click on the project name and select  New->Class from the context menu.
- When the New Class dialog appears, enter “paperreview” as the class name and check the box public static void main(String[] args) .
- Click on the  Finish button.
- Right click on the file with the  main method, and from the context menu select the Run->Java Application menu option.
- The program runs. Any console output is directed to a window at the bottom of the screen.
      
      
