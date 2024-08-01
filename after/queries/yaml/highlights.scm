;; extends

(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @_source
      (#any-of? @_source "source" "condition")))
  value: (block_node
    (block_scalar) @keywordx
    (#match? @keywordx "^[\\|>][-+]\n.*$")
    (#offset! @keywordx 0 2 0 0)
    ; (#set! injection.language "vrl")
    ))
