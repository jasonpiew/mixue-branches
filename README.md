# Introduction
This project is designed to allow users to find the location of Mixue, a popular Chinese beverage, using the Google Maps API and Python. Mixue is a traditional Chinese drink made from fermented grains and is often served at festivals and celebrations.

# Requirements
To use this project, you will need to have the following installed on your machine:

- Python 3.x
- The googlemaps Python library

# Getting Started
- Obtain a Google Maps API key by following the instructions [here](https://developers.google.com/maps/documentation/javascript/get-api-key)
- In the script file, replace YOUR_API_KEY with your actual API key.
- refer to the notebook script

# Customizing the Search
You can customize the search by modifying the location and radius parameters in the notebook script file. The location parameter determines the center of the search area, and the radius parameter determines the size of the search area (in meters).

# Further Reading
For more information on using the Google Maps API with Python, you can refer to the official documentation.

### Problems
I have to run the notebook multiple times since Google Maps API restricts access to 60 results per run, the problem is that I unsuccessfully filtering out the same results from happening twice, If you have an approach to filter out the places_id to appear more than once, please do let me know, Thank you and happy learning :D
