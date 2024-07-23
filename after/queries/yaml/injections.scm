;; extends
;; vim:ft=query

 (block_mapping_pair
   key: (flow_node
          (plain_scalar
            (string_scalar) @_new_rules
            (#eq? @_new_rules "new_rules")))
   value: (block_node
            (block_sequence
              (block_sequence_item
                (block_node
                  (block_mapping
                    (block_mapping_pair
                      key: (flow_node
                             (plain_scalar
                               (string_scalar) @injection.language
                               (#eq? @injection.language "sql")))
                      value: (block_node (block_scalar) @injection.content
                                         (#offset! @injection.content 0 1 0 0)))))))))

;; .gitlab-ci.yml
(block_mapping_pair
    key: (flow_node
      (plain_scalar
        (string_scalar) @_name
        (#eq? @_name "coverage")
        ))
    value: (flow_node
      (single_quote_scalar) @injection.content
      (#set! injection.language "regex")
      (#offset! @injection.content 0 1 0 -2)))

;; vector vrl embeded in Yaml
;; (block_mapping_pair
;;   key: (flow_node
;;     (plain_scalar
;;       (string_scalar) @_source
;;       (#any-of? @_source "source" "condition")))
;;   value: (block_node
;;     (block_scalar) @injection.content
;;     (#offset! @injection.content 0 2 0 0)
;;     (#set! injection.language "javascript")))
;;
;; (block_mapping_pair
;;   key: (flow_node
;;     (plain_scalar
;;       (string_scalar)))
;;   value: (flow_node
;;     (plain_scalar
;;       (string_scalar) @injection.content
;;       (#offset! @injection.content 0 1 0 0)
;;       (#set! injection.language "javascript"))))

