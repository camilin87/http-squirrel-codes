class Formatter
    def self.format(status_code_info)
        %{---
type: page
layout: page
title: #{status_code_info.full_name}
permalink: /#{status_code_info.code}/
---
![#{status_code_info.full_name}](#{status_code_info.url})  
}
    end
end