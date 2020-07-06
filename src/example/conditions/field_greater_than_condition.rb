require_relative '../../lib/condition'

module Example
  class FieldGreaterThanCondition < RulesEngine::Condition
    def passed?(object)
      if object.send(@params[:field]).is_a?(Numeric)
        object.send(@params[:field]) >= @params[:value]
      end
    end
  end
end
