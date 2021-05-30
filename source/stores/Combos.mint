record Combo {
  id : String,
  name : String,
  input: String
}

store Store.Combos {
  state combos : Array(Combo) = []

  fun fromLocalStorage(combos : Array(Combo)) {
    next {
      combos = combos
    }
  }

  fun update(newCombos : Array(Combo)) : Promise(Never, Void) {
    sequence {
      next {
        combos = newCombos
      }

      Storage.Local.set("combos", `JSON.stringify(#{combos})`)

      void
    } catch Storage.Error => error {
      void
    }
  }

  fun addCombo() {
    update(
      Array.push({
        id = Uid.generate(),
        name = "Edit Me",
        input = ""
      }, combos)
    )
  }

  fun updateCombo(id : String, name : String, input : String) {
    update(
      for (combo of combos) {
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
    )
  }

  fun removeCombo(id : String) {
    update(
      Array.reject((combo : Combo) { combo.id == id }, combos)
    )
  }
}
