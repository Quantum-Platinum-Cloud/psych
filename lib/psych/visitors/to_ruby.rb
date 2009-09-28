module Psych
  module Visitors
    ###
    # This class walks a YAML AST, converting each node to ruby
    class ToRuby < Psych::Visitors::Visitor
      visitor_for(Nodes::Scalar) do |o|
        o.value
      end

      visitor_for(Nodes::Sequence) do |o|
        o.children.map { |o| o.accept self }
      end
    end
  end
end
