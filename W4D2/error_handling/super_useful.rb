# PHASE 2
def convert_to_int(str)
  begin
    raise TypeError if !str.is_a?(Integer) 
    Integer(str)
    
  rescue TypeError
    str = text_to_number(str)
    return "not an number" if str.nil?
    retry 
  end
end

def text_to_number(num_text)
  hash = {
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
    }
  return hash[num_text] if hash.has_key?(num_text)
  nil
end

# PHASE 3

class NotAFruitError < StandardError ; end 

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  begin
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    else
      raise NotAFruitError 
    end
  rescue NotAFruitError
    puts "This isn't a fruit."
    if feed_coffee?
      puts "Thanks for the coffee."
      puts "Would you like to try to feed me again?"
      puts "Feed me a fruit! (Enter the name of a fruit): "
      maybe_fruit = gets.chomp
      retry
    else
      puts "What??? No Coffee???"
      puts "I don't like you anymore so I'm going to crush you like a banana."
    end
  end
end

def feed_coffee?
  puts "If you give me coffee, I'll let you feed me agan!"
  
  puts "Will you give me coffee? Y/N"
  response = gets.chomp 
  response == "Y" ? true : false 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  
  puts "Feed me a fruit! (Enter the name of a fruit): "
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Not a best friend unless you've known them for 5 or more years." if yrs_known < 5
    raise "Missing inputs. Please check again before creating a new instance." if name.length <= 0 || fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


