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
    SarwarConsults::Service.all.each.with_index(1) do |service, i|
     puts "#{i}. #{service.title}"
    end
  end

  def content(service)
      puts "#{service.title}"
      puts ""
      puts service.scrape_content
      puts""
      puts "For more information, click on: #{service.url}"
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
    puts "-----"
    input = gets.strip
    puts "-----"
      if input.to_i > 0
          if service = SarwarConsults::Service.find(input.to_i)
            content(service)
          end
      end
      puts ""
      puts "Would you like to sign up?"
      puts ""
      answer = gets.strip
      if ["Y", "YES"].include?(answer.upcase)
        puts ""
        puts "Click on the link below to sign up!"
        puts ""
        puts SarwarConsults::Service.signup
      end
      puts ""
      puts "Would you like to exit or choose another service title?"
      puts ""
      input = gets.strip
     end
    end

end
