;; extends
;; vim:ft=query

;; Detects a jq command and if the last argument is a block scalar, then set the language to "jq"
((command
    name: (command_name
      (word) @injection.language
      (#eq? @injection.language "jq"))
    (raw_string) @injection.content .)
    (#offset! @injection.content 0 1 0 -1))
