;; extends

(self_parameter (mutable_specifier) @keyword)
(
 ((field_identifier) @unwrap_call
  (#match? @unwrap_call "^unwrap")
  )
)

