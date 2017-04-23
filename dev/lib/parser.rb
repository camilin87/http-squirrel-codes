class StatusCodeInfo
    attr_accessor :code
    attr_accessor :description
    attr_accessor :url
end

class Parser
    def self.parse(markdown)
        markdown = markdown || ""
        markdown = markdown.strip

        m = /^\!\[(\d+)\s\-\s(.+)\]\((.+)\)$/.match(markdown)
        if m == nil
            return []
        end

        data = m.captures

        r = StatusCodeInfo.new
        r.code = data[0].to_i
        r.description = data[1]
        r.url = data[2]

        return [r]
    end
end
