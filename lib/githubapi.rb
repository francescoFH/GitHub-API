require 'octokit'

class GitHubApi

  def initialize(username)
    @user = Octokit.user(username)
  end

  def calculate_favourite_language
    repos = get_user_repos
  end

  def get_user_repos
    @user.rels[:repos].get.data
  end
end
