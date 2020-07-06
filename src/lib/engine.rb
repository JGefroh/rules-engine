module RulesEngine
  class Engine
    attr_accessor :rules

    def run!(object, context = '')
      rules.each{ |rule| rule.run!(object, context) }
    end
  end
end
