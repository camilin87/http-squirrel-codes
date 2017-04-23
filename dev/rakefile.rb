task :clean do
    `rm -Rf pkg bin`
end

def pwd
    File.dirname(__FILE__)
end

task :env do
    ENV["GOPATH"] = pwd
    sh "go env GOPATH"
end

task :build => [:env] do
    sh "go install local/squirrel-page-builder"
end

task :run => [:build] do
    sh "$GOPATH/bin/squirrel-page-builder"
end