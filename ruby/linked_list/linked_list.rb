class LinkedList
    attr_reader :head

    def initialize(first_node = nil)
        @head = first_node
    end

    def empty?
        @head.nil?
    end

    def nonempty?
        !empty?
    end
end
