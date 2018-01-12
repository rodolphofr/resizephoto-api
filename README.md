# Resize Photos API

Your mission:

* Consume a webservice endpoint (http://54.152.221.29/images.json) that returns a JSON of photos. There are 10 photos.
* Generate three different formats for each photo. The dimensions are: small (320x240), medium (384x288) and large (640x480).
* Write a webservice endpoint that lists (in JSON format) all the ten photos with their respective formats, providing their URLs.

### Language choice
I used Ruby because I'm more familiar and because it's the language I like to work with.
The choice was also based on ease integration with MongoDB.

### Dependencies
* ruby (2.3.1 or higher)
* rails (5.0.0.1 or higher)
* mongodb (3.4.4 or higher)
* ImageMagick ([link](https://www.imagemagick.org/script/download.php))

### How to run this solution?

Clone this repository
```
$ git clone https://github.com/rodolphofr/resizephoto-api.git
```

Run bundler to get dependencies
```
$ bundle install
```

Make sure mongo is running
```
$ brew services start mongodb
```

To import images from Webservice
```
$ rake images:import
```

Start application
```
$ rails s 
```

### Run Test Suite
```
$ rspec
```
