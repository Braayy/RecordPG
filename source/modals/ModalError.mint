global component Modal.Error {
  state open = false
  state error = ""

  fun show(error : String) {
    next {
      open = true,
      error = error
    }
  }

  fun handleClose {
    next {
      open = false,
      error = error
    }
  }

  fun render : Html {
    <div::errorModal>
      <div>
        <p><{ error }></p>
      </div>
      <button onClick={handleClose}>"Close"</button>
    </div>
  }

  style errorModal {
    position: absolute;

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

    if (open) {
      visibility: visible;
    } else {
      visibility: hidden;
    }

    div {
      flex-grow: 1;

      display: flex;
      justify-content: center;
      align-items: center;

      p {
        font-size: 3rem;
        color: var(--error);
      }
    }

    button {
      width: 6rem;
      height: 2rem;

      margin: 0 auto;

      border: 1px solid var(--text);
      background: none;
      color: var(--text);

      font-size: 1.2rem;

      cursor: pointer;

      transition: background .15s, color .15s;

      &:hover {
        background: var(--text);
        color: var(--primary);
      }
    }
  }
}
