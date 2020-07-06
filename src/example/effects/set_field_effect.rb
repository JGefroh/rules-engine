require_relative '../../lib/effect'
module Example
  class SetFieldEffect < RulesEngine::Effect
    def apply!(object)
      object.send("#{@params[:field]}=", @params[:value])
    end
  end
end
