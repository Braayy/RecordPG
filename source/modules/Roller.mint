module Roller {
  fun rollDie(die : String) : Number {
    case (dieNumber) {
      Maybe::Just(number) => Math.ceil(Math.random() * number)
      Maybe::Nothing => -1
    }
  } where {
    dieNumber = Regexp.create("\\D")
      |> Regexp.replace(die, (match : Regexp.Match) {
        ""
      })
      |> Number.fromString
  }

  fun rollCombo(combo : String) : Number {
    dice + modifier
  } where {
    dieRegexp = Regexp.create("^d[0-9]+$")
    modifierRegexp = Regexp.create("^[0-9]+$")

    elements = combo
    |> String.split("+")

    dice = elements
      |> Array.select((element : String) { Regexp.match(element, dieRegexp) })
      |> Array.map(rollDie)
      |> Array.reduce(0, (acc : Number, num : Number) {
        acc + num
      })

    modifier = elements
      |> Array.select((element : String) { Regexp.match(element, modifierRegexp) })
      |> Array.map(Number.fromString)
      |> Array.reduce(0, (acc : Number, numMaybe : Maybe(Number)) {
        case (numMaybe) {
          Maybe::Just(num) => acc + num
          Maybe::Nothing => acc
        }
      })
  }
}
