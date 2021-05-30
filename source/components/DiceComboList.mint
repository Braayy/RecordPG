component DiceComboList {
  connect Store.Combos exposing { combos, addCombo, removeCombo }

  fun handleAdd {
    addCombo()
  }

  fun render : Html {
    <div::diceComboList>
      <div::bar>
        <p>"Dice Combos"</p>
        <span onClick={handleAdd}>
          <Feather icon={Icon::Plus} />
        </span>
      </div>
      <div::list>
        for (combo of combos) {
          <DiceCombo combo={combo} />
        }
      </div>
    </div>
  }

  style diceComboList {
    width: 50%;

    border: 1px solid var(--text);
    margin-right: .25rem;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  style bar {
    width: 100%;
    padding: .25rem;

    position: relative;

    border-bottom: 1px solid var(--text);

    p {
      text-align: center;
    }

    span {
      position: absolute;

      width: 1.2rem;
      height: 1.2rem;

      top: .25rem;
      right: .25rem;

      svg {
        stroke: var(--text);

        cursor: pointer;

        &:hover {
          filter: brightness(70%);
        }
      }
    }
  }

  style list {
    flex-grow: 1;
  }
}
