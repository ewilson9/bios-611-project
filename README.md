# Emma Wilson's BIOS611 Midterm README



First, clone or fork this repo, open a terminal and navigate to this directory. 

Then, build the docker image by typing:
```
docker build . -t 611-midterm-wilson
```

Next, run the docker image by typing:

```
docker run -e PASSWORD=<your_password> -p 8787:8787 -v $(pwd):/home/rstudio/project -t 611-midterm-wilson
```

Once the image is running, connect to it by visiting
localhost:8787 in your browser. 
username:rstudio password:<your_password>

To build the final report, open the terminal in RStudio and type

```
cd project/
make reports/midterm_report.pdf
```

*Note that if there is an error with UTF-8 encoding of the data, simply download the source_data/shark_attacks.csv file and re-save it as a CSV UTF-8 file using either Microsoft Excel or Google Sheets.*
