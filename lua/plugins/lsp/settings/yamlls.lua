local opts = {
  settings = {
    yaml = {
      -- http = {
      --     proxy = "http://127.0.0.1:1087"
      -- },
      schemas = {
        -- ["https://tuyagateway.pages.tuya-inc.top/levimq.docs/others/gitlab-ci.schema.json"] = ".gitlab-ci.yml"
        ["/Users/belltoy/.gitlab-ci.schema"] = ".gitlab-ci.yml"
      },
      keyOrdering = false
    }
  }
}

return opts
