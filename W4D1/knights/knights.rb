require_relative "./00_tree_node.rb"

class KnightsPathFinder
  attr_reader :starting_pos

  MOVES = [
    [-2, -1],
    [-2, 1],
    [2, -1],
    [2, 1],
    [-1, -2],
    [-1, 2],
    [1, -2],
    [1, 2]]

  #take in x, y position (array)
  #create new list of possible positions from the initial position (by adding x, y in the moves list)
  #if the move is on the board, then shovel into possible moves array
  def self.valid_moves(pos)
    valid_moves = []
    cur_x, cur_y = pos

    MOVES.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      valid_moves << new_pos if new_pos.all? { |coords| coords.between?(0, 7) }
    end

    valid_moves
  end
  
  
  def initialize(starting_pos)
    @starting_pos = starting_pos
    @considered_positions = [starting_pos]

    build_move_tree
  end
  
  def new_move_positions(pos)
    valid_pos = KnightsPathFinder.valid_moves(pos)  ##get Array of possible moves
    valid_pos.reject! { |pos| @considered_positions.include?(pos) }
    @considered_positions.concat(valid_pos)
    valid_pos
  end

  attr_accessor :root_node

  def build_move_tree
    self.root_node = PolyTreeNode.new(starting_pos)

    nodes = [self.root_node]  ## array of PTN objects, NOT POSITIONS
    until nodes.empty?
      current_node = nodes.shift ## returns a PTN object (first one in the nodes tray)
      current_pos = current_node.value
      # search for new moves position (by shift)
      new_move_positions(current_pos).each do |possible_pos| ##function checks if pos already seen
        possible_node = PolyTreeNode.new(possible_pos) #create new PTN location
        current_node.add_child(possible_node) #add to child list of current node object
        nodes << possible_node #push into nodes
      end
    end
  end

  def find_path(end_pos)
    end_node = root_node.dfs(end_pos)   ## "find" end node object using root_node and bfs
    trace_path_back(end_node).reverse.map(&:value) # use trace_path_back method with end node to create path
  end

  def trace_path_back(end_node)  ## trace tree (using parent) from end_node all the way up until current.node is nil (because root node won't have a parent node, hence once it traces the root node, and tries to trace the "parent" of root node, it'll be nil)
    path = []                   
    cur_node = end_node
    until cur_node.nil?
      path << cur_node
      cur_node = cur_node.parent
    end
    path
  end
  
end

# def find_path(end_pos)
#   end_node = root_node.dfs(end_pos)

#   trace_path_back(end_node)
#     .reverse
#     .map(&:value)

# end

# def trace_path_back(end_node)
#   path = []
#   current_node = end_node
#   until current_node.nil?
#     path << current_node
#     current_node = current_node.parent
#   end
#   path
# end