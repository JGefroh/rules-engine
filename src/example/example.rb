require_relative 'user'

require_relative 'conditions/field_greater_than_condition'
require_relative 'effects/set_field_effect'
require_relative '../lib/rule'
require_relative '../lib/engine'

# Manually construct a rule and its conditions and effects.
# You can imagine what this would look like if it was retrieving these from the database or a configuration file.
rule = RulesEngine::Rule.new().tap{ |rule|
  rule.trigger_context = 'view'
}

condition1 = Example::FieldGreaterThanCondition.new().tap{ |condition|
  condition.params = {field: 'views', value: 100}
}

effect1 = Example::SetFieldEffect.new().tap{ |effect|
  effect.params = { field: 'category', value: 'popular' }
}

rule.conditions = [condition1]
rule.effects = [effect1]


# Initialize the rules engine with our new rule. A production rules engine could pre-initialize the rules.
rules_engine = RulesEngine::Engine.new.tap {|engine|
  engine.rules = [rule]
}

# Run the rules engine
user = User.new


puts "User has #{user.category || 'no'} category."
rules_engine.run!(user, 'create') # This will not run because the context does not match


puts "User has #{user.category || 'no'} category."
rules_engine.run!(user, 'view') # This will not apply the effect because the condition does not pass

user.views = 101

rules_engine.run!(user, 'view') # This will apply the effect since the context matches and the condition passes
puts "User has #{user.category || 'no'} category."
