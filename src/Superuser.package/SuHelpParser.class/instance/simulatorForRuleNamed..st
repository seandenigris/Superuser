accessing
simulatorForRuleNamed: aString
| grammar rule simulator |
	grammar := self smaccDefinitionGrammar.
	rule := grammar ruleNamed: aString.
	simulator := GtSmaCCTokenSimulator on: rule.
	^ GtSmaCCTokenSimulatorElement onSimulator: simulator