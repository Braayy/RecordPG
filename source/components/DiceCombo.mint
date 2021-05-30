component DiceCombo {
  connect Store.Combos exposing { combos, updateCombo, removeCombo }

  property combo : Combo

  state editing = false
  state editingName = combo.name
  state editingInput = combo.input

  fun handleEditor(event : Html.Event) {
    sequence {
      try {
        Html.Event.preventDefault(event)
      }

      next {
        editing = true
      }
    }
  }

  fun handleSave(event : Html.Event) {
    sequence {
      try {
        Html.Event.preventDefault(event)
      }

      updateCombo(combo.id, editingName, editingInput)

      next {
        editing = false
      }
    }
  }

  fun handleNameChange(event : Html.Event) {
    next {
      editingName = Dom.getValue(event.target)
    }
  }

  fun handleInputChange(event : Html.Event) {
    next {
      editingInput = Dom.getValue(event.target)
    }
  }

  fun handleRemove(event : Html.Event) {
    try {
      Html.Event.stopPropagation(event)

      removeCombo(combo.id)
    }
  }

  fun handleRoll {
    case (editing) {
      false => Modal.Roll.show(Roller.rollCombo(combo.input))
      => ``
    }
  }

  fun renderNormal : Html {
    <>
      <div::nameBar>
        <p onClick={handleRoll}><{ combo.name }></p>
        <span onClick={handleRemove}>
          <Feather icon={Icon::Trash2} />
        </span>
      </div>
      <p><{ combo.input }></p>
    </>
  }

  fun renderEditing : Html {
    <>
      <div::editor>
        <input type="text" value={editingName} onChange={handleNameChange} />
        <input type="text" value={editingInput} onChange={handleInputChange} />
        <button onClick={handleSave}>"Save"</button>
      </div>
    </>
  }

  fun render : Html {
    <div::diceCombo onContextMenu={handleEditor}>
      if (editing) {
        renderEditing()
      } else {
        renderNormal()
      }
    </div>
  }

  style diceCombo {
    padding: .25rem;

    p {
      text-align: center;
    }

    border-bottom: 1px solid var(--text);
  }

  style nameBar {
    width: 100%;

    padding: .25rem;

    position: relative;

    display: flex;
    justify-content: center;
    align-items: center;

    p {
      cursor: pointer;
      text-align: center;

      &:hover {
        filter: brightness(70%);
      }
    }

    span {
      position: absolute;

      top: .25rem;
      right: .25rem;

      width: 1.2rem;
      height: 1.2rem;

      cursor: pointer;

      svg {
        width: 100%;
        height: 100%;

        stroke: var(--text);

        &:hover {
          filter: brightness(70%);
        }
      }
    }
  }

  style editor {
    display: flex;
    flex-direction: column;

    input {
      width: 60%;
      height: 1.5rem;

      margin: 0 auto;
      margin-bottom: .5rem;

      font-size: 1rem;

      border: none;
      border-bottom: 1px solid var(--text);

      background: none;
      color: var(--text);
    }

    button {
      width: 8rem;
      height: 1.5rem;

      margin: 0 auto;

      font-size: 1rem;

      border: 1px solid var(--text);

      background: none;
      color: var(--text);

      cursor: pointer;
      
      transition: background .15s, color .15s;

      &:hover {
        background: var(--text);
        color: var(--primary);
      }
    }
  }
}
