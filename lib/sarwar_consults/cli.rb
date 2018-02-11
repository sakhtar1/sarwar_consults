# CLI Controller >> user interaction and dealing with input
require 'pry'
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

  def list_services
    list = SarwarConsults::Service.scrape_services
    list.each.with_index(1){|li,i| puts "#{i}. #{li}"}
  end

  def services
    list_services
    puts ""
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

     services = SarwarConsults::Service.scrape_services
     urls = SarwarConsults::Service.scrape_url
      if input.to_i <= 13
        service = services[input.to_i-1].strip
        url = urls[input.to_i-1].strip

        puts service
        puts ""
        puts SarwarConsults::Service.scrape_content(url)
        puts ""
        puts "For more information, click on: #{url}"
        puts ""
        puts "Would you like to sign up?"
        puts ""
        answer = gets.strip
        if ["Y", "YES"].include?(answer.upcase)
          puts ""
          puts "Click on the link below to sign up!"
          puts ""
          puts SarwarConsults::Service.scrape_signup
        end
      end
      puts ""
      puts "Would you like to exit or see the service list again?"
      puts ""
      input = gets.strip
    end

 end


end
