class StatusCodeInfo
    attr_accessor :code
    attr_accessor :description
    attr_accessor :url
end

class Parser
    def self.parse(markdown)
        markdown = markdown || ""

        result = []

        markdown.lines.each do |line|
            line = line.strip

            m = /^\!\[(\d+)\s\-\s(.+)\]\((.+)\)$/.match(line)
            if m != nil
                data = m.captures

                r = StatusCodeInfo.new
                r.code = data[0].to_i
                r.description = data[1]
                r.url = data[2]

                result.push r
            end
        end

        return result
    end
end
