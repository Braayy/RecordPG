record Combo {
  id : String,
  name : String,
  input: String
}

record Character {
  name : String,
  avatarUrl : String,

  currentHealth : Number,
  maxHealth : Number,

  currentSanity : Number,
  maxSanity : Number
}

store Store.Global {
  state combos : Array(Combo) = []

  state annotations = ""

  state character : Character = {
    name = "No Name",
    avatarUrl = "No Avatar",

    currentHealth = 0,
    maxHealth = 0,

    currentSanity = 0,
    maxSanity = 0
  }

  fun addCombo() {
    next {
      combos = Array.push({
        id = Uid.generate(),
        name = "Edit Me",
        input = ""
      }, combos)
    }
  }

  fun updateCombo(id : String, name : String, input : String) {
    next {
      combos = for (combo of combos) {
        if (combo.id == id) {
          {
            id = id,
            name = name,
            input = input
          }
        } else {
          combo
        }
      }
    }
  }

  fun removeCombo(id : String) {
    next {
      combos = Array.reject((combo : Combo) { combo.id == id }, combos)
    }
  }

  fun setAnnotations(annotations : String) {
    next {
      annotations = annotations
    }
  }

  fun setCharacterName(name : String) {
    next {
      character = {
        character |
        name = name
      }
    }
  }

  fun setCharacterAvatarUrl(avatarUrl : String) {
    next {
      character = {
        character |
        avatarUrl = avatarUrl
      }
    }
  }

  fun setCharacterHealth(currentHealth : Number, maxHealth : Number) {
    next {
      character = {
        character |
        currentHealth = currentHealth,
        maxHealth = maxHealth
      }
    }
  }

  fun setCharacterSanity(currentSanity : Number, maxSanity : Number) {
    next {
      character = {
        character |
        currentSanity = currentSanity,
        maxSanity = maxSanity
      }
    }
  }
}
