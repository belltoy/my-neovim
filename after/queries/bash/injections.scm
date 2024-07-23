;; extends
;; vim:ft=query

(command
    name: (command_name
      (word) @injection.language
      (#eq? @injection.language "jq"))
    argument: (raw_string) @injection.content
    (#offset! @injection.content 0 1 0 0))
