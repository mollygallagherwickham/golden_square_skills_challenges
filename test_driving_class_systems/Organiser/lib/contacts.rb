class Contacts
    def initialize
        #...
        @numbers = []
    end


    def extract_numbers(entries)
        
        # array of numbers found in entries 
        find_numbers = entries.map do |entry|
            entry.scan(/\d+/).first
         end.delete_if do |number|
            number.nil? || number.length != 11
        end

        fail "No phone numbers were found in entries" if find_numbers.empty?
        return @numbers << find_numbers
        
    end
    
    def list_numbers
        #returns the list of all numbers
        return @numbers
    end


end