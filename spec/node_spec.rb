require 'node'

describe Node do
    describe "#initialize" do
        it "return initialized score of 1" do
            node = Node.new(1)
        
            expect(node.score).to eq(1)
        end

        it "returns initial node with no children" do
            node = Node.new(1)

            expect(node.children).to eq([])
        end

        it "returns child when initialized with one child" do
            child = Node.new(score = 1)
            parent = Node.new(score = nil, children = [child])

            expect(parent.children).to eq([child])
        end

        it "returns two children when initialized with two children" do
            child_a = Node.new(score = 1)
            child_b = Node.new(score = 0)
            parent = Node.new(score = nil, children = [child_a, child_b])

            expect(parent.children).to eq([child_a, child_b])
        end
    end

    describe "#add_child" do
        it "adds child node to children" do
            node = Node.new
            child = Node.new(score = 5)
            node.add_child(child)

            expect(node.children.size).to eq(1)
        end
    end

    describe "#score_node" do
        it "returns the score of a node with no children" do
            parent = Node.new(score = 5)

            expect(parent.score_node(parent)).to eq(5)
        end

        it "returns node score of node with one child" do
            
            child = Node.new(score = 5)
            parent = Node.new(score = nil)
            parent.add_child(child)
            
            expect(parent.score_node(parent)).to eq(5)
        end

        it "returns node score of first child where there is more than one child" do
            parent = Node.new (score = nil)
            child_1 = Node.new(score = 12)
            child_2 = Node.new(score = 10)

            parent.add_child(child_1)
            parent.add_child(child_2)
            
            expect(parent.score_node(parent)).to eq(12)
        end

        it "returns the score of a linked list of nodes" do
            child = Node.new(score = 20)
            parent = Node.new(score = nil, children = [child])
            grandparent = Node.new(score = nil, children = [parent])

            expect(grandparent.score_node(grandparent)).to eq(20)
        end

        it "returns the lowest score of a game with two moves and two possible end states" do
            child_1 = Node.new(score = 12)
            child_2 = Node.new(score = 5)
            parent = Node.new(score = nil, children = [child_1, child_2])
            grandparent = Node.new(score = nil, children = [parent])

            expect(grandparent.score_node(grandparent)).to eq(5)
        end

        it "returns the lowest score of a game with two moves and three possible end states" do
            child_1 = Node.new(score = 12)
            child_2 = Node.new(score = -10)
            child_3 = Node.new(score = 5)
            parent = Node.new(score = nil, children = [child_1, child_2, child_3])
            grandparent = Node.new(score = nil, children = [parent])

            expect(grandparent.score_node(grandparent)).to eq(-10)
        end

        it "returns the score of a game with four moves and only the minimizer gets to move" do
            leaf_1 = Node.new(score = 1)
            leaf_2 = Node.new(score = 0)
            leaf_3 = Node.new(score = 2)
            leaf_4 = Node.new(score = -5)
            node_level_3a = Node.new(children = [leaf_1, leaf_2])
            node_level_3b = Node.new(children = [leaf_3, leaf_4])
            child_1 = Node.new(score = nil, children = node_level_3a)
            child_2 = Node.new(score = nil, children = node_level_3b)
            parent = Node.new(score = nil, children = [child_1, child_2])
            grandparent = Node.new(score = nil, children = [parent])

            expect(grandparent.score_node(grandparent)).to eq(-5)
        end

        it "returns the score of a game with one move and two possible end states" do
            child_1 = Node.new(score = 0)
            child_2 = Node.new(score = 1)
            parent = Node.new(score = nil, children = [child_1, child_2])

            expect(parent.score_node(parent)).to eq(1)
        end

        it "returns the score of a game with three moves and only the maximizer gets to move" do
            leaf_1 = Node.new(score = 11)
            leaf_2 = Node.new(score = 10)
            leaf_3 = Node.new(score = 22)
            leaf_4 = Node.new(score = -2002)
            child_1 = Node.new(score = nil, children = [leaf_1, leaf_2])
            child_2 = Node.new(score = nil, children = [leaf_3, leaf_4])
            parent_1 = Node.new(score = nil, children = [child_1])
            parent_2 = Node.new(score = nil, children = [child_2])
            grandparent = Node.new(score = nil, children = [parent_1, parent_2])

            expect(grandparent.score_node(grandparent)).to eq(22)
        end

        it "returns the score for a deeply nested game" do
            leaf_1 = Node.new(score = 1)
            leaf_2 = Node.new(score = -2)
            leaf_3 = Node.new(score = 2)
            leaf_4 = Node.new(score = -5)
            leaf_5 = Node.new(score = -11)
            leaf_6 = Node.new(score = -30)
            leaf_7 = Node.new(score = 20)
            leaf_8 = Node.new(score = 51)
            leaf_9 = Node.new(score = 12)
            leaf_10 = Node.new(score = 10)
            leaf_11 = Node.new(score = 6)
            leaf_12 = Node.new(score = 7)
            leaf_13 = Node.new(score = 8)
            leaf_14 = Node.new(score = 9)
            leaf_15 = Node.new(score = 3)
            leaf_16 = Node.new(score = 4)
            leaf_17 = Node.new(score = 7)
            leaf_18 = Node.new(score = 5)
            leaf_19 = Node.new(score = 9)
            leaf_20 = Node.new(score = 11)
        
            level4_a = Node.new(children = [leaf_1, leaf_2])
            level4_b = Node.new(children = [leaf_3, leaf_4])
            level4_c = Node.new(children = [leaf_5, leaf_6])
            level4_d = Node.new(children = [leaf_7, leaf_8])
            level4_e = Node.new(children = [leaf_9, leaf_10])
            level4_f = Node.new(children = [leaf_11, leaf_12])
            level4_g = Node.new(children = [leaf_13, leaf_14])
            level4_h = Node.new(children = [leaf_15, leaf_16])
            level4_i = Node.new(children = [leaf_17, leaf_18])
            level4_j = Node.new(children = [leaf_19, leaf_20])
        
            level3_a = Node.new(children = [level4_a, level4_b])
            level3_b = Node.new(children = [level4_c, level4_d])
            level3_c = Node.new(children = [level4_e, level4_f])
            level3_d = Node.new(children = [level4_g, level4_h])
            level3_e = Node.new(children = [level4_i, level4_j])
            level3_f = Node.new(score = 1)
            level3_g = Node.new(score = 2)
            level3_h = Node.new(score = 61)
        
            level2_a = Node.new(children = [level3_a, level3_b])
            level2_b = Node.new(children = [level3_c, level3_d])
            level2_c = Node.new(children = [level3_e, level3_f])
            level2_d = Node.new(children = [level3_g, level3_h])
        
            level1_a = Node.new(children = [level2_a, level2_b])
            level1_b = Node.new(children = [level2_c, level2_d])
        
            root = Node.new(children = [level1_a, level1_b])
            expect(root.score_node(root)).to eq(7)
          end
    end
end