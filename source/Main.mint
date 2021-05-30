component Main {
  fun componentDidMount {
    try {
      LocalStorageLoader.load()

      void
    }
  }

  fun render : Html {
    <div::container>
      <Character/>
      <DiceRow/>
      <div::split>
        <DiceComboList />
        <Annotations />
      </div>
    </div>
  }

  style container {
    width: 100%;
    min-height: 100vh;

    padding: .75rem;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
  }

  style split {
    width: 100%;
    height: 100%;

    display: flex;
    justify-content: space-between;

    flex-grow: 1;
  }
}
