# Web Automation Test

This is a  UI test automation suite of   http://the-internet.herokuapp.com using 
 **Ruby** + **Rspec** + **selenium-webdriver** 

### How to run test (relevant for linux and mac)


In order to run test you should :


1. Make sure you have  Ruby installed on your computer ( v. 2.4.0 or higher) and package manager, used for you OS.

##### If you have older Ruby version installed, you can update it using the following instructions (for OS X):

Open your terminal and run

`\curl -sSL https://get.rvm.io | bash -s stable` <br/>

When this is complete, you need to restart your terminal for the rvm to work.

Now, run `rvm list known`

This shows the list of versions of the ruby.

Now, run `rvm install ruby-2.4.2`

If you type `ruby -v` in the terminal, you should see ruby 2.4.2.

If it still shows you ruby 2.0., run `rvm use ruby-2.4.2 --default`


2. Go to test directoty and run `bundle`.  This will install all required gems and dependencies. All possible missing tools you should install via terminal and all instructions will be provided there after running `bundle`.
3. Run `rspec test_spec.rb` if you want to see the process and result in terminal, OR e.g. `rspec test_spec.rb > result.json` to generate the result file. It will be stored in the same test directory.



