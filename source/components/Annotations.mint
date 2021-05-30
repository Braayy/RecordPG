component Annotations {
  connect Store.Annotations exposing { annotations, updateAnnotations }

  fun handleChange(event : Html.Event) {
    updateAnnotations(Dom.getValue(event.target))
  }

  fun render : Html {
    <div::annotations>
      <div::bar>
        <p>"Annotations"</p>
      </div>
      <textarea placeholder="Annotations" autocomplete="off" value={annotations} onChange={handleChange}></textarea>
    </div>
  }

  style annotations {
    width: 50%;

    border: 1px solid var(--text);
    margin-left: .25rem;

    display: flex;
    flex-direction: column;
    justify-content: space-between;

    textarea {
      flex-grow: 1;

      width: 100%;
      height: 100%;
      resize: none;

      border: none;
      background: var(--primary);
      color: var(--text);
      font-size: 1rem;

      padding: 10px;

      &:focus {
        outline: none;
      }
    }
  }

  style bar {
    width: 100%;
    padding: .25rem;

    border-bottom: 1px solid var(--text);

    p {
      text-align: center;
    }
  }
}
