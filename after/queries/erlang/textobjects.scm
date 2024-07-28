;; extends

(function_clause) @function.outer

(function_clause
  body: (clause_body
          "->"
          .
          (_) @_start @_end
          (_)? @_end
          .
          (#make-range! "function.inner" @_start @_end)))

(maybe_expr
  .
  (_) @_start @_end
  (_)? @_end
  .
  "else"
  (#make-range! "maybe_block" @_start @_end))

(cr_clause) @case_clause
