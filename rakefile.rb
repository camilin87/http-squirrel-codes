task :default => :dev

task :dev do
    sh "bundle exec jekyll serve --config _config.yml,_config-dev.yml"
end