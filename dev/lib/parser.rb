class Parser
    def self.parse(markdown)
        result = Parser.parse_internal markdown
        puts "Action=Parse, Count=#{result.length}"
        result
    end

    private
    def self.parse_internal(markdown)
        (markdown || "")
            .lines
            .map { |l| /^\!\[(\d+)\s\-\s(.+)\]\((.+)\)\s\s$/.match l }
            .select { |m| m != nil }
            .map { |m| m.captures }
            .map { |data| StatusCodeInfo.new(data[0].to_i, data[1], data[2]) }
    end
end
