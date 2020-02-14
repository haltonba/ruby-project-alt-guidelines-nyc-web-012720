class CommandLine

    @@prompt = TTY::Prompt.new

    @@main_user = nil

    def welcome
    puts Rainbow("\n\n                888                               .d8888b.           888    888          888 888                     d8b                          
                888                              d88P  '88b          888    888          888 888                     88P                          
                888                              Y88b. d88P          888    888          888 888                     8P                           
                888       .d88b.  888  888        'Y8888P'           8888888888  8888b.  888 888888  .d88b.  88888b. '  .d8888b                   
                888      d88''88b 888  888       .d88P88K.d88P       888    888     '88b 888 888    d88''88b 888 '88b   88K                       
                888      888  888 888  888       888'  Y888P'        888    888 .d888888 888 888    888  888 888  888   'Y8888b.                  
                888      Y88..88P Y88b 888       Y88b .d8888b        888    888 888  888 888 Y88b.  Y88..88P 888  888        X88                  
                88888888  'Y88P'   'Y88888        'Y8888P' Y88b      888    888 'Y888888 888  'Y888  'Y88P'  888  888    88888P'
         \n\n
         88888888888 d8b          888               888          8888888888                   888                                          
             888     Y8P          888               888          888                          888                                          
             888                  888               888          888                          888                                          
             888     888  .d8888b 888  888  .d88b.  888888       8888888    888  888  .d8888b 88888b.   8888b.  88888b.   .d88b.   .d88b.  
             888     888 d88P'    888 .88P d8P  Y8b 888          888        `Y8bd8P' d88P'    888 '88b     '88b 888 '88b d88P'88b d8P  Y8b 
             888     888 888      888888K  88888888 888          888          X88K   888      888  888 .d888888 888  888 888  888 88888888 
             888     888 Y88b.    888 '88b Y8b.     Y88b.        888        .d8''8b. Y88b.    888  888 888  888 888  888 Y88b 888 Y8b.     
             888     888  'Y8888P 888  888  'Y8888   'Y888       8888888888 888  888  'Y8888P 888  888 'Y888888 888  888  'Y88888  'Y8888  
                                                                                                                             888          
                                                                                                                        Y8b d88P          
                                                                                                                         'Y88P'           
                                                                                                                         ").royalblue
    end 




    def introduction
        if !@@main_user
            attendee_name = @@prompt.ask("Enter your name:") 
            # while attendee_name != String
            #     attendee_name = @@prompt.ask("Please enter a valid name ") 
            # end 
            @@main_user = Attendee.find_or_create_by(name: attendee_name)
            puts "Welcome #{attendee_name}! \n What would you like to do? \n"
        end
        @@main_user
    end

    def main_menu_options
        input = @@prompt.select("MAIN MENU") do |menu|
            menu.default 1

            menu.choice "Order Tickets", 1
            menu.choice "View Existing Ticket Orders", 2
            menu.choice "Remove A Ticket From Order", 3
            menu.choice "Exit", 4
        end 
    end

    def menu_controller
        user_menu_input = main_menu_options
    
        case user_menu_input
        when 1
            quantity_selector
            menu_controller
        when 2
            view_tickets
            menu_controller
        when  3
            delete_ticket
            puts "Your ticket has been removed from your order. Thank you for choosing Lou & Halton's Ticket Exchange!"
            menu_controller
        when 4
            puts "Thank you for choosing Lou & Halton's Ticket Exchange!"
        end 
    end

    def event_search_input
        input = nil
        input = @@prompt.ask("Find tickets for:")
    end

    def api_request
        search = event_search_input
        tickets_string = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=2Y59hZVTykKgUR7cQj24G8vJEITAFVLM&keyword=#{search}&locale=*&size=10")
        tickets_hash = JSON.parse(tickets_string)
    end

    def ticket_assembler
        temp = []
        ticket_hash_access = api_request["_embedded"]["events"]
        ten_events = ticket_hash_access
        ten_events.each do |event|
            searched_date = event["dates"]["start"]["localDate"].slice(5..10)
            searched_time = event["dates"]["start"]["localTime"].slice(0..4)
            searched_event_name = event["name"]
            searched_venue = event["_embedded"]["venues"][0]["name"]
            searched_result = Event.new
            searched_result.date = searched_date
            searched_result.time = searched_time
            searched_result.event_name = searched_event_name
            searched_result.venue = searched_venue
            temp << searched_result
        end
        selected = @@prompt.select("MAKE A SELECTION\n ") do |menu|
            menu.default 1
            menu.choice "Event: #{temp[0].event_name} \n  Venue: #{temp[0].venue} \n  Date: #{temp[0].date} | Time: #{temp[0].time} \n" + ("=" * 60), 1
            menu.choice "Event: #{temp[1].event_name} \n  Venue: #{temp[1].venue} \n  Date: #{temp[1].date} | Time: #{temp[1].time} \n" + ("=" * 60), 2
            menu.choice "Event: #{temp[2].event_name} \n  Venue: #{temp[2].venue} \n  Date: #{temp[2].date} | Time: #{temp[2].time} \n" + ("=" * 60), 3
            menu.choice "Event: #{temp[3].event_name} \n  Venue: #{temp[3].venue} \n  Date: #{temp[3].date} | Time: #{temp[3].time} \n" + ("=" * 60), 4
            menu.choice "Event: #{temp[4].event_name} \n  Venue: #{temp[4].venue} \n  Date: #{temp[4].date} | Time: #{temp[4].time} \n" + ("=" * 60), 5
            menu.choice "Event: #{temp[5].event_name} \n  Venue: #{temp[5].venue} \n  Date: #{temp[5].date} | Time: #{temp[5].time} \n" + ("=" * 60), 6
            menu.choice "Event: #{temp[6].event_name} \n  Venue: #{temp[6].venue} \n  Date: #{temp[6].date} | Time: #{temp[6].time} \n" + ("=" * 60), 7
            menu.choice "Event: #{temp[7].event_name} \n  Venue: #{temp[7].venue} \n  Date: #{temp[7].date} | Time: #{temp[7].time} \n" + ("=" * 60), 8
            menu.choice "Event: #{temp[8].event_name} \n  Venue: #{temp[8].venue} \n  Date: #{temp[8].date} | Time: #{temp[8].time} \n" + ("=" * 60), 9
            menu.choice "Event: #{temp[9].event_name} \n  Venue: #{temp[9].venue} \n  Date: #{temp[9].date} | Time: #{temp[9].time} \n" + ("=" * 60), 10
        end
        temp[selected - 1]
    end

    def quantity_selector
        t = ticket_assembler
        puts "How many tickets would you like to purchase?"
        ticket_quantity = gets.chomp.to_i

        event = Event.find_or_create_by(event_name: t.event_name, venue: t.venue, date: t.date, time: t.time)
        ticket_quantity.times {|i| Ticket.create(attendee_id: @@main_user.id, event_id: event.id)}

        puts "Great! Your selection is confirmed. \nYour #{ticket_quantity} tickets to attend #{t.event_name} live at the #{t.venue} are reserved."
        puts "Be sure to arrive with $#{ticket_quantity * 20} at the door." 
    end

    def view_tickets  
        attendees_events = @@main_user.reload.events
        display_array = []
        attendees_events.uniq.select do |event|
            display_array << event
        end
        compare_array = []
        display_array.each do |e|
            attendees_events.each do |d|
                if d == e
                    compare_array << e
                end
            end
            amount = compare_array.count
            puts "  Event: #{e.event_name} \n  Venue: #{e.venue} \n  Date: #{e.date} | Time: #{e.time} | Quantity: #{amount} | Total: $#{amount * 20}\n" + ("=" * 60)
            compare_array = []
        end
    end

    def delete_ticket

        events_array = @@main_user.events 
        delete_ticket = @@main_user.tickets

        selected = @@prompt.select("DELETE A TICKET\n ") do |menu|
            j=0
            events_array.each do |i| 
                menu.default 1
                menu.choice "Event: #{events_array[j].event_name} \n  Venue: #{events_array[j].venue} \n  Date: #{events_array[j].date} | Time: #{events_array[j].time} \n" + ("=" * 60), (j+1)
                j+=1
            end 
        end
        Ticket.find(delete_ticket[selected - 1].id).delete
        
    end 

    
end