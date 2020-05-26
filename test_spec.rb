require '42'
require 'selenium-webdriver'
require 'nokogiri'
require 'pry'
require 'page-object'

class TheInternetPage


  include PageObject


  BROWSER = Selenium::WebDriver.for(:chrome)


  describe "When I go to the login page" do

    context 'and fill in valid user credentials'

    it "it returns correct info-message" do
      BROWSER.get('http://the-internet.herokuapp.com/login')
      BROWSER.find_element(:id, 'username').send_key("tomsmith")
      BROWSER.find_element(:id, 'password').send_key("SuperSecretPassword!")
      BROWSER.find_element(:css, '.radius').submit

      page = Nokogiri::HTML(BROWSER.page_source)
      message = page.css(".flash.success").map { |tag| tag.text.strip }.first[0...-1].strip

      expect(message).to eq("You logged into a secure area!"), "#### No proper info message"
    end

    context 'and fill in in-valid user name'

    it "it returns an proper username error" do

      BROWSER.get('http://the-internet.herokuapp.com/login')
      BROWSER.find_element(:id, 'username').send_key("NOT-tomsmith")
      BROWSER.find_element(:id, 'password').send_key("SuperSecretPassword!")
      BROWSER.find_element(:css, '.radius').submit

      page = Nokogiri::HTML(BROWSER.page_source)
      error = page.css(".flash.error").map { |tag| tag.text.strip }.first[0...-1].strip

      expect(error).to eq("Your username is invalid!"), "#### No proper ERROR"
    end

    context 'and fill in in-valid password'

    it "it returns an proper password error" do

      BROWSER.get('http://the-internet.herokuapp.com/login')
      BROWSER.find_element(:id, 'username').send_key("tomsmith")
      BROWSER.find_element(:id, 'password').send_key("Wrong-SuperSecretPassword!")
      BROWSER.find_element(:css, '.radius').submit

      page = Nokogiri::HTML(BROWSER.page_source)
      error = page.css(".flash.error").map { |tag| tag.text.strip }.first[0...-1].strip

      expect(error).to eq("Your password is invalid!"), "#### No proper ERROR"
    end


  end

  describe "When I go to Hover page " do

    context 'and hover over the 3 avatar pictures'

    it "it returns name for user 1" do
      BROWSER.get('http://the-internet.herokuapp.com/hovers')
      page = Nokogiri::HTML(BROWSER.page_source)


      user_avatar_1 = BROWSER.find_element(:css, ".figure:nth-child(3)")
      BROWSER.action.move_to(user_avatar_1).perform
      user_name_1 = page.css(".figure:nth-child(3) h5").map { |tag| tag.text.strip }.first.to_s

      expect(user_name_1).to eq("name: user1"), "#### No name displayed"
    end

    it "it returns name for user 2" do
      user_avatar_2 = BROWSER.find_element(:css, ".figure:nth-child(4)")
      BROWSER.action.move_to(user_avatar_2).perform
      page = Nokogiri::HTML(BROWSER.page_source)
      user_name_2 = page.css(".figure:nth-child(4) h5").map { |tag| tag.text.strip }.first.to_s

      expect(user_name_2).to eq("name: user2"), "#### No name displayed"
    end

    it "it returns name for user 3" do
      user_avatar_3 = BROWSER.find_element(:css, ".figure:nth-child(5)")
      BROWSER.action.move_to(user_avatar_3).perform
      page = Nokogiri::HTML(BROWSER.page_source)
      user_name_3 = page.css(".figure:nth-child(5) h5").map { |tag| tag.text.strip }.first.to_s

      expect(user_name_3).to eq("name: user3"), "#### No name displayed"
    end

  end


  describe "When I go to Tables page" do

    context 'and sort last name'

    it "it returns  last names are ordered alphabetically" do

      BROWSER.get('http://the-internet.herokuapp.com/tables')

      column = BROWSER.find_element(:css, ".last-name")
      column.click
      page = Nokogiri::HTML(BROWSER.page_source)
      names = page.css(".last-name").map { |tag| tag.text.strip }.drop(1)

      expect(names).to eq(names.sort), "#### Names are not sorted ASC"

    end

    context 'and sort last name DESC'

    it "it returns  last names are ordered alphabetically DESC" do

      column = BROWSER.find_element(:css, ".last-name")
      column.click
      page = Nokogiri::HTML(BROWSER.page_source)
      names = page.css(".last-name").map { |tag| tag.text.strip }.drop(1)

      expect(names).to eq(names.sort.reverse), "#### Names are not sorted DESC"
    end
  end

end



