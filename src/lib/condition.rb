module RulesEngine
  class Condition
    attr_accessor :type
    attr_accessor :params

    def passed?(object)
    end
  end
end
