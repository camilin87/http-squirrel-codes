class Formatter
    def self.format(status_code_info)
        %{---
title: #{status_code_info.full_name}
permalink: /#{status_code_info.code}
---
<div>
    <img src=\"#{status_code_info.url}\" alt=\"#{status_code_info.full_name}\" />
    <h1>#{status_code_info.code}</h1>
    <h2>#{status_code_info.description}</h2>
</div>
}
    end
end