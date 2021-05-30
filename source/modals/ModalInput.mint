enum Modal.Input.Type {
  String
  Number
}

enum Modal.Input.Result {
  String(String)
  Number(Number)
}

global component Modal.Input {
  state open = false
  state title = ""
  state oldValue = ""
  state currentValue = ""
  state callback : Function(Modal.Input.Result, Void) = (result : Modal.Input.Result) { void }
  state type : Modal.Input.Type = Modal.Input.Type::String

  fun show(type : Modal.Input.Type, title : String, oldValue : String, callback : Function(Modal.Input.Result, Void)) {
    next {
      open = true,
      title = title,
      oldValue = oldValue,
      currentValue = oldValue,
      callback = callback,
      type = type
    }
  }

  fun handleSave {
    sequence {
      case (type) {
        Modal.Input.Type::String => Modal.Input.Result::String(currentValue)
          |> callback()

        Modal.Input.Type::Number =>
        case (Utils.parseStatExpression(currentValue)) {
          Maybe::Just(number) => Modal.Input.Result::Number(number)
          Maybe::Nothing => Modal.Input.Result::String("Bad expression: #{currentValue}")
        }
        |> callback()
      }

      next {
        open = false,
        title = "",
        oldValue = "",
        currentValue = "",
        callback = (result : Modal.Input.Result) { void },
        type = Modal.Input.Type::String
      }
    }
  }

  fun handleCancel {
    next {
      open = false,
      title = "",
      oldValue = "",
      currentValue = "",
      callback = (result : Modal.Input.Result) { void },
      type = Modal.Input.Type::String
    }
  }

  fun handleEdit(event : Html.Event) {
    next {
      currentValue = Dom.getValue(event.target)
    }
  }

  fun render : Html {
    case (open) {
      true => (
        <div::inputModal>
        <p><{ title }></p>
        <div::input>
          <input type="text" value={currentValue} placeholder={title} onChange={handleEdit} />
        </div>
        <div::actions>
          <button onClick={handleSave}>"Save"</button>
          <button onClick={handleCancel}>"Cancel"</button>
        </div>
      </div>
      )
      => ``
    }
  }

  style inputModal {
    position: fixed;

    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);

    width: 40rem;
    height: 20rem;
    z-index: 1;

    padding: .5rem;

    background: var(--secondary);

    display: flex;
    flex-direction: column;

    p {
      height: 2rem;
      line-height: 2rem;
      text-align: center;
      font-size: 1.3rem;
    }
  }

  style input {
    flex-grow: 1;

    display: flex;
    justify-content: center;
    align-items: center;

    input {
      width: 50%;
      height: 2rem;

      border: none;
      border-bottom: 1px solid var(--text);
      background: none;

      font-size: 1.3rem;

      color: var(--text);

      padding: .25rem;

      &::placeholder {
        color: var(--text);
        filter: brightness(70%);
      }
    }
  }

  style actions {
    width: 100%;
    height: 3rem;

    display: flex;
    justify-content: space-around;
    align-items: center;

    button {
      width: 10rem;
      height: 100%;

      border: 1px solid var(--text);
      background: none;
      color: var(--text);

      font-size: 1.3rem;
      cursor: pointer;

      transition: background .15s, color .15s;

      &:hover {
        background: var(--text);
        color: var(--primary);
      }
    }
  }
}
