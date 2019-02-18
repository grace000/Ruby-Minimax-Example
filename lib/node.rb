class Node
    attr_accessor :score, :children
    def initialize(initial_score = nil, children = [])
        @score = initial_score
        @children = children
    end

    def add_child(node)
        children << node
    end

    def score_node(node)
        if node.score == nil
            child_array = node.children.map { |child| maximize(child) }
            child_array.max
        else
            node.score
        end
    end

    def maximize(node)
        if node.score == nil
            child_array = node.children.map { |child| minimize(child) }
            child_array.min
        else
            node.score
        end
    end

    def minimize(node)
        if node.score == nil
            child_array = node.children.map { |child| maximize(child) }
            child_array.max
        else
            node.score
        end
    end
end