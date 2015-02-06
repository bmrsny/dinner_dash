http://burrito-bombers.herokuapp.com

![ScreenShot](./app/assets/images/burrito-bombers-home.pdf?raw=true "Burrito Bombers")

Burrito Bombers is an ecommerce web application designed for a
Downtown Denver delivery business.  This 10 day project was
constructed by Bhargavi Satpathy, Brandon Mrsny, Chris Luhring
and Laura Whalin.  The group created detailed wireframes using
gliffy.com and utilized waffle.io as their project management
tool: https://waffle.io/bhargavisatpathy/dinner_dash

Burrito Bombers was built using TDD to drive development and includes
full cart functionality, administrative tools, user authentication and
authorization and a custom front end. Additional project
specifications can be found here:
http://tutorials.jumpstartlab.com/projects/dinner_dash.html


Checkout our project: "git clone https://github.com/bhargavisatpathy/dinner_dash.git"

Install any missing gems: "bundle"

Make sure PostgreSQL is running on your local machine.

Initialize the database using the command "rake db:rebuild" to create,
migrate and seed the application.

Start your local server using: "unicorn"

Then go to 'localhost:8080' to checkout the site.

Burrito Bombers was built on Rails 4.2.0. and depends on Mapbox, which
was used to create the delivery zone map on the homepage.

Run the test suite using: "rspec"
