component DiceRow {
  const DICE = [4, 6, 8, 10, 12, 20, 100]

  const LABEL_OFFSET =
    Map.empty()
    |> Map.set(4, 1)
    |> Map.set(6, 1)
    |> Map.set(10, 2)
    |> Map.set(12, 2)

  fun roll(die : Number) {
    () {
      Modal.Roll.show(Roller.rollDie("d#{die}"))
    }
  }

  fun render : Html {
    <div::dicerow>
      for (die of DICE) {
        <div::die(die, Map.get(die, LABEL_OFFSET)) onClick={roll(die)}>
          @svg(../../assets/die.svg)
        </div>
      }
    </div>
  }

  style dicerow {
    width: 40rem;

    margin-bottom: .5rem;

    display: flex;
    justify-content: space-around;
    align-items: center;
  }

  style die (number : Number, offset : Maybe(Number)) {
    position: relative;

    cursor: pointer;

    width: 4rem;

    svg {
      width: 100%;
      height: 100%;
    }

    &:after {
      content: '#{number}';
      position: absolute;
      font-size: 1rem;

      top: 50%;

      case (offset) {
        Maybe::Just(n) => left: calc(50% - #{n}px);

        Maybe::Nothing => left: 50%;
      }

      transform: translate(-50%, -50%);
    }
  }
}
