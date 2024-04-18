
## Overview

This repo contains the data, code, and analysis of the relationships between win rates and home advantage, goals scored and shots on target in football by analyzing the English Premier League 2023/24 season.

You can replicate the research by visiting the football data website: https://www.football-data.co.uk/, clicking 'England' under the 'ODDS & RESULTS: MAIN LEAUGE' section on the right hand side of the page, then downloading the Premier League excel data just below 'Season 2023/2024'. Another way is to simply copy and paste this url: https://www.football-data.co.uk/mmz4281/2324/E0.csv into your browser. 


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from https://www.football-data.co.uk/.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download and clean, and test data.
-   `parquet` contains the empty parquet file in an attempt to save the raw data into parquet but failed.

## Statement on LLM usage

The linear regression model and the figure 2,3 were constructed with the help of ChatGPT and the entire chat history is available in other/llm/usage.txt.
