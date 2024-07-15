;; extends

(unary_operator
  operator: ("@" @comment.documentation.identifier)
  operand: (call
    target: ((identifier) @_identifier
      (#any-of? @_identifier "moduledoc" "typedoc" "shortdoc" "doc")) @comment.documentation.identifier
    (arguments
      [
        (string)
        (boolean)
        (charlist)
        (sigil
          "~"
          (sigil_name)
          quoted_start: _
          (quoted_content)
          quoted_end: _)
      ]))
  )

