set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{104.236.63.176}
role :web, %w{104.236.63.176}
role :db,  %w{104.236.63.176}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# is something that quacks like a hash and can be used
# to set extended properties on the server.
server '104.236.63.176', user: 'deploy', roles: %w{web app db}

set :rails_env, :production