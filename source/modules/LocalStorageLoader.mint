module LocalStorageLoader {
  fun load : Promise(Never, Void) {
    sequence {
      loadCharacter()

      loadAnnotations()

      loadCombos()
    }
  }

  fun loadCharacter : Promise(Never, Void) {
    try {
      characterJson = Storage.Local.get("character")

      characterObject = Json.parse(characterJson)
        |> Maybe.toResult("combosJson json in character local storage key")

      character = decode characterObject as Character

      Store.Character.fromLocalStorage(character)

      ``
    } catch {
      ``
    }
  }

  fun loadAnnotations : Promise(Never, Void) {
    try {
      annotations = Storage.Local.get("annotations")

      Store.Annotations.updateAnnotations(annotations)

      ``
    } catch {
      ``
    }
  }

  fun loadCombos : Promise(Never, Void) {
    try {
      combosJson = Storage.Local.get("combos")

      combosArray = Json.parse(combosJson)
        |> Maybe.toResult("Invalid json in combos local storage key")

      combos = decode combosArray as Array(Combo)

      Store.Combos.fromLocalStorage(combos)

      ``
    } catch {
      ``
    }
  }
}
