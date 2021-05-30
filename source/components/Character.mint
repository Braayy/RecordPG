component Character {
  connect Store.Character exposing { character, setCharacterName, setCharacterAvatarUrl, setCharacterHealth, setCharacterSanity }
  
  fun handleName {
    Modal.Input.show(
      Modal.Input.Type::String,
      "Type your name",
      character.name,
      (result : Modal.Input.Result) {
        try {
          case (result) {
            Modal.Input.Result::String(name) => setCharacterName(name)
            => ``
          }

          void
        }
      }
    )
  }

  fun handleAvatar {
    Modal.Input.show(
      Modal.Input.Type::String,
      "Type your avatar url",
      character.avatarUrl,
      (result : Modal.Input.Result) {
        try {
          case (result) {
            Modal.Input.Result::String(name) => setCharacterAvatarUrl(name)
            => ``
          }

          void
        }
      }
    )
  }

  fun handleCurrentHealth {
    Modal.Input.show(
      Modal.Input.Type::Number,
      "Type your current health",
      Number.toString(character.currentHealth),
      (result : Modal.Input.Result) {
        try {
          case (result) {
            Modal.Input.Result::Number(currentHealth) => setCharacterHealth(currentHealth, character.maxHealth)
            Modal.Input.Result::String(error) => Modal.Error.show(error)
          }

          void
        }
      }
    )
  }

  fun handleMaxHealth {
    Modal.Input.show(
      Modal.Input.Type::Number,
      "Type your max health",
      Number.toString(character.maxHealth),
      (result : Modal.Input.Result) {
        try {
          case (result) {
            Modal.Input.Result::Number(maxHealth) => setCharacterHealth(character.currentHealth, maxHealth)
            Modal.Input.Result::String(error) => Modal.Error.show(error)
          }

          void
        }
      }
    )
  }

  fun handleCurrentSanity {
    Modal.Input.show(
      Modal.Input.Type::Number,
      "Type your current sanity",
      Number.toString(character.currentSanity),
      (result : Modal.Input.Result) {
        try {
          case (result) {
            Modal.Input.Result::Number(currentSanity) => setCharacterSanity(currentSanity, character.maxSanity)
            Modal.Input.Result::String(error) => Modal.Error.show(error)
          }

          void
        }
      }
    )
  }

  fun handleMaxSanity {
    Modal.Input.show(
      Modal.Input.Type::Number,
      "Type your max sanity",
      Number.toString(character.maxSanity),
      (result : Modal.Input.Result) {
        try {
          case (result) {
            Modal.Input.Result::Number(maxSanity) => setCharacterSanity(character.currentSanity, maxSanity)
            Modal.Input.Result::String(error) => Modal.Error.show(error)
          }

          void
        }
      }
    )
  }

  fun render : Html {
    <div::character>
      <div::visual>
        <img src={character.avatarUrl} onClick={handleAvatar} />

        <p onClick={handleName}>
          <{ character.name }>
        </p>
      </div>

      <div::stats>
        <div::stat::health>
          <p>
            <span onClick={handleCurrentHealth}><{ Number.toString(character.currentHealth) }></span>
            " / "
            <span onClick={handleMaxHealth}><{ Number.toString(character.maxHealth) }></span>
          </p>
        </div>

        <div::stat::sanity>
          <p>
            <span onClick={handleCurrentSanity}><{ Number.toString(character.currentSanity) }></span>
            " / "
            <span onClick={handleMaxSanity}><{ Number.toString(character.maxSanity) }></span>
          </p>
        </div>
      </div>
    </div>
  }

  style character {
    width: 20rem;
    margin-bottom: .5rem;
  }

  style visual {
    width: 80%;
    margin: 0 auto;

    display: flex;
    justify-content: center;
    align-items: center;

    margin-bottom: .5rem;

    img {
      width: 4.5rem;

      margin-right: .5rem;
      border-radius: 50%;

      cursor: pointer;

      &:hover {
        filter: brightness(70%);
      }
    }

    p {
      font-size: 2rem;

      cursor: pointer;

      &:hover {
        filter: brightness(70%);
      }
    }
  }

  style stats {
    width: 100%;
  }

  style stat {
    width: 100%;
    height: 1.25rem;
    display: flex;
    justify-content: center;
    align-items: center;

    p span {
      cursor: pointer;
      transition: filter .15s;

      font-size: 1.2rem;

      &:hover {
        filter: brightness(80%);
      }
    }
  }

  style health {
    background: var(--health);

    margin-bottom: .5rem;
  }

  style sanity {
    background: var(--sanity);
  }
}
