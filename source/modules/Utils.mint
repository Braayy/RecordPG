module Utils {
  fun parseStatExpression(expr : String) : Maybe(Number) {
    try {
      evaluatedExpr = evalJS(cleanedExpr)

      Maybe::Just(Math.floor(evaluatedExpr))
    } catch {
      Maybe::Nothing
    }
  } where {
    disallowedRegexp = Regexp.create("[^\-\+\/\*\(\)0-9]*")

    cleanedExpr = disallowedRegexp
      |> Regexp.replace(Debug.log(expr), (match : Regexp.Match) { "" })
  }

  fun evalJS(expr : String) : Result(String, a) {
    `
    (() => {
      try {
        let evaluated = eval(#{expr})

        return #{Result.ok(Debug.log(`evaluated`))}
      } catch (error) {
        return #{Result.error(`error`)}
      }
    })()
    `
  }
}
