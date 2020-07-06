module RulesEngine
  class Rule
    attr_accessor :trigger_context
    attr_accessor :effects
    attr_accessor :conditions

    def run!(object, context = '')
      if should_trigger?(context) && passed_conditions?(object)
        apply_effects!(object)
      end
    end

    private def should_trigger?(context)
      @trigger_context == context
    end

    private def passed_conditions?(object)
      @conditions.select{ |condition | condition.passed?(object) }.length == conditions.length
    end

    private def apply_effects!(object)
      @effects.each{ |effect| effect.apply!(object) }
    end
  end
end
