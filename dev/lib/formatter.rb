class Formatter
    def self.format(status_code_info)
        %{---
title: #{status_code_info.full_name}
permalink: /#{status_code_info.code}
---
<div class="status-page-container">
<div>
    <img src=\"#{status_code_info.image_url}\" alt=\"#{status_code_info.full_name}\" />

    <div id="code-description">
        <h1>#{status_code_info.code}</h1>
        <h2>#{status_code_info.description}</h2>
    </div>
</div>
</div>
}
    end
end