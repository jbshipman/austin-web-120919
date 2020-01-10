require 'pry'
require 'rest-client'
require 'json'

def welcome
  puts "Welcome the Book Searcher"
  puts "Please enter a search term:"
end

def get_user_input
  gets.chomp
end

def fetch_books(search_term)
  response = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{search_term}")
  #binding.pry
  JSON.parse(response.body)
end

def get_title(book)
  #binding.pry
  book["volumeInfo"]["title"]
end

def get_authors(book)
  if book["volumeInfo"]["authors"]
    book["volumeInfo"]["authors"].join(" and ")
  else
    "No authors found"
  end
end

def get_description(book)
  if book["volumeInfo"]["description"]
    book["volumeInfo"]["description"][0..140] + "..."
  else
    "No description found"
  end
end

  def print_book(title, authors, description)
    puts "*" * 30
    puts "Title: #{title}"
    puts "Authors: #{authors}"
    puts "Description: #{description}"
  end

  def run
    welcome
    search_term = get_user_input

    fetch_books(search_term)["items"].each do |book|
      #binding.pry
      title = get_title(book)
      authors = get_authors(book)
      description = get_description(book)

      print_book(title, authors, description)
    end
  end


run
# RestClient.get 'http://example.com/resource'

#GET Request - get some data from a server/API

#Server Response - data that comes back after a request is made

#Developer Console - Your new home (integrated browser environment)

#APIs - Data for a machine to read

#JSON - JavaScript Object Notation -- String

#Ruby Gems - reusable code
