require 'octokit'

class GitHubApi

  def initialize(username)
    @user = Octokit.user(username)
  end

  def calculate_favourite_language
    repos = get_user_repos
    languages = get_user_languages(repos)
    frequency = get_language_frequency(languages)
    result = sort_frequency(frequency)
    get_favourite_language(result)
  end

  def get_user_repos
    @user.rels[:repos].get.data
  end

  def get_user_languages(repos)
    repos.map{ | x | x.language }.compact
  end

  def get_language_frequency(languages)
    languages_sorted = {}
    languages.each do | language |
      if languages_sorted[language] == nil
        languages_sorted[language] = 1
      else
        languages_sorted[language] += 1
      end
    end
    languages_sorted
  end

  def sort_frequency(frequency)
    frequency.sort_by { | key, value | value }.reverse
  end

  def get_favourite_language(result)
    result.first.first
  end

end
