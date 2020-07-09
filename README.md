# rules-engine
This small library demonstrates a system capable of operating as a dynamic rules engine.

You can read more in my accompanying [blog post](https://medium.com/@jgefroh/how-to-design-software-rules-engines-adbb098b2d73).

## What is a rules engine?
A rules engine is simply a set of rules that are applied to something.

## Why are they useful?
Rules engines are useful in that they can allow configuration and execute of an operation during runtime. This means that an effectively set up rules engine would not require engineers to change a system's business logic.

It abstracts away policy decisions from the details of those policies. For engineers, what is important are the mechanics of how the rules are executed, not the details of those rules themselves.

Imagine the power of being able to reduce to a codeless system:
* Marketing could configure when onboarding emails get sent out
* Compliance teams could configure alerts and notifications to keep up with regulatory demands.
* Sales could test dynamically configure and test a arbitrary pricing strategies.
* Customer success could automatically configure high-risk accounts.

An effective rules framework would allow the details of these to change without engineering involvement.

## Components of a rules engine

### Rule
A rule is a business policy that is stored.

### Trigger
The trigger is the thing that determines when the engine should attempt to run through a rule. In simple systems, it could be a simple string check or even hard-coded. In more complex systems, it could be a full context check. In our case, it is a simple string on the rule that represents the context.

### Condition
The condition is the thing that determines if the effects should be applied in that particular circumstance or on that particular record. It is different from the trigger, which determines context.

### Effect
Effect is the thing that happens once a rule is triggered and its conditions pass.


## An arbitrary example
Suppose you had to set up a user account to be marked as a "Popular" member once a certain number of views for the profile has been reached. You could theoretically hard-code this, but it would require an engineer.

Suppose you had a rules framework that you could use to configure this instead.

A Rule could be created that:
* had the trigger of `view`
* had a condition of `view_count` being greater than `100`.
* had an effect of setting a field of the user to `popular`

This rule could then be applied immediately.


## Potential enhancements
This is the barebones skeleton of a rules engine. Real-life situations would require the data be stored in a database of policy configuration that is retrieved at runtime instead of hard-coded in the code.

You'd likely want auditing to ensure rule changes are tracked.

Effective dating techniques would be useful to help set up rules ahead of changeover events.

Dry-run capabilities and manual execution would also be quite useful in situations where rule details changed.
