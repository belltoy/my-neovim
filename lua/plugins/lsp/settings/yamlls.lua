-- local gitlab_schema = "https://gitlab.com/gitlab-org/gitlab/-/raw/v14.10.5-ee/app/assets/javascripts/editor/schema/ci.json"
local gitlab_schema = "https://gist.githubusercontent.com/belltoy/6e9d0ac4d1edcd533b053fca6e0572fb/raw/198110f01ccee2d0dc8932a5ca2cb880ef8f293f/gitlab-ci.schema.json"

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
