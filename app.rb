require "sinatra"
require "sinatra/reloader"
require "./lib/numbers_to_words"
also_reload "lib/**/*.rb"

get "/" do
  erb(:index)
end

get "/translation" do
  numbers = NumbersToWords.new
  @translation = numbers.transform_number(params.fetch("translation"))
  erb(:translation)
end
