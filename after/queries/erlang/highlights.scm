;; extends

((spec) @erlang.spec)

((record_decl) @erlang.record_decl)

;; ((macro_call_expr
;;    name: ((var) @constant.macro)
;;    args: (macro_call_args))
;;  (#match? @constant.macro "^LOG_")
;;  (#set! "priority" 102))
;;
;; ((macro_call_expr
;;    name: ((var) @constant.macro)
;;    args: (macro_call_args))
;;  (#not-match? @constant.macro "^LOG_")
;;  (#set! "priority" 102))

((export_type_attribute) @keyword.import)

((comment) @comment.documentation
           (#set! "priority" 101))

((comment) @comment.documentation
           (#lua-match? @comment.documentation "^[%%][%%] @doc")
           (#set! "priority" 102))

((feature_attribute
   (atom) @features.feature
   ((atom) @features.feature.enable
           (#match? @features.feature.enable "enable"))) @features)

((behaviour_attribute
   (atom) @behavirour))

(fun_decl
  (function_clause
    name: (atom)
    guard: (guard
             (guard_clause
               exprs: (call
                        expr: ((atom) @keyword))))))

(fun_decl
  clause: (function_clause
            name: (atom) @fun_decl))

(export_attribute
  funs: (fa
          fun: (atom) @exported_fun))

(list
  exprs: (tuple
           expr: (atom) @lists.key
           expr: (_)))

(type_alias
  ty: (map_expr
        fields: (map_field
                  key: (_) @type.definition.key)))

(map_expr
  fields: (map_field
            key: (binary) @string))
(map_expr
  fields: (map_field
            key: (_) @maps.key)
  (#set! "priority" 99))

(map_expr_update
  fields: (map_field
            key: (_) @maps.key))

(type_alias
  name: (type_name
          name: (atom) @type_name))

(opaque
  name: (type_name
          name: (atom) @type_name))

(macro_call_expr
  name: (atom) @macro_call
  args: (macro_call_args))

(macro_call_expr
  name: (var) @macro_call
  args: (macro_call_args))

(macro_call_expr
  name: (var) @macro_call)
