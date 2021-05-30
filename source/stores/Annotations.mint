store Store.Annotations {
  state annotations = ""

  fun updateAnnotations(annotations : String) : Promise(Never, Void) {
    sequence {
      next {
        annotations = annotations
      }

      Storage.Local.set("annotations", annotations)

      void
    } catch Storage.Error => error {
      void
    }
  }
}
