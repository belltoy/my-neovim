;; extends

((spec) @erlang.spec)

((record_decl) @erlang.record_decl)

(
    (macro_call_expr
        ((var) @constant.macro)
    )
    (#match? @constant.macro "^LOG_")
    (#set! "priority" 102)
)

(
    (macro_call_expr
        ((var) @constant.macro)
    )
    (#not-match? @constant.macro "^LOG_")
    (#set! "priority" 102)
)

(
    (export_type_attribute) @keyword.import
)

(
    (comment) @comment.documentation
    (#lua-match? @comment.documentation "^[%%][%%] @doc")
    (#set! "priority" 101)
)

(
    (feature_attribute
      (atom) @features.feature
      ((atom) @features.feature.enable
       (#match? @features.feature.enable "enable")
      )
    ) @features
)

(
    (behaviour_attribute
      (atom) @behavirour
    )
)
