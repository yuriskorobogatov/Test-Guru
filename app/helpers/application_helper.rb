module ApplicationHelper

  HASH_FOR_BOOTSTRAP={alert: 'alert alert-danger', notice: 'alert alert-primary'}
  def current_year
    Date.current.year
  end
    
  def github_url(author, repo)
    link_to  'Test-Guru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    HASH_FOR_BOOTSTRAP[key.to_sym]
  end
end
