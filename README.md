# Emma Wilson's BIOS611 Final Project README

### Purpose of this project:
This shark attack database was downloaded from kaggle at: https://www.kaggle.com/felipeesc/shark-attack-dataset

The data was put together by the Shark Research Institute, Inc. as a conservation tool. Sharks have traditionally received a lot of negative attention in the media as they are seen by the public as dangerous enemies. By compiling all existing information about historical shark attacks dated back to the 1800s, researchers hope to create this tool that can help better understand where and why shark attacks occur to help better understand them. This tool can be useful to shark conservationists studying behavior and patterns, to medical professionals understanding how to treat shark attack injuries, and for the media to help lessen the public's irrational fear of sharks. As the database authors note, "more people drown in a single year in the United States than have been killed by sharks throughout the entire world in the last two centuries."

For my project I am attempting to discern some patterns from these shark attacks in order to better understand their patterns and factors that influence attacks and human fatalities. One could imagine that certain activities in certain locations are more dangerous than others, perhaps the sharks are more active or aggressive during certain times of the year, or other factors may contribute to the likelihood of surviving a shark attack. Understanding many of these factors could help oceangoers take steps to better inform and protect themselves and allow them to more safely enjoy their leisure time, without taking drastic steps of further reducing shark populations as a knee-jerk reaction to avoidable shark attacks.

### Running this project:

First, clone or fork this repo, open a terminal and navigate to this directory. 

Then, build the docker image by typing:
```
docker build . -t 611-final-wilson
```

Next, run the docker image by typing:

```
docker run -e PASSWORD=pw -p 8787:8787 -v $(pwd):/home/rstudio/project -t 611-final-wilson
```

Once the image is running, connect to it by visiting
localhost:8787 in your browser. 
username:rstudio password:pw

To build the final report, open the terminal in RStudio and type

```
make reports/final_shark_report.pdf
```

*Note that if there is an error with UTF-8 encoding of the data, simply download the source_data/shark_attacks.csv file and re-save it as a CSV UTF-8 file using either Microsoft Excel or Google Sheets.*
