//%attributes = {}

C_VARIANT:C1683($result;$expected)
C_COLLECTION:C1488($col)

  // Null
$result:=formula_chain ().call(Null:C1517;3)
$expected:=3
ASSERT:C1129($result=$expected;String:C10($result)+" but expected "+String:C10($expected))

  // Empty
$result:=formula_chain (New collection:C1472()).call(Null:C1517;3)
$expected:=3
ASSERT:C1129($result=$expected;String:C10($result)+" but expected "+String:C10($expected))

  // 1 formula
$col:=New collection:C1472(Formula:C1597($1+2))
$result:=formula_chain ($col).call(Null:C1517;3)
$expected:=3+2
ASSERT:C1129($result=$expected;String:C10($result)+" but expected "+String:C10($expected))

  // 2 formulas
$col.push(Formula:C1597($1+5))
$result:=formula_chain ($col).call(Null:C1517;3)
$expected:=3+2+5
ASSERT:C1129($result=$expected;String:C10($result)+" but expected "+String:C10($expected))

  // 3, with type change
$col.push(Formula:C1597(String:C10($1)))
$result:=formula_chain ($col).call(Null:C1517;3)
$expected:=String:C10(3+2+5)
ASSERT:C1129($result=$expected;String:C10($result)+" but expected "+String:C10($expected))

  // 4 with append string
$col.push(Formula:C1597($1+"test"))
$result:=formula_chain ($col).call(Null:C1517;3)
$expected:=String:C10(3+2+5)+"test"
ASSERT:C1129($result=$expected;String:C10($result)+" but expected "+String:C10($expected))