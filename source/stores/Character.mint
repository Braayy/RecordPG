record Character {
  name : String,
  avatarUrl : String,

  currentHealth : Number,
  maxHealth : Number,

  currentSanity : Number,
  maxSanity : Number
}

store Store.Character {
  state character : Character = {
    name = "No Name",
    avatarUrl = "No Avatar",

    currentHealth = 0,
    maxHealth = 0,

    currentSanity = 0,
    maxSanity = 0
  }

  fun fromLocalStorage(character : Character) {
    next {
      character = character
    }
  }

  fun update(newCharacter : Character) : Promise(Never, Void) {
    sequence {
      next {
        character = newCharacter
      }

      Storage.Local.set("character", `JSON.stringify(#{character})`)

      void
    } catch Storage.Error => error {
      void
    }
  }

  fun setCharacterName(name : String) {
    update(
      {
        character |
        name = name
      }
    )
  }

  fun setCharacterAvatarUrl(avatarUrl : String) {
    update(
      {
        character |
        avatarUrl = avatarUrl
      }
    )
  }

  fun setCharacterHealth(currentHealth : Number, maxHealth : Number) {
    update(
      {
        character |
        currentHealth = currentHealth,
        maxHealth = maxHealth
      }
    )
  }

  fun setCharacterSanity(currentSanity : Number, maxSanity : Number) {
    update(
      {
        character |
        currentSanity = currentSanity,
        maxSanity = maxSanity
      }
    )
  }
}
