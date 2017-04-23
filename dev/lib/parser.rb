class StatusCodeInfo

end

class Parser
    def self.parse(markdown)
        markdown = markdown || ""
        markdown = markdown.strip

        if markdown == ""
            return []
        end

        if not markdown.start_with? "!"
            return []
        end

        [
            StatusCodeInfo.new()
        ]
    end
end
