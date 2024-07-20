local gitlab_schema = "https://gitlab.com/gitlab-org/gitlab/-/raw/v14.10.5-ee/app/assets/javascripts/editor/schema/ci.json"

local opts = {
  settings = {
    yaml = {
      schemas = {
        [gitlab_schema] = ".gitlab-ci.yml"
      },
      keyOrdering = false
    }
  }
}

return opts
