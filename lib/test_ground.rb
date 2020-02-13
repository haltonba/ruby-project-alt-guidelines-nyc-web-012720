# require 'pry'
# require 'json'
# require 'rest-client'
# require 'tty-prompt'

# @@prompt = TTY::Prompt.new

# class CommandLinea
#     @@selected_object = []
#     @@attendee = nil
    

#     def event_search_input
#         input = nil
#         input = @@prompt.ask("Find tickets for:")
#     end

#     def api_request
#         search = event_search_input
#         tickets_string = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=2Y59hZVTykKgUR7cQj24G8vJEITAFVLM&keyword=#{search}&locale=*&size=10")
#         tickets_hash = JSON.parse(tickets_string)
#     end

#     def ticket_assembler
#         temp = []
#         ticket_hash_access = api_request["_embedded"]["events"]
#         ten_events = ticket_hash_access
#         ten_events.each do |event|
#             searched_date = event["dates"]["start"]["localDate"].slice(5..10)
#             searched_time = event["dates"]["start"]["localTime"].slice(0..4)
#             searched_event_name = event["name"]
#             searched_venue = event["_embedded"]["venues"][0]["name"]
#             searched_result = Event.new
#             searched_result.date = searched_date
#             searched_result.time = searched_time
#             searched_result.event_name = searched_event_name
#             searched_result.venue = searched_venue
#             temp << searched_result
#         end
#         selected = @@prompt.select("MAKE A SELECTION\n ") do |menu|
#             menu.default 1
#             menu.choice "Event: #{temp[0].event_name} \n  Venue: #{temp[0].venue} \n  Date: #{temp[0].date} | Time: #{temp[0].time} \n" + ("=" * 60), 1
#             menu.choice "Event: #{temp[1].event_name} \n  Venue: #{temp[1].venue} \n  Date: #{temp[1].date} | Time: #{temp[1].time} \n" + ("=" * 60), 2
#             menu.choice "Event: #{temp[2].event_name} \n  Venue: #{temp[2].venue} \n  Date: #{temp[2].date} | Time: #{temp[2].time} \n" + ("=" * 60), 3
#             menu.choice "Event: #{temp[3].event_name} \n  Venue: #{temp[3].venue} \n  Date: #{temp[3].date} | Time: #{temp[3].time} \n" + ("=" * 60), 4
#             menu.choice "Event: #{temp[4].event_name} \n  Venue: #{temp[4].venue} \n  Date: #{temp[4].date} | Time: #{temp[4].time} \n" + ("=" * 60), 5
#             menu.choice "Event: #{temp[5].event_name} \n  Venue: #{temp[5].venue} \n  Date: #{temp[5].date} | Time: #{temp[5].time} \n" + ("=" * 60), 6
#             menu.choice "Event: #{temp[6].event_name} \n  Venue: #{temp[6].venue} \n  Date: #{temp[6].date} | Time: #{temp[6].time} \n" + ("=" * 60), 7
#             menu.choice "Event: #{temp[7].event_name} \n  Venue: #{temp[7].venue} \n  Date: #{temp[7].date} | Time: #{temp[7].time} \n" + ("=" * 60), 8
#             menu.choice "Event: #{temp[8].event_name} \n  Venue: #{temp[8].venue} \n  Date: #{temp[8].date} | Time: #{temp[8].time} \n" + ("=" * 60), 9
#             menu.choice "Event: #{temp[9].event_name} \n  Venue: #{temp[9].venue} \n  Date: #{temp[9].date} | Time: #{temp[9].time} \n" + ("=" * 60), 10
#         end
#         return temp[selected - 1]
#     end

#     def quantity_selector(ticket_assembler)
#         t = @@selected_object[0]

#         if !@@selected_object[0].quantity
#             puts "How many tickets would you like to purchase?"
#             ticket_quantity = gets.chomp.to_i
#             ticket_quantity.times do (Ticket.find_or_create_by(event_name: t.event_name, venue: t.venue, date: t.date, time: t.time) )
#             t.quantity = ticket_quantity
#             @@selected_object.pop
#             @@selected_object << t
#         end 
#         t
#     end

#     def order_lookup (attendee)
#         # attendee = get_attendee_name
#         ticket = quantity_selector
#         # binding.pry

#         Order.find_or_create_by(attendee_id: @@attendee.id, ticket_id: ticket.id)

#     end 

#     def purchase_confirmation
#         # binding.pry
#         puts "Great! Your selection is confirmed. \nYour #{@@selected_object[0].quantity} tickets to attend #{@@selected_object[0].event_name} live at the #{@@selected_object[0].venue} are reserved."
#         # binding.pry
#         puts "Be sure to arrive with $#{@@selected_object[0].quantity * 20} at the door." 
#     end


#     # def view_order
#     #     if attendee.id == self.id 
#     #         #display the attendee's tickets corresponding with their order
#     #         Order.all.find do |order|
#     #             order.attendee_id == self.id 
#     #         end.select do |order|
#     #             order.ticket_id
#     #         end 
#     #     end 

#     # end 







# # end 

