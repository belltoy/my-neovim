;; extends

(anonymous_fun
  clauses: (fun_clause
             body: (clause_body
                     "->"
                     .
                      (_) @_start @_end
                      (_)? @_end
                      .
                      (#make-range! "local.scope" @_start @_end))))
