# CLI Controller >> user interaction and dealing with input
#require 'pry'
class SarwarConsults::CLI

  def call
    introduction
    services
  end

  def introduction
    puts "Welcome to Sarwar Consults!"
    puts "What type of services are you looking for?"
    puts ""
  end

  def list
    SarwarConsults::Service.all.each.with_index(1) do |s, i|
     puts "#{i}. #{s.title}"
    end
  end

  def content_list(i)
    SarwarConsults::Service.all.each.with_index(1)  do |s,i|
      puts "#{i}. #{s.title}"
      puts "info: #{s.content}"
      puts "url: #{s.url}"
    end
  end

  def services
    puts ""
    list
    input = nil
    while input != "exit"
    puts ""
    puts "Enter a number to view specific services."
    puts ""
    puts "Enter exit to end the program."
    puts "To sign up at anytime, type sign up."
    puts "-----"
    input = gets.strip
    puts "-----"
      if input == "list"
            list
      elsif input.to_i == 0
          if SarwarConsults::Service.find_by_title(input)
            content_list(input)
          end
      elsif input.to_i > 0
          if SarwarConsults::Service.find(input.to_i)
            content_list(input)
          end
      end
        puts "Goodbye!!!"
     end
    end
end
