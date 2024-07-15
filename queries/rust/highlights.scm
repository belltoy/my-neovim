;; extends

(self_parameter (mutable_specifier) @keyword)

((field_identifier) @unwrap_call
  (#match? @unwrap_call "^unwrap")
  (#set! "priority" 150))

["unsafe"] @keyword.unsafe (#set! "priority" 250)

((pointer_type)
 @pointer_type
 (#set! "priority" 150))
