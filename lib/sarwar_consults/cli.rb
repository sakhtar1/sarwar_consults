# CLI Controller >> user interaction and dealing with input
require 'pry'
class SarwarConsults::CLI

  def call
    introduction
    services
  end

  def introduction
    puts "Welcome to Sarwar Consults!"
    puts "To exit at anytime, type exit."
    puts "What type of services are you looking for?"
  end

  def list_services
    list = SarwarConsults::Service.scrape_services
    list.each.with_index(1){|li,i| puts "#{i}. #{li}"}
  end

  def services
    list_services
    input = nil
    while input != "exit"
     puts ""
     puts "Enter a number to view specific services."
     puts ""
     puts "Enter exit to end the program."
     puts "To sign up at anytime, type sign up."
     input = gets.strip

     if input == "sign up"
        puts "Click on the link below to sign up!"
        puts SarwarConsults::Service.scrape_signup
     elsif
        services = SarwarConsults::Service.scrape_services
        urls = SarwarConsults::Service.scrape_url
        if input.to_i <= 13
          service = services[input.to_i-1].strip
          url = urls[input.to_i-1].strip

          puts service
          puts SarwarConsults::Service.scrape_content(url)
          puts "For more information, click on: #{url}"
        end
      elsif input == "exit"
         puts "Until next time!"
      else
         puts "Can you repeat?"
      break
      end
   end
 end


end
